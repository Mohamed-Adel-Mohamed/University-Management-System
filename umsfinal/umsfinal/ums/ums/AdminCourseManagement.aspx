<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="AdminCourseManagement.aspx.cs" Inherits="ums.AdminCourseManagement" %>

<!DOCTYPE html>

<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
<style>
    .container {
    width: 80%;
    margin: 2rem auto;
    background-color: #ecf0f1;
    padding: 2rem;
    border-radius: 8px;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 2rem;
}

h3 {
    text-align: center;
    color: #2c3e50;
    margin-bottom: 1rem;
}

p {
    text-align: center;
    color: #2c3e50;
    font-size: 1.1rem;
    margin-bottom: 2rem;
}

.btn {
    background-color: #2c3e50;
    color: white;
    padding: 0.75rem 2rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 1rem;
}

.btn:hover {
    background-color: #0056b3;
}

.section {
    margin-top: 2rem;
}
/* Center the button */
#courseManagement {
    text-align: center; /* Centers the content inside the section */
    margin-top: 2rem; /* Adds some space above */
}

#courseManagement {
    text-align: center; /* Centers the content inside the section */
    margin-top: 2rem; /* Adds some space above */
}
.btn {
    background-color: #2c3e50;
    color: white;
    padding: 0.75rem 2rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 1rem;
    display: inline-block; /* Ensures the button behaves like an inline element */
}

.btn:hover {
    background-color: #0056b3;
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
        <div>
            <div id="courseManagement" class="section">
    <h1>Course Management</h1>
    <h3>Course List Page</h3>
    <p>View all courses with details like instructors, schedule, and enrollment numbers.</p>
            <button class="btn" type="button" onclick="window.location.href='CourseDetails.aspx'">View Courses</button>

                  <h3>Course Insert Page</h3>
  <p>insert your courses here.</p>
          <button class="btn" type="button" onclick="window.location.href='AdminInsertCourse.aspx'">Insert Course</button>
                  <h3>Insert Course To Instructor</h3>
            <p>insert courses to instructors on easy way.</p>
            <button class="btn" type="button" onclick="window.location.href='InsertCourseToSpecificInstructor.aspx'">Insert To Instructor</button>
                                  <h3>Insert Course To Student</h3>
            <p>insert courses to Students on easy way.</p>
            <button class="btn" type="button" onclick="window.location.href='InsertCourseToSpecificStudent.aspx'">Insert To Student</button>

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
