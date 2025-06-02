from django.urls import path
from . import views
app_name = 'maintenance'
urlpatterns = [
    path('', views.maintenance_dashboard, name='dashboard'),
    path('reports/', views.MaintenanceReportListView.as_view(), name='maintenance_report_list'),
    path('add_department/', views.add_department, name='add_department'),
    path('add_machine/', views.add_machine, name='add_machine'),
    path('add_mechanic/', views.add_mechanic, name='add_mechanic'),
    path('create_report/', views.create_report, name='create_report'),
    path('view_reports/', views.view_reports, name='view_reports'),
]
