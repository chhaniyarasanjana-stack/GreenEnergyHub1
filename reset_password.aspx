<%@ Page Language="C#" AutoEventWireup="true" CodeFile="reset_password.aspx.cs" Inherits="reset_password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Reset Password</title>
    <style>
        body {
            font-family: Arial, sans-serif;
            background-color: #f4f4f9;
            margin: 0;
            padding: 0;
            display: flex;
            justify-content: center;
            align-items: center;
            height: 100vh;
        }
        form {
            background-color: #ffffff;
            padding: 20px;
            border: 1px solid #ddd;
            border-radius: 5px;
            box-shadow: 0 2px 5px rgba(0, 0, 0, 0.2);
            width: 300px;
        }
        label {
            display: block;
            font-weight: bold;
            margin-bottom: 5px;
        }
        input[type="text"], input[type="password"], .aspNet-TextBox {
            width: 93%;
            padding: 10px;
            margin-bottom: 10px;
            border: 1px solid #ccc;
            border-radius: 5px;
        }
        .aspNet-Button {
            width: 100%;
            background-color: #007bff;
            color: white;
            padding: 10px;
            border: none;
            border-radius: 5px;
            cursor: pointer;
            font-size: 16px;
        }
        .aspNet-Button:hover {
            background-color: #0056b3;
        }
        .aspNet-Validator {
            color: red;
            font-size: 12px;
        }
    </style>
</head>
<body>
    <form id="form1" runat="server">
        <!-- TextBox for username or email -->
        <label for="username_or_email">Enter your username or email:</label>
        <asp:TextBox ID="TextBoxUsernameOrEmail" runat="server" CssClass="aspNet-TextBox"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidatorEmail" runat="server" 
            ErrorMessage="Username or Email can't be empty" ControlToValidate="TextBoxUsernameOrEmail" CssClass="aspNet-Validator"></asp:RequiredFieldValidator>

        <label for="new_password">Enter your new password:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="aspNet-TextBox" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator1" runat="server" 
            ErrorMessage="Password can't be empty" ControlToValidate="TextBox1" CssClass="aspNet-Validator"></asp:RequiredFieldValidator>

        <label for="confirm_password">Confirm new password:</label>
        <asp:TextBox ID="TextBox2" runat="server" CssClass="aspNet-TextBox" TextMode="Password"></asp:TextBox>
        <asp:RequiredFieldValidator ID="RequiredFieldValidator2" runat="server" 
            ErrorMessage="Confirm password can't be empty" ControlToValidate="TextBox2" CssClass="aspNet-Validator"></asp:RequiredFieldValidator>

        <asp:Button ID="Button1" runat="server" OnClick="Button1_Click" 
            Text="Update Password" CssClass="aspNet-Button" />
    </form>
</body>
</html>
