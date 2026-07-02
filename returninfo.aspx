<%@ Page Title="Return Policy  - floraherbals.com" Language="C#" MasterPageFile="~/MasterPage.master" AutoEventWireup="true" CodeFile="returninfo.aspx.cs" Inherits="returninfo" %>

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
    ```html
<main>

    <!-- breadcrumb-area -->
    <section class="breadcrumb-area breadcrumb-bg">
        <div class="container">
            <div class="row">
                <div class="col-12">
                    <div class="breadcrumb-content">
                        <h2 class="title">Return Policy</h2>
                        <nav aria-label="breadcrumb">
                            <ol class="breadcrumb">
                                <li class="breadcrumb-item"><a href="index.aspx">Home</a></li>
                                <li class="breadcrumb-item active" aria-current="page">Return Policy</li>
                            </ol>
                        </nav>
                    </div>
                </div>
            </div>
        </div>
    </section>
    <!-- breadcrumb-area-end -->

    <!-- return-policy-area -->
    <section class="terms-and-conditions-area pt-85 pb-85">
        <section class="refund-policy-section">
            <div class="container">

                <div class="section-title">
                    <h1>Return Policy</h1>
                    <p>
                        At Flora Herbals, we aim to provide the highest quality health and wellness
                        products. If you are not satisfied with your purchase due to a valid reason,
                        please review our return policy below.
                    </p>
                </div>

                <div class="policy-content">

                    <h2>1. Return Eligibility</h2>
                    <p>
                        Returns are accepted only under the following circumstances:
                    </p>

                    <ul>
                        <li>The product delivered is damaged or defective.</li>
                        <li>You have received an incorrect product.</li>
                        <li>The product has expired before delivery.</li>
                        <li>The package was tampered with during transit.</li>
                    </ul>

                    <h2>2. Return Request Timeline</h2>
                    <p>
                        Customers must initiate a return request within
                        <strong>48 hours</strong> of receiving the product.
                    </p>

                    <h2>3. Non-Returnable Products</h2>
                    <p>
                        For safety and hygiene reasons, we cannot accept returns for products that
                        have been opened, used, or partially consumed.
                    </p>

                    <p>The following categories are non-returnable once opened:</p>

                    <ul>
                        <li>Meal Replacement Shakes</li>
                        <li>Energy Drinks</li>
                        <li>Protein Powders</li>
                        <li>Herbal Products</li>
                    </ul>

                    <h2>4. How to Request a Return</h2>
                    <p>
                        To initiate a return, please contact our customer support team with the
                        following details:
                    </p>

                    <ul>
                        <li>Order Number</li>
                        <li>Customer Name and Contact Information</li>
                        <li>Clear photographs of the product and packaging</li>
                        <li>Description of the issue faced</li>
                    </ul>

                    <h2>5. Return Approval</h2>
                    <p>
                        Once the return request is verified and approved, our team will provide
                        instructions for the return process. Products must be returned in their
                        original packaging wherever applicable.
                    </p>

                    <h2>6. Return Shipping</h2>
                    <p>
                        In cases where the return is due to an error on our part, Flora Herbals
                        will bear the return shipping costs. For other approved returns, shipping
                        charges may be applicable.
                    </p>

                    <h2>7. Contact Information</h2>
                    <p>
                        For any return-related queries, please contact us using the details below:
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

                    <h2>8. Policy Updates</h2>
                    <p>
                        Flora Herbals reserves the right to modify this Return Policy at any time
                        without prior notice. Any changes will be updated on this page and will
                        become effective immediately upon publication.
                    </p>

                </div>

            </div>
        </section>
    </section>
    <!-- return-policy-area-end -->

</main>
```

</asp:Content>

