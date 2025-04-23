from django.db import models
from employees.models import Employee  # assuming this app exists

class Department(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Assignment(models.Model):
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    date = models.DateField()
    start_time = models.TimeField()

    class Meta:
        unique_together = ('department', 'employee', 'date')

    def __str__(self):
        return f"{self.employee.name} -> {self.department.name} ({self.date})"



# from django.db import models
#
# class Department(models.Model):
#     name = models.CharField(max_length=100)
#
# class Employee(models.Model):
#     name = models.CharField(max_length=100)
#
# class Assignment(models.Model):
#     department = models.ForeignKey(Department, on_delete=models.CASCADE)
#     employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
#     date = models.DateField()
#     start_time = models.TimeField()
