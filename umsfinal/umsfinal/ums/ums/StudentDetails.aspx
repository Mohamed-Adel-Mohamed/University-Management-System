<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDetails.aspx.cs" Inherits="YourNamespace.StudentDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Details</title>
    <style>
        /* General Body Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #ecf0f1;
            margin: 0;
            padding: 0;
            display: flex;
            height: 100vh;
            color: #333;
        }

        /* Sidebar Navigation Styling */
        .navbar {
            width: 220px;
            background-color: #2c3e50; /* Blue background */
            padding-top: 30px;
            position: fixed;
            top: 0;
            left: 0;
            bottom: 0;
            display: flex;
            flex-direction: column;
            align-items: center;
            z-index: 1000;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            font-size: 1.1rem;
            margin: 10px 0;
            padding: 10px 20px;
            width: 80%;
            text-align: center;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .navbar a:hover {
            background-color: #2e59d9;
        }

        .navbar .active {
            background-color: #1e44b8;
        }

        /* Main Content Styling */
        .main-content {
            margin-left: 240px; /* To avoid overlap with the sidebar */
            padding: 20px;
            flex-grow: 1;
            overflow: auto;
        }

        /* Form Container */
        form {
            margin-left: 290px;
            width: 100%;
            max-width: 1000px;
            background-color: #ffffff;
            padding: 30px;
            border-radius: 10px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            box-sizing: border-box;
        }

        /* Title */
        h1 {
            color: #4e73df;
            text-align: center;
            margin-bottom: 30px;
            font-size: 2rem;
            font-weight: 600;
        }

        /* Search Bar */
        label {
            font-size: 1.1rem;
            color: #495057;
            margin-right: 15px;
        }

        #txtSearchStudentId {
            padding: 10px;
            width: 250px;
            border: 1px solid #ccc;
            border-radius: 5px;
            font-size: 1rem;
            margin-right: 20px;
            transition: border-color 0.3s ease;
        }

        #txtSearchStudentId:focus {
            border-color: #4e73df;
            outline: none;
        }

        #btnSearch {
            background-color: #2c3e50;
            color: white;
            border: none;
            padding: 10px 25px;
            border-radius: 5px;
            font-size: 1rem;
            cursor: pointer;
            transition: background-color 0.3s ease, transform 0.2s ease;
        }

        #btnSearch:hover {
            background-color: #2e59d9;
            transform: scale(1.05);
        }

        #btnSearch:active {
            background-color: #1e44b8;
        }

        /* GridView Styling */
        asp\:GridView {
            width: 100%;
            border-collapse: collapse;
            margin-top: 30px;
            border-radius: 8px;
            overflow: hidden;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
        }

        asp\:GridView th, asp\:GridView td {
            padding: 12px;
            text-align: left;
            border-bottom: 1px solid #ddd;
            font-size: 1rem;
        }

        asp\:GridView th {
            background-color: #4e73df;
            color: white;
            font-size: 1.1rem;
            font-weight: 600;
        }

        asp\:GridView td {
            background-color: #f8f9fa;
            color: #495057;
        }

        asp\:GridView tr:nth-child(odd) td {
            background-color: #f1f3f5;
        }

        asp\:GridView tr:hover {
            background-color: #e9ecef;
        }

        asp\:GridView .pager {
            text-align: center;
            margin-top: 30px;
        }

        asp\:GridView .pager a {
            padding: 8px 18px;
            margin: 0 7px;
            background-color: #4e73df;
            color: white;
            text-decoration: none;
            border-radius: 5px;
            font-size: 1rem;
            transition: background-color 0.3s ease;
        }

        asp\:GridView .pager a:hover {
            background-color: #2e59d9;
        }

        asp\:GridView .pager a:active {
            background-color: #1e44b8;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            body {
                flex-direction: column;
                height: auto;
                justify-content: flex-start;
            }

            .navbar {
                width: 100%;
                flex-direction: row;
                justify-content: space-around;
                position: relative;
            }

            .main-content {
                margin-left: 0;
                padding: 10px;
            }

            #txtSearchStudentId, #btnSearch {
                width: 100%;
                margin-right: 0;
            }

            form {
                width: 100%;
                padding: 20px;
            }

            h1 {
                font-size: 1.5rem;
            }
        }


    </style>
</head>
<body>
    <!-- Sidebar Navigation -->
    <div class="navbar">
        <a href="admin-dashboard.aspx">Dashboard</a>
        <a href="AdminStudentMangeOverView.aspx" class="active">Student Management</a>
        <a href="AdminCourseManagement.aspx">Course Management</a>
        <a href="AdminInstructorManagment.aspx">Instructor Management</a>
        <a href="AdminDepartmentManagment.aspx">Department Management</a>
        <a href="RoleManagement.aspx">Role Management</a>
    </div>

    <!-- Main Content Area -->
    <div class="main-content">
        <form id="form1" runat="server">
            <div>
                <label for="txtSearchStudentId">Search by Student ID:</label>
                <asp:TextBox ID="txtSearchStudentId" runat="server" placeholder="Enter Student ID to Search"></asp:TextBox>
                <asp:Button ID="btnSearch" runat="server" Text="Search" OnClick="btnSearch_Click" />
            </div>

            <asp:GridView ID="gvStudents" runat="server" AutoGenerateColumns="False" 
                          OnPageIndexChanging="gvStudents_PageIndexChanging" AllowPaging="True" 
                          PageSize="10">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" SortExpression="student_id" />
                    <asp:BoundField DataField="first_name" HeaderText="Full Name" SortExpression="first_name" />
                    <asp:BoundField DataField="last_name" HeaderText="Password" SortExpression="last_name" />
                    <asp:BoundField DataField="email" HeaderText="Email" SortExpression="email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" SortExpression="phone" />
                    <asp:BoundField DataField="department_id" HeaderText="Department ID" SortExpression="department_id" />
                    <asp:BoundField DataField="advisor_id" HeaderText="Advisor ID" SortExpression="advisor_id" />
                    <asp:BoundField DataField="GPA" HeaderText="GPA" SortExpression="GPA" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="address" HeaderText="Address" SortExpression="address" />
                </Columns>
            </asp:GridView>
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
