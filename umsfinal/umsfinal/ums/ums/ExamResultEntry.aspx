<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="ExamResultEntry.aspx.cs" Inherits="BugzUniversity.ExamResultEntry" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Exam Results Entry</title>
      <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
  <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/css/bootstrap.min.css" rel="stylesheet">
  <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.2/css/bootstrap.min.css">
    <style>
        .btn-primary {
        background-color: #2c3e50;
        }
        .sidebar {
            width: 250px;
            height: 100%;
            position: fixed;
            top: 0;
            left: 0;
            background-color: #060060;
            color: white;
            padding-top: 20px;
        }
        .content {
            margin-left: 250px;
            padding: 20px;
        }
        .grade-dropdown {
            width: 100px;
        }
               body {
           font-family: Arial, sans-serif;
       }
       .sidebar {
           width: 250px;
           height: 100%;
           position: fixed;
           top: 0;
           left: 0;
           background-color: #2c3e50;
           color: white;
           padding-top: 20px;
           transition: width 0.3s;
       }
       .sidebar a {
           color: white;
           text-decoration: none;
           display: block;
           padding: 15px;
       }
       .sidebar a:hover {
           background-color: #575757;
       }
       .sidebar .nav-link.active {
           background-color: #575757;
       }
       .sidebar .category-header {
           color: white;
           padding: 10px;
           background-color: #060060;
       }
       .content {
           margin-left: 250px;
           padding: 20px;
       }
       .category {
           list-style-type: none;
           padding: 0;
       }
       .category > li {
           padding-left: 15px;
           margin-top: 5px;
       }
       .category > li > a {
           color: #f8f9fa;
           padding-left: 20px;
           text-decoration: none;
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
        <div class="content">
            <div class="container">
                <h2 class="mb-4">Exam Results Entry</h2>
                
                <div class="form-group">
                    <label for="ddlCourses">Select Course:</label>
                    <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control" AutoPostBack="true" 
                        OnSelectedIndexChanged="ddlCourses_SelectedIndexChanged">
                    </asp:DropDownList>
                </div>

                <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                    CssClass="table table-bordered table-striped" OnRowDataBound="gvStudents_RowDataBound">
                    <Columns>
                        <asp:BoundField DataField="student_id" HeaderText="Student ID" />
                        <asp:BoundField DataField="full_name" HeaderText="Student Name" />
                        <asp:TemplateField HeaderText="Grade">
                            <ItemTemplate>
                                <asp:DropDownList ID="ddlGrade" runat="server" CssClass="form-control grade-dropdown">
                                    <asp:ListItem Text="Select Grade" Value="" />
                                    <asp:ListItem Text="A" Value="A" />
                                    <asp:ListItem Text="A-" Value="A-" />
                                    <asp:ListItem Text="B+" Value="B+" />
                                    <asp:ListItem Text="B" Value="B" />
                                    <asp:ListItem Text="B-" Value="B-" />
                                    <asp:ListItem Text="C+" Value="C+" />
                                    <asp:ListItem Text="C" Value="C" />
                                    <asp:ListItem Text="C-" Value="C-" />
                                    <asp:ListItem Text="D+" Value="D+" />
                                    <asp:ListItem Text="D" Value="D" />
                                    <asp:ListItem Text="F" Value="F" />
                                </asp:DropDownList>
                            </ItemTemplate>
                        </asp:TemplateField>
                        <asp:BoundField DataField="current_grade" HeaderText="Current Grade" />
                    </Columns>
                </asp:GridView>

                <div class="form-group mt-3">
                    <asp:Button ID="btnSave" runat="server" Text="Save Grades" 
                        CssClass="btn btn-primary" OnClick="btnSave_Click" />
                    <asp:Label ID="lblMessage" runat="server" CssClass="ml-3"></asp:Label>
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