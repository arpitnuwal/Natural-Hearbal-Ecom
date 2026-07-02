using System;
using System.Data;
using System.Data.SqlClient;
using System.Configuration;
using System.Security.Cryptography;
using System.Text;
using System.Web;

public partial class Admin_Login : System.Web.UI.Page
{
    SqlConnection con = new SqlConnection(
        ConfigurationManager.ConnectionStrings["MyCon"].ConnectionString);

    protected void Page_Load(object sender, EventArgs e)
    {
        // Redirect already-logged-in admin
        if (Session["AdminID"] != null)
            Response.Redirect("~/Admin/Dashboard.aspx");
    }

    protected void btnLogin_Click(object sender, EventArgs e)
    {
        string email = txtEmail.Text.Trim();
        string password = txtPassword.Text.Trim();

        if (string.IsNullOrEmpty(email) || string.IsNullOrEmpty(password))
        {
            ShowError("Please fill in all fields.");
            return;
        }

        string hash = password;

        try
        {
            SqlCommand cmd = new SqlCommand(
                @"SELECT AdminID, AdminName, Email
                  FROM Admins
                  WHERE Email = @Email
                    AND PasswordHash = @PasswordHash
                    AND Status = 1", con);

            cmd.Parameters.AddWithValue("@Email", email);
            cmd.Parameters.AddWithValue("@PasswordHash", hash);

            con.Open();
            SqlDataReader dr = cmd.ExecuteReader();

            if (dr.Read())
            {
                Session["AdminID"] = dr["AdminID"].ToString();
                Session["AdminName"] = dr["AdminName"].ToString();
                Session["AdminEmail"] = dr["Email"].ToString();

                dr.Close();
                con.Close();

                Response.Redirect("~/Admin/Dashboard.aspx");
            }
            else
            {
                dr.Close();
                ShowError("Invalid email or password. Please try again.");
            }
        }
        catch (Exception ex)
        {
            ShowError("Database error: " + ex.Message);
        }
        finally
        {
            if (con.State == ConnectionState.Open)
                con.Close();
        }
    }

    private void ShowError(string message)
    {
        pnlError.Visible = true;
        litError.Text = message;
    }

    /// <summary>
    /// Returns the SHA-256 hex string of the given plain-text password.
    /// Store the same hash in the Admins table.
    /// </summary>
    public static string HashPassword(string password)
    {
        using (SHA256 sha = SHA256.Create())
        {
            byte[] bytes = sha.ComputeHash(Encoding.UTF8.GetBytes(password));
            StringBuilder sb = new StringBuilder();
            foreach (byte b in bytes)
                sb.Append(b.ToString("x2"));
            return sb.ToString();
        }
    }
}