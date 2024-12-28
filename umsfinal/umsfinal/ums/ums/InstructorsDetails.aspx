<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="InstructorsDetails.aspx.cs" Inherits="ums.InstructorsDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Instructor Management</title>
    <style>
/* Global Styles */
body {
    font-family: 'Arial', sans-serif;
    margin: 0;
    padding: 0;
    background-color: #f4f7fa;
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
.container {
    width: 70%;
    margin: 3rem auto;
    background-color: #fff;
    padding: 3rem;
    border-radius: 8px;
    box-shadow: 0 2px 10px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 2.5rem;
    color: #343a40;
    margin-bottom: 2rem;
}

h3 {
    font-size: 1.5rem;
    color: #060060;
    margin-top: 1rem;
    margin-bottom: 0.5rem;
}

p {
    font-size: 1rem;
    color: #666;
    margin-bottom: 1rem;
}

/* Search and Button Styles */
.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    font-weight: bold;
    font-size: 1rem;
    margin-bottom: 0.5rem;
    color: #444;
}

.form-group input,
.form-group select {
    width: 100%;
    padding: 0.75rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    color: #555;
}

.form-group input:focus {
    border-color: #060060;
    outline: none;
}

.btn {
    background-color: #060060;
    color: white;
    padding: 0.75rem 2rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    margin-top: 1rem;
    transition: background-color 0.3s ease;
}

.btn:hover {
    background-color: #0056b3;
}

/* Table Styles */
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 2rem;
    font-size: 1rem;
    text-align: left;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table th,
.table td {
    padding: 1rem;
    border-bottom: 1px solid #ddd;
}

.table th {
    background-color: #060060;
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

/* Responsive Design */
@media (max-width: 768px) {
    .table {
        font-size: 0.9rem;
    }

    .table th,
    .table td {
        padding: 0.5rem;
    }
}

/* Action Links */
.actions {
    text-align: center;
    margin-bottom: 2rem;
}

.actions a {
    color: #060060;
    text-decoration: none;
    font-weight: bold;
    font-size: 1.2rem;
}

.actions a:hover {
    text-decoration: underline;
}

/* Inputs Focused */
input:focus, select:focus {
    border-color: #060060;
    outline: none;
}

    </style>
</head>
<body>
        <div class="navbar">
        <h2>Bugz University Admin</h2>
        <nav>
            <a href="AdminDashboard.aspx">Dashboard</a>
            <a href="AdminStudentMangeOverView.aspx">Student Management</a>
            <a href="AdminCourseManagement.aspx">Course Management</a>
            <a href="AdminInstructorManagment.aspx">Instructor Management</a>
            <a href="AdminDepartmentManagment.aspx">Department Management</a>
            <a href="#">Role Management</a>
        </nav>
    </div>
    <div class="container">
        <h1>Instructor Management</h1>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="searchTerm">Search Instructor</label>
                <asp:TextBox ID="searchTermTextBox" runat="server" placeholder="Enter Instructor Name or ID" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" CssClass="btn" />

            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" 
    OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
    OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
    DataKeyNames="instructor_id">
    <Columns>
        <asp:BoundField DataField="instructor_id" HeaderText="Instructor ID" ReadOnly="True" />
        <asp:BoundField DataField="first_name" HeaderText="Full Name" />
        <asp:BoundField DataField="last_name" HeaderText="Password" />
        <asp:BoundField DataField="email" HeaderText="Email" />
        <asp:BoundField DataField="phone" HeaderText="Phone" />
        <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
    </Columns>
</asp:GridView>

        </form>
        <button class="btn" onclick="location.href='AdminInsertInstructor.aspx';">Insert Instructor</button>
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
