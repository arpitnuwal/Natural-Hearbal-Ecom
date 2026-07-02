<%@ Page Title="Shipping Policy  - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="Shippingpolicy.aspx.cs" Inherits="Shippingpolicy" %>

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
                                <h2 class="title">Shipping Policy</h2>
                                <nav aria-label="breadcrumb">
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-item"><a href="index.html">Home</a></li>
                                        <li class="breadcrumb-item active" aria-current="page">Shipping Policy</li>
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
    <h1>Shipping Policy</h1>
    <p>
        At Flora Herbals, we are committed to delivering your health and wellness products
        safely and on time. Please review our shipping policy to understand our shipping process.
    </p>
</div>

<div class="policy-content">

    <h2>1. Order Processing</h2>
    <p>
        All orders are processed within <strong>1–3 business days</strong> after successful
        payment confirmation. Orders are not processed or shipped on Sundays or public holidays.
    </p>

    <h2>2. Shipping Coverage</h2>
    <p>
        We currently ship across India through trusted courier partners to ensure safe and
        timely delivery of your products.
    </p>

    <h2>3. Estimated Delivery Time</h2>
    <p>
        Delivery timelines may vary depending on your location. Estimated delivery times are:
    </p>

    <ul>
        <li>Metro Cities: 3–5 business days</li>
        <li>Other Cities: 5–7 business days</li>
        <li>Remote Areas: 7–10 business days</li>
    </ul>

    <h2>4. Shipping Charges</h2>
    <p>
        Shipping charges, if applicable, will be displayed during checkout before payment.
        Promotional offers providing free shipping may be introduced from time to time.
    </p>

    <h2>5. Order Tracking</h2>
    <p>
        Once your order has been shipped, you will receive a confirmation email or SMS
        containing the tracking details and courier information.
    </p>

    <h2>6. Delayed Deliveries</h2>
    <p>
        While we strive to deliver all orders within the estimated timeline, delays may occur
        due to unforeseen circumstances such as adverse weather conditions, natural disasters,
        strikes, or courier service disruptions.
    </p>

    <h2>7. Incorrect Shipping Information</h2>
    <p>
        Customers are responsible for providing accurate shipping details. Flora Herbals shall
        not be held responsible for delays or failed deliveries resulting from incorrect or
        incomplete address information provided by the customer.
    </p>

    <h2>8. Damaged Packages</h2>
    <p>
        If you receive a damaged or tampered package, please do not accept the delivery.
        Contact our customer support team immediately with photographs of the package for
        assistance.
    </p>

    <h2>9. Contact Information</h2>
    <p>
        For any shipping-related queries, please contact us using the details below:
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

    <h2>10. Policy Updates</h2>
    <p>
        Flora Herbals reserves the right to amend this Shipping Policy at any time without
        prior notice. Any changes will be updated on this page and will become effective
        immediately upon publication.
    </p>

</div>

        </div>
    </section>
            </section>
            <!-- terms-and-conditions-area-end -->

        </main>
</asp:Content>

