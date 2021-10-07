"""studyproject URL Configuration

The `urlpatterns` list routes URLs to views. For more information please see:
    https://docs.djangoproject.com/en/3.2/topics/http/urls/
Examples:
Function views
    1. Add an import:  from my_app import views
    2. Add a URL to urlpatterns:  path('', views.home, name='home')
Class-based views
    1. Add an import:  from other_app.views import Home
    2. Add a URL to urlpatterns:  path('', Home.as_view(), name='home')
Including another URLconf
    1. Import the include() function: from django.urls import include, path
    2. Add a URL to urlpatterns:  path('blog/', include('blog.urls'))
"""
from django.contrib import admin
from django.urls import path, include
import firstapp.views
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('welcome/', firstapp.views.welcome),
    path('secondapp/', include('secondapp.urls')),   # secondapp 사용시 secondapp.urls 를 끌어와 사용하겠다!!
    path('fourthapp/', include('fourthapp.urls')),
    path('redirectapp/', include('redirectapp.urls')),
    path('fifthapp/', include('fifthapp.urls')),
    path('relationapp/', include('relationapp.urls')),
    path('visitorapp/', include('visitorapp.urls')),
    path('accountapp/', include('accountapp.urls')),
    path('uploadapp/', include('uploadapp.urls')),
] + static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
