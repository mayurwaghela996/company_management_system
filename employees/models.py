from django.contrib.auth.models import AbstractUser
from django.db import models
from django.core.validators import RegexValidator
from django.core.exceptions import ValidationError
import os
import qrcode
from io import BytesIO
from django.core.files import File

# Phone number validator (only digits, 10–15 characters)
phone_validator = RegexValidator(
    regex=r'^\d{10,15}$',
    message="Contact must be a valid phone number with 10-15 digits."
)

# Employee ID validator (only alphanumeric allowed)
employee_id_validator = RegexValidator(
    regex=r'^[A-Za-z0-9]+$',
    message="Employee ID must be alphanumeric (letters and numbers only)."
)

# Name validator (only letters and spaces allowed)
name_validator = RegexValidator(
    regex=r'^[A-Za-z\s]+$',
    message="Name must only contain letters and spaces."
)


class Department(models.Model):
    name = models.CharField(max_length=100)

    def __str__(self):
        return self.name


class Employee(models.Model):
    employee_id = models.CharField(
        max_length=20,
        unique=True,
        validators=[employee_id_validator]
    )
    name = models.CharField(
        max_length=100,
        validators=[name_validator]
    )
    contact = models.CharField(
        max_length=100,
        validators=[phone_validator]
    )
    qr_code = models.ImageField(upload_to='qrcodes/', blank=True)

    def clean(self):
        # Additional check to prevent blank names
        if not self.name.strip():
            raise ValidationError({'name': 'Name cannot be empty or just spaces.'})

    def save(self, *args, **kwargs):
        self.full_clean()  # Run validations before saving

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




# from django.contrib.auth.models import AbstractUser
# from django.db import models
# import os
# import qrcode
# from io import BytesIO
# from django.core.files import File
# from django.db import models
#
#
# class Department(models.Model):
#     name = models.CharField(max_length=100)
#
#     def __str__(self):
#         return self.name
#
#
# class Employee(models.Model):
#     employee_id = models.CharField(max_length=20, unique=True)
#     name = models.CharField(max_length=100)
#     # position = models.CharField(max_length=100)
#     # department = models.ForeignKey(Department, on_delete=models.CASCADE)
#     contact = models.CharField(max_length=100)
#     qr_code = models.ImageField(upload_to='qrcodes/', blank=True)
#
#     def save(self, *args, **kwargs):
#         if not self.qr_code:
#             qrcode_img = qrcode.make(self.employee_id)
#             buffer = BytesIO()
#             qrcode_img.save(buffer, format="PNG")
#             filename = f'qr_{self.employee_id}.png'
#             self.qr_code.save(filename, File(buffer), save=False)
#         super().save(*args, **kwargs)
#
#     def __str__(self):
#         return f"{self.name} ({self.employee_id})"
#
#
# class CustomUser(AbstractUser):
#     is_admin = models.BooleanField(default=False)
#
#     def __str__(self):
#         return self.username