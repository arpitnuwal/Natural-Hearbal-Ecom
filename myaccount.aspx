<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myaccount.aspx.cs" Inherits="myaccount" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server"> <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.7.2/css/all.min.css">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
       <!-- Header -->
    <div style="background:#2e4c17; color:#fff; padding:18px; text-align:center; font-size:24px; font-weight:bold;">
        My Account
    </div>

    <!-- Welcome -->
  <div style="max-width:1000px;margin:30px auto;font-family:Arial,sans-serif;">

    <h2 style="text-align:center;color:#333;">My Account</h2>

    <div style="display:flex;flex-wrap:wrap;gap:20px;justify-content:center;">

        <!-- Home -->
        <a href="index.aspx" style="text-decoration:none;">
            <div style="width:200px;padding:30px;background:#fff;border:1px solid #ddd;border-radius:10px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,.1);">
                <i class="fa-solid fa-house" style="font-size:45px;color:#28a745;"></i>
                <div style="margin-top:15px;font-size:18px;font-weight:bold;color:#333;">Home</div>
            </div>
        </a>

        <!-- Orders -->
        <a href="myorderlist.aspx" style="text-decoration:none;">
            <div style="width:200px;padding:30px;background:#fff;border:1px solid #ddd;border-radius:10px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,.1);">
                <i class="fa-solid fa-box-open" style="font-size:45px;color:#007bff;"></i>
                <div style="margin-top:15px;font-size:18px;font-weight:bold;color:#333;">My Orders</div>
            </div>
        </a>

        <!-- Profile -->
        <a href="myprofile.aspx" style="text-decoration:none;">
            <div style="width:200px;padding:30px;background:#fff;border:1px solid #ddd;border-radius:10px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,.1);">
                <i class="fa-solid fa-user" style="font-size:45px;color:#ff9800;"></i>
                <div style="margin-top:15px;font-size:18px;font-weight:bold;color:#333;">My Profile</div>
            </div>
        </a>

        <!-- Logout -->
        <a href="Logout.aspx" onclick="return confirm('Are you sure you want to logout?');" style="text-decoration:none;">
            <div style="width:200px;padding:30px;background:#fff;border:1px solid #ddd;border-radius:10px;text-align:center;box-shadow:0 2px 8px rgba(0,0,0,.1);">
                <i class="fa-solid fa-right-from-bracket" style="font-size:45px;color:#dc3545;"></i>
                <div style="margin-top:15px;font-size:18px;font-weight:bold;color:#333;">Logout</div>
            </div>
        </a>

    </div>

</div>
</asp:Content>

