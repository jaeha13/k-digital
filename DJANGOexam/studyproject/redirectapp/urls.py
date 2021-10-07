from django.urls import path
from . import views

urlpatterns = [
    path('from1/', views.from1, name='from1'),
    path('from2/', views.from2, name='from2'),
    path('resultpage/', views.to1, name='to1'),
    path('resultpage/<data1>/<data2>/', views.to2, name='to2'),
]