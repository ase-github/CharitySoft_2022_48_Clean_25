using System;
using System.Collections.Generic;
using System.Configuration;
using System.Data;
using System.Data.SqlClient;
using System.Globalization;
using System.Linq;
using System.Threading;
using System.Web;
using System.Web.Security;
using System.Web.UI;
using System.Web.UI.HtmlControls;
using System.Web.UI.WebControls;
using System.Web.UI.WebControls.WebParts;
using DevExpress.Data.Linq;
using DevExpress.Web.ASPxCallbackPanel;
using DevExpress.Web.ASPxClasses;
using DevExpress.Web.ASPxEditors;
using DevExpress.Web.ASPxGridView;

public partial class NewDonations : BaseWebForm
{
    #region Fields

    protected string _culture;

    private DataAccessLibrary WS = new DataAccessLibrary();

    private DataAccessLibrary _ws = new DataAccessLibrary();

    #endregion

    #region Methods

    private void Clear_Frm(Control container)
    {
        foreach (Control control in container.Controls)
        {
            ClearControl(control);

            if (control.HasControls())
            {
                Clear_Frm(control);
            }
        }
    }

    private void ClearControl(ref Control control)
    {
        // other types can obviously be put in if necessary
        switch (control.GetType().Name)
        {
            case "ASPxTextBox":
                ((ASPxTextBox)control).Text = "";
                break;
            case "ASPxComboBox":
                ((ASPxComboBox)control).SelectedIndex = -1;
                break;
                // case "DataGrid":
                // ((DataGrid)control).DataSource = null;
                // control.DataBind();
            default:
                break;
        }
    }

    private void SearchDonation(int code)
    {
        object DonCod;
        DataSet DOnation_DS;
        string SQL;

        if (Session["app_ser_from_srch"] != null && Session["app_ser_from_srch"].ToString() != "")
        {
            this.txtdonCode.Text = Session["app_ser_from_srch"].ToString();
        }

        DonCod = this.txtdonCode.Text;
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session["username"], Session["password"], "GetDonations", CommandType.StoredProcedure, DonCod);

        if (DOnation_DS.Tables[0].Rows.Count > 0)
        {
            this.txtDonArabicName.Text = DOnation_DS.Tables[0].Rows[0][0] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][0].ToString();
            this.TxtDOnEngName.Text = DOnation_DS.Tables[0].Rows[0][1] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][1].ToString();
            decimal s = DOnation_DS.Tables[0].Rows[0][2] == DBNull.Value ? 0 : Convert.ToDecimal(DOnation_DS.Tables[0].Rows[0][2]);
            this.txtBasicVal.Text = DOnation_DS.Tables[0].Rows[0][2] == DBNull.Value ? "0" : DOnation_DS.Tables[0].Rows[0][2].ToString();
            this.cmbAccNum.Text = DOnation_DS.Tables[0].Rows[0][3] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][3].ToString();
            this.cmbDim1.Text = DOnation_DS.Tables[0].Rows[0][4] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][4].ToString();
            this.cmbDim2.Text = DOnation_DS.Tables[0].Rows[0][5] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][5].ToString();
            this.cmbDim4.Text = DOnation_DS.Tables[0].Rows[0][6] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][6].ToString();
            this.cmbDIm5.Text = DOnation_DS.Tables[0].Rows[0][7] == DBNull.Value ? string.Empty : DOnation_DS.Tables[0].Rows[0][7].ToString();
            this.cmbDonType.SelectedIndex = DOnation_DS.Tables[0].Rows[0][8] == DBNull.Value ? -1 : Convert.ToInt32(DOnation_DS.Tables[0].Rows[0][8]);
        }

        Session["app_ser_from_srch"] = "";
        Session["orphans_app_ser"] = this.txtdonCode.Text;
    }

    private void UpdateSourceTargetGrids()
    {
        LinqServerModeDataSource_source.DataBind();
        ASPxGridView_Source.DataBind();
        LinqServerModeDataSource_target.DataBind();
        ASPxGridView_Target.DataBind();
    }

    public void Fill_DDL()
    {
        DataSet DDL_DS;
        string SQL;
        string SQL1;
        string sql2;
        string sql3;
        // Session["username"] = "sa";
        // Session["password"] = "pass@word1";

        SQL1 = " select Mainaccount.MainAccountId from DynamicsAX..Mainaccount  inner Join ";
        sql2 = " DynamicsAX..MAINACCOUNTcATEGORY  ON DynamicsAX..Mainaccount.ACCOUNTCATEGORYREF=DynamicsAX..MAINACCOUNTcATEGORY.ACCOUNTCATEGORYREF ";
        sql3 = " WHERE DynamicsAX..Mainaccount.ACCOUNTCATEGORYREF IN(15,16,4)";
        // ,"11,12)";
        SQL = SQL1 + sql2 + sql3;
        DDL_DS = new DataSet();
        DDL_DS = WS.GetMyData("charitysoft", Session["username"], Session["password"], SQL);
        this.cmbAccNum.DataSource = DDL_DS.Tables[0];
        // cmbAccNum.DataTextField = "accountnum";
        // cmbAccNum.DataValueField = "MainAccountId";
        cmbAccNum.ValueField = "MainAccountId";
        cmbAccNum.DataBind();

        DDL_DS.Clear();
        DDL_DS = null;
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        dontCateg.ConnectionString = new ConnectionStringEx().TheConnectionString;
        DsAccountNum.ConnectionString = new ConnectionStringEx().TheConnectionString;
        Dsdim1.ConnectionString = new ConnectionStringEx().TheConnectionString;
        Dsdim2.ConnectionString = new ConnectionStringEx().TheConnectionString;
        DsSearchID.ConnectionString = new ConnectionStringEx().TheConnectionString;

        if (!IsPostBack)
        {
            try
            {
                // for testing 
                // Session["username"] = "sa";
                // Session["password"] = "pass@word1";

                // if (IsPostBack)
                // {
                // }
                // else
                // {
                // }
                // Fill_DDL();
            }
            catch (Exception ex)
            {
            }
        }
    }

    protected void LinqServerModeDataSource_target_Selecting(object sender, LinqServerModeDataSourceSelectEventArgs e)
    {
        e.KeyExpression = "nat_code";
        int donID = -5000;
        if (txtdonCode.Text != "")
        {
            donID = Convert.ToInt32(txtdonCode.Text);
        }
        Database db = new Database();
        List<short> countries = new List<short>();
        // string userName = ASPxComboBox_user_name.Value;

        countries = (from o in db.donations_rates where o.donation_code == donID select o.nat_code).ToList();
        e.QueryableSource = (from o in db.nat_tab where countries.Contains(o.nat_code) select o);
    }

    protected void LinqServerModeDataSource_source_Selecting(object sender, LinqServerModeDataSourceSelectEventArgs e)
    {
        e.KeyExpression = "nat_code";
        int donID = -5000;
        if (txtdonCode.Text != "")
        {
            donID = Convert.ToInt32(txtdonCode.Text);
        }

        Database db = new Database();
        List<short> countries = new List<short>();
        // string userName = ASPxComboBox_user_name.Value;

        countries = (from o in db.donations_rates where o.donation_code == donID select o.nat_code).ToList();
        e.QueryableSource = (from o in db.nat_tab where !countries.Contains(o.nat_code) select o);
    }

    // protected void ASPxComboBox_ListType_SelectedIndexChanged(object sender, EventArgs e)
    // {
    //     ASPxGridView_Source.DataBind();
    //     // ASPxGridView_Target.DataBind();
    // 
    //     ASPxGridView_Source.Selection.UnselectAll();
    //     // ASPxGridView_Target.Selection.UnselectAll();
    // }

    protected void ASPxCallback_Add_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        if (txtdonCode.Text != "")
        {
            try
            {
                List<object> selectionList = ASPxGridView_Source.GetSelectedFieldValues("nat_code");

                if (selectionList.Count > 0)
                {
                    using (Database db = new Database())
                    {
                        for (int a = 0; a <= selectionList.Count - 1; a++)
                        {
                            donations_rates _donation_rates = new donations_rates();
                            // _user_country_relationship.user_name = ASPxComboBox_user_name.Value;
                            _donation_rates.nat_code = Convert.ToInt16(selectionList[a]);
                            _donation_rates.donation_code = Convert.ToInt32(txtdonCode.Text);
                            _donation_rates.donation_standard_value = Convert.ToDecimal(txtBasicVal.Text);
                            _donation_rates.target_quantity = Convert.ToDecimal(txttargetVal.Text);
                            // TODO: Other fields
                            db.donations_rates.AddObject(_donation_rates);
                        }

                        db.SaveChanges();
                    }
                }

                e.Result = "OK";
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }
    }

    protected void ASPxCallback_Remove_Callback(object source, DevExpress.Web.ASPxCallback.CallbackEventArgs e)
    {
        if (txtdonCode.Text != "")
        {
            try
            {
                List<object> selectionList = ASPxGridView_Target.GetSelectedFieldValues("nat_code");
                // string userName = ASPxComboBox_user_name.Value;

                if (selectionList.Count > 0)
                {
                    using (Database db = new Database())
                    {
                        for (int a = 0; a <= selectionList.Count - 1; a++)
                        {
                            int DonID = Convert.ToInt32(txtdonCode.Text);
                            short nat_code = Convert.ToInt16(selectionList[a]);
                            donations_rates _donation_rates = (from o in db.donations_rates where o.nat_code == nat_code && o.donation_code == DonID select o).FirstOrDefault();

                            if (_donation_rates != null)
                            {
                                db.donations_rates.DeleteObject(_donation_rates);
                            }
                        }

                        db.SaveChanges();
                    }
                }

                e.Result = "OK";
            }
            catch (Exception ex)
            {
                e.Result = ex.Message;
            }
        }
    }

    protected void txttarget_TextChanged(object sender, EventArgs e)
    {
    }

    protected void ASPxButton_Add_Click(object sender, EventArgs e)
    {
    }

    protected void txtdonCode_TextChanged(object sender, EventArgs e)
    {
        UpdateSourceTargetGrids();
    }

    protected void txtdonCode_ValueChanged(object sender, EventArgs e)
    {
    }

    protected void Btn_Search_Click(object sender, EventArgs e)
    {
        if (CmbSearchId.SelectedIndex != -1)
        {
            this.txtdonCode.Text = CmbSearchId.SelectedItem.Value;
            SearchDonation(Convert.ToInt32(this.txtdonCode.Text));
            UpdateSourceTargetGrids();
        }
    }

    protected void ASPxButton_New_Click(object sender, EventArgs e)
    {
        Clear_Frm(this);
        UpdateSourceTargetGrids();
    }

    protected void ASPxButton_Save_Click(object sender, EventArgs e)
    {
        if (this.txtDonArabicName.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Enter Donation Arabic Name')", true);
            return;
        }

        if (this.TxtDOnEngName.Text == "")
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Enter Donation English Name')", true);
            return;
        }

        if (!IsNumeric(txtBasicVal.Text))
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Enter Standard Value')", true);
            return;
        }

        if (cmbAccNum.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select Account Number')", true);
            return;
        }

        if (cmbDim1.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select DImension1')", true);
            return;
        }

        if (cmbDim2.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select DImension2')", true);
            return;
        }

        if (txtdonCode.Text == "")
        {
            using (Database db = new Database())
            {
                donation _newDonation = new donation();
                _newDonation.donation_cat = Convert.ToInt16(cmbDonType.SelectedIndex);
                _newDonation.donation_descrar = txtDonArabicName.Text;
                _newDonation.donation_descreng = TxtDOnEngName.Text;
                _newDonation.donation_standard_value = decimal.Parse(txtBasicVal.Text);
                _newDonation.account_num = cmbAccNum.Text;
                _newDonation.dimension1 = cmbDim1.Text;
                _newDonation.dimension2 = cmbDim2.Text;
                _newDonation.dimension3 = "";
                _newDonation.dimension4 = cmbDim4.Text;
                _newDonation.dimension5 = cmbDIm5.Text;
                // int _newdoncode = db.donations.Max(o => o.donation_code) + 1;
                db.donations.AddObject(_newDonation);
                db.SaveChanges();
                txtdonCode.Text = _newDonation.donation_code.ToString();
            }

            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('تم الحفظ بنجاح')", true);
        }
        else
        {
            using (Database db = new Database())
            {
                int doncode = Convert.ToInt32(txtdonCode.Text);
                donation _newDonation = (from don in db.donations
                                        where don.donation_code == doncode).FirstOrDefault();
                if (_newDonation != null)
                {
                    _newDonation.donation_cat = Convert.ToInt16(cmbDonType.SelectedIndex);
                    _newDonation.donation_descrar = txtDonArabicName.Text;
                    _newDonation.donation_descreng = TxtDOnEngName.Text;
                    _newDonation.donation_standard_value = decimal.Parse(txtBasicVal.Text);
                    _newDonation.account_num = cmbAccNum.Text;
                    _newDonation.dimension1 = cmbDim1.Text;
                    _newDonation.dimension2 = cmbDim2.Text;
                    _newDonation.dimension3 = "";
                    _newDonation.dimension4 = cmbDim4.Text;
                    _newDonation.dimension5 = cmbDIm5.Text;

                    db.SaveChanges();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('تم الحفض بنجاح')", true);
                }
            }
        }
        UpdateSourceTargetGrids();
    }

    // Helper method to check if a string is numeric (VB.NET IsNumeric equivalent)
    private bool IsNumeric(string value)
    {
        decimal result;
        return decimal.TryParse(value, out result);
    }

    #endregion
}