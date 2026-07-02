<%@ Page Title="" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Login.aspx.cs" Inherits="Login" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" runat="Server">
    <main>

            <!-- breadcrumb-area -->
            <div class="breadcrumb-area breadcrumb-bg-two">
                <div class="container custom-container">
                    <div class="row">
                        <div class="col-12">
                            <div class="breadcrumb-content">
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item"><a href="index.aspx">Login</a></li>
                                 
                                    </ol>
                                </nav>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
            <!-- breadcrumb-area-end -->

            <!-- checkout-area -->
            <div class="checkout-area pt-90 pb-90" style="margin-top:-35px">
                <div class="container">
                    <div class="row justify-content-center">
                          <div class="col-lg-4"></div>



                        <div class="col-lg-4">

<asp:UpdatePanel ID="UpdatePanel1" runat="server">
    <ContentTemplate>
    <div class="checkout-form-wrap">

        <div class="checkout-form-top" style="text-align:center !important">
            <h5 class="title" style="text-align:center !important">Login or Create Account</h5>
        </div>

        <div class="building-info-wrap">

            <asp:TextBox ID="txtemail" runat="server"
                placeholder="Enter Email"></asp:TextBox>

            <asp:Button ID="Button1" runat="server"
                Text="Get OTP"
                CssClass="btn"
                OnClick="Button1_Click" />

            <asp:TextBox ID="txtotp" runat="server"
                placeholder="Enter OTP"
                Visible="false"></asp:TextBox>

<asp:Label ID="lblmsg" runat="server" ForeColor="Red"></asp:Label>

            <asp:Button ID="Button2" runat="server"
                Text="Verify OTP"
                CssClass="Verfiy"
                Visible="false"
                OnClick="Button2_Click"></asp:Button>

         

            <div class="different-address-wrap"  style="text-align:center !important">
                <div class="account-create-info">
                  <asp:LinkButton ID="LinkButton1" runat="server" OnClick="LinkButton1_Click">
                      <img src="img/google.png" style="width:70%;margin-left:45px" />
                  </asp:LinkButton>
                </div>
            </div>

        </div>

    </div>
</ContentTemplate>
</asp:UpdatePanel>
</div>



                        <div class="col-lg-4">
                            
                        </div>
                    </div>
                </div>
            </div>
            <!-- checkout-area-end -->

        </main>
</asp:Content>

