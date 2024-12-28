<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamResult.aspx.cs" Inherits="BugzUniversity.ExamResult" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Results</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
/* General Styling */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f8f9fa;
    margin: 0;
    padding: 0;
}

/* Sidebar Styling */
.sidebar {
    width: 250px;
    height: 100%;
    position: fixed;
    top: 0;
    left: 0;
    background-color: #2c3e50;
    color: white;
    padding-top: 30px;
    transition: width 0.3s;
    z-index: 100;
}

.sidebar h2 {
    color: #ffffff;
    text-align: center;
    margin-bottom: 20px;
}

.sidebar a {
    color: #f8f9fa;
    text-decoration: none;
    display: block;
    padding: 15px;
    font-size: 16px;
    transition: background-color 0.3s;
}

.sidebar a:hover {
    background-color: #575757;
}

.sidebar .category-header {
    color: white;
    padding: 10px;
    background-color: #060060;
    text-align: center;
}

.sidebar .nav-item {
    margin: 0;
}

.sidebar .nav-link {
    padding: 12px 20px;
    font-size: 16px;
}

/* Content Styling */
.content {
    margin-left: 250px; /* Sidebar space */
    padding: 30px;
    background-color: #ffffff;
    min-height: 100vh;
}

/* Table Styling */
.table {
    width: 100%;
    background-color: #fff;
    border-collapse: collapse;
    margin-top: 20px;
}

.table th, .table td {
    padding: 12px;
    text-align: left;
    border: 1px solid #ddd;
}

.table th {
    background-color: #2c3e50;
    color: white;
}

.table td {
    background-color: #f9f9f9;
}

.table-bordered {
    border: 1px solid #ddd;
}

.table-striped tbody tr:nth-of-type(odd) {
    background-color: #f2f2f2;
}

.table-hover tbody tr:hover {
    background-color: #f1f1f1;
}

/* Label Message Styling */
.text-danger {
    color: red;
    font-weight: bold;
}

/* Responsive Layout for Sidebar and Content */
@media (max-width: 768px) {
    .sidebar {
        width: 100%;
        height: auto;
        position: relative;
        padding-top: 20px;
    }

    .sidebar a {
        padding: 12px;
        text-align: center;
    }

    .content {
        margin-left: 0;
        padding: 15px;
    }
}

    </style>
</head>
<body>
      <div class="sidebar">
    <h2 class="text-center text-white">Instructor Dashboard</h2>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="#">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#instructorManagement" role="button" aria-expanded="false" aria-controls="instructorManagement">Instructor Management</a>
            <ul class="collapse category" id="instructorManagement">
                <li><a href="UserInstructorDetails.aspx">Instructor Dashboard</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#examManagement" role="button" aria-expanded="false" aria-controls="examManagement">Examination Management</a>
            <ul class="collapse category" id="examManagement">
                <li><a href="ExamScheduling.aspx">Exam Scheduling</a></li>
                <li><a href="ExamResultEntry.aspx">Exam Results Entry</a></li>
                <li><a href="ExamResult.aspx">Exam Results</a></li>
                <li><a href="ExamsSchedule.aspx">Exam Schedule</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#gradeManagement" role="button" aria-expanded="false" aria-controls="gradeManagement">Grade Management</a>
            <ul class="collapse category" id="gradeManagement">
                <li><a href="ExamResultEntry.aspx">Grade Entry</a></li>
                <li><a href="GradeAuditLog.aspx">Grade Audit Log</a></li>
            </ul>
        </li>
    </ul>
</div>
    <form id="form1" runat="server">
        <div class="container">
            <h2 class="mb-4">Exam Results</h2>
            <asp:Label ID="lblMessage" runat="server" CssClass="text-danger"></asp:Label>
            <asp:GridView ID="gvExamResults" runat="server" CssClass="table table-bordered" AutoGenerateColumns="False">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                    <asp:BoundField DataField="student_name" HeaderText="Student Name" />
                    <asp:BoundField DataField="course_name" HeaderText="Course" />
                    <asp:BoundField DataField="grade" HeaderText="Grade" />
                </Columns>
            </asp:GridView>
        </div>
    </form>
</body>
</html>
