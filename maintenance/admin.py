from django.contrib import admin
from .models import Department, Machine, Mechanic, MaintenanceReport

admin.site.register(Department)
admin.site.register(Machine)
admin.site.register(Mechanic)
admin.site.register(MaintenanceReport)
