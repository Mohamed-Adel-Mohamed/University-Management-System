<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="CourseDetails.aspx.cs" Inherits="ums.CourseDetails" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Course Management</title>
<style>
    /* General page layout */
body {
    font-family: 'Arial', sans-serif;
    background-color: #f4f7fc;
    color: #333;
    margin: 0;
    padding: 0;
}

/* Container to center content */
.container {
    width: 80%;
    margin: 0 auto;
    padding: 20px;
}

/* Header styles */
h1 {
    font-size: 2.5rem;
    text-align: center;
    color: #0056b3;
}

h3 {
    font-size: 1.8rem;
    text-align: center;
    color: #666;
    margin-bottom: 15px;
}

/* Paragraph for description */
p {
    text-align: center;
    font-size: 1rem;
    color: #888;
    margin-bottom: 30px;
}

/* Button styling */
button {
    background-color: #0056b3;
    color: white;
    padding: 12px 25px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    transition: background-color 0.3s ease;
}

button:hover {
    background-color: #004080;
}

.btn {
    text-align: center;
    display: inline-block;
    margin: 20px 0;
}

/* GridView Table styles */
table {
    width: 100%;
    border-collapse: collapse;
    margin: 0 auto;
    background-color: white;
    border-radius: 8px;
    overflow: hidden;
}

th, td {
    padding: 15px;
    text-align: left;
    border-bottom: 1px solid #ddd;
}

th {
    background-color: #f8f9fa;
    color: #333;
    font-weight: bold;
}

td {
    background-color: #fafafa;
}

td input, td select {
    padding: 8px;
    font-size: 1rem;
    width: 100%;
    border: 1px solid #ddd;
    border-radius: 5px;
}

/* Edit/Delete buttons within GridView */
.GridViewCommandField .edit, .GridViewCommandField .delete {
    background-color: #0056b3;
    color: white;
    padding: 6px 12px;
    border-radius: 5px;
    text-decoration: none;
    font-size: 0.9rem;
}

.GridViewCommandField .edit:hover, .GridViewCommandField .delete:hover {
    background-color: #004080;
}

/* Custom search bar styles */
#searchTerm {
    padding: 8px 15px;
    font-size: 1rem;
    width: 250px;
    border: 1px solid #ddd;
    border-radius: 5px;
}

#searchBtn {
    background-color: #0056b3;
    color: white;
    padding: 10px 20px;
    border: none;
    border-radius: 5px;
    cursor: pointer;
    font-size: 1rem;
    margin-left: 10px;
}

#searchBtn:hover {
    background-color: #004080;
}

/* Responsive adjustments for smaller screens */
@media screen and (max-width: 768px) {
    .container {
        width: 90%;
    }

    h1 {
        font-size: 2rem;
    }

    h3 {
        font-size: 1.5rem;
    }

    button, #searchBtn {
        font-size: 1rem;
        padding: 10px 20px;
    }
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
        <div class="container">
            <h1>Course Management</h1>
            <h3>Course List</h3>
            <p>View all courses with details like instructors, schedule, and enrollment numbers.</p>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" 
                CssClass="table" 
                OnRowEditing="GridView1_RowEditing" 
                OnRowUpdating="GridView1_RowUpdating" 
                OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                OnRowDeleting="GridView1_RowDeleting" 
                DataKeyNames="course_id">
                
                <Columns>
                    <asp:BoundField DataField="course_id" HeaderText="Course ID" ReadOnly="True" SortExpression="course_id" />
                    <asp:BoundField DataField="course_name" HeaderText="Course Name" SortExpression="course_name" ReadOnly="True" />
                    <asp:BoundField DataField="department_id" HeaderText="Department ID" SortExpression="department_id" />
                    <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" SortExpression="instructor_id" />
                    <asp:BoundField DataField="course_code" HeaderText="Course Code" SortExpression="course_code" ReadOnly="True" />
                    <asp:BoundField DataField="semester" HeaderText="Semester" SortExpression="semester" />
                    <asp:BoundField DataField="year" HeaderText="Year" SortExpression="year" />
                    <asp:BoundField DataField="schedule" HeaderText="Schedule" SortExpression="schedule" />
                    <asp:BoundField DataField="classroom" HeaderText="Classroom" SortExpression="classroom" />
                    <asp:BoundField DataField="capacity" HeaderText="Capacity" SortExpression="capacity" />
                    <asp:BoundField DataField="status" HeaderText="Status" SortExpression="status" />
                    <asp:BoundField DataField="credit_hours" HeaderText="Credit Hours" SortExpression="credit_hours" />
                    
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
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
