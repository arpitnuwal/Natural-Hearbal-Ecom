<%@ Page Title="Contact Us  - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Contactus.aspx.cs" Inherits="Contactus" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
      <main>
          <iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d2396.9578529848877!2d74.62761325402745!3d25.36109202903286!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x3968c2575ef22e03%3A0x27697877571d9867!2sGayatri%20Nagar%2C%20Bhilwara%2C%20Rajasthan%20311001!5e1!3m2!1sen!2sin!4v1781506735634!5m2!1sen!2sin" height="450" style="border:0;width:100%" allowfullscreen="" loading="lazy" referrerpolicy="no-referrer-when-downgrade"></iframe>
            <!-- map-area -->
        
            <!-- map-area-end -->

            <!-- contact-area -->
            <section class="contact-area pt-90 pb-90">
                <div class="container">
                    <div class="container-inner-wrap">
                        <div class="row justify-content-center justify-content-lg-between">
                            <div class="col-lg-6 col-md-8 order-2 order-lg-0">
                                <div class="contact-title mb-25">
                                    <h5 class="sub-title">Contact Us</h5>
                                    <h2 class="title">Let's Talk Question<span>.</span></h2>
                                </div>
                                <div class="contact-wrap-content">
                                    <p>Feel free to reach out to us with any questions, feedback, or project inquiries. Our team is ready to assist you.</p>
                                    <div class="contact-form">

    <div class="form-grp">
        <label for="txtName">Your Name <span>*</span></label>
        <asp:TextBox ID="txtName" runat="server" CssClass="form-control"
            placeholder="Your Name..."></asp:TextBox>
    </div>
<div class="form-grp">
        <label for="txtName">Your Mobile No. <span>*</span></label>
        <asp:TextBox ID="txtmobile" runat="server" CssClass="form-control"
            placeholder="Your Mobile No...."></asp:TextBox>
    </div>
    <div class="form-grp">
        <label for="txtEmail">Your Email <span>*</span></label>
        <asp:TextBox ID="txtEmail" runat="server" CssClass="form-control"
            placeholder="Your Email "></asp:TextBox>
    </div>

    <div class="form-grp">
        <label for="txtMessage">Your Message <span>*</span></label>
        <asp:TextBox ID="txtMessage" runat="server" TextMode="MultiLine"
            CssClass="form-control" Rows="5"
            placeholder="Your Message..."></asp:TextBox>
    </div>

    <div class="form-grp checkbox-grp">
        <asp:CheckBox ID="chkHideEmail" runat="server" />
        <label for="<%= chkHideEmail.ClientID %>">
            Don’t show your email address
        </label>
    </div>

    <asp:Button ID="btnSend" runat="server"
        Text="Send Now"
        CssClass="btn rounded-btn"
        OnClick="btnSend_Click" />

    <br />

    <asp:Label ID="lblMessage" runat="server"></asp:Label>

</div>
                                </div>
                            </div>
                            <div class="col-xl-5 col-lg-6 col-md-8">
                                <div class="contact-info-wrap">
                                    <div class="contact-img">
                                        <img src="img/images/contact_img.png" alt=""/>
                                    </div>
                                    <div class="contact-info-list">
                                        <ul>
                                            <li>
                                                <div class="icon"><i class="fas fa-map-marker-alt"></i></div>
                                                <div class="content">
                                                    <p>Plot No.14,Near Samudayik Bhawan,Gaytri Nagar,Bhilwara,Rajasthan 311001</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="icon"><i class="fas fa-phone-alt"></i></div>
                                                <div class="content">
                                                    <p>+91 7742924007</p>
                                                </div>
                                            </li>
                                            <li>
                                                <div class="icon"><i class="fas fa-envelope-open"></i></div>
                                                <div class="content">
                                                    <p>customerhappiness@floraherbals.com</p>
                                                </div>
                                            </li>
                                        </ul>
                                    </div>
                                    <div class="contact-social">
                                        <ul>
                                            <li><a href="#"><i class="fab fa-facebook-f"></i></a></li>
                                            <li><a href="#"><i class="fab fa-twitter"></i></a></li>
                                            <li><a href="#"><i class="fab fa-linkedin-in"></i></a></li>
                                        </ul>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- contact-area-end -->

        </main>
</asp:Content>

