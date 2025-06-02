import gspread
from oauth2client.service_account import ServiceAccountCredentials

scope = ['https://spreadsheets.google.com/feeds','https://www.googleapis.com/auth/drive']
creds = ServiceAccountCredentials.from_json_keyfile_name('credentials.json', scope)
client = gspread.authorize(creds)

# Create spreadsheet
spreadsheet = client.create("Test Sheet From Python")

# Share with your email
spreadsheet.share('your.email@gmail.com', perm_type='user', role='writer')

print(f"Spreadsheet created: {spreadsheet.url}")