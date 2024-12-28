<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="StudentDashboard.aspx.cs" Inherits="BugzUniversity.StudentDashboard" %>

<!DOCTYPE html>
<html xmlns="http://www.w3.org/1999/xhtml">
<head runat="server">
    <title>Student Dashboard - Bugz University</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet" />
<style>
    .section-card {
        margin-bottom: 20px;
    }
    .grid-container {
        overflow-x: auto;
    }
    .card-header {
        background-color: #2c3e50 !important; /* Apply the color to all card-headers */
        color: #fff; /* Optional: Ensure the text is readable */
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <div class="container-fluid mt-4">
            <div class="row">
                <div class="col-12 mb-4">
                    <h2>Welcome, <asp:Label ID="lblStudentName" runat="server"></asp:Label></h2>
                    <asp:Button ID="btnLogout" runat="server" Text="Logout" CssClass="btn btn-danger float-end" OnClick="btnLogout_Click" />
                </div>
            </div>

            <!-- Student Information Section -->
            <div class="card section-card">
                <div class="card-header bg-primary text-white">
                    <h5 class="mb-0">Student Information</h5>
                </div>
                <div class="card-body">
                    <div class="row">
                        <div class="col-md-6">
                            <p><strong>Student ID:</strong> <asp:Label ID="lblStudentId" runat="server"></asp:Label></p>
                            <p><strong>Email:</strong> <asp:Label ID="lblEmail" runat="server"></asp:Label></p>
                            <p><strong>Department:</strong> <asp:Label ID="lblDepartment" runat="server"></asp:Label></p>
                        </div>
                        <div class="col-md-6">
                            <p><strong>GPA:</strong> <asp:Label ID="lblGPA" runat="server"></asp:Label></p>
                            <p><strong>Advisor:</strong> <asp:Label ID="lblAdvisor" runat="server"></asp:Label></p>
                            <p><strong>Status:</strong> <asp:Label ID="lblStatus" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Academic Results Section -->
            <div class="card section-card">
                <div class="card-header bg-success text-white">
                    <h5 class="mb-0">Academic Results</h5>
                </div>
                <div class="card-body grid-container">
                    <asp:GridView ID="gvAcademicResults" runat="server" CssClass="table table-striped table-bordered"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                            <asp:BoundField DataField="enrollment_date" HeaderText="Enrollment Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="grade" HeaderText="Grade" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Course Enrollment Section -->
            <div class="card section-card">
                <div class="card-header bg-info text-white">
                    <h5 class="mb-0">Course Enrollment</h5>
                </div>
                <div class="card-body">
                    <div class="row mb-3">
                        <div class="col-md-6">
                            <asp:DropDownList ID="ddlCourses" runat="server" CssClass="form-select">
                            </asp:DropDownList>
                        </div>
                        <div class="col-md-6">
                            <asp:Button ID="btnEnroll" runat="server" Text="Enroll" CssClass="btn btn-primary" OnClick="btnEnroll_Click" />
                        </div>
                    </div>
                    <div class="grid-container">
                        <asp:GridView ID="gvEnrolledCourses" runat="server" CssClass="table table-striped table-bordered"
                            AutoGenerateColumns="False" OnRowCommand="gvEnrolledCourses_RowCommand">
                            <Columns>
                                <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                                <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                                <asp:BoundField DataField="instructor_name" HeaderText="Instructor" />
                                <asp:ButtonField ButtonType="Button" CommandName="DropCourse" Text="Drop" ControlStyle-CssClass="btn btn-danger btn-sm" />
                            </Columns>
                        </asp:GridView>
                    </div>
                </div>
            </div>

            <!-- Exam Schedule Section -->
            <div class="card section-card">
                <div class="card-header bg-warning">
                    <h5 class="mb-0">Exam Schedule</h5>
                </div>
                <div class="card-body grid-container">
                    <asp:GridView ID="gvExamSchedule" runat="server" CssClass="table table-striped table-bordered"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="course_id" HeaderText="Course ID" />
                            <asp:BoundField DataField="exam_date" HeaderText="Exam Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="start_time" HeaderText="Start Time" />
                            <asp:BoundField DataField="end_time" HeaderText="End Time" />
                            <asp:BoundField DataField="classroom_id" HeaderText="Classroom" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Class Schedule Section -->
            <div class="card section-card">
                <div class="card-header bg-secondary text-white">
                    <h5 class="mb-0">Class Schedule</h5>
                </div>
                <div class="card-body grid-container">
                    <asp:GridView ID="gvClassSchedule" runat="server" CssClass="table table-striped table-bordered"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="course_code" HeaderText="Course Code" />
                            <asp:BoundField DataField="course_name" HeaderText="Course Name" />
                            <asp:BoundField DataField="schedule" HeaderText="Schedule" />
                            <asp:BoundField DataField="classroom" HeaderText="Classroom" />
                            <asp:BoundField DataField="instructor_name" HeaderText="Instructor" />
                        </Columns>
                    </asp:GridView>
                </div>
            </div>

            <!-- Payments Section -->
            <div class="card section-card">
                <div class="card-header bg-danger text-white">
                    <h5 class="mb-0">Payments</h5>
                </div>
                <div class="card-body grid-container">
                    <asp:GridView ID="gvPayments" runat="server" CssClass="table table-striped table-bordered"
                        AutoGenerateColumns="False">
                        <Columns>
                            <asp:BoundField DataField="payment_date" HeaderText="Payment Date" DataFormatString="{0:d}" />
                            <asp:BoundField DataField="amount" HeaderText="Amount" DataFormatString="{0:C}" />
                            <asp:BoundField DataField="payment_type" HeaderText="Payment Type" />
                            <asp:BoundField DataField="status" HeaderText="Status" />
                        </Columns>
                    </asp:GridView>
                    <div class="row mt-3">
                        <div class="col-md-6">
                            <p><strong>Total Due:</strong> <asp:Label ID="lblTotalDue" runat="server"></asp:Label></p>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
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