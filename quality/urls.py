from django.urls import path
from . import views

# urlpatterns = [
#     # path('', views.dashboard, name='dashboard'),
#     # path('dashboard/', views.production_dashboard, name='production-dashboard'),
#     # path('monthly-view/', views.monthly_view, name='monthly_view'),
#     # path('export-sheet/', views.export_sheet_view, name='export_sheet'),
# ]

urlpatterns = [
    path('', views.qualityDashboardView.as_view(), name='quality'),
]
