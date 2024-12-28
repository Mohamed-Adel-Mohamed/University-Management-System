<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="BugzUniversity.Default" %>

<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Login - Bugz University</title>
    <style>
        body {
            font-family: 'Arial', sans-serif;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
            background-image: url('preview.png');
            background-size: cover;
            background-position: center;
            background-attachment: fixed;
        color:white;
            }

        .login-container {
            background-color: rgba(255, 255, 255, 0.8);
            padding: 2rem;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.1);
            width: 100%;
            max-width: 400px;
        }

        h2 {
            text-align: center;
            color: #060060;
            margin-bottom: 1.5rem;
        }

        h1 {
            text-align: center;
            color: #f2f6d7;
            font-size: 2.5rem;
            margin-bottom: 1.5rem;
            position: relative;
            -webkit-background-clip: text;
            background-clip: text;
            text-shadow:
                2px 2px 0px rgba(0, 0, 0, 0.6),
                -2px -2px 0px rgba(0, 0, 0, 0.6),
                2px -2px 0px rgba(0, 0, 0, 0.6),
                -2px 2px 0px rgba(0, 0, 0, 0.6);
        }

        .form-group {
            margin-bottom: 1.5rem;
        }

        label {
            display: block;
            margin-bottom: 0.5rem;
            color: #333;
        }

        input[type="text"], input[type="password"] {
            width: 100%;
            padding: 0.75rem;
            border: 1px solid #ccc;
            border-radius: 4px;
            font-size: 1rem;
            box-sizing: border-box;
            text-align: center;
            color: black;
        }

        .btn {
            width: 100%;
            padding: 1rem;
            background-color: #060060;
            color: white;
            border: none;
            border-radius: 4px;
            font-size: 1.1rem;
            cursor: pointer;
            margin-top: 2rem;
        }

        .btn:hover {
            background-color: #0056b3;
        }

        .error-message {
            color: red;
            font-size: 0.875rem;
            text-align: center;
            margin-top: 1rem;
        }
        h3 {
            color:white;
        }
    </style>
</head>
<body class="bg-light">
    <form id="form1" runat="server">
        <div class="container">
            <div class="row justify-content-center mt-5">
                <div class="col-md-6">
                    <div class="card shadow">
                        <div class="card-header bg-primary text-white">
                            <h3 class="text-center mb-0">Login</h3>
                        </div>
                        <div class="card-body">
                            <asp:Label ID="lblError" runat="server" CssClass="alert alert-danger d-block" Visible="false"></asp:Label>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblID" runat="server" Text=":" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtID" runat="server" CssClass="form-control"  Placeholder=" Id "></asp:TextBox>
                            </div>
                            
                            <div class="mb-3">
                                <asp:Label ID="lblPassword" runat="server"  Text=":" CssClass="form-label"></asp:Label>
                                <asp:TextBox ID="txtPassword" runat="server" CssClass="form-control"  Placeholder=" Password "></asp:TextBox>
                            </div>
                            
                            <div class="text-center">
                                <asp:Button ID="btnLogin" runat="server" Text="Login" 
                                          OnClick="btnLogin_Click" 
                                          CssClass="btn btn-primary btn-lg w-100" />
                            </div>
                        </div>
                        <div class="card-footer text-center">
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </form>
    
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>
