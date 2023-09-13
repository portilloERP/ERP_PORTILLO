# Generated by Django 4.2.2 on 2023-09-12 14:08

from django.conf import settings
from django.db import migrations, models
import django.db.models.deletion


class Migration(migrations.Migration):

    initial = True

    dependencies = [
        ('marketing', '0007_alter_campania_coste_estimado_and_more'),
        migrations.swappable_dependency(settings.AUTH_USER_MODEL),
    ]

    operations = [
        migrations.CreateModel(
            name='Asesor',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('activo', models.BooleanField(default=False)),
                ('numeroLeads', models.IntegerField(blank=True, null=True)),
                ('numeroProyectos', models.IntegerField(blank=True, null=True)),
                ('fechaCreado', models.DateTimeField(null=True)),
                ('fechaActualizado', models.DateTimeField(null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Estado',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='Lead',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, null=True)),
                ('apellido', models.CharField(max_length=100, null=True)),
                ('asignado', models.BooleanField(default=False)),
                ('activo', models.BooleanField(default=False)),
                ('celular', models.CharField(max_length=100, null=True)),
                ('comentario', models.TextField(blank=True, max_length=200, null=True)),
                ('horaEntrega', models.DateTimeField(null=True)),
                ('mensajeMarketing', models.TextField(blank=True, max_length=200, null=True)),
                ('llamar', models.BooleanField(default=False)),
                ('asesor', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='ventas.asesor')),
                ('campania', models.ForeignKey(null=True, on_delete=django.db.models.deletion.CASCADE, to='marketing.campania')),
                ('estado', models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='ventas.estado')),
            ],
        ),
        migrations.CreateModel(
            name='Objecion',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('nombre', models.CharField(max_length=100, null=True)),
            ],
        ),
        migrations.CreateModel(
            name='WhatsApp',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('detalle', models.TextField(blank=True, max_length=200, null=True)),
                ('lead', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='ventas.lead')),
            ],
        ),
        migrations.CreateModel(
            name='Llamada',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('detalle', models.TextField(blank=True, max_length=200, null=True)),
                ('lead', models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to='ventas.lead')),
            ],
        ),
        migrations.AddField(
            model_name='lead',
            name='objeciones',
            field=models.ForeignKey(blank=True, null=True, on_delete=django.db.models.deletion.SET_NULL, to='ventas.objecion'),
        ),
        migrations.CreateModel(
            name='AsesorProyecto',
            fields=[
                ('id', models.BigAutoField(auto_created=True, primary_key=True, serialize=False, verbose_name='ID')),
                ('asesor', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='ventas.asesor')),
                ('proyecto', models.ForeignKey(on_delete=django.db.models.deletion.CASCADE, to='marketing.proyecto')),
            ],
        ),
        migrations.AddField(
            model_name='asesor',
            name='proyectos',
            field=models.ManyToManyField(blank=True, through='ventas.AsesorProyecto', to='marketing.proyecto'),
        ),
        migrations.AddField(
            model_name='asesor',
            name='user',
            field=models.OneToOneField(on_delete=django.db.models.deletion.CASCADE, to=settings.AUTH_USER_MODEL),
        ),
    ]
