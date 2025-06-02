from django.urls import path
from . import views

urlpatterns = [
    path('', views.dashboard, name='production-dashboard'),

    # Department
    path('departments/', views.department_list, name='department_list'),
    path('departments/add/', views.add_department, name='add_department'),
    # path('departments/delete/<int:id>/', views.delete_department, name='delete_department'),

    # Employee
    path('employees/', views.employee_list, name='employee_list'),
    path('employees/add/', views.add_employee, name='add_employee'),
    path('employees/delete/<int:id>/', views.delete_employee, name='delete_employee'),

    # Production
    path('production-dashboard/', views.production_planning, name='production-dashboard'),
    path('monthly-view/', views.monthly_view, name='monthly_view'),
    path('export/', views.export_to_google_sheet, name='export_to_google_sheet'),
]




# from django.urls import path
# from . import views
#
# urlpatterns = [
#     path('', views.dashboard, name='production-dashboard'),
#     path('monthly-view/', views.monthly_view, name='monthly_view'),
#     path('export-sheet/', views.export_sheet_view, name='export_sheet'),
# ]
