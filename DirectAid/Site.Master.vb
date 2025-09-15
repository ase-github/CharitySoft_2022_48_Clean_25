
#Region "Imports Directives"

Imports System.Globalization
Imports System.Threading

#End Region

Public Class Site
    Inherits System.Web.UI.MasterPage

#Region "Methods"

    Private Sub SignOut()

        Session(SessionKey.MAIN_MENU_SEUCRITY) = Nothing
        FormsAuthentication.SignOut()
        FormsAuthentication.RedirectToLoginPage()

    End Sub

    Private Sub SetLanguage()

        Dim currentCulture As String = Session(SessionKey.CULTURE)

        If currentCulture = Constant.CULTURE_AR_KW Then

            ASPxMenu1.Items.FindByName("Language").Text = "الانجليزيه"
            ASPxMenu1.Items.FindByName("Language").Image.Url = "~/Images/flag_usa_16x16.png"
            ASPxMenu1.RightToLeft = DevExpress.Utils.DefaultBoolean.True
            ASPxMenu1.Items.FindByName("UserName").Text = String.Format("{0}", Session(SessionKey.USERNAME))

        Else

            ASPxMenu1.Items.FindByName("Language").Text = "Arabic"
            ASPxMenu1.Items.FindByName("Language").Image.Url = "~/Images/flag_kuwait_16x16.png"
            ASPxMenu1.RightToLeft = DevExpress.Utils.DefaultBoolean.False
            ASPxMenu1.Items.FindByName("UserName").Text = String.Format("{0}", Session(SessionKey.USERNAME))

        End If

    End Sub

    Private Sub SwitchLanguage()

        Dim currentCulture As String = Session(SessionKey.CULTURE)

        If currentCulture = Constant.CULTURE_AR_KW Then

            Session(SessionKey.CULTURE) = Constant.CULTURE_EN_US

        Else

            Session(SessionKey.CULTURE) = Constant.CULTURE_AR_KW

        End If

        Response.Redirect(Request.Url.OriginalString)

    End Sub

    Private Sub MenuSecurity()

#If DEBUG Then

#Else
        Dim _view_main_menu_security As New view_main_menu_security

        If Not Session(SessionKey.MAIN_MENU_SEUCRITY) Is Nothing Then

            _view_main_menu_security = DirectCast(Session(SessionKey.MAIN_MENU_SEUCRITY), view_main_menu_security)

        Else

            Using db As New Database

                _view_main_menu_security = (From o In db.view_main_menu_security Select o).FirstOrDefault

                Session(SessionKey.MAIN_MENU_SEUCRITY) = _view_main_menu_security

            End Using

        End If

        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_MAINDATA).Visible = _view_main_menu_security.MAINDATA
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_DONATIONS).Visible = _view_main_menu_security.DONATIONS
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_ORPHANS).Visible = _view_main_menu_security.ORPHANS
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_EDUCATION).Visible = _view_main_menu_security.EDUCATION
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_HEALTH).Visible = _view_main_menu_security.HEALTH
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_RELIEF).Visible = _view_main_menu_security.RELIEF
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_DAAWA).Visible = _view_main_menu_security.DAAWA
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_PROJECTS).Visible = _view_main_menu_security.PROJECTS
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_PROJECTS_CONSTRUCTION).Visible = _view_main_menu_security.PROJECTS_CONSTRUCTION
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_PROJECTS_DEVELOPMENT).Visible = _view_main_menu_security.PROJECTS_DEVELOPMENT
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_SETTINGS).Visible = _view_main_menu_security.SETTINGS
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_REPORTS).Visible = _view_main_menu_security.REPORTS
        ASPxMenu1.Items.FindByName(Constant.MAIN_MENU_ITEM_NAME_DONOR_MERGE).Visible = _view_main_menu_security.DONOR_MERGE
#End If

    End Sub

    Private Sub Cacheability()

        ''HttpContext.Current.Response.Cache.SetAllowResponseInBrowserHistory(<span style="COLOR:blue;">false</span>)
        'HttpContext.Current.Response.Cache.SetCacheability(HttpCacheability.NoCache)
        'HttpContext.Current.Response.Cache.SetNoStore()
        ''Response.Cache.SetExpires(DateTime.Now.AddSeconds(60))
        ''Response.Cache.SetValidUntilExpires(<span style="COLOR:blue;">true</span>)

    End Sub

    Private Sub SessionHandler()

        If Session(SessionKey.USERNAME) Is Nothing Then

            SignOut()

        End If

    End Sub

    Private Sub CheckForceChangePassword()

        If Session(SessionKey.FORCE_CHANGE_PASSWORD) And System.IO.Path.GetFileName(Request.PhysicalPath) <> "ChangePassword.aspx" Then

            Response.Redirect("ChangePassword.aspx")

        End If

    End Sub

#End Region

#Region "Events"

    Protected Sub Page_Load(ByVal sender As Object, ByVal e As System.EventArgs) Handles Me.Load

        SessionHandler()

        Cacheability()

        SetLanguage()

        If Not IsPostBack Then

            '#If Not Debug Then

            MenuSecurity()

            CheckForceChangePassword()

            '#End If

        End If

    End Sub

    Protected Sub ASPxMenu1_ItemClick(source As Object, e As DevExpress.Web.MenuItemEventArgs) Handles ASPxMenu1.ItemClick

        Select Case e.Item.Name

            Case "Exit"
                SignOut()

            Case "Language"
                SwitchLanguage()

        End Select

    End Sub

#End Region

End Class