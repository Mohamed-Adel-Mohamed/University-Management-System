<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentEnrollment.aspx.cs" Inherits="UMS.StudentEnrollment" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Enrollment</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
        }
        .container {
            width: 70%;
            margin: auto;
            background: #fff;
            padding: 20px;
            margin-top: 50px;
            border-radius: 8px;
            box-shadow: 0px 0px 10px 0px rgba(0, 0, 0, 0.1);
        }
        .form-group {
            margin-bottom: 15px;
        }
        .form-group label {
            display: block;
            font-weight: bold;
        }
        .form-group select,
        .form-group input {
            width: 100%;
            padding: 8px;
            margin-top: 5px;
        }
        .btn {
            display: inline-block;
            padding: 10px 20px;
            background-color: #2c3e50;
            color: #fff;
            text-align: center;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            margin-top: 10px;
        }
        .btn:hover {
            background-color: #2980b9;
        }
        .navbar {
            background-color: #2c3e50;
            color: #fff;
            padding: 10px 20px;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }
        .navbar h2 {
            margin: 0;
            font-size: 1.5rem;
        }
        .navbar nav {
            display: flex;
        }
        .navbar nav a {
            color: #ecf0f1;
            text-decoration: none;
            padding: 10px 15px;
            margin: 0 5px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }
        .navbar nav a:hover {
            background-color: #34495e;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <h2>Bugz University Admin</h2>
        <nav>
            <a href="admin-dashboard.aspx">Dashboard</a>
            <a href="AdminStudentMangeOverView.aspx">Student Management</a>
            <a href="AdminCourseManagement.aspx">Course Management</a>
            <a href="AdminInstructorManagment.aspx">Instructor Management</a>
            <a href="AdminDepartmentManagment.aspx">Department Management</a>
            <a href="#">Role Management</a>
        </nav>
    </div>
    <div class="container">
        <h2>Enroll Student in a Course</h2>
        <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
        <form runat="server">
            <div class="form-group">
                <label for="ddlStudents">Select Student</label>
                <asp:DropDownList ID="ddlStudents" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select a Student" Value="" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="ddlCourses">Select Course</label>
                <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select a Course" Value="" />
                </asp:DropDownList>
            </div>
            <div class="form-group">
                <label for="txtEnrollmentDate">Enrollment Date</label>
                <asp:TextBox ID="txtEnrollmentDate" runat="server" CssClass="form-control" TextMode="Date" />
            </div>
            <div class="form-group">
                <label for="ddlStatus">Status</label>
                <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                    <asp:ListItem Text="Select Status" Value="" />
                    <asp:ListItem Text="Enrolled" Value="Enrolled" />
                    <asp:ListItem Text="Waitlisted" Value="Waitlisted" />
                    <asp:ListItem Text="Completed" Value="Completed" />
                </asp:DropDownList>
            </div>
            <asp:Button ID="btnEnroll" runat="server" Text="Enroll" CssClass="btn" OnClick="btnEnroll_Click" />
        </form>
    </div>
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
