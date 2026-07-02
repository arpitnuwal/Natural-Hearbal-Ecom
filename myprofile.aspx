<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="myprofile.aspx.cs" Inherits="myprofile" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
    <br /><br /><br />

<div style="max-width:900px;margin:30px auto;background:#fff;border:1px solid #ddd;border-radius:10px;box-shadow:0 3px 10px rgba(0,0,0,.1);font-family:Arial;">

    <!-- Header -->
    <div style="background:#2e4c17;color:#fff;padding:18px;border-radius:10px 10px 0 0;font-size:24px;font-weight:bold;">
        <i class="fa fa-user"></i> My Profile
    </div>

    <div style="padding:25px;">

        <table style="width:100%;border-collapse:collapse;">

            <tr>
                <td style="padding:12px;width:180px;font-weight:bold;">Full Name</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtname" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Email</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtemail" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Mobile</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtmobile" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Company Name</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtcompanyname" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Address</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtaddress" runat="server" TextMode="MultiLine" Rows="3"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">City</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtcity" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">State</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtstate" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Pincode</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtpincode" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

            <tr>
                <td style="padding:12px;font-weight:bold;">Country</td>
                <td style="padding:12px;">
                    <asp:TextBox ID="txtcountry" runat="server"
                        style="width:100%;padding:10px;border:1px solid #ccc;border-radius:5px;"></asp:TextBox>
                </td>
            </tr>

        </table>

        <div style="text-align:center;margin-top:30px;">

            <asp:Button ID="btnUpdate" runat="server"
                Text="Update Profile"
                OnClick="btnUpdate_Click"
                style="background:#2e4c17;color:#fff;padding:12px 35px;border:none;border-radius:5px;font-size:16px;cursor:pointer;" />

        </div>

    </div>

</div>
</asp:Content>

