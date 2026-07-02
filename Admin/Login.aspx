<%@ Page Title="Admin Login" Language="C#" AutoEventWireup="true"
CodeFile="Login.aspx.cs" Inherits="Admin_Login" %>

<!DOCTYPE html>

<html>
<head id="Head1" runat="server">
    <title>Admin Login</title>


<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
<link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.3/font/bootstrap-icons.css" rel="stylesheet">

<style>
    body {
        background: #f4f5f9;
        min-height: 100vh;
        display: flex;
        align-items: center;
        justify-content: center;
        font-family: 'Segoe UI';
    }

    .login-card {
        width: 100%;
        max-width: 420px;
        background: #fff;
        border-radius: 14px;
        border: 1px solid #e5e7eb;
        overflow: hidden;
        box-shadow: 0 8px 30px rgba(0,0,0,.08);
    }

    .login-header {
        background: #1a1f36;
        color: #fff;
        padding: 24px;
        text-align: center;
    }

    .login-header h3 {
        margin: 0;
        font-size: 22px;
        font-weight: 700;
    }

    .login-body {
        padding: 24px;
    }

    .form-label {
        font-weight: 600;
        margin-bottom: 6px;
    }

    .form-control {
        border-radius: 10px;
        height: 46px;
    }

    .btn-login {
        background: #4f6ef7;
        color: #fff;
        border: none;
        height: 46px;
        border-radius: 10px;
        width: 100%;
        font-weight: 600;
    }

    .btn-login:hover {
        background: #3a59e0;
    }

    .error-box {
        background: #fee2e2;
        color: #991b1b;
        padding: 10px;
        border-radius: 8px;
        margin-bottom: 15px;
    }
</style>


</head>

<body>

<form id="form1" runat="server">

<div class="login-card">

    <div class="login-header">
        <h3><i class="bi bi-shield-lock"></i> Admin Login</h3>
    </div>

    <div class="login-body">

        <asp:Panel ID="pnlError"
            runat="server"
            CssClass="error-box"
            Visible="false">

            <asp:Literal ID="litError"
                runat="server">
            </asp:Literal>

        </asp:Panel>

        <div class="mb-3">
            <label class="form-label">Email Address</label>

            <asp:TextBox ID="txtEmail"
                runat="server"
                CssClass="form-control"
                TextMode="Email"
                placeholder="Enter email">
            </asp:TextBox>
        </div>

        <div class="mb-4">
            <label class="form-label">Password</label>

            <asp:TextBox ID="txtPassword"
                runat="server"
                CssClass="form-control"
                TextMode="Password"
                placeholder="Enter password">
            </asp:TextBox>
        </div>

        <asp:Button ID="btnLogin"
            runat="server"
            Text="Login"
            CssClass="btn-login"
            OnClick="btnLogin_Click" />

    </div>

</div>


</form>

</body>
</html>
