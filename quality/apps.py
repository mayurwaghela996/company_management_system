# production/apps.py
from django.apps import AppConfig

class ProductionConfig(AppConfig):
    default_auto_field = 'django.db.models.BigAutoField'
    name = 'quality'
    # label = 'prod'  # Uncomment and set unique label if needed