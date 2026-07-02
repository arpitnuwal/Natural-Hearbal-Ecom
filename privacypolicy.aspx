<%@ Page Title="Privacy Policy   - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="privacypolicy.aspx.cs" Inherits="privacypolicy" %>

<asp:Content ID="Content1" ContentPlaceHolderID="head" Runat="Server">
    <style>
    .refund-policy-section {
        padding: 80px 0;
        background: #f5f7fa;
    }

    .refund-policy-section .container {
        max-width: 1100px;
        margin: auto;
        padding: 0 15px;
    }

    .policy-content {
        background: #fff;
        padding: 50px;
        border-radius: 20px;
        box-shadow: 0 10px 40px rgba(0, 0, 0, 0.08);
    }

    .section-title {
        text-align: center;
        margin-bottom: 40px;
    }

    .section-title h1 {
        font-size: 42px;
        color: #2d3748;
        margin-bottom: 15px;
        position: relative;
        display: inline-block;
    }

    .section-title h1::after {
        content: "";
        width: 70px;
        height: 4px;
        background: #2e4c17;
        position: absolute;
        left: 50%;
        bottom: -12px;
        transform: translateX(-50%);
        border-radius: 10px;
    }

    .section-title p {
        color: #666;
        font-size: 16px;
        line-height: 1.8;
        max-width: 800px;
        margin: 25px auto 0;
    }

    .policy-content h2 {
        font-size: 24px;
        color: #2e4c17;
        margin-top: 40px;
        margin-bottom: 15px;
        padding-left: 15px;
        border-left: 5px solid #2e4c17;
    }

    .policy-content p {
        color: #555;
        line-height: 1.9;
        margin-bottom: 15px;
    }

    .policy-content ul {
        list-style: none;
        padding: 0;
        margin: 20px 0;
    }

    .policy-content ul li {
        position: relative;
        padding: 12px 0 12px 35px;
        color: #555;
        border-bottom: 1px solid #eee;
    }

    .policy-content ul li:last-child {
        border-bottom: none;
    }

    .policy-content ul li::before {
        content: "✓";
        position: absolute;
        left: 0;
        top: 12px;
        width: 24px;
        height: 24px;
        background: #2e4c17;
        color: #fff;
        text-align: center;
        line-height: 24px;
        border-radius: 50%;
        font-size: 13px;
        font-weight: bold;
    }

    .contact-info {
        margin-top: 20px;
    }

    .contact-info li {
        background: #f8f9fa;
        padding: 20px 20px 20px 65px !important;
        margin-bottom: 15px;
        border-radius: 12px;
        border: none !important;
    }

    .contact-info li::before {
        content: "📌";
        width: 40px;
        height: 40px;
        line-height: 40px;
        left: 15px;
        top: 50%;
        transform: translateY(-50%);
        border-radius: 50%;
        background: rgba(40, 167, 69, 0.1);
        font-size: 18px;
    }

    .contact-info li:nth-child(2)::before {
        content: "📞";
    }

    .contact-info li:nth-child(3)::before {
        content: "✉️";
    }

    strong {
        color: #2d3748;
    }

    @media (max-width: 768px) {
        .policy-content {
            padding: 30px 20px;
        }

        .section-title h1 {
            font-size: 32px;
        }

        .policy-content h2 {
            font-size: 20px;
        }
    }
</style>
</asp:Content>
<asp:Content ID="Content2" ContentPlaceHolderID="ContentPlaceHolder1" Runat="Server">
  
<main>

    <!-- breadcrumb-area -->
    <section class="breadcrumb-area breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h2 class="title">Privacy Policy</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Privacy Policy</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- privacy-policy-area -->
    <section class="terms-and-conditions-area pt-85 pb-85">
        <section class="refund-policy-section">
            <div class="container">

                <div class="section-title">
                    <h1>Privacy Policy</h1>
                    <p>
                        At Flora Herbals, we value your privacy and are committed to protecting
                        the personal information you share with us. This Privacy Policy explains
                        how we collect, use, disclose, and safeguard your information when you
                        visit our website or purchase our products.
                    </p>
                </div>

                <div class="policy-content">

                    <h2>1. Information We Collect</h2>
                    <p>
                        We may collect personal information that you voluntarily provide to us,
                        including:
                    </p>

                    <ul>
                        <li>Name and contact details.</li>
                        <li>Billing and shipping address.</li>
                        <li>Email address and phone number.</li>
                        <li>Payment and transaction information.</li>
                        <li>Any information submitted through contact forms.</li>
                    </ul>

                    <h2>2. How We Use Your Information</h2>
                    <p>Your information may be used for the following purposes:</p>

                    <ul>
                        <li>To process and fulfill your orders.</li>
                        <li>To provide customer support and respond to inquiries.</li>
                        <li>To improve our website, products, and services.</li>
                        <li>To send order updates and important notifications.</li>
                        <li>To comply with applicable legal obligations.</li>
                    </ul>

                    <h2>3. Information Sharing</h2>
                    <p>
                        Flora Herbals does not sell, rent, or trade your personal information.
                        We may share information only with trusted service providers involved in
                        payment processing, shipping, or legal compliance.
                    </p>

                    <h2>4. Data Security</h2>
                    <p>
                        We implement appropriate security measures to protect your personal data
                        against unauthorized access, alteration, disclosure, or destruction.
                        However, no method of transmission over the internet is completely secure.
                    </p>

                    <h2>5. Cookies</h2>
                    <p>
                        Our website may use cookies and similar technologies to enhance user
                        experience, analyze website traffic, and improve functionality. You may
                        choose to disable cookies through your browser settings.
                    </p>

                    <h2>6. Third-Party Links</h2>
                    <p>
                        Our website may contain links to third-party websites. We are not
                        responsible for the privacy practices or content of those external sites.
                    </p>

                    <h2>7. Your Rights</h2>
                    <p>
                        You may request access to, correction of, or deletion of your personal
                        information by contacting us using the details provided below, subject to
                        applicable laws.
                    </p>

                    <h2>8. Contact Information</h2>
                    <p>
                        If you have any questions regarding this Privacy Policy, please contact us:
                    </p>

                    <ul class="contact-info">
                        <li>
                            <strong>Address:</strong><br>
                            Plot No.14, Near Samudayik Bhawan, Gaytri Nagar,
                            Bhilwara, Rajasthan - 311001
                        </li>

                        <li>
                            <strong>Phone:</strong><br>
                            +91 7742924007
                        </li>

                        <li>
                            <strong>Email:</strong><br>
                            customerhappiness@floraherbals.com
                        </li>
                    </ul>

                    <h2>9. Changes to This Privacy Policy</h2>
                    <p>
                        Flora Herbals reserves the right to update or modify this Privacy Policy
                        at any time without prior notice. Any changes will be posted on this page,
                        and the revised policy will become effective immediately upon publication.
                    </p>

                </div>

            </div>
        </section>
    </section>
    <!-- privacy-policy-area-end -->

</main>


</asp:Content>

