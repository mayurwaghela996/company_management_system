from django.db import models

class Department(models.Model):
    name = models.CharField(max_length=100, unique=True)

    def __str__(self):
        return self.name

class Employee(models.Model):
    name = models.CharField(max_length=100)
    phone = models.CharField(max_length=15)
    department = models.ForeignKey(Department, on_delete=models.SET_NULL, null=True)

    def __str__(self):
        return self.name

class ProductionPlan(models.Model):
    date = models.DateField()
    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    employee = models.ForeignKey(Employee, on_delete=models.CASCADE)
    start_time = models.TimeField()

    class Meta:
        unique_together = ('date', 'department', 'employee')



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
