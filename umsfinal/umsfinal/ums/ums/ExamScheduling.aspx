<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamScheduling.aspx.cs" Inherits="ums.ExamScheduling" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Schedule Management</title>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css" />
          <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <style>
        /* Your updated CSS */
              .btn-primary {
              background-color: #2c3e50;
              }
        .sidebar {
            width: 100%;
            height: auto;
            position: relative;
            background-color: #2c3e50;
            color: white;
            padding: 10px 0;
            display: flex;
            justify-content: space-around;
            flex-wrap: wrap;
        }

        .sidebar a {
            color: white;
            text-decoration: none;
            padding: 15px;
            margin: 0 10px;
        }

        .sidebar a:hover {
            background-color: #575757;
        }

        .sidebar .category-header {
            color: white;
            padding: 10px;
            background-color: #060060;
        }

        .content {
            padding: 20px;
            margin-top: 70px; /* Ensure content doesn't overlap with the navbar */
        }

        .category {
            list-style-type: none;
            padding: 0;
            display: flex;
            flex-wrap: wrap;
            justify-content: space-around;
        }

        .category > li {
            padding: 5px;
            margin: 10px;
        }

        .category > li > a {
            color: #f8f9fa;
            text-decoration: none;
        }
    </style>
</head>
<body>
      <div class="sidebar">
    <h2 class="text-center text-white">Instructor Dashboard</h2>
    <ul class="nav flex-column">
        <li class="nav-item">
            <a class="nav-link active" href="UserInstructorDetails.aspx">Home</a>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#UserInstructorDetails.aspx" role="button" aria-expanded="false" aria-controls="instructorManagement">Instructor Management</a>
            <ul class="collapse category" id="instructorManagement">
                <li><a href="UserInstructorDetails.aspx">Instructor Dashboard</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ExamScheduling.aspx" role="button" aria-expanded="false" aria-controls="examManagement">Examination Management</a>
            <ul class="collapse category" id="examManagement">
                <li><a href="ExamScheduling.aspx">Exam Scheduling</a></li>
                <li><a href="ExamResultEntry.aspx">Exam Results Entry</a></li>
                <li><a href="ExamResult.aspx">Exam Results</a></li>
                <li><a href="ExamsSchedule.aspx">Exam Schedule</a></li>
            </ul>
        </li>
        <li class="nav-item">
            <a class="nav-link collapsed" data-bs-toggle="collapse" href="#ExamResultEntry.aspx" role="button" aria-expanded="false" aria-controls="gradeManagement">Grade Management</a>
            <ul class="collapse category" id="gradeManagement">
                <li><a href="ExamResultEntry.aspx">Grade Entry</a></li>
                <li><a href="GradeAuditLog.aspx">Grade Audit Log</a></li>
            </ul>
        </li>
    </ul>
</div>
    <form id="form1" runat="server">
        <div class="container mt-4">
            <h2>Exam Schedule Management</h2>
            
            <div class="card mb-4">
                <div class="card-header">
                    <h4>Schedule New Exam</h4>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlDepartment">Department:</label>
                                <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control" 
                                    AutoPostBack="true" OnSelectedIndexChanged="ddlDepartment_SelectedIndexChanged">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="ddlCourse">Course:</label>
                                <asp:DropDownList ID="ddlCourse" runat="server" CssClass="form-control">
                                </asp:DropDownList>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtClassroom">Classroom:</label>
                                <asp:TextBox ID="txtClassroom" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                                            <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtdayofweek">day of week:</label>
                                <asp:TextBox ID="txtdayofweek" runat="server" CssClass="form-control"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtExamDate">Exam Date:</label>
                                <asp:TextBox ID="txtExamDate" runat="server" CssClass="form-control" TextMode="Date"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtStartTime">Start Time:</label>
                                <asp:TextBox ID="txtStartTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                        <div class="col-md-4">
                            <div class="form-group">
                                <label for="txtEndTime">End Time:</label>
                                <asp:TextBox ID="txtEndTime" runat="server" CssClass="form-control" TextMode="Time"></asp:TextBox>
                            </div>
                        </div>
                    </div>
                    
                    <div class="row mt-3">
                        <div class="col">
                            <asp:Button ID="btnSchedule" runat="server" Text="Schedule Exam" 
                                CssClass="btn btn-primary" OnClick="btnSchedule_Click" />
                            <asp:Label ID="lblMessage" runat="server" CssClass="ml-3"></asp:Label>
                        </div>
                    </div>
                </div>
            </div>

            <div class="card">
                <div class="card-header">
                    <h4>Scheduled Exams</h4>
                </div>
                <div class="card-body">
                    <asp:GridView ID="gvExams" runat="server" CssClass="table table-bordered table-striped" 
                        AutoGenerateColumns="False" OnRowCommand="gvExams_RowCommand">
                        <Columns>
                            <asp:BoundField DataField="department_name" HeaderText="Department" />
                            <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                            <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                            <asp:BoundField DataField="exam_date" HeaderText="Date" DataFormatString="{0:MM/dd/yyyy}" />
                            <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                            <asp:BoundField DataField="end_time" HeaderText="End Time" />
                            <asp:BoundField DataField="classroom_id" HeaderText="Classroom" />
                            <asp:TemplateField HeaderText="Actions">
                                <ItemTemplate>
                                    <asp:LinkButton ID="btnDelete" runat="server" CssClass="btn btn-danger btn-sm"
                                        CommandName="DeleteExam" CommandArgument='<%# Eval("schedule_id") %>'
                                        OnClientClick="return confirm('Are you sure you want to delete this exam?');">
                                        Delete
                                    </asp:LinkButton>
                                </ItemTemplate>
                            </asp:TemplateField>
                        </Columns>
                    </asp:GridView>
                </div>
            </div>
        </div>
    </form>
    <style>
    .logout-button {
        background-color: #e74c3c; /* Red color */
        color: #fff; /* White text */
        border: none; /* No border */
        padding: 10px 20px; /* Padding for better size */
        border-radius: 5px; /* Rounded corners */
        font-size: 16px; /* Readable font size */
        cursor: pointer; /* Pointer cursor on hover */
        text-decoration: none; /* Remove underline */
        display: inline-block; /* Allow inline placement */
        transition: background-color 0.3s ease; /* Smooth hover effect */
        position: fixed; /* Position fixed for placement */
        bottom: 20px; /* 20px above the bottom edge */
        left: 50%; /* Start positioning from the center */
        transform: translateX(-50%); /* Adjust to truly center horizontally */
    }

    .logout-button:hover {
        background-color: #c0392b; /* Darker red on hover */
    }
</style>

<a href="Default.aspx" class="logout-button">Logout</a>

</body>
</html>