<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="DepartmentDetails.aspx.cs" Inherits="ums.DepartmentDetails" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Department Management</title>
<style>
    /* Global Styles */
body {
    font-family: 'Roboto', sans-serif;
    background-color: #ecf0f1;
    color: #333;
    margin: 0;
    padding: 0;
}

.container {
    width: 90%;
    max-width: 1200px;
    margin: 2rem auto;
    padding: 2rem;
    background-color: #fff;
    border-radius: 8px;
    box-shadow: 0 4px 6px rgba(0, 0, 0, 0.1);
}

h1 {
    text-align: center;
    font-size: 2rem;
    color: #333;
    margin-bottom: 1.5rem;
    text-transform: uppercase;
    letter-spacing: 1px;
}

/* Button Styles */
.btn {
    background-color: #2c3e50;
    color: #fff;
    padding: 0.75rem 1.5rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 1rem;
    transition: all 0.3s ease;
    margin-top: 1rem;
}

.btn:hover {
    background-color: #0056b3;
}

/* Form Styles */
.form-group {
    margin-bottom: 1.5rem;
}

.form-group label {
    display: block;
    font-size: 1rem;
    color: #555;
    font-weight: bold;
    margin-bottom: 0.5rem;
}

.form-group input {
    width: 100%;
    padding: 0.75rem;
    font-size: 1rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    transition: border-color 0.3s ease;
}

.form-group input:focus {
    border-color: #007bff;
    outline: none;
}

/* Table Styles */
.table {
    width: 100%;
    border-collapse: collapse;
    margin-top: 2rem;
    background-color: #fff;
    border-radius: 8px;
    overflow: hidden;
    box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
}

.table th,
.table td {
    padding: 1rem;
    text-align: center;
    border-bottom: 1px solid #ddd;
}

.table th {
    background-color: #2c3e50;
    color: #fff;
    text-transform: uppercase;
    font-weight: bold;
}

.table tr:nth-child(even) {
    background-color: #f9f9f9;
}

.table tr:hover {
    background-color: #f1f1f1;
}

.table td {
    font-size: 0.95rem;
    color: #555;
}

/* Action Buttons */
.table button {
    padding: 0.5rem 1rem;
    border: none;
    border-radius: 4px;
    cursor: pointer;
    font-size: 0.9rem;
    transition: background-color 0.3s ease;
}

.table button.update-btn {
    background-color: #28a745;
    color: #fff;
}

.table button.update-btn:hover {
    background-color: #218838;
}

.table button.delete-btn {
    background-color: #dc3545;
    color: #fff;
}

.table button.delete-btn:hover {
    background-color: #c82333;
}

/* Search Section */
.search-container {
    display: flex;
    gap: 1rem;
    align-items: center;
    justify-content: space-between;
    flex-wrap: wrap;
    margin-bottom: 1rem;
}

.search-container input {
    flex: 1;
    padding: 0.75rem;
    border: 1px solid #ccc;
    border-radius: 4px;
    font-size: 1rem;
}

.search-container .btn {
    padding: 0.75rem 1.5rem;
}

/* Responsive Styles */
@media (max-width: 768px) {
    .container {
        padding: 1.5rem;
    }

    .table th,
    .table td {
        padding: 0.5rem;
    }

    h1 {
        font-size: 1.8rem;
    }

    .search-container {
        flex-direction: column;
        gap: 0.5rem;
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
    <div class="container">
        <h1>Department Management</h1>
        <form id="form1" runat="server">
            <div class="form-group">
                <label for="searchTerm">Search Department</label>
                <asp:TextBox ID="searchTermTextBox" runat="server" placeholder="Enter Department Name or ID" CssClass="form-control"></asp:TextBox>
                <asp:Button ID="searchBtn" runat="server" Text="Search" OnClick="SearchBtn_Click" CssClass="btn" />
            </div>

            <asp:GridView ID="GridView1" runat="server" AutoGenerateColumns="False" CssClass="table" 
                OnRowEditing="GridView1_RowEditing" OnRowUpdating="GridView1_RowUpdating" 
                OnRowDeleting="GridView1_RowDeleting" OnRowCancelingEdit="GridView1_RowCancelingEdit" 
                DataKeyNames="department_id">
                <Columns>
                    <asp:BoundField DataField="department_id" HeaderText="Department ID" ReadOnly="True" />
                    <asp:BoundField DataField="department_name" HeaderText="Department Name" />
                    <asp:CommandField ShowEditButton="True" ShowDeleteButton="True" />
                </Columns>
            </asp:GridView>
        </form>
        <button class="btn" onclick="location.href='AdminDepartmentInsert.aspx';">Insert Department</button>
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
