<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Public Class XtraReport_ReceiptVoucherV2
    Inherits DevExpress.XtraReports.UI.XtraReport

    'XtraReport overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        If disposing AndAlso components IsNot Nothing Then
            components.Dispose()
        End If
        MyBase.Dispose(disposing)
    End Sub

    'Required by the Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Designer
    'It can be modified using the Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()> _
    Private Sub InitializeComponent()
        Me.Detail = New DevExpress.XtraReports.UI.DetailBand()
        Me.XrLabel2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.natdescrar1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.donationdescrar1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.lineamount1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.ReportHeader = New DevExpress.XtraReports.UI.ReportHeaderBand()
        Me.PageHeader = New DevExpress.XtraReports.UI.PageHeaderBand()
        Me.XrLabel1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text2 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text3 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text4 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text5 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text6 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text7 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text8 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text9 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text10 = New DevExpress.XtraReports.UI.XRLabel()
        Me.donornamear1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.donorid1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.branchdescar1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.recieptnum1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.currencydescrar1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.printcount1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.totalamount1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Expr11 = New DevExpress.XtraReports.UI.XRLabel()
        Me.ReportFooter = New DevExpress.XtraReports.UI.ReportFooterBand()
        Me.XrPageInfo2 = New DevExpress.XtraReports.UI.XRPageInfo()
        Me.Text11 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text13 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text14 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text15 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text17 = New DevExpress.XtraReports.UI.XRLabel()
        Me.primaryphone1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.phone21 = New DevExpress.XtraReports.UI.XRLabel()
        Me.remarks1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.collectnamear1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.NumberToWords1 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text16 = New DevExpress.XtraReports.UI.XRLabel()
        Me.Text20 = New DevExpress.XtraReports.UI.XRLabel()
        Me.PageFooter = New DevExpress.XtraReports.UI.PageFooterBand()
        Me.TopMarginBand1 = New DevExpress.XtraReports.UI.TopMarginBand()
        Me.BottomMarginBand1 = New DevExpress.XtraReports.UI.BottomMarginBand()
        Me.Collection_Receipt_ViewTableAdapter = New Global.DirectAid.DataSet_ReceiptVoucherTableAdapters.Collection_Receipt_ViewTableAdapter()
        Me.DataSet_ReceiptVoucher1 = New Global.DirectAid.DataSet_ReceiptVoucher()
        CType(Me.DataSet_ReceiptVoucher1, System.ComponentModel.ISupportInitialize).BeginInit()
        CType(Me, System.ComponentModel.ISupportInitialize).BeginInit()
        '
        'Detail
        '
        Me.Detail.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLabel2, Me.natdescrar1, Me.donationdescrar1, Me.lineamount1})
        Me.Detail.Dpi = 254.0!
        Me.Detail.HeightF = 58.42004!
        Me.Detail.Name = "Detail"
        '
        'XrLabel2
        '
        Me.XrLabel2.BackColor = System.Drawing.Color.Transparent
        Me.XrLabel2.BorderColor = System.Drawing.Color.Black
        Me.XrLabel2.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.XrLabel2.CanGrow = False
        Me.XrLabel2.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.qty", "{0:n3}")})
        Me.XrLabel2.Dpi = 254.0!
        Me.XrLabel2.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.XrLabel2.ForeColor = System.Drawing.Color.Black
        Me.XrLabel2.LocationFloat = New DevExpress.Utils.PointFloat(1170.646!, 0.0!)
        Me.XrLabel2.Name = "XrLabel2"
        Me.XrLabel2.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.XrLabel2.SizeF = New System.Drawing.SizeF(190.5002!, 58.42004!)
        Me.XrLabel2.StylePriority.UseBackColor = False
        Me.XrLabel2.StylePriority.UseBorders = False
        Me.XrLabel2.StylePriority.UseFont = False
        Me.XrLabel2.StylePriority.UsePadding = False
        Me.XrLabel2.StylePriority.UseTextAlignment = False
        Me.XrLabel2.Text = "XrLabel2"
        Me.XrLabel2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'natdescrar1
        '
        Me.natdescrar1.BackColor = System.Drawing.Color.Transparent
        Me.natdescrar1.BorderColor = System.Drawing.Color.Black
        Me.natdescrar1.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.natdescrar1.CanGrow = False
        Me.natdescrar1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.nat_descrar")})
        Me.natdescrar1.Dpi = 254.0!
        Me.natdescrar1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.natdescrar1.ForeColor = System.Drawing.Color.Black
        Me.natdescrar1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 0.0!)
        Me.natdescrar1.Name = "natdescrar1"
        Me.natdescrar1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.natdescrar1.SizeF = New System.Drawing.SizeF(434.7999!, 58.42001!)
        Me.natdescrar1.StylePriority.UseBackColor = False
        Me.natdescrar1.StylePriority.UseBorders = False
        Me.natdescrar1.StylePriority.UseFont = False
        Me.natdescrar1.StylePriority.UsePadding = False
        Me.natdescrar1.StylePriority.UseTextAlignment = False
        Me.natdescrar1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'donationdescrar1
        '
        Me.donationdescrar1.BackColor = System.Drawing.Color.Transparent
        Me.donationdescrar1.BorderColor = System.Drawing.Color.Black
        Me.donationdescrar1.Borders = CType((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.donationdescrar1.CanGrow = False
        Me.donationdescrar1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.donation_descrar")})
        Me.donationdescrar1.Dpi = 254.0!
        Me.donationdescrar1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.donationdescrar1.ForeColor = System.Drawing.Color.Black
        Me.donationdescrar1.LocationFloat = New DevExpress.Utils.PointFloat(459.8004!, 0.0!)
        Me.donationdescrar1.Name = "donationdescrar1"
        Me.donationdescrar1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.donationdescrar1.SizeF = New System.Drawing.SizeF(710.8458!, 58.42001!)
        Me.donationdescrar1.StylePriority.UseBackColor = False
        Me.donationdescrar1.StylePriority.UseBorders = False
        Me.donationdescrar1.StylePriority.UseFont = False
        Me.donationdescrar1.StylePriority.UsePadding = False
        Me.donationdescrar1.StylePriority.UseTextAlignment = False
        Me.donationdescrar1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'lineamount1
        '
        Me.lineamount1.BackColor = System.Drawing.Color.Transparent
        Me.lineamount1.BorderColor = System.Drawing.Color.Black
        Me.lineamount1.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.lineamount1.CanGrow = False
        Me.lineamount1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.line_amount", "{0:n3}")})
        Me.lineamount1.Dpi = 254.0!
        Me.lineamount1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.lineamount1.ForeColor = System.Drawing.Color.Black
        Me.lineamount1.LocationFloat = New DevExpress.Utils.PointFloat(1361.146!, 0.0!)
        Me.lineamount1.Name = "lineamount1"
        Me.lineamount1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.lineamount1.SizeF = New System.Drawing.SizeF(281.3375!, 58.42004!)
        Me.lineamount1.StylePriority.UseBackColor = False
        Me.lineamount1.StylePriority.UseBorders = False
        Me.lineamount1.StylePriority.UseFont = False
        Me.lineamount1.StylePriority.UsePadding = False
        Me.lineamount1.StylePriority.UseTextAlignment = False
        Me.lineamount1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'ReportHeader
        '
        Me.ReportHeader.Dpi = 254.0!
        Me.ReportHeader.HeightF = 0.0!
        Me.ReportHeader.Name = "ReportHeader"
        Me.ReportHeader.Visible = False
        '
        'PageHeader
        '
        Me.PageHeader.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrLabel1, Me.Text1, Me.Text2, Me.Text3, Me.Text4, Me.Text5, Me.Text6, Me.Text7, Me.Text8, Me.Text9, Me.Text10, Me.donornamear1, Me.donorid1, Me.branchdescar1, Me.recieptnum1, Me.currencydescrar1, Me.printcount1, Me.totalamount1, Me.Expr11})
        Me.PageHeader.Dpi = 254.0!
        Me.PageHeader.HeightF = 245.5818!
        Me.PageHeader.Name = "PageHeader"
        '
        'XrLabel1
        '
        Me.XrLabel1.BackColor = System.Drawing.Color.Gainsboro
        Me.XrLabel1.BorderColor = System.Drawing.Color.Black
        Me.XrLabel1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.XrLabel1.CanGrow = False
        Me.XrLabel1.Dpi = 254.0!
        Me.XrLabel1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.XrLabel1.ForeColor = System.Drawing.Color.Black
        Me.XrLabel1.LocationFloat = New DevExpress.Utils.PointFloat(1170.646!, 187.1617!)
        Me.XrLabel1.Name = "XrLabel1"
        Me.XrLabel1.SizeF = New System.Drawing.SizeF(190.5!, 58.42001!)
        Me.XrLabel1.StylePriority.UseBackColor = False
        Me.XrLabel1.StylePriority.UseBorders = False
        Me.XrLabel1.StylePriority.UseFont = False
        Me.XrLabel1.StylePriority.UseTextAlignment = False
        Me.XrLabel1.Text = "الكمية"
        Me.XrLabel1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Text1
        '
        Me.Text1.BackColor = System.Drawing.Color.Transparent
        Me.Text1.BorderColor = System.Drawing.Color.Black
        Me.Text1.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text1.CanGrow = False
        Me.Text1.Dpi = 254.0!
        Me.Text1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text1.ForeColor = System.Drawing.Color.Black
        Me.Text1.LocationFloat = New DevExpress.Utils.PointFloat(1475.004!, 0.0!)
        Me.Text1.Name = "Text1"
        Me.Text1.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text1.SizeF = New System.Drawing.SizeF(167.4795!, 58.42001!)
        Me.Text1.StylePriority.UseBackColor = False
        Me.Text1.StylePriority.UseBorders = False
        Me.Text1.StylePriority.UseFont = False
        Me.Text1.StylePriority.UsePadding = False
        Me.Text1.StylePriority.UseTextAlignment = False
        Me.Text1.Text = "التاريخ"
        Me.Text1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text2
        '
        Me.Text2.BackColor = System.Drawing.Color.Transparent
        Me.Text2.BorderColor = System.Drawing.Color.Black
        Me.Text2.Borders = CType((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Right), DevExpress.XtraPrinting.BorderSide)
        Me.Text2.CanGrow = False
        Me.Text2.Dpi = 254.0!
        Me.Text2.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text2.ForeColor = System.Drawing.Color.Black
        Me.Text2.LocationFloat = New DevExpress.Utils.PointFloat(1475.004!, 58.42001!)
        Me.Text2.Name = "Text2"
        Me.Text2.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text2.SizeF = New System.Drawing.SizeF(167.4795!, 58.42001!)
        Me.Text2.StylePriority.UseBackColor = False
        Me.Text2.StylePriority.UseBorders = False
        Me.Text2.StylePriority.UseFont = False
        Me.Text2.StylePriority.UsePadding = False
        Me.Text2.StylePriority.UseTextAlignment = False
        Me.Text2.Text = "رقم المتبرع"
        Me.Text2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text3
        '
        Me.Text3.BackColor = System.Drawing.Color.Transparent
        Me.Text3.BorderColor = System.Drawing.Color.Black
        Me.Text3.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text3.CanGrow = False
        Me.Text3.Dpi = 254.0!
        Me.Text3.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text3.ForeColor = System.Drawing.Color.Black
        Me.Text3.LocationFloat = New DevExpress.Utils.PointFloat(1475.004!, 116.84!)
        Me.Text3.Name = "Text3"
        Me.Text3.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text3.SizeF = New System.Drawing.SizeF(167.4795!, 58.42!)
        Me.Text3.StylePriority.UseBackColor = False
        Me.Text3.StylePriority.UseBorders = False
        Me.Text3.StylePriority.UseFont = False
        Me.Text3.StylePriority.UsePadding = False
        Me.Text3.StylePriority.UseTextAlignment = False
        Me.Text3.Text = "وصلنا من"
        Me.Text3.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text4
        '
        Me.Text4.BackColor = System.Drawing.Color.Transparent
        Me.Text4.BorderColor = System.Drawing.Color.Black
        Me.Text4.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text4.CanGrow = False
        Me.Text4.Dpi = 254.0!
        Me.Text4.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text4.ForeColor = System.Drawing.Color.Black
        Me.Text4.LocationFloat = New DevExpress.Utils.PointFloat(459.8003!, 0.0!)
        Me.Text4.Name = "Text4"
        Me.Text4.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text4.SizeF = New System.Drawing.SizeF(171.7996!, 58.42001!)
        Me.Text4.StylePriority.UseBackColor = False
        Me.Text4.StylePriority.UseBorders = False
        Me.Text4.StylePriority.UseFont = False
        Me.Text4.StylePriority.UsePadding = False
        Me.Text4.StylePriority.UseTextAlignment = False
        Me.Text4.Text = "الفرع"
        Me.Text4.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text5
        '
        Me.Text5.BackColor = System.Drawing.Color.Transparent
        Me.Text5.BorderColor = System.Drawing.Color.Black
        Me.Text5.Borders = DevExpress.XtraPrinting.BorderSide.Right
        Me.Text5.CanGrow = False
        Me.Text5.Dpi = 254.0!
        Me.Text5.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text5.ForeColor = System.Drawing.Color.Black
        Me.Text5.LocationFloat = New DevExpress.Utils.PointFloat(459.8003!, 58.42001!)
        Me.Text5.Name = "Text5"
        Me.Text5.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text5.SizeF = New System.Drawing.SizeF(171.7996!, 58.42001!)
        Me.Text5.StylePriority.UseBackColor = False
        Me.Text5.StylePriority.UseBorders = False
        Me.Text5.StylePriority.UseFont = False
        Me.Text5.StylePriority.UsePadding = False
        Me.Text5.StylePriority.UseTextAlignment = False
        Me.Text5.Text = "رقم الإستلام"
        Me.Text5.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text6
        '
        Me.Text6.BackColor = System.Drawing.Color.Transparent
        Me.Text6.BorderColor = System.Drawing.Color.Black
        Me.Text6.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text6.CanGrow = False
        Me.Text6.Dpi = 254.0!
        Me.Text6.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text6.ForeColor = System.Drawing.Color.Black
        Me.Text6.LocationFloat = New DevExpress.Utils.PointFloat(459.8003!, 116.84!)
        Me.Text6.Name = "Text6"
        Me.Text6.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text6.SizeF = New System.Drawing.SizeF(171.7996!, 58.42!)
        Me.Text6.StylePriority.UseBackColor = False
        Me.Text6.StylePriority.UseBorders = False
        Me.Text6.StylePriority.UseFont = False
        Me.Text6.StylePriority.UsePadding = False
        Me.Text6.StylePriority.UseTextAlignment = False
        Me.Text6.Text = "القيمة / العملة"
        Me.Text6.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text7
        '
        Me.Text7.BackColor = System.Drawing.Color.Transparent
        Me.Text7.BorderColor = System.Drawing.Color.Black
        Me.Text7.Borders = CType((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text7.CanGrow = False
        Me.Text7.Dpi = 254.0!
        Me.Text7.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text7.ForeColor = System.Drawing.Color.Black
        Me.Text7.LocationFloat = New DevExpress.Utils.PointFloat(96.90025!, 0.0!)
        Me.Text7.Name = "Text7"
        Me.Text7.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text7.SizeF = New System.Drawing.SizeF(163.0!, 58.42001!)
        Me.Text7.StylePriority.UseBackColor = False
        Me.Text7.StylePriority.UseBorders = False
        Me.Text7.StylePriority.UseFont = False
        Me.Text7.StylePriority.UsePadding = False
        Me.Text7.StylePriority.UseTextAlignment = False
        Me.Text7.Text = "عداد الطباعه"
        Me.Text7.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text8
        '
        Me.Text8.BackColor = System.Drawing.Color.Gainsboro
        Me.Text8.BorderColor = System.Drawing.Color.Black
        Me.Text8.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text8.CanGrow = False
        Me.Text8.Dpi = 254.0!
        Me.Text8.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text8.ForeColor = System.Drawing.Color.Black
        Me.Text8.LocationFloat = New DevExpress.Utils.PointFloat(1361.146!, 187.1617!)
        Me.Text8.Name = "Text8"
        Me.Text8.SizeF = New System.Drawing.SizeF(281.3379!, 58.42001!)
        Me.Text8.StylePriority.UseBackColor = False
        Me.Text8.StylePriority.UseBorders = False
        Me.Text8.StylePriority.UseFont = False
        Me.Text8.StylePriority.UseTextAlignment = False
        Me.Text8.Text = "القيمة"
        Me.Text8.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Text9
        '
        Me.Text9.BackColor = System.Drawing.Color.Gainsboro
        Me.Text9.BorderColor = System.Drawing.Color.Black
        Me.Text9.Borders = CType((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text9.CanGrow = False
        Me.Text9.Dpi = 254.0!
        Me.Text9.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text9.ForeColor = System.Drawing.Color.Black
        Me.Text9.LocationFloat = New DevExpress.Utils.PointFloat(459.8004!, 187.1617!)
        Me.Text9.Name = "Text9"
        Me.Text9.SizeF = New System.Drawing.SizeF(710.8455!, 58.42001!)
        Me.Text9.StylePriority.UseBackColor = False
        Me.Text9.StylePriority.UseBorders = False
        Me.Text9.StylePriority.UseFont = False
        Me.Text9.StylePriority.UseTextAlignment = False
        Me.Text9.Text = "غرض التبرع"
        Me.Text9.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Text10
        '
        Me.Text10.BackColor = System.Drawing.Color.Gainsboro
        Me.Text10.BorderColor = System.Drawing.Color.Black
        Me.Text10.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text10.CanGrow = False
        Me.Text10.Dpi = 254.0!
        Me.Text10.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text10.ForeColor = System.Drawing.Color.Black
        Me.Text10.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 187.1617!)
        Me.Text10.Name = "Text10"
        Me.Text10.SizeF = New System.Drawing.SizeF(434.8!, 58.42001!)
        Me.Text10.StylePriority.UseBackColor = False
        Me.Text10.StylePriority.UseBorders = False
        Me.Text10.StylePriority.UseFont = False
        Me.Text10.StylePriority.UseTextAlignment = False
        Me.Text10.Text = "البلد"
        Me.Text10.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'donornamear1
        '
        Me.donornamear1.BackColor = System.Drawing.Color.Transparent
        Me.donornamear1.BorderColor = System.Drawing.Color.Black
        Me.donornamear1.CanGrow = False
        Me.donornamear1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.donor_full_name_ar")})
        Me.donornamear1.Dpi = 254.0!
        Me.donornamear1.Font = New DevExpress.Drawing.DXFont("Arial", 11.25!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.donornamear1.ForeColor = System.Drawing.Color.Black
        Me.donornamear1.LocationFloat = New DevExpress.Utils.PointFloat(660.0002!, 116.84!)
        Me.donornamear1.Name = "donornamear1"
        Me.donornamear1.SizeF = New System.Drawing.SizeF(800.3583!, 58.42!)
        Me.donornamear1.StylePriority.UseBackColor = False
        Me.donornamear1.StylePriority.UseFont = False
        Me.donornamear1.StylePriority.UseTextAlignment = False
        Me.donornamear1.Text = "donornamear1"
        Me.donornamear1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'donorid1
        '
        Me.donorid1.BackColor = System.Drawing.Color.Transparent
        Me.donorid1.BorderColor = System.Drawing.Color.Black
        Me.donorid1.CanGrow = False
        Me.donorid1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.donor_id")})
        Me.donorid1.Dpi = 254.0!
        Me.donorid1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.donorid1.ForeColor = System.Drawing.Color.Black
        Me.donorid1.LocationFloat = New DevExpress.Utils.PointFloat(660.0002!, 58.42001!)
        Me.donorid1.Name = "donorid1"
        Me.donorid1.SizeF = New System.Drawing.SizeF(800.3583!, 58.42001!)
        Me.donorid1.StylePriority.UseBackColor = False
        Me.donorid1.StylePriority.UseFont = False
        Me.donorid1.StylePriority.UseTextAlignment = False
        Me.donorid1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'branchdescar1
        '
        Me.branchdescar1.BackColor = System.Drawing.Color.Transparent
        Me.branchdescar1.BorderColor = System.Drawing.Color.Black
        Me.branchdescar1.Borders = CType((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.branchdescar1.CanGrow = False
        Me.branchdescar1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.branch_descar")})
        Me.branchdescar1.Dpi = 254.0!
        Me.branchdescar1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.branchdescar1.ForeColor = System.Drawing.Color.Black
        Me.branchdescar1.LocationFloat = New DevExpress.Utils.PointFloat(259.9002!, 0.0!)
        Me.branchdescar1.Name = "branchdescar1"
        Me.branchdescar1.SizeF = New System.Drawing.SizeF(199.9!, 58.42001!)
        Me.branchdescar1.StylePriority.UseBackColor = False
        Me.branchdescar1.StylePriority.UseBorders = False
        Me.branchdescar1.StylePriority.UseFont = False
        Me.branchdescar1.StylePriority.UseTextAlignment = False
        Me.branchdescar1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'recieptnum1
        '
        Me.recieptnum1.BackColor = System.Drawing.Color.Transparent
        Me.recieptnum1.BorderColor = System.Drawing.Color.Black
        Me.recieptnum1.Borders = DevExpress.XtraPrinting.BorderSide.Left
        Me.recieptnum1.CanGrow = False
        Me.recieptnum1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.reciept_num")})
        Me.recieptnum1.Dpi = 254.0!
        Me.recieptnum1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.recieptnum1.ForeColor = System.Drawing.Color.Black
        Me.recieptnum1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 58.42001!)
        Me.recieptnum1.Name = "recieptnum1"
        Me.recieptnum1.SizeF = New System.Drawing.SizeF(434.8!, 58.42!)
        Me.recieptnum1.StylePriority.UseBackColor = False
        Me.recieptnum1.StylePriority.UseBorders = False
        Me.recieptnum1.StylePriority.UseFont = False
        Me.recieptnum1.StylePriority.UseTextAlignment = False
        Me.recieptnum1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'currencydescrar1
        '
        Me.currencydescrar1.BackColor = System.Drawing.Color.Transparent
        Me.currencydescrar1.BorderColor = System.Drawing.Color.Black
        Me.currencydescrar1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.currencydescrar1.CanGrow = False
        Me.currencydescrar1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.currency_descrar")})
        Me.currencydescrar1.Dpi = 254.0!
        Me.currencydescrar1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.currencydescrar1.ForeColor = System.Drawing.Color.Black
        Me.currencydescrar1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 116.84!)
        Me.currencydescrar1.Name = "currencydescrar1"
        Me.currencydescrar1.SizeF = New System.Drawing.SizeF(214.9!, 58.41998!)
        Me.currencydescrar1.StylePriority.UseBackColor = False
        Me.currencydescrar1.StylePriority.UseBorders = False
        Me.currencydescrar1.StylePriority.UseFont = False
        Me.currencydescrar1.StylePriority.UseTextAlignment = False
        Me.currencydescrar1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'printcount1
        '
        Me.printcount1.BackColor = System.Drawing.Color.Transparent
        Me.printcount1.BorderColor = System.Drawing.Color.Black
        Me.printcount1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.printcount1.CanGrow = False
        Me.printcount1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.print_count")})
        Me.printcount1.Dpi = 254.0!
        Me.printcount1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.printcount1.ForeColor = System.Drawing.Color.Black
        Me.printcount1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 0.0!)
        Me.printcount1.Name = "printcount1"
        Me.printcount1.SizeF = New System.Drawing.SizeF(71.58006!, 58.42003!)
        Me.printcount1.StylePriority.UseBackColor = False
        Me.printcount1.StylePriority.UseBorders = False
        Me.printcount1.StylePriority.UseFont = False
        Me.printcount1.StylePriority.UseTextAlignment = False
        Me.printcount1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'totalamount1
        '
        Me.totalamount1.BackColor = System.Drawing.Color.Transparent
        Me.totalamount1.BorderColor = System.Drawing.Color.Black
        Me.totalamount1.Borders = CType((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.totalamount1.CanGrow = False
        Me.totalamount1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.total_amount", "{0:n3}")})
        Me.totalamount1.Dpi = 254.0!
        Me.totalamount1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.totalamount1.ForeColor = System.Drawing.Color.Black
        Me.totalamount1.LocationFloat = New DevExpress.Utils.PointFloat(239.9003!, 116.84!)
        Me.totalamount1.Name = "totalamount1"
        Me.totalamount1.SizeF = New System.Drawing.SizeF(219.9!, 58.42001!)
        Me.totalamount1.StylePriority.UseBackColor = False
        Me.totalamount1.StylePriority.UseBorders = False
        Me.totalamount1.StylePriority.UseFont = False
        Me.totalamount1.StylePriority.UseTextAlignment = False
        Me.totalamount1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Expr11
        '
        Me.Expr11.BackColor = System.Drawing.Color.Transparent
        Me.Expr11.BorderColor = System.Drawing.Color.Black
        Me.Expr11.CanGrow = False
        Me.Expr11.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.reciept_date", "{0:yyyy-MM-dd}")})
        Me.Expr11.Dpi = 254.0!
        Me.Expr11.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Expr11.ForeColor = System.Drawing.Color.Black
        Me.Expr11.LocationFloat = New DevExpress.Utils.PointFloat(660.0002!, 0.0!)
        Me.Expr11.Name = "Expr11"
        Me.Expr11.SizeF = New System.Drawing.SizeF(800.3583!, 58.42001!)
        Me.Expr11.StylePriority.UseBackColor = False
        Me.Expr11.StylePriority.UseFont = False
        Me.Expr11.StylePriority.UseTextAlignment = False
        Me.Expr11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'ReportFooter
        '
        Me.ReportFooter.Controls.AddRange(New DevExpress.XtraReports.UI.XRControl() {Me.XrPageInfo2, Me.Text11, Me.Text13, Me.Text14, Me.Text15, Me.Text17, Me.primaryphone1, Me.phone21, Me.remarks1, Me.collectnamear1, Me.NumberToWords1, Me.Text16, Me.Text20})
        Me.ReportFooter.Dpi = 254.0!
        Me.ReportFooter.HeightF = 338.3001!
        Me.ReportFooter.Name = "ReportFooter"
        '
        'XrPageInfo2
        '
        Me.XrPageInfo2.Dpi = 254.0!
        Me.XrPageInfo2.Font = New DevExpress.Drawing.DXFont("Tahoma", 6.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.XrPageInfo2.Format = "{0:dd-MM-yyyy    hh:mm tt}"
        Me.XrPageInfo2.LocationFloat = New DevExpress.Utils.PointFloat(828.3!, 300.2001!)
        Me.XrPageInfo2.Name = "XrPageInfo2"
        Me.XrPageInfo2.Padding = New DevExpress.XtraPrinting.PaddingInfo(5, 5, 0, 0, 254.0!)
        Me.XrPageInfo2.PageInfo = DevExpress.XtraPrinting.PageInfo.DateTime
        Me.XrPageInfo2.SizeF = New System.Drawing.SizeF(408.6044!, 38.09998!)
        Me.XrPageInfo2.StylePriority.UseFont = False
        Me.XrPageInfo2.StylePriority.UseTextAlignment = False
        Me.XrPageInfo2.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Text11
        '
        Me.Text11.BackColor = System.Drawing.Color.Transparent
        Me.Text11.BorderColor = System.Drawing.Color.Black
        Me.Text11.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text11.CanGrow = False
        Me.Text11.Dpi = 254.0!
        Me.Text11.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text11.ForeColor = System.Drawing.Color.Black
        Me.Text11.LocationFloat = New DevExpress.Utils.PointFloat(1502.005!, 0.0!)
        Me.Text11.Name = "Text11"
        Me.Text11.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text11.SizeF = New System.Drawing.SizeF(140.479!, 62.50006!)
        Me.Text11.StylePriority.UseBackColor = False
        Me.Text11.StylePriority.UseBorders = False
        Me.Text11.StylePriority.UseFont = False
        Me.Text11.StylePriority.UsePadding = False
        Me.Text11.StylePriority.UseTextAlignment = False
        Me.Text11.Text = "المجموع"
        Me.Text11.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text13
        '
        Me.Text13.BackColor = System.Drawing.Color.Transparent
        Me.Text13.BorderColor = System.Drawing.Color.Black
        Me.Text13.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text13.CanGrow = False
        Me.Text13.Dpi = 254.0!
        Me.Text13.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text13.ForeColor = System.Drawing.Color.Black
        Me.Text13.LocationFloat = New DevExpress.Utils.PointFloat(1502.005!, 63.90009!)
        Me.Text13.Name = "Text13"
        Me.Text13.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text13.SizeF = New System.Drawing.SizeF(140.479!, 128.4!)
        Me.Text13.StylePriority.UseBackColor = False
        Me.Text13.StylePriority.UseBorders = False
        Me.Text13.StylePriority.UseFont = False
        Me.Text13.StylePriority.UsePadding = False
        Me.Text13.Text = "ملاحظات"
        Me.Text13.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'Text14
        '
        Me.Text14.BackColor = System.Drawing.Color.Transparent
        Me.Text14.BorderColor = System.Drawing.Color.Black
        Me.Text14.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Top Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text14.CanGrow = False
        Me.Text14.Dpi = 254.0!
        Me.Text14.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text14.ForeColor = System.Drawing.Color.Black
        Me.Text14.LocationFloat = New DevExpress.Utils.PointFloat(259.8003!, 63.90009!)
        Me.Text14.Name = "Text14"
        Me.Text14.SizeF = New System.Drawing.SizeF(203.2001!, 62.50006!)
        Me.Text14.StylePriority.UseBackColor = False
        Me.Text14.StylePriority.UseBorders = False
        Me.Text14.StylePriority.UseFont = False
        Me.Text14.StylePriority.UseTextAlignment = False
        Me.Text14.Text = "تليفون"
        Me.Text14.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'Text15
        '
        Me.Text15.BackColor = System.Drawing.Color.Transparent
        Me.Text15.BorderColor = System.Drawing.Color.Black
        Me.Text15.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.Text15.CanGrow = False
        Me.Text15.Dpi = 254.0!
        Me.Text15.Font = New DevExpress.Drawing.DXFont("Arial", 9.0!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text15.ForeColor = System.Drawing.Color.Black
        Me.Text15.LocationFloat = New DevExpress.Utils.PointFloat(478.3211!, 200.0001!)
        Me.Text15.Name = "Text15"
        Me.Text15.Padding = New DevExpress.XtraPrinting.PaddingInfo(0, 5, 0, 0, 254.0!)
        Me.Text15.SizeF = New System.Drawing.SizeF(1164.162!, 100.2!)
        Me.Text15.StylePriority.UseBackColor = False
        Me.Text15.StylePriority.UseBorders = False
        Me.Text15.StylePriority.UseFont = False
        Me.Text15.StylePriority.UsePadding = False
        Me.Text15.Text = "المصروفات الإدارية لمشروعك تستقطع من ريع الصدقة الجارية، ومازاد عن تبرعك يصرف في " & _
    "صيانة المشروع  لاحقا و مشاريع خيرية أخرى، وما نقص من تبرعك يسدد من تبرعات الأخري" & _
    "ن مالم تعط تعليمات بعكس ذلك"
        Me.Text15.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'Text17
        '
        Me.Text17.BackColor = System.Drawing.Color.Transparent
        Me.Text17.BorderColor = System.Drawing.Color.Black
        Me.Text17.CanGrow = False
        Me.Text17.Dpi = 254.0!
        Me.Text17.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.Text17.ForeColor = System.Drawing.Color.Black
        Me.Text17.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 200.0001!)
        Me.Text17.Name = "Text17"
        Me.Text17.SizeF = New System.Drawing.SizeF(436.0999!, 45.71999!)
        Me.Text17.StylePriority.UseBackColor = False
        Me.Text17.StylePriority.UseFont = False
        Me.Text17.Text = "عن جمعيه العون المباشر"
        Me.Text17.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        '
        'primaryphone1
        '
        Me.primaryphone1.BackColor = System.Drawing.Color.Transparent
        Me.primaryphone1.BorderColor = System.Drawing.Color.Black
        Me.primaryphone1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right), DevExpress.XtraPrinting.BorderSide)
        Me.primaryphone1.CanGrow = False
        Me.primaryphone1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.primary_phone")})
        Me.primaryphone1.Dpi = 254.0!
        Me.primaryphone1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.primaryphone1.ForeColor = System.Drawing.Color.Black
        Me.primaryphone1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 63.90009!)
        Me.primaryphone1.Name = "primaryphone1"
        Me.primaryphone1.SizeF = New System.Drawing.SizeF(234.8!, 62.50006!)
        Me.primaryphone1.StylePriority.UseBackColor = False
        Me.primaryphone1.StylePriority.UseBorders = False
        Me.primaryphone1.StylePriority.UseFont = False
        Me.primaryphone1.StylePriority.UseTextAlignment = False
        Me.primaryphone1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'phone21
        '
        Me.phone21.BackColor = System.Drawing.Color.Transparent
        Me.phone21.BorderColor = System.Drawing.Color.Black
        Me.phone21.Borders = CType((((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Right) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.phone21.CanGrow = False
        Me.phone21.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.phone_2")})
        Me.phone21.Dpi = 254.0!
        Me.phone21.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.phone21.ForeColor = System.Drawing.Color.Black
        Me.phone21.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 126.4001!)
        Me.phone21.Name = "phone21"
        Me.phone21.SizeF = New System.Drawing.SizeF(234.8!, 62.50006!)
        Me.phone21.StylePriority.UseBackColor = False
        Me.phone21.StylePriority.UseBorders = False
        Me.phone21.StylePriority.UseFont = False
        Me.phone21.StylePriority.UseTextAlignment = False
        Me.phone21.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleCenter
        '
        'remarks1
        '
        Me.remarks1.BackColor = System.Drawing.Color.Transparent
        Me.remarks1.BorderColor = System.Drawing.Color.Black
        Me.remarks1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.remarks1.CanGrow = False
        Me.remarks1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.remarks")})
        Me.remarks1.Dpi = 254.0!
        Me.remarks1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.remarks1.ForeColor = System.Drawing.Color.Black
        Me.remarks1.LocationFloat = New DevExpress.Utils.PointFloat(478.3211!, 63.90009!)
        Me.remarks1.Name = "remarks1"
        Me.remarks1.SizeF = New System.Drawing.SizeF(1023.684!, 128.4!)
        Me.remarks1.StylePriority.UseBackColor = False
        Me.remarks1.StylePriority.UseBorders = False
        Me.remarks1.StylePriority.UseFont = False
        Me.remarks1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopRight
        '
        'collectnamear1
        '
        Me.collectnamear1.BackColor = System.Drawing.Color.Transparent
        Me.collectnamear1.BorderColor = System.Drawing.Color.Black
        Me.collectnamear1.CanGrow = False
        Me.collectnamear1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.collect_namear")})
        Me.collectnamear1.Dpi = 254.0!
        Me.collectnamear1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Regular, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.collectnamear1.ForeColor = System.Drawing.Color.Black
        Me.collectnamear1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 254.4801!)
        Me.collectnamear1.Name = "collectnamear1"
        Me.collectnamear1.SizeF = New System.Drawing.SizeF(436.0999!, 45.71997!)
        Me.collectnamear1.StylePriority.UseBackColor = False
        Me.collectnamear1.StylePriority.UseFont = False
        Me.collectnamear1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.TopCenter
        '
        'NumberToWords1
        '
        Me.NumberToWords1.BackColor = System.Drawing.Color.Transparent
        Me.NumberToWords1.BorderColor = System.Drawing.Color.Black
        Me.NumberToWords1.Borders = CType(((DevExpress.XtraPrinting.BorderSide.Left Or DevExpress.XtraPrinting.BorderSide.Top) _
            Or DevExpress.XtraPrinting.BorderSide.Bottom), DevExpress.XtraPrinting.BorderSide)
        Me.NumberToWords1.CanGrow = False
        Me.NumberToWords1.DataBindings.AddRange(New DevExpress.XtraReports.UI.XRBinding() {New DevExpress.XtraReports.UI.XRBinding("Text", Nothing, "Collection_Receipt_View.num_to_word_ar")})
        Me.NumberToWords1.Dpi = 254.0!
        Me.NumberToWords1.Font = New DevExpress.Drawing.DXFont("Arial", 9.75!, DevExpress.Drawing.DXFontStyle.Bold, DevExpress.Drawing.DXGraphicsUnit.Point, New DevExpress.Drawing.DXFontAdditionalProperty() {New DevExpress.Drawing.DXFontAdditionalProperty("GdiCharSet", CType(0, Byte))})
        Me.NumberToWords1.ForeColor = System.Drawing.Color.Black
        Me.NumberToWords1.LocationFloat = New DevExpress.Utils.PointFloat(25.00025!, 0.0!)
        Me.NumberToWords1.Name = "NumberToWords1"
        Me.NumberToWords1.SizeF = New System.Drawing.SizeF(1477.005!, 62.50006!)
        Me.NumberToWords1.StylePriority.UseBackColor = False
        Me.NumberToWords1.StylePriority.UseBorders = False
        Me.NumberToWords1.StylePriority.UseFont = False
        Me.NumberToWords1.StylePriority.UseTextAlignment = False
        Me.NumberToWords1.Text = "NumberToWords1"
        Me.NumberToWords1.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text16
        '
        Me.Text16.BackColor = System.Drawing.Color.Transparent
        Me.Text16.BorderColor = System.Drawing.Color.Black
        Me.Text16.CanGrow = False
        Me.Text16.Dpi = 254.0!
        Me.Text16.Font = New DevExpress.Drawing.DXFont("Tahoma", 7.0!)
        Me.Text16.ForeColor = System.Drawing.Color.Black
        Me.Text16.LocationFloat = New DevExpress.Utils.PointFloat(1236.904!, 300.2001!)
        Me.Text16.Name = "Text16"
        Me.Text16.SizeF = New System.Drawing.SizeF(405.5792!, 38.09998!)
        Me.Text16.StylePriority.UseBackColor = False
        Me.Text16.StylePriority.UseTextAlignment = False
        Me.Text16.Text = ":: CRUX Information Technology ::"
        Me.Text16.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleRight
        '
        'Text20
        '
        Me.Text20.BackColor = System.Drawing.Color.Transparent
        Me.Text20.BorderColor = System.Drawing.Color.Black
        Me.Text20.CanGrow = False
        Me.Text20.Dpi = 254.0!
        Me.Text20.Font = New DevExpress.Drawing.DXFont("Tahoma", 7.0!)
        Me.Text20.ForeColor = System.Drawing.Color.Black
        Me.Text20.LocationFloat = New DevExpress.Utils.PointFloat(498.1!, 300.2001!)
        Me.Text20.Name = "Text20"
        Me.Text20.SizeF = New System.Drawing.SizeF(330.2001!, 38.10001!)
        Me.Text20.StylePriority.UseBackColor = False
        Me.Text20.StylePriority.UseTextAlignment = False
        Me.Text20.Text = ":: Direct Aid Foundation ::"
        Me.Text20.TextAlignment = DevExpress.XtraPrinting.TextAlignment.MiddleLeft
        '
        'PageFooter
        '
        Me.PageFooter.Dpi = 254.0!
        Me.PageFooter.HeightF = 0.0!
        Me.PageFooter.Name = "PageFooter"
        '
        'TopMarginBand1
        '
        Me.TopMarginBand1.Dpi = 254.0!
        Me.TopMarginBand1.HeightF = 0.0!
        Me.TopMarginBand1.Name = "TopMarginBand1"
        '
        'BottomMarginBand1
        '
        Me.BottomMarginBand1.Dpi = 254.0!
        Me.BottomMarginBand1.HeightF = 0.0!
        Me.BottomMarginBand1.Name = "BottomMarginBand1"
        '
        'Collection_Receipt_ViewTableAdapter
        '
        Me.Collection_Receipt_ViewTableAdapter.ClearBeforeFill = True
        '
        'DataSet_ReceiptVoucher1
        '
        Me.DataSet_ReceiptVoucher1.DataSetName = "DataSet_ReceiptVoucher"
        Me.DataSet_ReceiptVoucher1.EnforceConstraints = False
        Me.DataSet_ReceiptVoucher1.SchemaSerializationMode = System.Data.SchemaSerializationMode.IncludeSchema
        '
        'XtraReport_ReceiptVoucherV2
        '
        Me.Bands.AddRange(New DevExpress.XtraReports.UI.Band() {Me.Detail, Me.ReportHeader, Me.PageHeader, Me.ReportFooter, Me.PageFooter, Me.TopMarginBand1, Me.BottomMarginBand1})
        Me.Bookmark = " "
        Me.DataAdapter = Me.Collection_Receipt_ViewTableAdapter
        Me.DataMember = "Collection_Receipt_View"
        Me.DataSource = Me.DataSet_ReceiptVoucher1
        Me.DisplayName = " "
        Me.Dpi = 254.0!
        Me.Margins = New DevExpress.Drawing.DXMargins(100, 100, 0, 0)
        Me.PageHeight = 2970
        Me.PageWidth = 2100
        Me.PaperKind = DevExpress.Drawing.Printing.DXPaperKind.A4
        Me.ReportUnit = DevExpress.XtraReports.UI.ReportUnit.TenthsOfAMillimeter
        Me.SnapGridSize = 10.0!
        Me.Version = "13.1"
        CType(Me.DataSet_ReceiptVoucher1, System.ComponentModel.ISupportInitialize).EndInit()
        CType(Me, System.ComponentModel.ISupportInitialize).EndInit()

    End Sub
    Friend WithEvents Detail As DevExpress.XtraReports.UI.DetailBand
    Friend WithEvents natdescrar1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents donationdescrar1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents lineamount1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents ReportHeader As DevExpress.XtraReports.UI.ReportHeaderBand
    Friend WithEvents PageHeader As DevExpress.XtraReports.UI.PageHeaderBand
    Friend WithEvents Text1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text2 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text3 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text4 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text5 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text7 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text8 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text9 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text10 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents donornamear1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents donorid1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents branchdescar1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents recieptnum1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents currencydescrar1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents printcount1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents totalamount1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Expr11 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents ReportFooter As DevExpress.XtraReports.UI.ReportFooterBand
    Friend WithEvents Text11 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text13 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text14 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text15 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text17 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents primaryphone1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents phone21 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents remarks1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents collectnamear1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents NumberToWords1 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text16 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Text20 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents PageFooter As DevExpress.XtraReports.UI.PageFooterBand
    Friend WithEvents TopMarginBand1 As DevExpress.XtraReports.UI.TopMarginBand
    Friend WithEvents BottomMarginBand1 As DevExpress.XtraReports.UI.BottomMarginBand
    Friend WithEvents Text6 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents Collection_Receipt_ViewTableAdapter As Global.DirectAid.DataSet_ReceiptVoucherTableAdapters.Collection_Receipt_ViewTableAdapter
    Friend WithEvents DataSet_ReceiptVoucher1 As Global.DirectAid.DataSet_ReceiptVoucher
    Friend WithEvents XrPageInfo2 As DevExpress.XtraReports.UI.XRPageInfo
    Friend WithEvents XrLabel2 As DevExpress.XtraReports.UI.XRLabel
    Friend WithEvents XrLabel1 As DevExpress.XtraReports.UI.XRLabel
End Class
