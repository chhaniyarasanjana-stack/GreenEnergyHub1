<%@ Page Language="C#" AutoEventWireup="true" CodeFile="forgot_password.aspx.cs" Inherits="forgot_password" %>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">

<html xmlns="http://www.w3.org/1999/xhtml">
<head id="Head1" runat="server">
    <title>Forgot Password</title>
    <style>
    body {
        font-family: Arial, sans-serif;
        background-color: #eef2f7;
        margin: 0;
        padding: 0;
        display: flex;
        justify-content: center;
        align-items: center;
        height: 100vh;
        color: #333;
    }

    form {
        background-color: #ffffff;
        padding: 25px;
        border: 1px solid #ccc;
        border-radius: 10px;
        box-shadow: 0 6px 12px rgba(0, 0, 0, 0.1);
        width: 100%;
        max-width: 360px;
        text-align: center;
    }

    label {
        font-size: 16px;
        font-weight: bold;
        color: #333;
        display: block;
        margin-bottom: 10px;
    }

    input[type="text"], input[type="password"], .aspNetTextBox {
        width: calc(100% - 20px);
        height: 35px;
        padding: 5px 10px;
        margin-bottom: 15px;
        border: 1px solid #ccc;
        border-radius: 6px;
        font-size: 14px;
        transition: border-color 0.3s, box-shadow 0.3s;
    }

    input[type="text"]:focus, input[type="password"]:focus {
        border-color: #007bff;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.5);
        outline: none;
    }

    .aspNetButton {
        background-color: #007bff;
        color: white;
        font-size: 16px;
        padding: 10px 20px;
        border: none;
        border-radius: 6px;
        cursor: pointer;
        width: 100%;
        transition: background-color 0.3s, transform 0.3s;
    }

    .aspNetButton:hover {
        background-color: #0056b3;
        transform: translateY(-2px);
    }

    .aspNetButton:focus {
        outline: none;
        box-shadow: 0 0 5px rgba(0, 123, 255, 0.7);
    }

    .error {
        color: red;
        font-size: 13px;
        margin-top: -10px;
        margin-bottom: 10px;
        text-align: left;
    }

    @media (max-width: 480px) {
        form {
            padding: 20px;
            width: 90%;
        }

        .aspNetTextBox, input[type="text"], input[type="password"] {
            font-size: 13px;
        }

        .aspNetButton {
            font-size: 14px;
        }
    }
</style>

</head>
<body>
    <form id="form1" runat="server">
        <label for="username_or_email">Enter your username or email:</label>
        <asp:TextBox ID="TextBox1" runat="server" CssClass="aspNetTextBox" Height="29px"></asp:TextBox>
        <asp:RequiredFieldValidator 
            ID="RequiredFieldValidator1" 
            runat="server" 
            ControlToValidate="TextBox1" 
            ErrorMessage="This field is required." 
            CssClass="error"></asp:RequiredFieldValidator>
        <br />
        <asp:Button ID="Button1" runat="server" Text="Reset Password" CssClass="aspNetButton" onclick="Button1_Click" />
    </form>
</body>
</html>
