<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminInstructorManagment.aspx.cs" Inherits="ums.AdminInstructorManagment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <style>
        /* General Page Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
            color: #333;
        }

        /* Navigation Bar */
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

        /* Container Styling */
        form {
            max-width: 900px;
            margin: 20px auto;
            padding: 20px;
            background: #ffffff;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            border-radius: 8px;
        }

        /* Section Styling */
        .section {
            margin-bottom: 20px;
        }

        .section h1 {
            font-size: 2rem;
            color: #2c3e50;
            margin-bottom: 10px;
            text-align: center;
        }

        .section h3 {
            font-size: 1.5rem;
            color: #34495e;
            margin-bottom: 5px;
        }

        .section p {
            font-size: 1rem;
            color: #7f8c8d;
            margin-bottom: 15px;
        }

        /* Button Styling */
        .btn {
            display: inline-block;
            background-color: #2c3e50;
            color: #ffffff;
            font-size: 1rem;
            padding: 10px 20px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            text-decoration: none;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #2980b9;
        }

        /* Responsive Design */
        @media (max-width: 768px) {
            form {
                padding: 10px;
            }

            .section h1 {
                font-size: 1.5rem;
            }

            .section h3 {
                font-size: 1.2rem;
            }

            .btn {
                font-size: 0.9rem;
                padding: 8px 15px;
            }
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
    <form id="form1" runat="server">
        <div id="instructorManagement" class="section">
            <h1>Instructor Management</h1>
            <h3>Instructor Details Page</h3>
            <p>Detailed profile of an instructor, including their teaching schedule.</p>
            <a href="InstructorsDetails.aspx" class="btn">View Instructor Details</a>
            <h3>Insert Instructor Details Page</h3>
            <p>Insert a new instructor</p>
            <a href="AdminInsertInstructor.aspx" class="btn">Insert Instructor</a>
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
