from django.urls import path
from . import views

urlpatterns = [
    path('employee/', views.employee),
    path('employeedepartment/', views.employeedepartment),
    path('employeedepartmentlocation/', views.employeedepartmentlocation),
    path('employeedepartmentlocationdooly/', views.employeedepartmentlocationdooly),
    path('department/', views.department),
    path('departmentemployee/', views.departmentemployee),
    path('alldepartmentemployee/', views.alldepartmentemployee),
    path('employeelocation/', views.employeelocation),
    path('locationemployee/', views.locationemployee),
    path('seoullocationemployee/', views.seoullocationemployee),
]