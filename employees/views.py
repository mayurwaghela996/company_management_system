from django.views.generic import ListView, CreateView, UpdateView, DeleteView, TemplateView, DetailView
from django.urls import reverse_lazy
from .models import Employee, Department
from .forms import EmployeeForm
from django.views.generic import TemplateView
from django.contrib.auth.mixins import LoginRequiredMixin
from django.shortcuts import get_object_or_404
from django.shortcuts import render

class EmployeeListView(ListView):
    model = Employee
    template_name = 'employees/employee_list.html'
    context_object_name = 'employees'

class EmployeeCreateView(CreateView):
    model = Employee
    form_class = EmployeeForm
    template_name = 'employees/employee_form.html'
    success_url = reverse_lazy('employee-list')

class EmployeeUpdateView(UpdateView):
    model = Employee
    form_class = EmployeeForm
    template_name = 'employees/employee_form.html'
    success_url = reverse_lazy('employee-list')

class EmployeeDeleteView(DeleteView):
    model = Employee
    template_name = 'employees/employee_confirm_delete.html'
    success_url = reverse_lazy('employee-list')

class DashboardView(LoginRequiredMixin, TemplateView):
    template_name = 'dashboard.html'
    login_url = '/login/'  # URL to redirect if not authenticated


class EmployeeQRView(DetailView):
    model = Employee
    template_name = 'employees/employee_qr.html'
    context_object_name = 'employee'

    def get_object(self):
        obj = super().get_object()
        # Ensure QR code exists
        if not obj.qr_code:
            obj.save()  # This will generate the QR code
        return obj