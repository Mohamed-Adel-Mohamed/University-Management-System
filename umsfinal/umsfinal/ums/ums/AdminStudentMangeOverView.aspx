<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminStudentMangeOverView.aspx.cs" Inherits="ums.AdminStudentMangeOverView" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Management Overview</title>
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
        .form-group select[required] {}

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
    <div class="sidebar">
        <h2>Student Management</h2>
        <nav>
            <a href="admin-dashboard.aspx" onclick="showSection('Home')">Home</a>
            <a href="#" onclick="showSection('studentList')">Student List</a>
            <a href="#" onclick="showSection('studentDetails')">Student Details</a>
            <a href="#" onclick="showSection('studentEnrollment')">Student Enrollment</a>
        </nav>
    </div>

    <div class="content">
        <div id="studentList" class="section active">
            <h1>Student Management</h1>
            <h3>Student List Page</h3>
            <p>View, search, and filter students. Add, update, or delete student records.</p>
            <a href="smanagment.aspx">
                <button class="btn">Manage Students</button>
            </a>
        </div>

        <div id="studentDetails" class="section">
            <h3>Student Details Page</h3>
            <p>Detailed view of a student’s information (GPA, enrolled courses, advisor, contact info).</p>
            <a href="StudentDetails.aspx">
                <button class="btn">View Student Details</button>
            </a>
        </div>

        <div id="studentEnrollment" class="section">
            <h3>Student Enrollment Page</h3>
            <p>Interface for students to enroll in available courses.</p>
            <a href="StudentEnrollment.aspx">
                <button class="btn">Manage Enrollment</button>
            </a>
        </div>
    </div>

    <script>
        function showSection(sectionId) {
            const sections = document.querySelectorAll('.section');
            sections.forEach(section => section.classList.remove('active'));
            document.getElementById(sectionId).classList.add('active');
        }

        // Default to show the student list section
        showSection('studentList');
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
