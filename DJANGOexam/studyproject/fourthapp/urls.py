from django.urls import path
from . import views


urlpatterns = [
    path('C/', views.c, name='C'),
    path('R/', views.r, name='R1'),             # read all
    path('R/<int:id>/', views.r, name='R2'),    # read id=id
    path('U/<int:id>/', views.u, name='U'),
    path('D/<int:id>/', views.d, name='D'),
]