using System;
using System.Collections.Generic;
using System.Linq;
using System.Net;
using System.Net.Mail;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

using ASPSnippets.GoogleAPI;
using System.Web.Script.Serialization;
public partial class Login : System.Web.UI.Page
{
    ClsConnection cnn = new ClsConnection();
    protected void Page_Load(object sender, EventArgs e)
    {
        GoogleConnect.ClientId = "408562082954-dbt3m70gc13836oo4vnuuqhub44ben7k.apps.googleusercontent.com";
        GoogleConnect.ClientSecret = "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";
        GoogleConnect.RedirectUri = Request.Url.AbsoluteUri.Split('?')[0];

        if (!this.IsPostBack)
        {
            string code = Request.QueryString["code"];
            if (!string.IsNullOrEmpty(code))
            {
                GoogleConnect connect = new GoogleConnect();
                string json = connect.Fetch("me", code);
                GoogleProfile profile = new JavaScriptSerializer().Deserialize<GoogleProfile>(json);
                Response.Write("ID: " + profile.Id + "<br/>");
                Response.Write("Name: " + profile.Name + "<br/>");
                Response.Write("Email: " + profile.Email + "<br/>");
                Response.Write("Verified: " + profile.Verified_Email + "<br/>");
                Response.Write("<img src='" + profile.Picture + "' alt='Profile Image' width='120' height='120' /><br/>");

                if (profile.Verified_Email == "True")
                {
                    cnn.Open();
                    string emailcheck = cnn.ExecuteScalar("Select  count(*) From [Register] where Email='" + profile.Email + "'").ToString();
                    if (emailcheck == "0")
                    {
                        string uid = cnn.ExecuteScalar("Select  IsNull(Max(UserID)+1,1) From [Register]").ToString();
                        cnn.ExecuteNonQuery("insert into Register (UserID,FullName,Email,Mobile,Address,City,State,Pincode,Country,EmailVerified,MobileVerified,IsActive) values ('" + uid + "','" + profile.Name + "','" + profile.Email + "','','','','','','',1,0,1)");
                       
                        HttpCookie userCookie = new HttpCookie("UserInfofloraherbals");
                        userCookie["UserID"] = uid.ToString();
                        userCookie["UserName"] = "";
                        userCookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(userCookie);

                        cartupdate(uid);
                        Response.Redirect("index.aspx");
                    }

                    else
                    {

                        string uid = cnn.ExecuteScalar("Select  UserID From [Register] where Email='" + profile.Email + "'").ToString();
                        HttpCookie userCookie = new HttpCookie("UserInfofloraherbals");
                        userCookie["UserID"] = uid.ToString();
                        userCookie["UserName"] = "";
                        userCookie.Expires = DateTime.Now.AddDays(30);
                        Response.Cookies.Add(userCookie);
                        cartupdate(uid);
                        Response.Redirect("index.aspx");
                  
                    }

                    cnn.Close();
                }
            }
        }
    }

    protected void Button1_Click(object sender, EventArgs e)
    {
        lblmsg.Text = "";
        Random r = new Random();
        string otp = r.Next(100000, 999999).ToString();

        Session["OTP"] = otp;

        // SMTP Code
        MailMessage mail = new MailMessage();
        mail.From = new MailAddress("websiteordermessage@gmail.com");
        mail.To.Add(txtemail.Text.Trim());
        mail.Subject = "Login OTP";
        mail.Body = "Your OTP is : <b>" + otp + "</b>";
        mail.IsBodyHtml = true;

        SmtpClient smtp = new SmtpClient("smtp.gmail.com", 587);
        smtp.EnableSsl = true;
        smtp.UseDefaultCredentials = false;
        smtp.Credentials = new NetworkCredential("websiteordermessage@gmail.com", "gmoxxnboybmyvukj");
        smtp.Send(mail);

        // Controls Show
        txtotp.Visible = true;
        Button2.Visible = true;
        lblmsg.Text = "Otp Send";
        Button1.Text = "Re-Send";
        txtotp.Focus();
    }

    protected void Button2_Click(object sender, EventArgs e)
    {
        if (Session["OTP"] != null && txtotp.Text.Trim() == Session["OTP"].ToString())
        {
            cnn.Open();

             string emailcheck = cnn.ExecuteScalar("Select  count(*) From [Register] where Email='" + txtemail.Text + "'").ToString();
             if (emailcheck == "0")
             {
                 string uid = cnn.ExecuteScalar("Select  IsNull(Max(UserID)+1,1) From [Register]").ToString();
                 cnn.ExecuteNonQuery("insert into Register (UserID,FullName,Email,Mobile,Address,City,State,Pincode,Country,EmailVerified,MobileVerified,IsActive) values ('" + uid + "','','" + txtemail.Text + "','','','','','','',1,0,1)");
                 cnn.Close();
                 HttpCookie userCookie = new HttpCookie("UserInfofloraherbals");
                 userCookie["UserID"] = uid.ToString();
                 userCookie["UserName"] = "";
                 userCookie.Expires = DateTime.Now.AddDays(30);
                 Response.Cookies.Add(userCookie);

                 cartupdate(uid);
                 Response.Redirect("index.aspx");
             }
             else
             {

                 string uid = cnn.ExecuteScalar("Select  UserID From [Register] where Email='" + txtemail.Text + "'").ToString();
                 HttpCookie userCookie = new HttpCookie("UserInfofloraherbals");
                 userCookie["UserID"] = uid.ToString();
                 userCookie["UserName"] = "";
                 userCookie.Expires = DateTime.Now.AddDays(30);
                 Response.Cookies.Add(userCookie);

                 cartupdate(uid);
                 Response.Redirect("index.aspx");
             }
                       

        }
        else
        {
            lblmsg.Text = "Otp Not Match"; Button2.Focus(); return;
        }
    }
    public class GoogleProfile
    {
        public string Id { get; set; }
        public string Name { get; set; }
        public string Picture { get; set; }
        public string Email { get; set; }
        public string Verified_Email { get; set; }
    }
    protected void btnResend_Click(object sender, EventArgs e)
    {
        Button1_Click(sender, e);
    }

    public void cartupdate(string uid)
    {

        HttpContext context1 = HttpContext.Current;
        if (context1.Request.Cookies["floraherbalscart"] != null)
        {
            if (Request.Cookies["floraherbalscart"].Value != null)
            {
                cnn.Open();
                cnn.ExecuteNonQuery("update trncart set cartid=0,userid=" + uid + " where cartid=" + Request.Cookies["floraherbalscart"].Value + "");
                cnn.Close();
                Response.Cookies["floraherbalscart"].Expires = DateTime.Now.AddDays(-1);
                Response.Cookies.Remove("floraherbalscart");
                HttpCookie myCookie = new HttpCookie("floraherbalscart");
                myCookie.Expires = DateTime.Now.AddDays(-1d);
                Response.Cookies.Add(myCookie);
            }
        }
    
    }
    protected void LinkButton1_Click(object sender, EventArgs e)
    {
        GoogleConnect.Authorize("profile", "email");
    }
}