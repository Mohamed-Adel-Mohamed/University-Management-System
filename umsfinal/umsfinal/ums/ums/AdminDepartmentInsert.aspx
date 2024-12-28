<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDepartmentInsert.aspx.cs" Inherits="UMS.AdminDepartmentInsert" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Insert Department - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
            display: flex;
            flex-direction: row;
        }

        .sidebar {
            width: 250px;
            height: 100vh;
            background-color: #2c3e50;
            color: #fff;
            padding: 20px;
            box-sizing: border-box;
            position: fixed;
        }

        .sidebar h2 {
            text-align: center;
            margin-bottom: 40px;
        }

        .sidebar nav a {
            display: block;
            padding: 10px 20px;
            color: #ecf0f1;
            text-decoration: none;
            font-size: 18px;
            margin-bottom: 15px;
            border-radius: 5px;
            transition: background-color 0.3s;
        }

        .sidebar nav a:hover {
            background-color: #34495e;
        }

        .content {
            margin-left: 250px;
            padding: 92px;
            flex-grow: 1;
            background-color: #ecf0f1;
        }

        .header h2 {
            text-align: center;
            color: #2c3e50;
        }

        .form-container {
            max-width: 800px;
            margin: 0 auto;
            background-color: #fff;
            padding: 40px;
            border-radius: 8px;
            box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
        }

        .form-group {
            margin-bottom: 15px;
        }

        .form-group label {
            display: block;
            font-size: 16px;
            margin-bottom: 5px;
        }

        .form-group input {
            width: 98%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input:focus {
            border-color: #3498db;
            outline: none;
        }

        .btn {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 20px;
            font-size: 16px;
            border-radius: 5px;
            cursor: pointer;
            transition: background-color 0.3s;
        }

        .btn:hover {
            background-color: #2980b9;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <div class="sidebar">
            <h2>Bugz University Admin</h2>
            <nav>
                <a href="admin-dashboard.aspx">Admin Dashboard</a>
                <a href="AdminStudentMangeOverView.aspx">Student Management</a>
                <a href="AdminCourseManagement.aspx">Course Management</a>
                <a href="AdminInstructorManagment.aspx">Instructor Management</a>
                <a href="AdminDepartmentManagment.aspx">Department Management</a>
            </nav>
        </div>

        <div class="content">
            <div class="header">
                <h2>Admin Insert Department</h2>
            </div>

            <div class="form-container">
                <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
                <asp:Panel runat="server">
                    <div class="form-group">
                        <label for="departmentId">Department ID</label>
                        <asp:TextBox ID="txtDepartmentId" runat="server" CssClass="form-control" required="required" />
                    </div>
                    <div class="form-group">
                        <label for="departmentName">Department Name</label>
                        <asp:TextBox ID="txtDepartmentName" runat="server" CssClass="form-control" required="required" />
                    </div>
                    <asp:Button ID="btnInsertDepartment" runat="server" Text="Insert Department" CssClass="btn" OnClick="btnInsertDepartment_Click" />
                </asp:Panel>
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
