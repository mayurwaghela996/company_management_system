from django import forms
from .models import Department, Assignment
from employees.models import Employee

class AssignmentForm(forms.Form):
    department = forms.ModelChoiceField(queryset=Department.objects.all())
    employees = forms.ModelMultipleChoiceField(queryset=Employee.objects.all(), widget=forms.CheckboxSelectMultiple)
    date = forms.DateField(widget=forms.SelectDateWidget())
    start_time = forms.TimeField(widget=forms.TimeInput(format='%H:%M'))


# from django import forms
# from .models import Assignment, Department, Employee
# import datetime
#
# class AssignmentForm(forms.ModelForm):
#     date = forms.DateField(widget=forms.SelectDateWidget())
#     class Meta:
#         model = Assignment
#         fields = ['department', 'employee', 'date', 'start_time']
#         widgets = {
#             'start_time': forms.TimeInput(format='%H:%M'),
#         }
