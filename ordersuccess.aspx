<%@ Page Language="C#" AutoEventWireup="true" CodeFile="OrderSuccess.aspx.cs" Inherits="OrderSuccess" %>

<!DOCTYPE html>
<html>
<head id="Head1" runat="server">
    <title>Order Success</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet" />
    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.0.0/css/all.min.css" rel="stylesheet" />
    <style>
        @import url('https://fonts.googleapis.com/css2?family=Poppins:wght@300;400;500;600;700&display=swap');
        
        * { margin: 0; padding: 0; box-sizing: border-box; }
        
        body {
            font-family: 'Poppins', sans-serif;
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            min-height: 100vh;
            display: flex;
            align-items: center;
            justify-content: center;
            padding: 20px;
        }
        
        .success-card {
            background: white;
            border-radius: 20px;
            box-shadow: 0 25px 50px rgba(0, 0, 0, 0.15);
            max-width: 450px;
            width: 100%;
            overflow: hidden;
            animation: slideUp 0.6s ease-out;
        }
        
        @keyframes slideUp {
            from { opacity: 0; transform: translateY(40px); }
            to { opacity: 1; transform: translateY(0); }
        }
        
        .card-header-custom {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            padding: 40px 20px;
            text-align: center;
        }
        
        .checkmark-circle {
            width: 90px;
            height: 90px;
            background: white;
            border-radius: 50%;
            display: flex;
            align-items: center;
            justify-content: center;
            margin: 0 auto;
            animation: scaleIn 0.5s ease-out 0.3s both;
        }
        
        @keyframes scaleIn {
            from { transform: scale(0); }
            to { transform: scale(1); }
        }
        
        .checkmark-circle i {
            font-size: 45px;
            color: #11998e;
            animation: checkPop 0.4s ease-out 0.5s both;
        }
        
        @keyframes checkPop {
            0% { transform: scale(0); }
            70% { transform: scale(1.2); }
            100% { transform: scale(1); }
        }
        
        .card-header-custom h2 {
            color: white;
            font-size: 24px;
            font-weight: 700;
            margin-top: 15px;
        }
        
        .card-body-custom {
            padding: 30px;
        }
        
        .order-details {
            background: #f8f9fa;
            border-radius: 12px;
            padding: 20px;
            margin: 20px 0;
        }
        
        .order-details p {
            margin: 8px 0;
            color: #555;
            font-size: 14px;
        }
        
        .order-details strong {
            color: #333;
        }
        
        .btn {
            border: none;
            padding: 14px;
            font-size: 15px;
            font-weight: 600;
            border-radius: 50px;
            width: 100%;
            cursor: pointer;
            transition: all 0.3s ease;
            text-decoration: none;
            display: block;
            text-align: center;
            margin-top: 10px;
        }
        
        .btn-continue {
            background: linear-gradient(135deg, #11998e 0%, #38ef7d 100%);
            color: white;
        }
        
        .btn-continue:hover {
            transform: translateY(-2px);
            box-shadow: 0 8px 20px rgba(17, 153, 142, 0.4);
            color: white;
        }
        
        .btn-logout {
            background: white;
            color: #dc3545;
            border: 2px solid #dc3545;
            margin-top: 10px;
        }
        
        .btn-logout:hover {
            background: #dc3545;
            color: white;
        }
    </style>
</head>
<body>
    <form id="Form1" runat="server">
        <div class="success-card">
            <div class="card-header-custom">
                <div class="checkmark-circle">
                    <i class="fas fa-check"></i>
                </div>
                <h2>Order Successful!</h2>
            </div>
            
            <div class="card-body-custom">
                <p class="text-center text-muted">
                    Your order <strong>#<asp:Label ID="lblOrderId" runat="server"></asp:Label></strong> has been confirmed.
                </p>
                
                <div class="order-details">
                    <p><i class="fas fa-credit-card me-2"></i> <strong>Payment Method:</strong> <asp:Label ID="lblPayment" runat="server"></asp:Label></p>
                    <p><i class="fas fa-rupee-sign me-2"></i> <strong>Total Amount:</strong> ₹ <asp:Label ID="lblAmount" runat="server"></asp:Label></p>
                </div>
                
                <!-- Continue Shopping -->
                <a href="Home.aspx" class="btn btn-continue">
                    <i class="fas fa-shopping-bag me-2"></i> Continue Shopping
                </a>
                
               
            </div>
        </div>
    </form>
</body>
</html>