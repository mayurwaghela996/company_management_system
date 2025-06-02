from django.shortcuts import render, redirect, get_object_or_404
from django.contrib import messages
from .models import Department, Employee, ProductionPlan
from .forms import DepartmentForm, EmployeeForm, AssignmentForm
from datetime import date
from .sheets import export_assignments_to_sheet
from django.contrib.admin.views.decorators import staff_member_required
from calendar import monthrange

@staff_member_required
def dashboard(request):
    return redirect('production-dashboard')

# DEPARTMENT
def department_list(request):
    departments = Department.objects.all()
    form = DepartmentForm()
    return render(request, 'production/departments.html', {'departments': departments, 'form': form})

def add_department(request):
    if request.method == 'POST':
        form = DepartmentForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Department added successfully.")
    return redirect('department_list')

def delete_department(request, id):
    get_object_or_404(Department, id=id).delete()
    messages.success(request, "Department deleted.")
    return redirect('department_list')

# EMPLOYEE
def employee_list(request):
    employees = Employee.objects.select_related('department').all()
    form = EmployeeForm()
    return render(request, 'production/employees.html', {'employees': employees, 'form': form})

def add_employee(request):
    if request.method == 'POST':
        form = EmployeeForm(request.POST)
        if form.is_valid():
            form.save()
            messages.success(request, "Employee added.")
    return redirect('employee_list')

def delete_employee(request, id):
    get_object_or_404(Employee, id=id).delete()
    messages.success(request, "Employee deleted.")
    return redirect('employee_list')

# PRODUCTION PLANNING
@staff_member_required
def production_planning(request):
    form = AssignmentForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        dept = form.cleaned_data['department']
        employees = form.cleaned_data['employees']
        plan_date = form.cleaned_data['date']
        time = form.cleaned_data['start_time']

        for emp in employees:
            ProductionPlan.objects.update_or_create(
                department=dept,
                employee=emp,
                date=plan_date,
                defaults={'start_time': time}
            )
        return redirect('production_planning')

    assignments = ProductionPlan.objects.select_related('department', 'employee').order_by('-date', 'department')
    return render(request, 'production/production-dashboard.html', {'form': form, 'assignments': assignments})

# MONTHLY VIEW
@staff_member_required
def monthly_view(request):
    today = date.today()
    month = int(request.GET.get('month', today.month))
    year = int(request.GET.get('year', today.year))
    start_date = date(year, month, 1)
    end_date = date(year, month, monthrange(year, month)[1])

    assignments = ProductionPlan.objects.filter(date__range=(start_date, end_date)).select_related('department', 'employee').order_by('date')
    return render(request, 'production/monthly_view.html', {
        'assignments': assignments,
        'month': month,
        'year': year
    })

# EXPORT
@staff_member_required
def export_to_google_sheet(request):
    if request.method == "POST":
        url = export_assignments_to_sheet()
        return redirect(url)
    return redirect('production_planning')
