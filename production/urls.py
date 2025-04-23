from django.urls import path
from . import views

urlpatterns = [
    path('', views.dashboard, name='dashboard'),
    # path('monthly-view/', views.monthly_view, name='monthly_view'),
    path('export-sheet/', views.export_sheet_view, name='export_sheet'),
]
