<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>My Requests - Bugz University</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            margin: 0;
            padding: 0;
            background-color: #f1f1f1;
        }

        .navbar {
            background-color: #060060;
            color: white;
            padding: 1rem;
            display: flex;
            justify-content: space-between;
            align-items: center;
        }

        .navbar a {
            color: white;
            text-decoration: none;
            margin-left: 1rem;
        }

        .navbar a:hover {
            text-decoration: underline;
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

        .section {
            margin-bottom: 2rem;
        }

        .section h2 {
            font-size: 1.5rem;
            color: #060060;
        }

        .section button {
            padding: 0.5rem 1rem;
            margin: 0.5rem 0;
            color: white;
            background-color: #060060;
            border: none;
            border-radius: 4px;
            cursor: pointer;
            font-size: 1rem;
        }

        .section button:hover {
            background-color: #3333aa;
        }

        .data-container {
            margin-top: 1rem;
            padding: 1rem;
            background-color: #f9f9f9;
            border: 1px solid #ddd;
            border-radius: 4px;
            max-height: 200px;
            overflow-y: auto;
        }

        .data-container p {
            margin: 0.5rem 0;
            font-size: 1rem;
            color: #333;
        }

        .form-container {
            margin-top: 1rem;
        }

        .form-container input,
        .form-container select {
            width: 100%;
            padding: 0.5rem;
            margin: 0.5rem 0;
            border: 1px solid #ddd;
            border-radius: 4px;
        }

        .form-container button {
            padding: 0.5rem 1rem;
            color: white;
            background-color: #060060;
            border: none;
            border-radius: 4px;
            cursor: pointer;
        }

        .form-container button:hover {
            background-color: #3333aa;
        }
    </style>
</head>
<body>
    <div class="navbar">
        <div>
            <strong>Bugz University</strong>
        </div>
        <div>
            <a href="home.html">Home</a>
            <a href="academic-affairs.html">Academic Affairs</a>
        </div>
    </div>

    <div class="container">
        <h1>My Requests</h1>

        <!-- Section: Course Withdrawal Request -->
        <div class="section">
            <h2>Course Withdrawal Request</h2>
            <button onclick="fetchWithdrawalRequests()">View Requests</button>
            <div class="data-container" id="withdrawalRequests">
                <p>Withdrawal request details will be displayed here.</p>
            </div>
            <div class="form-container">
                <h3>Submit New Request</h3>
                <input type="text" id="courseName" placeholder="Course Name" />
                <input type="text" id="reason" placeholder="Reason for Withdrawal" />
                <button onclick="submitWithdrawalRequest()">Submit Request</button>
            </div>
        </div>

        <!-- Section: Online Payment by Banks -->
        <div class="section">
            <h2>Online Payment by Banks</h2>
            <button onclick="fetchPaymentHistory()">View Payment History</button>
            <div class="data-container" id="paymentHistory">
                <p>Payment history details will be displayed here.</p>
            </div>
            <div class="form-container">
                <h3>Make Payment</h3>
                <select id="bankName">
                    <option value="Bank A">Bank A</option>
                    <option value="Bank B">Bank B</option>
                    <option value="Bank C">Bank C</option>
                </select>
                <input type="number" id="amount" placeholder="Amount" />
                <button onclick="makePayment()">Make Payment</button>
            </div>
        </div>
    </div>

    <script>
        // Function to fetch existing withdrawal requests
        function fetchWithdrawalRequests() {
            fetch('https://your-backend-api-url.com/getWithdrawalRequests') // Replace with actual API URL
                .then(response => response.json())
                .then(data => {
                    const withdrawalContainer = document.getElementById('withdrawalRequests');
                    if (data && data.length > 0) {
                        withdrawalContainer.innerHTML = data.map(request => `
                            <p><strong>Course:</strong> ${request.courseName} - <strong>Reason:</strong> ${request.reason}</p>
                        `).join('');
                    } else {
                        withdrawalContainer.innerHTML = '<p>No withdrawal requests found.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching withdrawal requests:', error);
                    document.getElementById('withdrawalRequests').innerHTML = '<p>Error loading requests.</p>';
                });
        }

        // Function to submit a new withdrawal request
        function submitWithdrawalRequest() {
            const courseName = document.getElementById('courseName').value;
            const reason = document.getElementById('reason').value;

            fetch('https://your-backend-api-url.com/submitWithdrawalRequest', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ courseName, reason })
            })
                .then(response => response.json())
                .then(data => {
                    alert('Request submitted successfully!');
                    fetchWithdrawalRequests();
                })
                .catch(error => {
                    console.error('Error submitting request:', error);
                    alert('Error submitting request.');
                });
        }

        // Function to fetch payment history
        function fetchPaymentHistory() {
            fetch('https://your-backend-api-url.com/getPaymentHistory') // Replace with actual API URL
                .then(response => response.json())
                .then(data => {
                    const paymentContainer = document.getElementById('paymentHistory');
                    if (data && data.length > 0) {
                        paymentContainer.innerHTML = data.map(payment => `
                            <p><strong>Bank:</strong> ${payment.bankName} - <strong>Amount:</strong> $${payment.amount}</p>
                        `).join('');
                    } else {
                        paymentContainer.innerHTML = '<p>No payment history found.</p>';
                    }
                })
                .catch(error => {
                    console.error('Error fetching payment history:', error);
                    document.getElementById('paymentHistory').innerHTML = '<p>Error loading payment history.</p>';
                });
        }

        // Function to make a new payment
        function makePayment() {
            const bankName = document.getElementById('bankName').value;
            const amount = document.getElementById('amount').value;

            fetch('https://your-backend-api-url.com/makePayment', {
                method: 'POST',
                headers: {
                    'Content-Type': 'application/json'
                },
                body: JSON.stringify({ bankName, amount })
            })
                .then(response => response.json())
                .then(data => {
                    alert('Payment successful!');
                    fetchPaymentHistory();
                })
                .catch(error => {
                    console.error('Error making payment:', error);
                    alert('Error making payment.');
                });
        }
    </script>
</body>
</html>
