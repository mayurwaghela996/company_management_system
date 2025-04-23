from django.shortcuts import render, redirect
from django.contrib.admin.views.decorators import staff_member_required
from .forms import AssignmentForm
from .models import Assignment
from .sheets import export_assignments_to_sheet

@staff_member_required
def dashboard(request):
    form = AssignmentForm(request.POST or None)

    if request.method == 'POST' and form.is_valid():
        dept = form.cleaned_data['department']
        employees = form.cleaned_data['employees']
        date = form.cleaned_data['date']
        time = form.cleaned_data['start_time']
        for emp in employees:
            Assignment.objects.update_or_create(
                department=dept,
                employee=emp,
                date=date,
                defaults={'start_time': time}
            )
        return redirect('dashboard')

    assignments = Assignment.objects.all().order_by('-date', 'department')
    return render(request, 'production/dashboard.html', {'form': form, 'assignments': assignments})

@staff_member_required
def export_sheet_view(request):
    if request.method == "POST":
        url = export_assignments_to_sheet()
        return render(request, 'production/export_success.html', {'sheet_url': url})
    return redirect('dashboard')





# from django.shortcuts import render, redirect
# from .models import Assignment, Department, Employee
# from .forms import AssignmentForm
# from datetime import date
# from calendar import monthrange
# from django.contrib.auth.decorators import user_passes_test
# from django.contrib.admin.views.decorators import staff_member_required
# from django.shortcuts import render, redirect
# from .sheets import export_assignments_to_sheet
#
#
#
#
# def is_admin(user):
#     return user.is_staff
#
# @user_passes_test(is_admin)
# def dashboard(request):
#     form = AssignmentForm(request.POST or None)
#     today = date.today()
#
#     if request.method == 'POST' and form.is_valid():
#         form.save()
#         return redirect('dashboard')
#
#     assignments = Assignment.objects.filter(date=today)
#
#     return render(request, 'production/dashboard.html', {
#         'form': form,
#         'assignments': assignments,
#     })
#
# @staff_member_required
# def export_sheet_view(request):
#     if request.method == "POST":
#         url = export_assignments_to_sheet()
#         return render(request, 'production/export_success.html', {'sheet_url': url})
#     return redirect('dashboard')
#
#
# def monthly_view(request):
#     today = date.today()
#     year = int(request.GET.get('year', today.year))
#     month = int(request.GET.get('month', today.month))
#
#     start_date = date(year, month, 1)
#     end_date = date(year, month, monthrange(year, month)[1])
#
#     assignments = Assignment.objects.filter(date__range=(start_date, end_date)).order_by('date', 'department')
#
#     return render(request, 'production/monthly_view.html', {
#         'assignments': assignments,
#         'month': month,
#         'year': year
#     })
#
#
#
#
# # sheets-exporter@productionplanningdjango.iam.gserviceaccount.com