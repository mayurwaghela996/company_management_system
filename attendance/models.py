from django.db import models

# Create your models here.
from django.db import models
from employees.models import Employee
from datetime import datetime, date, timedelta

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
        total = timedelta()
        for in_time, out_time in [
            (self.in_1, self.out_1),
            (self.in_2, self.out_2),
            (self.in_3, self.out_3),
            (self.in_4, self.out_4),
        ]:
            if in_time and out_time:
                delta = datetime.combine(date.min, out_time) - datetime.combine(date.min, in_time)
                total += delta
        return round(total.total_seconds() / 3600, 2) if total else "-"
    # @property
    # def total_hours(self):
    #     # Calculate total working hours
    #     # Implementation depends on your specific logic
    #     pass
    #
    # class Meta:
    #     unique_together = ('employee', 'date')
    #
    # def __str__(self):
    #     return f"{self.employee.name} - {self.date}"