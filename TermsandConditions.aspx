<%@ Page Title="Terms & Conditions  - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="TermsandConditions.aspx.cs" Inherits="TermsandConditions" %>

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
                        <h2 class="title">Terms & Conditions</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item">
                                    <a href="index.html">Home</a>
                                </li>
                                <li class="breadcrumb-item active" aria-current="page">
                                    Terms & Conditions
                                </li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- terms-and-conditions-area -->
    <section class="terms-and-conditions-area pt-85 pb-85">
        <section class="refund-policy-section">
            <div class="container">

                <div class="section-title">
                    <h1>Terms & Conditions</h1>
                    <p>
                        Welcome to Flora Herbals. By accessing and using our website,
                        you agree to comply with and be bound by the following terms
                        and conditions. Please read them carefully before placing an order.
                    </p>
                </div>

                <div class="policy-content">

                    <h2>1. Acceptance of Terms</h2>
                    <p>
                        By using this website, creating an account, or purchasing products
                        from Flora Herbals, you acknowledge that you have read, understood,
                        and agreed to these Terms & Conditions.
                    </p>

                    <h2>2. Products and Services</h2>
                    <p>
                        Flora Herbals offers health and wellness products, including but
                        not limited to meal replacement shakes, energy drinks, protein
                        powders, and herbal products. Product availability may change
                        without prior notice.
                    </p>

                    <h2>3. Pricing and Payments</h2>
                    <p>
                        All prices displayed on the website are in Indian Rupees (INR).
                        We reserve the right to modify prices at any time without prior
                        notice. Payments must be completed through the approved payment
                        methods available on the website.
                    </p>

                    <h2>4. Order Acceptance</h2>
                    <p>
                        We reserve the right to accept or reject any order at our sole
                        discretion. An order confirmation does not guarantee acceptance
                        of the order until it has been processed and dispatched.
                    </p>

                    <h2>5. Shipping and Delivery</h2>
                    <p>
                        Delivery timelines provided are estimates only. Flora Herbals
                        shall not be held liable for delays caused by courier services,
                        natural events, or circumstances beyond our control.
                    </p>

                    <h2>6. Returns and Refunds</h2>
                    <p>
                        Returns and refunds are subject to our Return Policy and Refund
                        Policy. Customers are encouraged to review these policies before
                        making a purchase.
                    </p>

                    <h2>7. Intellectual Property</h2>
                    <p>
                        All content on this website, including text, graphics, logos,
                        images, and designs, is the property of Flora Herbals and may
                        not be copied, reproduced, or distributed without prior written
                        permission.
                    </p>

                    <h2>8. Limitation of Liability</h2>
                    <p>
                        Flora Herbals shall not be liable for any indirect, incidental,
                        special, or consequential damages arising from the use of our
                        products or website.
                    </p>

                    <h2>9. User Responsibilities</h2>
                    <p>
                        Users agree not to misuse the website, attempt unauthorized
                        access, transmit harmful code, or engage in activities that may
                        disrupt the operation of the website.
                    </p>

                    <h2>10. Governing Law</h2>
                    <p>
                        These Terms & Conditions shall be governed by and construed in
                        accordance with the laws of India. Any disputes shall be subject
                        to the jurisdiction of the courts in Bhilwara, Rajasthan.
                    </p>

                    <h2>11. Contact Information</h2>
                    <p>
                        For any questions regarding these Terms & Conditions, please
                        contact us:
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

                    <h2>12. Changes to Terms & Conditions</h2>
                    <p>
                        Flora Herbals reserves the right to update or modify these
                        Terms & Conditions at any time without prior notice. Continued
                        use of the website after such changes constitutes acceptance
                        of the revised terms.
                    </p>

                </div>

            </div>
        </section>
    </section>
    <!-- terms-and-conditions-area-end -->

</main>

</asp:Content>

