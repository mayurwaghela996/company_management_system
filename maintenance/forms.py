from django import forms
from .models import Department, Machine, Mechanic, MaintenanceReport

class DepartmentForm(forms.ModelForm):
    class Meta:
        model = Department
        fields = ['name']

class MachineForm(forms.ModelForm):
    class Meta:
        model = Machine
        fields = ['name', 'department']

class MechanicForm(forms.ModelForm):
    class Meta:
        model = Mechanic
        fields = ['name']

class MaintenanceReportForm(forms.ModelForm):
    class Meta:
        model = MaintenanceReport
        fields = ['department', 'machine', 'mechanic', 'description', 'note', 'language']
