<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminDepartmentManagment.aspx.cs" Inherits="ums.AdminDepartmentManagment" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
   <style>
        /* Basic Styling */
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
        }

        #form1 {
            padding: 20px;
        }

        h1 {
            color: #333;
            font-size: 24px;
        }

        h3 {
            color: #555;
            font-size: 18px;
        }

        p {
            font-size: 16px;
            color: #666;
        }

        /* Button Styling */
        .btn {
            background-color: #2c3e50; /* Green */
            color: white;
            padding: 10px 20px;
            margin: 10px 0;
            border: none;
            cursor: pointer;
            font-size: 16px;
            border-radius: 5px;
            transition: background-color 0.3s ease;
        }

        .btn:hover {
            background-color: #45a049;
        }

        /* Section Styling */
        .section {
            background-color: white;
            border-radius: 8px;
            padding: 20px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            margin-bottom: 20px;
        }

        /* Link Styling */
        a {
            text-decoration: none;
        }

        /* For buttons inside the links */
        button {
            border: none;
            background: none;
            padding: 0;
            cursor: pointer;
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
    </style>

</head>
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
<body>
<form id="form1" runat="server">
    <div>
        <div id="departmentManagement" class="section">
            <h1>Department Management</h1>
            <h3>Department List Page</h3>
            <p>View all departments details with their courses, instructors, and students.</p>
            
          <button class="btn" type="button" onclick="window.location.href='DepartmentDetails.aspx'">Depatment list</button>

            
            <h3>Insert Department</h3>
            <p>Insert department page</p>
            
          <button class="btn" type="button" onclick="window.location.href='AdminDepartmentInsert.aspx'">Insert Department</button>

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
