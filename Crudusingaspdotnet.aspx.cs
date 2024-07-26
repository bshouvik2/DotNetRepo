using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Linq;
using System.Web;
using System.Web.UI;
using System.Web.UI.WebControls;

namespace Crudusingdotnet
{
    public partial class Crudusingaspdotnet : System.Web.UI.Page
    {
        private string strConnectionString = ConfigurationManager.ConnectionStrings["myconnection"].ConnectionString;
        private SqlCommand _sqlCommand;
        private SqlDataAdapter _sqlDataAdapter;
        DataSet _dtSet;
        protected void Page_Load(object sender, EventArgs e)
        {
            if (!IsPostBack)
            {
                BindEmployeeData();

            }
        }
        public void CreateConnection()
        {
            SqlConnection _sqlConnection = new SqlConnection(strConnectionString);
            _sqlCommand = new SqlCommand();
            _sqlCommand.Connection = _sqlConnection;
        }
        public void OpenConnection()
        {
            _sqlCommand.Connection.Open();
        }
        public void CloseConnection()
        {
            _sqlCommand.Connection.Close();
        }
        public void DisposeConnection()
        {
            _sqlCommand.Connection.Dispose();
        }
        public void BindEmployeeData()
        {
            try
            {
                CreateConnection();
                OpenConnection();
                _sqlCommand.CommandText = "usp_GridViewExample";
                _sqlCommand.CommandType = CommandType.StoredProcedure;
                _sqlCommand.Parameters.AddWithValue("@Event", "Select");
                _sqlDataAdapter = new SqlDataAdapter(_sqlCommand);
                _dtSet = new DataSet();
                _sqlDataAdapter.Fill(_dtSet);
                grvEmployee.DataSource = _dtSet;
                grvEmployee.DataBind();
            }
            catch (Exception ex)
            {
                Response.Redirect("The Error is " + ex);
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }
        protected void btnAddEmployee_Click(object sender, EventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();
                _sqlCommand.CommandText = "usp_GridViewExample";
                _sqlCommand.CommandType = CommandType.StoredProcedure;
                _sqlCommand.Parameters.AddWithValue("@Event", "Add");
                _sqlCommand.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstName.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@PhoneNumber", Convert.ToString(txtPhoneNumber.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@EmailAddress", Convert.ToString(txtEmailAddress.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
                int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {
                    lblMessage.Text = "Record Added Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    BindEmployeeData();
                }
                else
                {
                    lblMessage.Text = "Failed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Check your input data";
                Console.WriteLine(ex.Message);
                lblMessage.ForeColor = System.Drawing.Color.Red;
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void btnAddEmployeerest_Click(object sender, EventArgs e)
        {
            txtEmailAddress.Text = "";
            txtFirstName.Text = "";
            txtLastName.Text = "";
            txtPhoneNumber.Text = "";
            txtSalary.Text = "";
            grvEmployee.EmptyDataText = "";
        }

        protected void grvEmployee_RowEditing(object sender, GridViewEditEventArgs e)
        {
            e.NewEditIndex = grvEmployee.EditIndex;
            BindEmployeeData();
        }

        protected void grvEmployee_RowDeleting(object sender, GridViewDeleteEventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();
                Label id = (Label)grvEmployee.Rows[e.RowIndex].FindControl("lblEmpId");
                _sqlCommand.CommandText = "usp_GridViewExample";
                _sqlCommand.Parameters.AddWithValue("@Event", "Delete");
                _sqlCommand.Parameters.AddWithValue("@EmpId", Convert.ToInt32(id.Text));
                _sqlCommand.CommandType = CommandType.StoredProcedure;
                int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {
                    lblMessage.Text = "Record Deleted Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    grvEmployee.EditIndex = -1;
                    BindEmployeeData();
                }
                else
                {
                    lblMessage.Text = "Failed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                    BindEmployeeData();
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Check your input data";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Console.WriteLine(ex.Message);
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void grvEmployee_RowUpdating(object sender, GridViewUpdateEventArgs e)
        {
            try
            {
                CreateConnection();
                OpenConnection();

                Label Empid = (Label)grvEmployee.Rows[e.RowIndex].FindControl("lblEmpId");
                TextBox txtFirstName = (TextBox)grvEmployee.Rows[e.RowIndex].FindControl("txtFirstName");
                TextBox txtLastName = (TextBox)grvEmployee.Rows[e.RowIndex].FindControl("txtLastName");
                TextBox txtPhoneNumber = (TextBox)grvEmployee.Rows[e.RowIndex].FindControl("txtPhoneNumber");
                TextBox txtEmailAddress = (TextBox)grvEmployee.Rows[e.RowIndex].FindControl("txtEmailAddress");
                TextBox txtSalary = (TextBox)grvEmployee.Rows[e.RowIndex].FindControl("txtSalary");


                _sqlCommand.CommandText = "usp_GridViewExample";
                _sqlCommand.CommandType = CommandType.StoredProcedure;
                _sqlCommand.Parameters.AddWithValue("@Event", "Update");
                _sqlCommand.Parameters.AddWithValue("@FirstName", Convert.ToString(txtFirstName.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@LastName", Convert.ToString(txtLastName.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@PhoneNumber", Convert.ToString(txtPhoneNumber.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@EmailAddress", Convert.ToString(txtEmailAddress.Text.Trim()));
                _sqlCommand.Parameters.AddWithValue("@Salary", Convert.ToDecimal(txtSalary.Text));
                _sqlCommand.Parameters.AddWithValue("@EmpId", Convert.ToDecimal(Empid.Text));

                int result = Convert.ToInt32(_sqlCommand.ExecuteNonQuery());
                if (result > 0)
                {
                    lblMessage.Text = "Record Updated Successfully";
                    lblMessage.ForeColor = System.Drawing.Color.Green;
                    grvEmployee.EditIndex = -1;
                    BindEmployeeData();
                }
                else
                {
                    lblMessage.Text = "Failed";
                    lblMessage.ForeColor = System.Drawing.Color.Red;
                }
            }
            catch (Exception ex)
            {
                lblMessage.Text = "Check your input data";
                lblMessage.ForeColor = System.Drawing.Color.Red;
                Console.WriteLine(ex.Message);
            }
            finally
            {
                CloseConnection();
                DisposeConnection();
            }
        }

        protected void grvEmployee_RowCancelingEdit(object sender, GridViewCancelEditEventArgs e)
        {
            grvEmployee.EditIndex = -1;
            BindEmployeeData();
        }

        protected void grvEmployee_PageIndexChanging(object sender, GridViewPageEventArgs e)
        {
            grvEmployee.PageIndex = e.NewPageIndex;
            BindEmployeeData();
        }
    }
}
