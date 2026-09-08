Imports CrystalDecisions.CrystalReports.Engine
Imports CrystalDecisions.Shared

Public Class frmReportViewer

    ' Variables to store values passed from Form1
    Public FromDate As Date
    Public ToDate As Date
    Public FromCustomerId As String
    Public ToCustomerId As String
    Public FromAccSet As String
    Public ToAccSet As String
    Public Property ShowDetails As Boolean

    Private Sub frmReportViewer_Load(sender As Object, e As EventArgs) Handles MyBase.Load
        Try
            ' 1. Create Report Document Instance
            Dim rptDoc As New ReportDocument()

            ' 2. Dynamically check and locate the Crystal Report file
            Dim reportFileName As String = "Revised Customer_Ledger_Template_v2.rpt"

            ' Path A: Right inside the startup folder (bin\Debug or bin\Release)
            Dim reportPath As String = IO.Path.Combine(Application.StartupPath, reportFileName)

            ' Path B: If running from VS Debug mode (stepping up 2 folders to root)
            If Not IO.File.Exists(reportPath) Then
                reportPath = IO.Path.Combine(Application.StartupPath, "..", "..", "Reports", reportFileName)
            End If

            ' Path C: In case of deeply nested folder structure (stepping up 3 folders)
            If Not IO.File.Exists(reportPath) Then
                reportPath = IO.Path.Combine(Application.StartupPath, "..", "..", "..", "Reports", reportFileName)
            End If

            ' If still not found anywhere, show a precise path error and exit gracefully
            If Not IO.File.Exists(reportPath) Then
                MessageBox.Show("Crystal Report file not found!" & vbCrLf &
                                "Please make sure '" & reportFileName & "' is inside the 'Reports' folder or bin\Debug folder.",
                                "Path Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
                Exit Sub
            End If

            ' 3. Load the Report Safely (Only Once)
            rptDoc.Load(reportPath)

            ' 4. Pass Database Credentials (SQL Server Logins)
            Dim connectionInfo As New ConnectionInfo()
            connectionInfo.ServerName = "localhost"
            connectionInfo.DatabaseName = "Demo_Database"
            connectionInfo.UserID = "sa"
            connectionInfo.Password = "1122"

            ' Apply connection to all tables in the report
            Dim tables As Tables = rptDoc.Database.Tables
            For Each table As Table In tables
                Dim tableLogOnInfo As TableLogOnInfo = table.LogOnInfo
                tableLogOnInfo.ConnectionInfo = connectionInfo
                table.ApplyLogOnInfo(tableLogOnInfo)
            Next

            ' 5. Pass Parameters EXACTLY matching Crystal Report Parameter Names
            rptDoc.SetParameterValue("FromDate", FromDate)
            rptDoc.SetParameterValue("ToDate", ToDate)
            rptDoc.SetParameterValue("FromCustomerId", If(String.IsNullOrEmpty(FromCustomerId), "", FromCustomerId))
            rptDoc.SetParameterValue("ToCustomerId", If(String.IsNullOrEmpty(ToCustomerId), "ZZZZZZZZZZ", ToCustomerId))
            rptDoc.SetParameterValue("FromAccSet", If(String.IsNullOrEmpty(FromAccSet), "", FromAccSet))
            rptDoc.SetParameterValue("ToAccSet", If(String.IsNullOrEmpty(ToAccSet), "ZZZZZZZZZZ", ToAccSet))
            rptDoc.SetParameterValue("ShowDetails", Me.ShowDetails)

            ' Hide side parameter panel to avoid user prompt interactions
            CrystalReportViewer1.ShowParameterPanelButton = False
            ' Force Crystal Report Viewer to reuse already provided parameter values
            CrystalReportViewer1.ReuseParameterValuesOnRefresh = True

            ' 6. Assign to ReportViewer control ONLY AFTER setting parameters and logon info
            CrystalReportViewer1.ReportSource = rptDoc
            CrystalReportViewer1.RefreshReport()

            ' 7. Open Form in Maximized Mode
            Me.WindowState = FormWindowState.Maximized

        Catch ex As Exception
            MessageBox.Show("Error loading report: " & ex.Message, "Error", MessageBoxButtons.OK, MessageBoxIcon.Error)
        End Try
    End Sub

    Private Sub CrystalReportViewer1_Load(sender As Object, e As EventArgs) Handles CrystalReportViewer1.Load

    End Sub
End Class