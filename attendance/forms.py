from django import forms
from .models import AttendanceRecord
from employees.models import Employee


class AttendanceRecordForm(forms.ModelForm):
    employee = forms.ModelChoiceField(
        queryset=Employee.objects.all(),
        widget=forms.Select(attrs={'class': 'form-control'})
    )
    date = forms.DateField(
        widget=forms.DateInput(attrs={'class': 'form-control', 'type': 'date'})
    )

    class Meta:
        model = AttendanceRecord
        fields = [
            'employee', 'date',
            'in_1', 'out_1',
            'in_2', 'out_2',
            'in_3', 'out_3',
            'in_4', 'out_4'
        ]
        widgets = {
            'in_1': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'out_1': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'in_2': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'out_2': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'in_3': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'out_3': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'in_4': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
            'out_4': forms.TimeInput(attrs={'class': 'form-control', 'type': 'time'}),
        }