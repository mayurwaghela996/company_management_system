import gspread
from oauth2client.service_account import ServiceAccountCredentials
from .models import Assignment
from datetime import date

def export_assignments_to_sheet(sheet_name=None):
    scope = ['https://www.googleapis.com/auth/spreadsheets', 'https://www.googleapis.com/auth/drive']
    creds = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
    client = gspread.authorize(creds)

    if not sheet_name:
        sheet_name = f"Prod_Report_{date.today()}"

    spreadsheet = client.create(sheet_name)
    sheet = spreadsheet.sheet1
    sheet.append_row(['Date', 'Department', 'Employee', 'Start Time'])

    assignments = Assignment.objects.select_related('department', 'employee').order_by('date')
    for a in assignments:
        sheet.append_row([str(a.date), a.department.name, a.employee.name, a.start_time.strftime('%H:%M')])

    return spreadsheet.url




# # production/sheets.py
#
# import gspread
# from oauth2client.service_account import ServiceAccountCredentials
# from .models import Assignment
# from datetime import date
# import pandas as pd
#
# def export_assignments_to_sheet(sheet_name: str = None):
#     # Setup credentials
#     scope = ['https://spreadsheets.google.com/feeds', 'https://www.googleapis.com/auth/drive']
#     creds = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
#     client = gspread.authorize(creds)
#
#     # Use provided name or create one
#     if not sheet_name:
#         today = date.today()
#         sheet_name = f"Production_Assignments_{today.strftime('%Y-%m-%d')}"
#
#     # Create or open sheet
#     try:
#         sheet = client.open(sheet_name).sheet1
#     except gspread.SpreadsheetNotFound:
#         sheet = client.create(sheet_name).sheet1
#
#     # Set header
#     sheet.clear()
#     headers = ['Date', 'Department', 'Employee', 'Start Time']
#     sheet.append_row(headers)
#
#     # Get all assignments
#     assignments = Assignment.objects.select_related('department', 'employee').order_by('date')
#
#     # Format for Google Sheets
#     data = [
#         [str(a.date), a.department.name, a.employee.name, a.start_time.strftime('%H:%M')]
#         for a in assignments
#     ]
#
#     # Write to sheet
#     sheet.append_rows(data)
#     return sheet.url
