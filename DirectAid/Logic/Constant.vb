
Public Class Constant

    Public Const ALLOCATION_ORPHAN_ASSIGN As Byte = 1
    Public Const ALLOCATION_ORPHAN_UNASSIGN As Byte = 2
    Public Const ALLOCATION_ORPHAN_CANCEL As Byte = 3
    Public Const ALLOCATION_ORPHAN_REASSIGN As Byte = 4

    Public Const CULTURE_AR As String = "ar"
    Public Const CULTURE_EN As String = "en"

    Public Const CULTURE_AR_KW As String = "ar-kw"
    Public Const CULTURE_EN_US As String = "en-us"

    Public Const RECEIPTS_TO_PRINT As String = "~\PHYSICAL_SESSION\RECEIPTS_TO_PRINT\"
    Public Const BANK_DISK_FILES As String = "~\BankDiskFiles\"
    Public Const Orphans_Images As String = "~\OrphansImages\"
    Public Const REPORTS_FOLDER As String = "~\Reports\"
    Public Const ProjectPhaseDocument As String = "~\ProjectPhaseDocument\"
    Public Const ProjectPhasePhoto As String = "~\ProjectPhasePhoto\"
    Public Const ProjectTemplate As String = "~\ProjectTemplate\"
    'Ayman 08/06/2016----------------------------'
    Public Const PeriodicalReport As String = "~\PeriodicalReport\"
    Public Const PeriodicalReport_Orphans As String = "~\PeriodicalReport\Orphans\"
    Public Const PeriodicalReport_Da3ya As String = "~\PeriodicalReport\Da3ya\"
    Public Const PeriodicalReport_Students As String = "~\PeriodicalReport\Students\"
    'Ayman 08/06/2016----------------------------'
    Public Shared MainConnectionString As String = ConfigurationManager.ConnectionStrings("CharitySystemConnectionString").ConnectionString

    Public Const CHARITYSOFT As String = "charitysoft"

    Public Const RESTOREDCHARITYSOFTJUNE192014 As String = "RestoredCharitySoftJune192014"

    Public Const ALLOCATE_LETTER_ORPHAN As String = "allocate_letter"

    Public Const ALLOCATE_LETTER_DAAYA As String = "allocate_letter_daaya"

    Public Const OUTBOXNUMBER As String = "OutboxNumber"

    Public Const YEAR As String = "YEAR"

    Public Const FROMDATE As String = "@FROMDATE"
    Public Const TODATE As String = "@TODATE"

    Public Const DONOR_ID_DIRECT_AID As Int32 = 0

    Public Const DONOR_ID_BENEFACTOR_MALE As Int32 = 1

    Public Const DONOR_ID_BENEFACTOR_FEMALE As Int32 = 2

    Public Const ALLOCATION_OPERATION_ASSIGN As Byte = 1

    Public Const HOBBY_TYPE_CODE_HOBBHY As Byte = 1

    Public Const HOBBY_TYPE_CODE_ACTIVITY As Byte = 2

    Public Const MAIN_MENU_ITEM_NAME_MAINDATA As String = "MAINDATA"
    Public Const MAIN_MENU_ITEM_NAME_DONATIONS As String = "DONATIONS"
    Public Const MAIN_MENU_ITEM_NAME_ORPHANS As String = "ORPHANS"
    Public Const MAIN_MENU_ITEM_NAME_EDUCATION As String = "EDUCATION"
    Public Const MAIN_MENU_ITEM_NAME_HEALTH As String = "HEALTH"
    Public Const MAIN_MENU_ITEM_NAME_RELIEF As String = "RELIEF"
    Public Const MAIN_MENU_ITEM_NAME_DAAWA As String = "DAAWA"
    Public Const MAIN_MENU_ITEM_NAME_PROJECTS As String = "PROJECTS"
    Public Const MAIN_MENU_ITEM_NAME_PROJECTS_CONSTRUCTION As String = "PROJECTS_CONSTRUCTION"
    Public Const MAIN_MENU_ITEM_NAME_PROJECTS_DEVELOPMENT As String = "PROJECTS_DEVELOPMENT"
    Public Const MAIN_MENU_ITEM_NAME_SETTINGS As String = "SETTINGS"
    Public Const MAIN_MENU_ITEM_NAME_REPORTS As String = "REPORTS"
    Public Const MAIN_MENU_ITEM_NAME_DONOR_MERGE As String = "DONOR_MERGE"

    Public Const NEW_DONORS_PERIODICAL As String = "NEW_DONORS_PERIODICAL"

    Public Const dimension5_ORPHAN As Byte = 2
    Public Const dimension5_STUDENT As Byte = 1
    Public Const dimension5_DAAYA As Byte = 3

    Public Const SYSTEM_UNIT_ID_BENEFICIARY_REPORT As Byte = 1
    Public Const SYSTEM_UNIT_ID_DONOR_PROFILE_VIEW As Byte = 2
    Public Const SYSTEM_UNIT_ID_PROJECT_PLAN As Byte = 3

    Public Const ACTION_TRACK_ENTITY_ID_DONOR As String = "DONOR"
    Public Const ACTION_TRACK_ENTITY_ID_PROJECT_PLAN As String = "PROJECT_PLAN"

    Public Const ACTION_TRACK_ACTION_VIEW As String = "VIEW"
    Public Const ACTION_TRACK_ACTION_START As String = "START"
    Public Const ACTION_TRACK_ACTION_STOP As String = "STOP"

End Class