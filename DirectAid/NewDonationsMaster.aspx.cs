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

public partial class NewDonationsMaster : BaseWebForm
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

        if (Session["app_ser_from_srch"] != null && Session["app_ser_from_srch"].ToString() != "")
        {
            this.txtdonCode.Text = Session["app_ser_from_srch"].ToString();
        }

        DonCod = this.txtdonCode.Text;
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session["username"], Session["password"], "GetDonations", CommandType.StoredProcedure, DonCod);

        if (DOnation_DS.Tables[0].Rows.Count > 0)
        {
            this.txtDonArabicName.Value = DOnation_DS.Tables[0].Rows[0]["donation_descrar"];
            this.TxtDOnEngName.Value = DOnation_DS.Tables[0].Rows[0]["donation_descreng"];
            this.cmbAccNum.Value = DOnation_DS.Tables[0].Rows[0]["account_num"];
            this.cmbDim1.Value = DOnation_DS.Tables[0].Rows[0]["dimension1"];
            this.cmbDim2.Value = DOnation_DS.Tables[0].Rows[0]["dimension2"];
            this.cmbDim4.Value = DOnation_DS.Tables[0].Rows[0]["dimension3"];
            this.cmbDIm5.Value = DOnation_DS.Tables[0].Rows[0]["dimension4"];
            this.cmbDonType.Value = DOnation_DS.Tables[0].Rows[0]["donation_cat"];
            ASPxCheckBox_ApplyCurrencyConversion.Value = DOnation_DS.Tables[0].Rows[0]["ApplyCurrencyConversion"];
            ASPxCheckBox_Active.Value = DOnation_DS.Tables[0].Rows[0]["Active"];
        }

        Session["app_ser_from_srch"] = "";
        Session["orphans_app_ser"] = this.txtdonCode.Text;
    }

    private void UpdateSourceTargetGrids()
    {
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        dontCateg.ConnectionString = new ConnectionStringEx().TheConnectionString;
        // DsAccountNum.ConnectionString = new ConnectionStringEx().TheConnectionString;
        // Dsdim1.ConnectionString = new ConnectionStringEx().TheConnectionString;
        // Dsdim2.ConnectionString = new ConnectionStringEx().TheConnectionString;
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

    // protected void ASPxComboBox_ListType_SelectedIndexChanged(object sender, EventArgs e)
    // {
    //     ASPxGridView_Source.DataBind();
    //     // ASPxGridView_Target.DataBind();
    // 
    //     ASPxGridView_Source.Selection.UnselectAll();
    //     // ASPxGridView_Target.Selection.UnselectAll();
    // }

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

        // if (!IsNumeric(txtBasicVal.Text))
        // {
        //     Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Enter Standard Value')", true);
        //     return;
        // }

        if (cmbAccNum.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select Account Number')", true);
            return;
        }

        if (cmbDim1.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select Dimension1')", true);
            return;
        }

        if (cmbDim2.SelectedIndex == -1)
        {
            Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('Please Select Dimension2')", true);
            return;
        }

        if (txtdonCode.Text == "")
        {
            using (Database db = new Database())
            {
                donation _newDonation = new donation();
                _newDonation.donation_cat = Convert.ToInt32(cmbDonType.Value);
                _newDonation.donation_descrar = txtDonArabicName.Value.ToString();
                _newDonation.donation_descreng = TxtDOnEngName.Value.ToString();
                // _newDonation.donation_standard_value = decimal.Parse(txtBasicVal.Text);
                _newDonation.account_num = cmbAccNum.Value.ToString();
                _newDonation.dimension1 = cmbDim1.Value.ToString();
                _newDonation.dimension2 = cmbDim2.Value.ToString();
                _newDonation.dimension3 = null;
                _newDonation.dimension4 = cmbDim4.Value?.ToString();
                _newDonation.dimension5 = cmbDIm5.Value?.ToString();
                _newDonation.donation_code = (from o in db.donations select o.donation_code).DefaultIfEmpty(0).Max() + 1;
                _newDonation.ApplyCurrencyConversion = Convert.ToBoolean(ASPxCheckBox_ApplyCurrencyConversion.Value);
                _newDonation.Active = Convert.ToBoolean(ASPxCheckBox_Active.Value);
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
                    _newDonation.donation_cat = Convert.ToInt32(cmbDonType.Value);
                    _newDonation.donation_descrar = txtDonArabicName.Value.ToString();
                    _newDonation.donation_descreng = TxtDOnEngName.Value.ToString();
                    // _newDonation.donation_standard_value = decimal.Parse(txtBasicVal.Text);
                    _newDonation.account_num = cmbAccNum.Value.ToString();
                    _newDonation.dimension1 = cmbDim1.Value.ToString();
                    _newDonation.dimension2 = cmbDim2.Value.ToString();
                    _newDonation.dimension3 = null;
                    _newDonation.dimension4 = cmbDim4.Value?.ToString();
                    _newDonation.dimension5 = cmbDIm5.Value?.ToString();
                    _newDonation.ApplyCurrencyConversion = Convert.ToBoolean(ASPxCheckBox_ApplyCurrencyConversion.Value);
                    _newDonation.Active = Convert.ToBoolean(ASPxCheckBox_Active.Value);

                    db.SaveChanges();
                    Page.ClientScript.RegisterStartupScript(this.GetType(), "show_alert", "alert('تم الحفظ بنجاح')", true);
                }
            }
        }
        UpdateSourceTargetGrids();
    }

    #endregion
}