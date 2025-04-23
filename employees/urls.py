from django.urls import path
from . import views

urlpatterns = [
    path('', views.EmployeeListView.as_view(), name='employee-list'),
    path('new/', views.EmployeeCreateView.as_view(), name='employee-create'),
    path('<int:pk>/edit/', views.EmployeeUpdateView.as_view(), name='employee-update'),
    path('<int:pk>/delete/', views.EmployeeDeleteView.as_view(), name='employee-delete'),
    path('<int:pk>/qr/', views.EmployeeQRView.as_view(), name='employee-qr'),
]