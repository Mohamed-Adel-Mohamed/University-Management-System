<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Update Student - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .container {
            width: 80%;
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

        .form-group input,
        .form-group select,
        .form-group textarea {
            width: 100%;
            padding: 0.75rem;
            font-size: 1rem;
            border: 1px solid #ccc;
            border-radius: 4px;
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
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .actions {
            text-align: center;
            margin-top: 2rem;
        }

        .output {
            margin-top: 2rem;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1>Update Student Details</h1>

        <div class="form-group">
            <label for="studentId">Student ID</label>
            <input type="text" id="studentId" placeholder="Enter Student ID" required>
        </div>

        <div class="form-group">
            <label for="firstName">First Name</label>
            <input type="text" id="firstName" placeholder="Enter First Name" required>
        </div>

        <div class="form-group">
            <label for="lastName">Last Name</label>
            <input type="text" id="lastName" placeholder="Enter Last Name" required>
        </div>

        <div class="form-group">
            <label for="email">Email</label>
            <input type="email" id="email" placeholder="Enter Email" required>
        </div>

        <div class="form-group">
            <label for="phone">Phone</label>
            <input type="tel" id="phone" placeholder="Enter Phone Number" required>
        </div>

        <div class="form-group">
            <label for="department">Department</label>
            <select id="department" required>
                <option value="">Select Department</option>
                <option value="Computer Science">Computer Science</option>
                <option value="Engineering">Engineering</option>
                <option value="Business">Business</option>
                <option value="Arts">Arts</option>
            </select>
        </div>

        <div class="form-group">
            <label for="gpa">GPA</label>
            <input type="number" step="0.01" id="gpa" placeholder="Enter GPA" min="0" max="4" required>
        </div>

        <div class="form-group">
            <label for="advisorId">Advisor ID</label>
            <input type="text" id="advisorId" placeholder="Enter Advisor ID" required>
        </div>

        <div class="form-group">
            <label for="status">Status</label>
            <select id="status" required>
                <option value="">Select Status</option>
                <option value="active">Active</option>
                <option value="inactive">Inactive</option>
            </select>
        </div>

        <div class="form-group">
            <label for="address">Address</label>
            <textarea id="address" rows="4" placeholder="Enter Address" required></textarea>
        </div>

        <div class="actions">
            <button class="btn" onclick="updateStudent()">Update Student</button>
        </div>

        <div id="output" class="output">
            <!-- Placeholder for dynamic output -->
        </div>
    </div>

    <script>
        function updateStudent() {
            const studentId = document.getElementById('studentId').value;
            const firstName = document.getElementById('firstName').value;
            const lastName = document.getElementById('lastName').value;
            const email = document.getElementById('email').value;
            const phone = document.getElementById('phone').value;
            const department = document.getElementById('department').value;
            const gpa = document.getElementById('gpa').value;
            const advisorId = document.getElementById('advisorId').value;
            const status = document.getElementById('status').value;
            const address = document.getElementById('address').value;

            if (studentId && firstName && lastName && email && phone && department && gpa && advisorId && status && address) {
                document.getElementById('output').innerHTML = `
                    <p>Student ID: ${studentId}</p>
                    <p>First Name: ${firstName}</p>
                    <p>Last Name: ${lastName}</p>
                    <p>Email: ${email}</p>
                    <p>Phone: ${phone}</p>
                    <p>Department: ${department}</p>
                    <p>GPA: ${gpa}</p>
                    <p>Advisor ID: ${advisorId}</p>
                    <p>Status: ${status}</p>
                    <p>Address: ${address}</p>
                    <p><strong>Student details have been updated successfully.</strong></p>
                `;
            } else {
                alert('Please fill all fields before updating.');
            }
        }
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
