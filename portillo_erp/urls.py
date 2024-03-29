
from django.contrib import admin
from django.urls import path, include
from django.conf.urls.static import static
from django.conf import settings

urlpatterns = [
    path('admin/', admin.site.urls),
    path('api/', include('cuenta.urls')),
    path('api/', include('marketing.urls')),
    path('api/', include('ventas.urls')),
    path('api/', include('multimedia.urls')),
]

urlpatterns +=  static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
