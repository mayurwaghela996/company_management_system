from django.views.generic import ListView, CreateView
from django.urls import reverse_lazy
from .models import AttendanceRecord
from .forms import AttendanceRecordForm
from reportlab.pdfgen import canvas
from django.http import HttpResponse
from django.utils.timezone import now
from django.utils import timezone
from reportlab.lib.pagesizes import A4
from reportlab.lib import colors
from reportlab.platypus import Table, TableStyle, SimpleDocTemplate, Paragraph, Spacer
from reportlab.lib.styles import getSampleStyleSheet
import io


class AttendanceListView(ListView):
    model = AttendanceRecord
    template_name = 'attendance/attendance_list.html'

    def get_queryset(self):
        date = self.request.GET.get('date')
        if date:
            return AttendanceRecord.objects.filter(date=date)
        return AttendanceRecord.objects.all()


class AttendanceCreateView(CreateView):
    model = AttendanceRecord
    form_class = AttendanceRecordForm
    template_name = 'attendance/attendance_form.html'
    success_url = reverse_lazy('attendance-list')


# class AttendanceReportView(ListView):
#     model = AttendanceRecord
#     template_name = 'attendance/attendance_report.html'
#
#     def get_context_data(self, **kwargs):
#         context = super().get_context_data(**kwargs)
#         # Add report generation logic here
#         return context

class AttendanceReportView(ListView):
    model = AttendanceRecord
    template_name = 'attendance/attendance_report.html'

    def get_queryset(self):
        date = self.request.GET.get('date')
        if date:
            return AttendanceRecord.objects.filter(date=date)
        return AttendanceRecord.objects.none()

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # context['selected_date'] = self.request.GET.get('date', now().date())
        context['selected_date'] = self.request.GET.get('date') or timezone.now().date()
        return context




#     def generate_pdf_report(request, date):
#         # Get attendance data
#         records = AttendanceRecord.objects.filter(date=date)
#
#         # Create PDF response
#         response = HttpResponse(content_type='application/pdf')
#         response['Content-Disposition'] = f'attachment; filename="attendance_report_{date}.pdf"'
#
#         # Create PDF
#         p = canvas.Canvas(response)
#
#         # Add content to PDF
#         p.drawString(100, 800, f"Attendance Report - {date}")
#
#         y_position = 750
#         for record in records:
#             p.drawString(100, y_position, f"{record.employee.name}: {record.total_hours} hours")
#             y_position -= 20
#
#         p.showPage()
#         p.save()
#
#         return response
#
#
# def generate_pdf_report(request):
#     date = request.GET.get('date')
#     if not date:
#         return HttpResponse("Please provide a date (e.g., ?date=2024-06-01)", status=400)
#
#     records = AttendanceRecord.objects.filter(date=date)
#     response = HttpResponse(content_type='application/pdf')
#     response['Content-Disposition'] = f'attachment; filename="attendance_report_{date}.pdf"'
#
#     p = canvas.Canvas(response)
#     p.drawString(100, 800, f"Attendance Report - {date}")
#
#     y = 760
#     for record in records:
#         total = record.total_hours or "N/A"
#         p.drawString(100, y, f"{record.employee.name}: {total} hours")
#         y -= 20
#         if y < 100:
#             p.showPage()
#             y = 800
#
#     p.showPage()
#     p.save()
#
#     return response


# def generate_pdf_report(request):
#     date = request.GET.get('date')
#     if not date:
#         return HttpResponse("Please provide a date (e.g., ?date=2024-06-01)", status=400)
#
#     records = AttendanceRecord.objects.filter(date=date)
#     response = HttpResponse(content_type='application/pdf')
#     response['Content-Disposition'] = f'attachment; filename="attendance_report_{date}.pdf"'
#
#     p = canvas.Canvas(response)
#     p.setFont("Helvetica", 12)
#     p.drawString(50, 800, f"Attendance Report - {date}")
#
#     y = 770
#     for record in records:
#         total = record.total_hours or "-"
#         p.drawString(50, y, f"{record.employee.name} | Total Hours: {total}")
#         y -= 20
#         if y < 50:
#             p.showPage()
#             y = 800
#
#     p.showPage()
#     p.save()
#
#     return response


def generate_pdf_report(request):
    date = request.GET.get('date')
    if not date:
        return HttpResponse("Please provide a date (e.g., ?date=2025-06-05)", status=400)

    records = AttendanceRecord.objects.filter(date=date)
    if not records.exists():
        return HttpResponse("No records found for this date.", status=404)

    buffer = io.BytesIO()
    doc = SimpleDocTemplate(buffer, pagesize=A4)
    elements = []
    styles = getSampleStyleSheet()

    elements.append(Paragraph(f"Attendance Report - {date}", styles['Title']))
    elements.append(Spacer(1, 12))

    # Header row
    data = [
        [
            'Employee',
            'In 1', 'Out 1',
            'In 2', 'Out 2',
            'In 3', 'Out 3',
            'In 4', 'Out 4',
            'Total Hours'
        ]
    ]

    # Data rows
    for r in records:
        data.append([
            r.employee.name,
            r.in_1.strftime('%H:%M') if r.in_1 else '-',
            r.out_1.strftime('%H:%M') if r.out_1 else '-',
            r.in_2.strftime('%H:%M') if r.in_2 else '-',
            r.out_2.strftime('%H:%M') if r.out_2 else '-',
            r.in_3.strftime('%H:%M') if r.in_3 else '-',
            r.out_3.strftime('%H:%M') if r.out_3 else '-',
            r.in_4.strftime('%H:%M') if r.in_4 else '-',
            r.out_4.strftime('%H:%M') if r.out_4 else '-',
            str(r.total_hours)
        ])

    # Create table
    table = Table(data, colWidths=[80] + [40] * 8 + [60])
    table.setStyle(TableStyle([
        ('BACKGROUND', (0, 0), (-1, 0), colors.lightblue),
        ('TEXTCOLOR', (0, 0), (-1, 0), colors.black),
        ('ALIGN', (0, 0), (-1, -1), 'CENTER'),
        ('FONTNAME', (0, 0), (-1, 0), 'Helvetica-Bold'),
        ('BOTTOMPADDING', (0, 0), (-1, 0), 10),
        ('GRID', (0, 0), (-1, -1), 0.5, colors.grey),
    ]))

    elements.append(table)
    doc.build(elements)

    buffer.seek(0)
    return HttpResponse(buffer, content_type='application/pdf', headers={
        'Content-Disposition': f'attachment; filename="attendance_report_{date}.pdf"'
    })