from django.urls import path
from . import views

urlpatterns = [
    path('', views.AttendanceListView.as_view(), name='attendance-list'),
    path('new/', views.AttendanceCreateView.as_view(), name='attendance-create'),
    path('report/', views.AttendanceReportView.as_view(), name='attendance-report'),
]