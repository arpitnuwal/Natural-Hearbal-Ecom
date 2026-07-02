using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

public partial class Contactus : System.Web.UI.Page
{
    protected void Page_Load(object sender, EventArgs e)
    {

    }
    protected void btnSend_Click(object sender, EventArgs e)
    {
        try
        {
            string name = txtName.Text.Trim();
            string email = txtEmail.Text.Trim();
            string message = txtMessage.Text.Trim();
            bool hideEmail = chkHideEmail.Checked;

            if (name == "" || email == "" || message == "")
            {
                lblMessage.Text = "Please fill all required fields.";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                return;
            }

            string conStr = ConfigurationManager
                                .ConnectionStrings["MyCon"]
                                .ConnectionString;

            using (SqlConnection con = new SqlConnection(conStr))
            {
                string query = @"INSERT INTO ContactUs
                                (Name, Email, Message, HideEmail,mobile)
                                VALUES
                                (@Name, @Email, @Message, @HideEmail,'" + txtmobile.Text + "')";

                using (SqlCommand cmd = new SqlCommand(query, con))
                {
                    cmd.Parameters.AddWithValue("@Name", name);
                    cmd.Parameters.AddWithValue("@Email", email);
                    cmd.Parameters.AddWithValue("@Message", message);
                    cmd.Parameters.AddWithValue("@HideEmail", hideEmail);

                    con.Open();
                    cmd.ExecuteNonQuery();
                }
            }

            lblMessage.Text = "Your message has been sent successfully.";
            lblMessage.ForeColor = System.Drawing.Color.Green;

            // Clear Form
            txtName.Text = "";
            txtEmail.Text = "";
            txtMessage.Text = ""; txtmobile.Text = "";
            chkHideEmail.Checked = false;
        }
        catch (Exception ex)
        {
            lblMessage.Text = "Error: " + ex.Message;
            lblMessage.ForeColor = System.Drawing.Color.Red;
        }
    }
}
