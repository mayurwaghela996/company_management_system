from django.views.generic import ListView, CreateView
from django.urls import reverse_lazy
from .models import AttendanceRecord
from .forms import AttendanceRecordForm
from reportlab.pdfgen import canvas
from django.http import HttpResponse


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


class AttendanceReportView(ListView):
    model = AttendanceRecord
    template_name = 'attendance/attendance_report.html'

    def get_context_data(self, **kwargs):
        context = super().get_context_data(**kwargs)
        # Add report generation logic here
        return context

    def generate_pdf_report(request, date):
        # Get attendance data
        records = AttendanceRecord.objects.filter(date=date)

        # Create PDF response
        response = HttpResponse(content_type='application/pdf')
        response['Content-Disposition'] = f'attachment; filename="attendance_report_{date}.pdf"'

        # Create PDF
        p = canvas.Canvas(response)

        # Add content to PDF
        p.drawString(100, 800, f"Attendance Report - {date}")

        y_position = 750
        for record in records:
            p.drawString(100, y_position, f"{record.employee.name}: {record.total_hours} hours")
            y_position -= 20

        p.showPage()
        p.save()

        return response
