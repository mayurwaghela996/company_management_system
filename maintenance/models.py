from django.db import models

class Department(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class Machine(models.Model):
    name = models.CharField(max_length=100)
    department = models.ForeignKey(Department, on_delete=models.CASCADE)

    def __str__(self):
        return self.name

class Mechanic(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name

class MaintenanceReport(models.Model):
    LANGUAGE_CHOICES = [
        ('en', 'English'),
        ('nl', 'Dutch'),
    ]

    department = models.ForeignKey(Department, on_delete=models.CASCADE)
    machine = models.ForeignKey(Machine, on_delete=models.CASCADE)
    mechanic = models.ForeignKey(Mechanic, on_delete=models.CASCADE)
    description = models.TextField()
    note = models.TextField(blank=True)
    date = models.DateField(auto_now_add=True)
    language = models.CharField(max_length=2, choices=LANGUAGE_CHOICES)

    def __str__(self):
        return f"{self.machine.name} - {self.date}"
