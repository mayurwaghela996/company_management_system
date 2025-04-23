from django.db import models

# Create your models here.
from django.db import models
from employees.models import Employee


class AttendanceRecord(models.Model):
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    date = models.DateField()
    in_1 = models.TimeField(null=True, blank=True)
    out_1 = models.TimeField(null=True, blank=True)
    in_2 = models.TimeField(null=True, blank=True)
    out_2 = models.TimeField(null=True, blank=True)
    in_3 = models.TimeField(null=True, blank=True)
    out_3 = models.TimeField(null=True, blank=True)
    in_4 = models.TimeField(null=True, blank=True)
    out_4 = models.TimeField(null=True, blank=True)

    @property
    def total_hours(self):
        # Calculate total working hours
        # Implementation depends on your specific logic
        pass

    class Meta:
        unique_together = ('employee', 'date')

    def __str__(self):
        return f"{self.employee.name} - {self.date}"