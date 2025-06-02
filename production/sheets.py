# production/sheets.py

import gspread
from oauth2client.service_account import ServiceAccountCredentials
from .models import ProductionPlan
from datetime import date
import pandas as pd

def export_assignments_to_sheet(sheet_name: str = None):
    # Setup credentials
    scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
    creds = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
    client = gspread.authorize(creds)

    # Use provided name or create one
    if not sheet_name:
        today = date.today()
        sheet_name = f"Production_Assignments_{today.strftime('%Y-%m-%d')}"

    # Create or open sheet
    try:
        sheet = client.open(sheet_name).sheet1
    except gspread.SpreadsheetNotFound:
        sheet = client.create(sheet_name).sheet1

    # Set header
    sheet.clear()
    headers = ['Date', 'Department', 'Employee', 'Start Time']
    sheet.append_row(headers)

    # Get all assignments
    # assignments = Assignment.objects.select_related('department', 'employee').order_by('date')
    assignments = ProductionPlan.objects.select_related('department', 'employee').order_by('date')
    # Format for Google Sheets
    data = [
        [str(a.date), a.department.name, a.employee.name, a.start_time.strftime('%H:%M')]
        for a in assignments
    ]

    # Write to sheet
    sheet.append_rows(data)
    return sheet.url
