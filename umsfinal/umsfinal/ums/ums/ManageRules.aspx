<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Role Management</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f4f4f4;
        }
        .container {
            width: 80%;
            margin: 50px auto;
            background-color: white;
            padding: 30px;
            border-radius: 8px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.1);
        }
        h2 {
            text-align: center;
        }
        form {
            display: flex;
            flex-direction: column;
            gap: 15px;
        }
        label {
            font-weight: bold;
        }
        select, input {
            padding: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        button {
            padding: 10px 20px;
            background-color: #007BFF;
            color: white;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        button:hover {
            background-color: #0056b3;
        }
        .role-container {
            display: flex;
            gap: 20px;
        }
        #statusMessage {
            margin-top: 20px;
            text-align: center;
            font-size: 16px;
        }
    </style>
</head>
<body>

<div class="container">
    <h2>Manage User Roles</h2>
    <form id="roleForm">
        <label for="userId">User ID:</label>
        <input type="text" id="userId" name="userId" placeholder="Enter user ID" required>

        <label for="role">Role:</label>
        <select id="role" name="role" required>
            <option value="student">Student</option>
            <option value="instructor">Instructor</option>
            <option value="admin">Admin</option>
        </select>

        <label for="permissions">Permissions:</label>
        <div class="role-container">
            <div>
                <input type="checkbox" id="canViewCourses" name="permissions[]" value="view_courses">
                <label for="canViewCourses">View Courses</label>
            </div>
            <div>
                <input type="checkbox" id="canAssignGrades" name="permissions[]" value="assign_grades">
                <label for="canAssignGrades">Assign Grades</label>
            </div>
            <div>
                <input type="checkbox" id="canManageUsers" name="permissions[]" value="manage_users">
                <label for="canManageUsers">Manage Users</label>
            </div>
        </div>

        <button type="submit">Update Role</button>
    </form>

    <div id="statusMessage"></div>
</div>

<script>
document.getElementById('roleForm').addEventListener('submit', function (e) {
    e.preventDefault(); 

    const userId = document.getElementById('userId').value;
    const role = document.getElementById('role').value;
    const permissions = [];
    
    document.querySelectorAll('input[name="permissions[]"]:checked').forEach(function (checkbox) {
        permissions.push(checkbox.value);
    });

    const data = {
        userId: userId,
        role: role,
        permissions: permissions
    };

    document.getElementById('statusMessage').innerHTML = 'Updating...';

    fetch('https://your-backend-api-url.com/updateRole', {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json',
        },
        body: JSON.stringify(data) 
    })
    .then(response => response.json())
    .then(data => {
        if (data.success) {
            document.getElementById('statusMessage').innerHTML = 'Role updated successfully!';
        } else {
            document.getElementById('statusMessage').innerHTML = 'Error: ' + data.message;
        }
    })
    .catch(error => {
        console.error('Error:', error);
        document.getElementById('statusMessage').innerHTML = 'There was an error updating the role.';
    });
});
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
