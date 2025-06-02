from django.contrib import admin
from django.urls import path, include
from django.contrib.auth import views as auth_views
from employees import views as emp_views
from attendance import views as att_views
from django.contrib.auth.views import LoginView, LogoutView
from employees.views import DashboardView
from django.conf import settings
from django.conf.urls.static import static

urlpatterns = [
    path('admin/', admin.site.urls),
    path('dashboard/', DashboardView.as_view(), name='dashboard'),
    path('', auth_views.LoginView.as_view(template_name='registration/login.html'), name='login'),
    path('logout/', auth_views.LogoutView.as_view(), name='logout'),
    path('', LoginView.as_view(template_name='registration/login.html'), name='login'),
    # Employee URLs
    path('employees/', include('employees.urls')),

    # Attendance URLs
    path('attendance/', include('attendance.urls')),

    # Production URLs
    path('production/', include('production.urls')),

    # maintenance URLs
    path('maintenance/', include('maintenance.urls')),

    # Installation URLs
    path('installation/', include('installation.urls')),

    # quality URLs
    path('quality/', include('quality.urls')),
]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)



# urlpatterns = [
#     path('admin/', admin.site.urls),
#     # path('', DashboardView.as_view(), name='dashboard'),
#     path('', LoginView.as_view(template_name='registration/login.html'), name='login'),
#     path('dashboard/', DashboardView.as_view(), name='dashboard'),
#     # path('dashboard/', DashboardView.as_view(), name='production-dashboard'),
#     # path('', emp_views.DashboardView.as_view(), name='dashboard'),
#     # path('login/', auth_views.LoginView.as_view(template_name='registration/login.html'), name='login'),
#     path('logout/', auth_views.LogoutView.as_view(), name='logout'),
#
#     # Employee URLs
#     path('employees/', include('employees.urls')),
#
#     # Attendance URLs
#     path('attendance/', include('attendance.urls')),
#
#     # Production URLs
#     # path('production/', include('production.urls')),
#     path('production/', include('production.urls')),
# ]+ static(settings.MEDIA_URL, document_root=settings.MEDIA_ROOT)
