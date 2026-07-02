<%@ Page Title="Help & FAQ  -  floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="HelpFAQ.aspx.cs" Inherits="HelpFAQ" %>

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
                        <h2 class="title">Help & FAQ</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Help & FAQ</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- help-faq-area -->
    <section class="terms-and-conditions-area pt-85 pb-85">
        <section class="refund-policy-section">
            <div class="container">

                <div class="section-title">
                    <h1>Help & Frequently Asked Questions</h1>
                    <p>
                        Welcome to Flora Herbals Help Center. Find answers to the most commonly
                        asked questions regarding orders, shipping, returns, payments, and our
                        health and wellness products.
                    </p>
                </div>

                <div class="policy-content">

                    <h2>1. How can I place an order?</h2>
                    <p>
                        Browse our products, add the desired items to your cart, proceed to
                        checkout, enter your shipping details, and complete the payment process.
                    </p>

                    <h2>2. What payment methods do you accept?</h2>
                    <p>
                        We accept major debit cards, credit cards, UPI payments, net banking,
                        and other secure payment methods available during checkout.
                    </p>

                    <h2>3. How long does shipping take?</h2>
                    <p>
                        Orders are usually delivered within 3–7 business days depending on
                        your location. Delivery timelines may vary for remote areas.
                    </p>

                    <h2>4. How can I track my order?</h2>
                    <p>
                        Once your order is shipped, you will receive tracking details via
                        email or SMS, allowing you to monitor your shipment status.
                    </p>

                    <h2>5. Can I cancel my order?</h2>
                    <p>
                        Orders can be cancelled before they are dispatched. Once shipped,
                        cancellation requests may not be accepted.
                    </p>

                    <h2>6. What is your return policy?</h2>
                    <p>
                        Returns are accepted only for damaged, defective, or incorrectly
                        delivered products. Please contact customer support within 48 hours
                        of receiving your order.
                    </p>

                    <h2>7. Are your products safe to use?</h2>
                    <p>
                        Our products are manufactured following quality standards. However,
                        customers should read the product label carefully and consult a
                        healthcare professional if necessary.
                    </p>

                    <h2>8. How can I contact customer support?</h2>
                    <p>
                        You can contact our support team using the details provided below.
                        We will be happy to assist you.
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

                    <h2>9. Need Further Assistance?</h2>
                    <p>
                        If you cannot find the answer to your question here, please get in touch
                        with our customer support team. We are committed to providing prompt and
                        effective assistance.
                    </p>

                </div>

            </div>
        </section>
    </section>
    <!-- help-faq-area-end -->

</main>




</asp:Content>

