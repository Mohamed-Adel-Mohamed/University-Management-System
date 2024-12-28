<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="smanagment.aspx.cs" Inherits="ums.smanagment" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Student Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #ecf0f1;
        }

        .container {
            width: 62%;
            margin: 2rem auto;
            background-color: #fff;
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
        }

        h1 {
            text-align: center;
            color: #060060;
            margin-bottom: 2rem;
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        .form-group label {
            display: block;
            font-weight: bold;
            margin-bottom: 0.5rem;
        }

        .form-group input {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
        }

        .btn {
            background-color: #2c3e50;
            color: white;
            padding: 0.75rem 2rem;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
            margin-right: 1rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .actions {
            text-align: center;
            margin-bottom: 2rem;
        }
        .table {
    width: 100%;
    border-collapse: collapse;
    margin: 1rem 0;
    font-size: 1rem;
    text-align: left;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table th,
.table td {
    padding: 0.75rem;
    border-bottom: 1px solid #ddd;
}

.table th {
    background-color: #2c3e50;
    color: white;
    font-weight: bold;
    text-transform: uppercase;
    text-align: center;
}

.table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tr:nth-child(odd) {
    background-color: #fff;
}

.table tr:hover {
    background-color: #f1f1f1;
    transition: background-color 0.3s ease;
}

.table td {
    text-align: center;
}

.table button {
    padding: 0.5rem 1rem;
    background-color: #060060;
    color: white;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9rem;
}

.table button:hover {
    background-color: #0056b3;
    transition: background-color 0.3s ease;
}

@media (max-width: 768px) {
    .table {
        font-size: 0.9rem;
    }

    .table th,
    .table td {
        padding: 0.5rem;
    }
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

    </style>
</head>
<body>
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
    <div class="container">
        <h1>Student Management</h1>


        <form id="form1" runat="server">

            <div class="form-group">
                <label for="searchTerm">Search Student</label>
                <asp:TextBox ID="searchTerm" runat="server" placeholder="Enter Student Name or ID" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" CssClass="btn" />
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" 
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                DataKeyNames="student_id">
                <Columns>
                    <asp:BoundField DataField="student_id" HeaderText="Student ID" ReadOnly="True" />
                    <asp:BoundField DataField="first_name" HeaderText=" Full Name" />
                    <asp:BoundField DataField="last_name" HeaderText="Password" />
                    <asp:BoundField DataField="email" HeaderText="Email" />
                    <asp:BoundField DataField="phone" HeaderText="Phone" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </form>
        <button class="btn" onclick="location.href='admin-dashboard.aspx'; showSection('Insert Student');">Insert Student</button>
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

