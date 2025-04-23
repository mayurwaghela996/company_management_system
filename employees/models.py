from django.contrib.auth.models import AbstractUser
from django.db import models
import os
import qrcode
from io import BytesIO
from django.core.files import File
from django.db import models


class Department(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Employee(models.Model):
    employee_id = models.CharField(max_length=20, unique=True)
    name = models.CharField(max_length=100)
    # position = models.CharField(max_length=100)
    # department = models.ForeignKey(Department, on_delete=models.CASCADE)
    contact = models.CharField(max_length=100)
    qr_code = models.ImageField(upload_to='qrcodes/', blank=True)

    def save(self, *args, **kwargs):
        if not self.qr_code:
            qrcode_img = qrcode.make(self.employee_id)
            buffer = BytesIO()
            qrcode_img.save(buffer, format="PNG")
            filename = f'qr_{self.employee_id}.png'
            self.qr_code.save(filename, File(buffer), save=False)
        super().save(*args, **kwargs)

    def __str__(self):
        return f"{self.name} ({self.employee_id})"


class CustomUser(AbstractUser):
    is_admin = models.BooleanField(default=False)

    def __str__(self):
        return self.username