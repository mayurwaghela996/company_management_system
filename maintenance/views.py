from django.shortcuts import render, redirect
from .forms import DepartmentForm, MachineForm, MechanicForm, MaintenanceReportForm
from .models import MaintenanceReport
from django.shortcuts import render
from .models import MaintenanceReport
from django.views.generic import ListView
from django.views.generic import CreateView
from django.urls import reverse_lazy

def add_department(request):
    if request.method == 'POST':
        form = DepartmentForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('add_department')
    else:
        form = DepartmentForm()
    return render(request, 'maintenance/add_department.html', {'form': form})

def add_machine(request):
    if request.method == 'POST':
        form = MachineForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('add_machine')
    else:
        form = MachineForm()
    return render(request, 'maintenance/add_machine.html', {'form': form})

def add_mechanic(request):
    if request.method == 'POST':
        form = MechanicForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('add_mechanic')
    else:
        form = MechanicForm()
    return render(request, 'maintenance/add_mechanic.html', {'form': form})

def create_report(request):
    if request.method == 'POST':
        form = MaintenanceReportForm(request.POST)
        if form.is_valid():
            form.save()
            return redirect('view_reports')
    else:
        form = MaintenanceReportForm()
    return render(request, 'maintenance/create_report.html', {'form': form})

def view_reports(request):
    reports = MaintenanceReport.objects.all()
    return render(request, 'maintenance/view_reports.html', {'reports': reports})

from django.shortcuts import render

def maintenance_dashboard(request):
    return render(request, 'maintenance/dashboard.html')

class MaintenanceReportListView(ListView):
    model = MaintenanceReport
    template_name = 'maintenance/maintenance_report_list.html'
    context_object_name = 'reports'

# Create view for maintenance reports
class MaintenanceReportCreateView(CreateView):
    model = MaintenanceReport
    template_name = 'maintenance/maintenance_report_form.html'
    fields = ['name', 'description', 'date']
    success_url = reverse_lazy('maintenance:maintenance_report_list')