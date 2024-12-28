<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="admin-dashboard.aspx.cs" Inherits="UMS.admin_dashboard" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Admin Dashboard - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
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
            margin-left: 750px;
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
            padding: 20px;
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

        .form-group input,
        .form-group select {
            width: 98%;
            padding: 10px;
            font-size: 14px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }

        .form-group input:focus,
        .form-group select:focus {
            border-color: #3498db;
            outline: none;
        }

        .form-group input[required],
        .form-group select[required] {
        }

        .form-group .error {
            color: #fff;
            font-size: 12px;
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

        .section {
            display: none;
        }

        .section.active {
            display: block;
        }

        .form-container .form-group {
            margin-bottom: 20px;
        }
        
        .form-group select,
        .form-group input {
            font-size: 16px;
        }

        .form-group input[type="email"] {
            text-transform: lowercase;
        }
    </style>
</head>

<body>

    <form runat="server">
        <div class="sidebar">
            <h2>Bugz University Admin</h2>
            <nav>
                <a href="#" onclick="showSection('registration')">Registration Page</a>
                <a href="AdminStudentMangeOverView.aspx" onclick="showSection('studentManagement')">Student Management</a>
                <a href="AdminCourseManagement.aspx" onclick="showSection('courseManagement')">Course Management</a>
                <a href="AdminInstructorManagment.aspx" onclick="showSection('instructorManagement')">Instructor Management</a>
                <a href="AdminDepartmentManagment.aspx" onclick="showSection('departmentManagement')">Department Management</a>
                <a href="#" onclick="showSection('roleManagement')">Role Management</a>
            </nav>
        </div>

        <div class="content">
            <div class="header">
                <h2>Welcome to Admin Dashboard</h2>
            </div>

            <!-- Registration Form -->
            <div id="registration" class="section active">
                <div class="form-container">
                    <asp:Label ID="lblMessage" runat="server" Text="" ForeColor="Green"></asp:Label>
                    <asp:ValidationSummary ID="ValidationSummary" runat="server" ForeColor="Red" />
                    <asp:Panel runat="server">
                        <div class="form-group">
                            <label for="studentId">Student ID</label>
                            <asp:TextBox ID="txtStudentId" runat="server" CssClass="form-control" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="firstName"> Full Name </label>
                            <asp:TextBox ID="txtFirstName" runat="server" CssClass="form-control" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="lastName">Password</label>
                            <asp:TextBox ID="txtLastName" runat="server" CssClass="form-control" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="email">Email</label>
                            <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control" TextMode="Email" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="phone">Phone</label>
                            <asp:TextBox ID="txtPhone" runat="server" CssClass="form-control" required="required" />
                        </div>
                        <div class="form-group">
                            <label for="department">Department</label>
                            <asp:DropDownList ID="ddlDepartment" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select Department" Value="" />
                                <asp:ListItem Text="1 - Computer Science" Value="1" />
                                <asp:ListItem Text="2 - Engineering" Value="2" />
                                <asp:ListItem Text="3 - Business" Value="3" />
                                <asp:ListItem Text="4 - Arts" Value="4" />
                            </asp:DropDownList>

                            <asp:RequiredFieldValidator ID="rfvDepartment" runat="server" ControlToValidate="ddlDepartment" InitialValue="" ErrorMessage="Please select a department." ForeColor="Red" />
                        </div>
                        <div class="form-group">
                            <label for="status">Status</label>
                            <asp:DropDownList ID="ddlStatus" runat="server" CssClass="form-control">
                                <asp:ListItem Text="Select Status" Value="" />
                                <asp:ListItem Text="Active" Value="Active" />
                                <asp:ListItem Text="Inactive" Value="Inactive" />
                            </asp:DropDownList>
                            <asp:RequiredFieldValidator ID="rfvStatus" runat="server" ControlToValidate="ddlStatus" InitialValue="" ErrorMessage="Please select a status." ForeColor="Red" />
                        </div>
                        <div class="form-group">
                            <label for="address">Address</label>
                            <asp:TextBox ID="txtAddress" runat="server" CssClass="form-control" required="required" />
                        </div>
                        <asp:Button ID="btnRegister" runat="server" Text="Register Student" CssClass="btn" OnClick="BtnRegister_Click" />
                    </asp:Panel>
                </div>
            </div>
        </div>
    </form>
    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => section.classList.remove('active'));
            document.getElementById(sectionId).classList.add('active');
        }

        showSection('registration');
    </script>
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
