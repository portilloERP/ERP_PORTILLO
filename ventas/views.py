from cuenta.serializers import *
from ventas.serializers import *
from marketing.serializers import *

from django.shortcuts import render
from rest_framework import generics
from rest_framework.response import Response
from django.shortcuts import get_object_or_404
from cuenta.models import User
from rest_framework import status
from datetime import datetime, timedelta
from django.http import Http404
from rest_framework.views import APIView
from rest_framework.permissions import IsAuthenticated
from rest_framework.decorators import permission_classes
from .consts import *
from multimedia.models import VideoProducto, ImagenProducto
from multimedia.serializers import VideoProductoSerializer, ImagenProductoSerializer


def get_or_none(classmodel, **kwargs):
    try:
        return classmodel.objects.get(**kwargs)
    except classmodel.DoesNotExist:
        return None


#markting filtrar por fecha creacion
#asesor fecha asignacion
#asesor admin asignacion
#si se filtra por asginado true, fecha asignacion
#si se filtra por desaginado true, fecha desasignacion

@permission_classes([IsAuthenticated])
class LeadList(generics.ListCreateAPIView):
    serializer_class = LeadSerializer
    queryset = Lead.objects.all()

    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)


        #asesor_queryset = User.objects.filter(is_active=True, estado= 'A').filter(groups__name__in=["asesor" or "Asesor" or "ASESOR"])


        fecha_limite = datetime.now() - timedelta(days=60)

        estado = request.query_params.get('estado')
        desde = request.query_params.get('desde')
        hasta = request.query_params.get('hasta')
        asignado = request.query_params.get('asignado')
        recienCreado = request.query_params.get('recienCreado')




        if asignado == False:
            lead_queryset = lead_queryset.filter(asignado=asignado)
            if request.user.groups.first().name == "marketing" : 
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_creacion__range=[desde, hasta]).order_by('-fecha_creacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_creacion__gte=fecha_limite).order_by('-fecha_creacion')
            
            elif request.user.groups.first().name == "asesor" : 
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_desasignacion__range=[desde, hasta]).order_by('-fecha_desasignacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_desasignacion__gte=fecha_limite).order_by('-fecha_desasignacion')
            else:
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_desasignacion__range=[desde, hasta]).order_by('-fecha_desasignacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_desasignacion__gte=fecha_limite).order_by('-fecha_desasignacion')

        else :
            if request.user.groups.first().name == "marketing" : 
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_creacion__range=[desde, hasta]).order_by('-fecha_creacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_creacion__gte=fecha_limite).order_by('-fecha_creacion')
            
            elif request.user.groups.first().name == "asesor" : 
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_asignacion__range=[desde, hasta]).order_by('-fecha_asignacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_asignacion__gte=fecha_limite).order_by('-fecha_asignacion')
            else:
                if desde and hasta:
                    lead_queryset = Lead.objects.filter(fecha_asignacion__range=[desde, hasta]).order_by('-fecha_asignacion')
                else : 
                    lead_queryset = Lead.objects.filter(fecha_asignacion__gte=fecha_limite).order_by('-fecha_asignacion')



        if estado:
            lead_queryset = lead_queryset.filter(estado=estado)

        if recienCreado:
            lead_queryset = lead_queryset.filter(recienCreado=recienCreado)
        

        leadSerializer = LeadSerializer(lead_queryset, many=True)

        leadData = leadSerializer.data
        for i in leadData:
            user_data = get_or_none(User, id=i["asesor"])
            userCreador_data = get_or_none(User, id=i["usuarioCreador"])
            userActualizador_data = get_or_none(
                User, id=i["usuarioActualizador"])
            campania_data = get_or_none(Campania, id=i["campania"])
            objecion_data = get_or_none(Objecion, id=i["objecion"])

            userSerializer = UserSerializer(user_data, fields=(
                'id', 'first_name', 'last_name', 'username')) if user_data else None
            userCreadorSerializer = UserSerializer(userCreador_data, fields=(
                'id', 'first_name', 'last_name', 'username')) if userCreador_data else None
            userActualizadorializer = UserSerializer(userActualizador_data, fields=(
                'id', 'first_name', 'last_name', 'username')) if userActualizador_data else None
            campaniaSerializer = CampaniaSerializer(
                campania_data) if campania_data else None
            objecionSerializer = ObjecionSerializer(
                objecion_data) if objecion_data else None

            i["asesor"] = userSerializer.data if userSerializer else {}
            i["campania"] = campaniaSerializer.data if campaniaSerializer else {}
            i["campania"]["proyecto"] = ProyectoSerializer(
                Proyecto.objects.filter(pk=i["campania"]["proyecto"]).first()).data
            i["objecion"] = objecionSerializer.data if objecionSerializer else {}

        return Response(leadData)
    

    def post(self, request, format=None):
        dos_meses_atras = timezone.now() - timezone.timedelta(days=60)
        serializer = LeadSerializer(data=request.data)
        registros_existentes = Lead.objects.filter(celular=request.data.get("celular"), fecha_creacion__gte=dos_meses_atras)
        if registros_existentes.exists():
            return Response({'celular':'El número de celular ya ha sido utilizado en los últimos dos meses.'})
        
        if serializer.is_valid():
            lead = serializer.save()

            if lead.asesor !=None :
                HistoricoLeadAsesor.objects.create(lead = lead, usuario = lead.asesor)

            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)
    


@permission_classes([IsAuthenticated])
class LeadDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = LeadSerializer
    queryset = Lead.objects.all()

    def retrieve(self, request, pk=None):
        # para asesor y jefe de ventas whatsapps, llamadas y eventos
        usuario = request.user

        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        if request.user.isAdmin == True:
            lead = get_or_none(Lead, id=pk)
            if lead == None:
                return Response({"message": "No existe lead"}, status=404)
        else:
            lead = Lead.objects.filter(id=pk, asesor=usuario.pk).first()
            if lead == None:
                return Response({"message": "No existe lead o lead no pertenece al usario"}, status=404)

        leadSerializer = LeadSerializer(lead)
        lead_data = leadSerializer.data

        user_data = get_or_none(User, id=lead_data["asesor"])
        userCreador_data = get_or_none(User, id=lead_data["usuarioCreador"])
        userActualizador_data = get_or_none(
            User, id=lead_data["usuarioActualizador"])
        campania_data = get_or_none(Campania, id=lead_data["campania"])
        objecion_data = get_or_none(Objecion, id=lead_data["objecion"])

        userSerializer = UserSerializer(user_data, fields=(
            'id', 'first_name', 'last_name', 'username')) if user_data else None
        userCreadorSerializer = UserSerializer(userCreador_data, fields=(
            'id', 'first_name', 'last_name', 'username')) if userCreador_data else None
        userActualizadorializer = UserSerializer(userActualizador_data, fields=(
            'id', 'first_name', 'last_name', 'username')) if userActualizador_data else None
        campaniaSerializer = CampaniaSerializer(
            campania_data) if campania_data else None
        objecionSerializer = ObjecionSerializer(
            objecion_data) if objecion_data else None

        lead_data["asesor"] = userSerializer.data if userSerializer else None
        lead_data["campania"] = campaniaSerializer.data if campaniaSerializer else None
        lead_data["objecion"] = objecionSerializer.data if objecionSerializer else None
        lead_data["whatsapps"] = WhatsAppSerializer(
            WhatsApp.objects.filter(lead=lead.pk), many=True).data

        # for i in lead_data["whatsapps"] :
        #     i["objecion"] = ObjecionSerializer(Objecion.objects.filter(pk = i["objecion"]).first()).data

        lead_data["llamadas"] = LlamadaSerializer(
            Llamada.objects.filter(lead=lead.pk), many=True).data

        # for i in lead_data["llamadas"]:
        #     i["objecion"] = ObjecionSerializer(
        #         Objecion.objects.filter(pk=i["objecion"]).first()).data

        lead_data["eventos"] = EventoSerializer(
            Evento.objects.filter(lead=lead.pk), many=True).data
        
        for eventoIter in lead_data["eventos"] :
            asesor = User.objects.filter(id = eventoIter["asesor"]).first()
            tipoEvento = TipoEvento.objects.filter(id = eventoIter["tipo"]).first()
            estadoEvento = EstadoEvento.objects.filter(id = eventoIter["estadoEvento"]).first()
            objecion = Objecion.objects.filter(id = eventoIter["objecion"]).first()

            eventoIter["asesor"] = UserSerializer(asesor ,fields=('id', 'first_name', 'last_name', 'username', 'codigoAsesor')).data if asesor != None else None            
            eventoIter["tipo"] =  TipoEventoSerializer(tipoEvento).data if tipoEvento != None else None
            eventoIter["estadoEvento"] =  EstadoEventoSerializer(estadoEvento).data if estadoEvento != None else None
            eventoIter["objecion"] =  ObjecionSerializer(objecion).data if objecion != None else None

        return Response(lead_data)

    def put(self, request, pk):
        try:
            instancia = Lead.objects.get(pk=pk)
        except Lead.DoesNotExist:
            return Response(status=status.HTTP_404_NOT_FOUND)
        
        data = request.data


        if data.get("celular") == None:
            data["celular"] = instancia.celular
        if data.get("asesor") != None:
            data["fecha_asignacion"] = timezone.now()
        
        try:
            if data["asesor"] == None:
                data["fecha_desasignacion"] = timezone.now()
                DesasignacionLeadAsesor.objects.create(lead = instancia, usuario = instancia.asesor)
            else :
                asesor = get_or_none(User, id = data["asesor"])
                if asesor !=None:
                    HistoricoLeadAsesor.objects.create(lead = instancia, usuario = asesor)
        except:
            pass

        data["campania"] = instancia.campania.pk


        serializer = LeadSerializer(instancia, data=data)

        if serializer.is_valid():
            serializer.save()

            return Response(serializer.data)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)




# @permission_classes([IsAuthenticated])
# class LeadListSinFiltros(LeadList):
#     def list(self, request):
#         if not (bool(request.user.groups.first().permissions.filter(codename = PermissionLead.CAN_VIEW) or request.user.is_superuser)) :
#             return Response({"message" : "Usuario no tiene permisos para ver leads"}, status=403)

#         self.queryset = self.queryset.filter()
#         return super().list(request)


class LeadListSinFiltros(generics.ListAPIView):
    permission_classes = [IsAuthenticated]
    # Reemplaza 'TuSerializer' con el nombre real de tu serializer
    serializer_class = LeadSerializer
    queryset = Lead.objects.all()  # Reemplaza 'TuModel' con el nombre real de tu modelo

    def get_queryset(self):
        queryset = super().get_queryset()
        # Obtener parámetros de la URL
        asesor_id = self.request.query_params.get('asesor', None)
        # Aplicar filtros según los parámetros
        if asesor_id is not None:
            queryset = queryset.filter(asesor=asesor_id)

        return queryset

    def list(self, request, *args, **kwargs):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        return super().list(request, *args, **kwargs)


@permission_classes([IsAuthenticated])
class LeadListAsignados(LeadList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        self.queryset = self.queryset.filter(estado="A", asignado=True)
        return super().list(request)


@permission_classes([IsAuthenticated])
class LeadListNoAsignados(LeadList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        self.queryset = self.queryset.filter(estado="A", asignado=False)
        return super().list(request)


@permission_classes([IsAuthenticated])
class LeadListActivos(LeadList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class LeadListInactivos(LeadList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionLead.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver leads"}, status=403)

        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class WhatsAppList(generics.ListCreateAPIView):
    serializer_class = WhatsAppSerializer
    queryset = WhatsApp.objects.all()


@permission_classes([IsAuthenticated])
class whatsappActivos(WhatsAppList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class whatsappInactivos(WhatsAppList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class WhatsAppDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = WhatsAppSerializer
    queryset = WhatsApp.objects.all()


@permission_classes([IsAuthenticated])
class LlamadaList(generics.ListCreateAPIView):
    serializer_class = LlamadaSerializer
    queryset = Llamada.objects.all()


@permission_classes([IsAuthenticated])
class LlamadaActivos(LlamadaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class LlamadaInactivos(LlamadaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class LlamadaDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = LlamadaSerializer
    queryset = Llamada.objects.all()


@permission_classes([IsAuthenticated])
class ObjecionList(generics.ListCreateAPIView):
    serializer_class = ObjecionSerializer
    queryset = Objecion.objects.all()


@permission_classes([IsAuthenticated])
class ObjecionActivos(ObjecionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class ObjecionInactivos(ObjecionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class ObjecionDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ObjecionSerializer
    queryset = Objecion.objects.all()


@permission_classes([IsAuthenticated])
class EstadoLeadList(generics.ListCreateAPIView):
    serializer_class = EstadoLeadSerializer
    queryset = EstadoLead.objects.all()


@permission_classes([IsAuthenticated])
class EstadoLeadDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = EstadoLeadSerializer
    queryset = EstadoLead.objects.all()

    def get_object(self):
        nombre = self.kwargs.get('nombre')
        estado_lead = EstadoLead.objects.filter(nombre=nombre).first()

        if estado_lead is None:
            raise Http404("EstadoLead no encontrado")

        return estado_lead


@permission_classes([IsAuthenticated])
class EstadoLeadActivos(EstadoLeadList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class EstadoLeadInactivos(EstadoLeadList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class EventoList(generics.ListCreateAPIView):
    serializer_class = EventoSerializer
    queryset = Evento.objects.all()

    def post(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionEvento.CAN_ADD) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para crear eventos"}, status=403)
        idUsuario = request.user.pk
        print("id user", idUsuario)
        try:
            request.data["asesor"] = idUsuario
            serializer = EventoSerializer(data=request.data)
        except:
            return Response({"message": "El asesor no existe"})

        if serializer.is_valid():
            serializer.save()
            return Response(serializer.data, status=status.HTTP_201_CREATED)
        return Response(serializer.errors, status=status.HTTP_400_BAD_REQUEST)

    def list(self, request):
        usuarioId = request.user.pk

        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionEvento.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver eventos"}, status=403)

        evento_queryset = Evento.objects.all()
        estado = request.query_params.get('estado')
        desde = request.query_params.get('desde')
        hasta = request.query_params.get('hasta')

        if estado:
            evento_queryset = Evento.objects.all().filter(estado=estado)
        if desde and hasta:
            evento_queryset = evento_queryset.filter(
                fecha_creacion__range=[desde, hasta])

        if request.user.isAdmin == False:
            evento_queryset = evento_queryset.filter(asesor=usuarioId)
        elif request.user.isAdmin == True:
            evento_queryset = evento_queryset

        evento_data = EventoSerializer(evento_queryset, many=True).data
        print(evento_data)
        for eventoIterador in evento_data:
            asesor = get_or_none(User, id=eventoIterador["asesor"])
            tipo = get_or_none(TipoEvento, id=eventoIterador["tipo"])
            lead = get_or_none(Lead, id=eventoIterador["lead"])
            estadoEvento = get_or_none(EstadoEvento, id=eventoIterador["estadoEvento"])
            userCreador = get_or_none(
                User, id=eventoIterador["usuarioCreador"])
            userActualizador = get_or_none(
                User, id=eventoIterador["usuarioActualizador"])

            estadoEventoSerializer = EstadoEventoSerializer(estadoEvento) if estadoEvento else None
            userAsesorSerializer = UserSerializer(asesor, fields=(
                'id', 'first_name', 'last_name', 'username')) if asesor else None
            tipoSerializer = TipoEventoSerializer(tipo) if tipo else None
            leadSerializer = LeadSerializer(lead) if lead else None

            userCreadorSerializer = UserSerializer(userCreador, fields=(
                'id', 'first_name', 'last_name', 'username')) if userCreador else None
            userActualizadorializer = UserSerializer(userActualizador, fields=(
                'id', 'first_name', 'last_name', 'username')) if userActualizador else None

            eventoIterador["asesor"] = userAsesorSerializer.data if userAsesorSerializer else {
            }
            eventoIterador["tipo"] = tipoSerializer.data if tipoSerializer else {}
            eventoIterador["estadoEvento"] = estadoEventoSerializer.data if estadoEventoSerializer else {}

            eventoIterador["lead"] = leadSerializer.data if leadSerializer else {}

        return Response(evento_data)


@permission_classes([IsAuthenticated])
class EventoListSinFiltros(EventoList):
    def list(self, request):
        self.queryset = self.queryset.filter()
        return super().list(request)


@permission_classes([IsAuthenticated])
class EventoListActivos(EventoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


@permission_classes([IsAuthenticated])
class EventoListInactivos(EventoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


@permission_classes([IsAuthenticated])
class EventoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = EventoSerializer
    queryset = Evento.objects.all()

    def retrieve(self, request, pk=None):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionEvento.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver eventos"}, status=403)
        try:
            evento = Evento.objects.get(id=pk)
        except:
            return Response({"message": "El evento no existe"}, status=404)

        asesor = get_or_none(User, id=evento.asesor.pk)
        tipo = get_or_none(TipoEvento, id=evento.tipo.pk)
        estadoEvento = get_or_none(EstadoEvento, id=evento.estadoEvento.pk)


        asesorSerlializer = UserSerializer(asesor, fields=(
            'id', 'first_name', 'last_name', 'username')) if asesor else None
        
        tipoSerializer = TipoEventoSerializer(tipo) if tipo else None
        estadoEventoSerializer = EstadoEventoSerializer(estadoEvento) if estadoEvento else None


        evento_dataJson = EventoSerializer(evento).data
        evento_dataJson["asesor"] = asesorSerlializer.data if asesorSerlializer else {
        }
        evento_dataJson["tipo"] = tipoSerializer.data if tipoSerializer else {}
        evento_dataJson["estadoEvento"] = estadoEventoSerializer.data if estadoEventoSerializer else {}

        return Response(evento_dataJson)


class TipoEventoList(generics.ListCreateAPIView):
    serializer_class = TipoEventoSerializer
    queryset = TipoEvento.objects.all()


class TipoEventoListActivos(TipoEventoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class TipoEventoListInactivos(TipoEventoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class TipoEventoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TipoEventoSerializer
    queryset = TipoEvento.objects.all()


@permission_classes([IsAuthenticated])
class ProductoList(generics.ListCreateAPIView):
    serializer_class = ProductoSerializer
    queryset = Producto.objects.all()

    def list(self, request):

        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionProducto.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver productos"}, status=403)

        estado = request.query_params.get('estado')
        print(estado)
        if estado:
            producto_queryset = Producto.objects.all().filter(estado=estado)
        else:
            producto_queryset = Producto.objects.all()

        try:
            producto_datajson = ProductoSerializer(
                producto_queryset, many=True).data
        except:
            return Response({"message": "El producto no existe"}, status=404)

        for i in producto_datajson:
            tipoProducto = get_or_none(TipoProducto, id=i["tipo"])
            proyecto = get_or_none(Proyecto, id=i["proyecto"])
            userCreador = get_or_none(User, id=i["usuarioCreador"])
            userActualizador = get_or_none(User, id=i["usuarioActualizador"])

            tipoProductoSerializer = ProyectoSerializer(
                tipoProducto) if tipoProducto else None
            proyectoSerializer = ProyectoSerializer(
                proyecto) if proyecto else None
            userCreadorSerializer = UserSerializer(userCreador, fields=(
                'id', 'first_name', 'last_name', 'username')) if userCreador else None
            userActualizadorializer = UserSerializer(userActualizador, fields=(
                'id', 'first_name', 'last_name', 'username')) if userActualizador else None

            i["tipo"] = tipoProductoSerializer.data if tipoProductoSerializer else {}
            i["proyecto"] = proyectoSerializer.data if proyectoSerializer else {}
            i["videos"] = VideoProductoSerializer(
                VideoProducto.objects.filter(producto=i["id"]), many=True).data
            i["imagenes"] = ImagenProductoSerializer(
                ImagenProducto.objects.filter(producto=i["id"]), many=True).data

        return Response(producto_datajson)


class ProductoListSinFiltros(ProductoList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionProducto.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver productos"}, status=403)

        self.queryset = self.queryset.filter()
        return super().list(request)


class ProductoListActivos(ProductoList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionProducto.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver productos"}, status=403)

        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class ProductoListInactivos(ProductoList):
    def list(self, request):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionProducto.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver productos"}, status=403)

        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class ProductoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = ProductoSerializer
    queryset = Producto.objects.all()

    def retrieve(self, request, pk=None):
        if not (bool(request.user.groups.first().permissions.filter(codename=PermissionProducto.CAN_VIEW) or request.user.is_superuser)):
            return Response({"message": "Usuario no tiene permisos para ver productos"}, status=403)

        try:
            producto = Producto.objects.get(id=pk)
            producto_datajson = ProductoSerializer(producto).data
        except:
            return Response({"message": "El producto no existe"}, status=404)

        tipoProducto = get_or_none(TipoProducto, id=producto.tipo.pk)
        proyecto = get_or_none(Proyecto, id=producto.proyecto.pk)
        userCreador = get_or_none(User, id=producto.usuarioCreador.pk)
        userActualizador = get_or_none(
            User, id=producto.usuarioActualizador.pk)

        tipoProductoSerializer = ProyectoSerializer(
            tipoProducto) if tipoProducto else None
        proyectoSerializer = ProyectoSerializer(proyecto) if proyecto else None
        userCreadorSerializer = UserSerializer(userCreador, fields=(
            'id', 'first_name', 'last_name', 'username')) if userCreador else None
        userActualizadorializer = UserSerializer(userActualizador, fields=(
            'id', 'first_name', 'last_name', 'username')) if userActualizador else None

        producto_datajson["tipo"] = tipoProductoSerializer.data if tipoProductoSerializer else {
        }
        producto_datajson["proyecto"] = proyectoSerializer.data if proyectoSerializer else {
        }

        producto_datajson["videos"] = VideoProductoSerializer(
            VideoProducto.objects.filter(producto=producto_datajson["id"]), many=True).data
        producto_datajson["imagenes"] = ImagenProductoSerializer(
            ImagenProducto.objects.filter(producto=producto_datajson["id"]), many=True).data

        return Response(producto_datajson)


class TipoProductoList(generics.ListCreateAPIView):
    serializer_class = TipoProductoSerializer
    queryset = TipoProducto.objects.all()


class TipoProductoListActivos(TipoProductoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class TipoProductoListInactivos(TipoProductoList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class TipoProductoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TipoProductoSerializer
    queryset = TipoProducto.objects.all()


class CotizacionList(generics.ListCreateAPIView):
    serializer_class = CotizacionSerializer
    queryset = Cotizacion.objects.all()

    def list(self, request):
        cotizacion_queryset = self.queryset
        tipo_queryset = TipoCotizacion.objects.all()
        proyecto_queryset = Proyecto.objects.all()
        asesor_queryset = User.objects.all()

        dataJson = CotizacionSerializer(cotizacion_queryset, many=True).data

        for i in dataJson:
            i["tipo"] = TipoCotizacionSerializer(
                tipo_queryset.get(id=i["tipo"])).data
            i["proyecto"] = ProyectoSerializer(
                proyecto_queryset.get(id=i["proyecto"])).data
            i["asesor"] = UserSerializer(
                asesor_queryset.get(id=i["asesor"])).data

        return Response(dataJson)


class CotizacionListSinFiltros(CotizacionList):
    def list(self, request):
        self.queryset = self.queryset.filter()
        return super().list(request)


class CotizacionListActivos(CotizacionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class CotizacionListInactivos(CotizacionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class CotizacionDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CotizacionSerializer
    queryset = Cotizacion.objects.all()

    def retrieve(self, request, pk=None):
        cotizacion = Cotizacion.objects.get(id=pk)
        tipo_queryset = TipoCotizacion.objects.all()
        proyecto_queryset = Proyecto.objects.all()
        asesor_queryset = User.objects.all()

        dataJson = CotizacionSerializer(cotizacion).data
        dataJson["tipo"] = TipoCotizacionSerializer(
            tipo_queryset.get(id=cotizacion.tipo.pk)).data
        dataJson["proyecto"] = ProyectoSerializer(
            proyecto_queryset.get(id=cotizacion.proyecto.pk)).data
        dataJson["asesor"] = UserSerializer(
            asesor_queryset.get(id=cotizacion.asesor.pk)).data

        return Response(dataJson)


class TipoCotizacionList(generics.ListCreateAPIView):
    serializer_class = TipoCotizacionSerializer
    queryset = TipoCotizacion.objects.all()


class TipoCotizacionListActivos(TipoCotizacionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class TipoCotizacionListInactivos(TipoCotizacionList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class TipoCotizacionDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TipoCotizacionSerializer
    queryset = TipoCotizacion.objects.all()


class CuotaList(generics.ListCreateAPIView):
    serializer_class = CuotaSerializer
    queryset = Cuota.objects.all()

    def list(self, request):
        cuota_queryset = self.queryset
        cotizacion_queryset = Cotizacion.objects.all()
        tipo_queryset = TipoCuota.objects.all()
        dataJson = CuotaSerializer(cuota_queryset, many=True).data

        for i in dataJson:
            i["tipo"] = TipoCuotaSerializer(
                tipo_queryset.get(id=i["tipo"])).data
            i["cotizacion"] = CotizacionSerializer(
                cotizacion_queryset.get(id=i["cotizacion"])).data

        return Response(dataJson)


class CuotaListSinFiltros(CuotaList):
    def list(self, request):
        self.queryset = self.queryset.filter()
        return super().list(request)


class CuotaListActivos(CuotaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class CuotaListInactivos(CuotaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class CuotaDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = CuotaSerializer
    queryset = Cuota.objects.all()

    def retrieve(self, request, pk=None):
        cuota = Cuota.objects.get(id=pk)
        cotizacion_queryset = Cotizacion.objects.all()
        tipo_queryset = TipoCuota.objects.all()

        dataJson = CuotaSerializer(cuota).data
        dataJson["tipo"] = TipoCuotaSerializer(
            tipo_queryset.get(id=cuota.tipo.pk)).data
        dataJson["cotizacion"] = CotizacionSerializer(
            cotizacion_queryset.get(id=cuota.cotizacion.pk)).data

        return Response(dataJson)


class TipoCuotaList(generics.ListCreateAPIView):
    serializer_class = TipoCuotaSerializer
    queryset = TipoCuota.objects.all()


class TipoCuotaListActivos(TipoCuotaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class TipoCuotaListInactivos(TipoCuotaList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class TipoCuotaDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = TipoCuotaSerializer
    queryset = TipoCuota.objects.all()


class PrecioList(generics.ListCreateAPIView):
    serializer_class = PrecioSerializer
    queryset = Precio.objects.all()

    def list(self, request):
        precio_queryset = self.queryset
        tipo_producto_queryset = TipoProducto.objects.all()
        cotizacion_queryset = Cotizacion.objects.all()
        dataJson = PrecioSerializer(precio_queryset, many=True).data

        for i in dataJson:
            i["tipoProducto"] = TipoProductoSerializer(
                tipo_producto_queryset.get(id=i["tipoProducto"])).data
            i["cotizacion"] = CotizacionSerializer(
                cotizacion_queryset.get(id=i["cotizacion"])).data

        return Response(dataJson)


class PrecioListSinFiltros(PrecioList):
    def list(self, request):
        self.queryset = self.queryset.filter()
        return super().list(request)


class PrecioListActivos(PrecioList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="A")
        return super().list(request)


class PrecioListInactivos(PrecioList):
    def list(self, request):
        self.queryset = self.queryset.filter(estado="I")
        return super().list(request)


class PrecioDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = PrecioSerializer
    queryset = Precio.objects.all()

    def retrieve(self, request, pk=None):
        precio = Precio.objects.get(id=pk)
        tipo_producto_queryset = TipoProducto.objects.all()
        cotizacion_queryset = Cotizacion.objects.all()

        dataJson = PrecioSerializer(precio).data
        dataJson["tipoProducto"] = TipoProductoSerializer(
            tipo_producto_queryset.get(id=precio.tipoProducto.pk)).data
        dataJson["cotizacion"] = CotizacionSerializer(
            cotizacion_queryset.get(id=precio.cotizacion.pk)).data

        return Response(dataJson)


class HistoricoLeadAsesorList(generics.ListCreateAPIView):
    serializer_class = HistoricoLeadAsesorSerlializer
    queryset = HistoricoLeadAsesor.objects.all()

    def list(self, request):
        queryset = HistoricoLeadAsesor.objects.all()
        lead_queryset = Lead.objects.all()
        user_queryset = User.objects.all()
        dataJson = HistoricoLeadAsesorSerlializer(queryset, many=True).data

        for i in dataJson:
            i["lead"] = LeadSerializer(lead_queryset.filter(pk=i["lead"]).first(), fields=[
                                       "nombre", "apellido", "celular"]).data
            i["usuario"] = UserSerializer(user_queryset.filter(
                pk=i["usuario"]).first(), fields=["username", "first_name", "last_name"]).data

        return Response(dataJson)


class DesasignacionLeadAsesorList(generics.ListCreateAPIView):
    serializer_class = DesasignacionLeadAsesorSerlializer
    queryset = DesasignacionLeadAsesor.objects.all()

    def list(self, request):
        desde = request.query_params.get('desde')
        hasta = request.query_params.get('hasta')

        queryset = DesasignacionLeadAsesor.objects.all()
        lead_queryset = Lead.objects.all()
        user_queryset = User.objects.all()

        if desde and hasta:
            queryset = queryset.filter(fecha__range=[desde, hasta])
        dataJson = DesasignacionLeadAsesorSerlializer(queryset, many=True).data


        for i in dataJson:
            i["lead"] = LeadSerializer(lead_queryset.filter(pk=i["lead"]).first(), fields=[
                                       "nombre", "apellido", "celular"]).data
            i["usuario"] = UserSerializer(user_queryset.filter(
                pk=i["usuario"]).first(), fields=["username", "first_name", "last_name"]).data

        return Response(dataJson)


class EstadoEventoList(generics.ListCreateAPIView):
    serializer_class = EstadoEventoSerializer
    queryset = EstadoEvento.objects.all()


class EstadoEventoDetail(generics.RetrieveUpdateDestroyAPIView):
    serializer_class = EstadoEventoSerializer
    queryset = EstadoEvento.objects.all()
