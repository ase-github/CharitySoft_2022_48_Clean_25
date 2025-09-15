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
using DevExpress.Web;

public partial class NewDonationsDetail : BaseWebForm
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
            this.CmbSearchId.Value = Session["app_ser_from_srch"];
        }

        DonCod = this.CmbSearchId.Value;
        DOnation_DS = WS.ExecSpResultSet("charitysoft", Session["username"], Session["password"], "GetDonations", CommandType.StoredProcedure, DonCod);

        if (DOnation_DS.Tables[0].Rows.Count > 0)
        {
            decimal s = DOnation_DS.Tables[0].Rows[0][2] == DBNull.Value ? 0 : Convert.ToDecimal(DOnation_DS.Tables[0].Rows[0][2]);
        }

        Session["app_ser_from_srch"] = "";
        Session["orphans_app_ser"] = this.CmbSearchId.Value;
    }

    private void UpdateSourceTargetGrids()
    {
        LinqServerModeDataSource_source.DataBind();
        ASPxGridView_Source.DataBind();
        EntityDataSource_donations_rates.DataBind();
        ASPxGridView_Target.DataBind();
    }

    #endregion

    #region Events

    protected void Page_Load(object sender, EventArgs e)
    {
        DsSearchID.ConnectionString = new ConnectionStringEx().TheConnectionString;
    }

    protected void LinqServerModeDataSource_target_Selecting(object sender, LinqServerModeDataSourceSelectEventArgs e)
    {
        // if (CmbSearchId.Value != null)
        // {
        //     e.KeyExpression = "nat_code";
        //     short donID = Convert.ToInt16(CmbSearchId.Value);
        //     Database db = new Database();
        // 
        //     e.QueryableSource = (from o in db.donations_rates where o.donation_code == donID select o);
        // }
    }

    protected void LinqServerModeDataSource_source_Selecting(object sender, LinqServerModeDataSourceSelectEventArgs e)
    {
        if (CmbSearchId.Value != null)
        {
            e.KeyExpression = "nat_code";

            short donID = Convert.ToInt16(CmbSearchId.Value);

            Database db = new Database();
            List<short> countries = new List<short>();
            // string userName = ASPxComboBox_user_name.Value;

            countries = (from o in db.donations_rates where o.donation_code == donID select o.nat_code).ToList();
            e.QueryableSource = (from o in db.nat_tab where !countries.Contains(o.nat_code) select o);
        }
        else
        {
            e.QueryableSource = null;
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

    protected void ASPxCallback_Add_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        if (CmbSearchId.Value != null)
        {
            try
            {
                List<object> selectionList = ASPxGridView_Source.GetSelectedFieldValues("nat_code");

                if (selectionList.Count > 0)
                {
                    using (Database db = new Database())
                    {
                        short donationCode = Convert.ToInt16(CmbSearchId.Value);
                        bool _ApplyCurrencyConversion = (from o in db.donations where o.donation_code == donationCode select o.ApplyCurrencyConversion).DefaultIfEmpty(false).FirstOrDefault();

                        for (int a = 0; a <= selectionList.Count - 1; a++)
                        {
                            donations_rates _donation_rates = new donations_rates();

                            _donation_rates.nat_code = Convert.ToInt16(selectionList[a]);
                            _donation_rates.donation_code = Convert.ToInt16(CmbSearchId.Value);
                            _donation_rates.donation_standard_value = 1;
                            _donation_rates.target_quantity = 1;
                            _donation_rates.ApplyCurrencyConversion = _ApplyCurrencyConversion;

                            db.donations_rates.AddObject(_donation_rates);
                        }

                        db.SaveChanges();
                    }
                }

                e.Result = "OK";
            }
            catch (Exception ex)
            {
                e.Result = FaultEngine.HandleException(ex).Message;
            }
        }
    }

    protected void ASPxCallback_Remove_Callback(object source, DevExpress.Web.CallbackEventArgs e)
    {
        if (CmbSearchId.Value != null)
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
                            int DonID = Convert.ToInt32(CmbSearchId.Value);
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

    protected void ASPxButton_Add_Click(object sender, EventArgs e)
    {
    }

    protected void txtdonCode_TextChanged(object sender, EventArgs e)
    {
        UpdateSourceTargetGrids();
    }

    protected void Btn_Search_Click(object sender, EventArgs e)
    {
        if (CmbSearchId.SelectedIndex != -1)
        {
            this.CmbSearchId.Value = CmbSearchId.SelectedItem.Value;
            // SearchDonation(Convert.ToInt32(this.CmbSearchId.Value));
            UpdateSourceTargetGrids();
        }
    }

    protected void ASPxGridView_Target_RowUpdating(object sender, DevExpress.Web.Data.ASPxDataUpdatingEventArgs e)
    {
        e.NewValues["donation_code"] = CmbSearchId.Value;
    }

    #endregion
}