from .models import Department, Employee
from django import forms

class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control', 'placeholder': 'Enter department name'})
        }

class EmployeeForm(forms.ModelForm):
    class Meta:
        model = Employee
        fields = ['name', 'phone', 'department']
        widgets = {
            'name': forms.TextInput(attrs={'class': 'form-control'}),
            'phone': forms.TextInput(attrs={'class': 'form-control'}),
            # 'department': forms.Select(attrs={'class': 'form-select'})
        }

class AssignmentForm(forms.Form):
    department = forms.ModelChoiceField(queryset=Department.objects.all(), widget=forms.Select(attrs={'class': 'form-select'}))
    employees = forms.ModelMultipleChoiceField(queryset=Employee.objects.all(), widget=forms.CheckboxSelectMultiple)
    date = forms.DateField(widget=forms.DateInput(attrs={'type': 'date', 'class': 'form-control'}))
    start_time = forms.TimeField(widget=forms.TimeInput(attrs={'type': 'time', 'class': 'form-control'}))
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
