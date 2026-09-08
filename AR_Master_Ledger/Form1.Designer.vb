<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()>
Partial Class Form1
    Inherits System.Windows.Forms.Form

    'Form overrides dispose to clean up the component list.
    <System.Diagnostics.DebuggerNonUserCode()>
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Required by the Windows Form Designer
    Private components As System.ComponentModel.IContainer

    'NOTE: The following procedure is required by the Windows Form Designer
    'It can be modified using the Windows Form Designer.  
    'Do not modify it using the code editor.
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Dim resources As System.ComponentModel.ComponentResourceManager = New System.ComponentModel.ComponentResourceManager(GetType(Form1))
        Me.btnShowReport = New System.Windows.Forms.Button()
        Me.chkDetailJournals = New System.Windows.Forms.CheckBox()
        Me.Label1 = New System.Windows.Forms.Label()
        Me.cmbToAccSetID = New System.Windows.Forms.ComboBox()
        Me.cmbFromAccSetID = New System.Windows.Forms.ComboBox()
        Me.dtpFromDate = New System.Windows.Forms.DateTimePicker()
        Me.ToAccSetIDLabel = New System.Windows.Forms.Label()
        Me.FromDateLabel = New System.Windows.Forms.Label()
        Me.FromAccSetIDLabel = New System.Windows.Forms.Label()
        Me.ToDateLabel = New System.Windows.Forms.Label()
        Me.cmbToCustomerID = New System.Windows.Forms.ComboBox()
        Me.dtpToDate = New System.Windows.Forms.DateTimePicker()
        Me.cmbFromCustomerID = New System.Windows.Forms.ComboBox()
        Me.FromCustomerIDLabel = New System.Windows.Forms.Label()
        Me.ToCustomerIDLabel = New System.Windows.Forms.Label()
        Me.MainPanel = New System.Windows.Forms.Panel()
        Me.btnRefresh = New System.Windows.Forms.Button()
        Me.MainPanel.SuspendLayout()
        Me.SuspendLayout()
        '
        'btnShowReport
        '
        Me.btnShowReport.Anchor = System.Windows.Forms.AnchorStyles.None
        Me.btnShowReport.Font = New System.Drawing.Font("Microsoft Sans Serif", 13.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnShowReport.Location = New System.Drawing.Point(354, 342)
        Me.btnShowReport.Name = "btnShowReport"
        Me.btnShowReport.Size = New System.Drawing.Size(203, 51)
        Me.btnShowReport.TabIndex = 31
        Me.btnShowReport.Text = "Show Report"
        Me.btnShowReport.UseVisualStyleBackColor = True
        '
        'chkDetailJournals
        '
        Me.chkDetailJournals.AutoSize = True
        Me.chkDetailJournals.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.chkDetailJournals.Location = New System.Drawing.Point(248, 309)
        Me.chkDetailJournals.Name = "chkDetailJournals"
        Me.chkDetailJournals.Size = New System.Drawing.Size(308, 33)
        Me.chkDetailJournals.TabIndex = 30
        Me.chkDetailJournals.Text = "Customer Detail Journals"
        Me.chkDetailJournals.UseVisualStyleBackColor = True
        '
        'Label1
        '
        Me.Label1.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.Label1.Font = New System.Drawing.Font("Microsoft Sans Serif", 14.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.Label1.Location = New System.Drawing.Point(304, 35)
        Me.Label1.Name = "Label1"
        Me.Label1.Size = New System.Drawing.Size(310, 43)
        Me.Label1.TabIndex = 16
        Me.Label1.Text = "AR Customer Ledger"
        '
        'cmbToAccSetID
        '
        Me.cmbToAccSetID.Font = New System.Drawing.Font("Microsoft Sans Serif", 13.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbToAccSetID.ForeColor = System.Drawing.SystemColors.InactiveCaptionText
        Me.cmbToAccSetID.FormattingEnabled = True
        Me.cmbToAccSetID.Location = New System.Drawing.Point(665, 233)
        Me.cmbToAccSetID.Name = "cmbToAccSetID"
        Me.cmbToAccSetID.Size = New System.Drawing.Size(279, 39)
        Me.cmbToAccSetID.TabIndex = 29
        '
        'cmbFromAccSetID
        '
        Me.cmbFromAccSetID.Font = New System.Drawing.Font("Microsoft Sans Serif", 13.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbFromAccSetID.ForeColor = System.Drawing.SystemColors.InactiveCaptionText
        Me.cmbFromAccSetID.FormattingEnabled = True
        Me.cmbFromAccSetID.Location = New System.Drawing.Point(228, 234)
        Me.cmbFromAccSetID.Name = "cmbFromAccSetID"
        Me.cmbFromAccSetID.Size = New System.Drawing.Size(200, 39)
        Me.cmbFromAccSetID.TabIndex = 28
        '
        'dtpFromDate
        '
        Me.dtpFromDate.CalendarForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.dtpFromDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpFromDate.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtpFromDate.Location = New System.Drawing.Point(228, 144)
        Me.dtpFromDate.Name = "dtpFromDate"
        Me.dtpFromDate.Size = New System.Drawing.Size(200, 35)
        Me.dtpFromDate.TabIndex = 18
        '
        'ToAccSetIDLabel
        '
        Me.ToAccSetIDLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.ToAccSetIDLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ToAccSetIDLabel.Location = New System.Drawing.Point(472, 234)
        Me.ToAccSetIDLabel.Name = "ToAccSetIDLabel"
        Me.ToAccSetIDLabel.Size = New System.Drawing.Size(185, 38)
        Me.ToAccSetIDLabel.TabIndex = 27
        Me.ToAccSetIDLabel.Text = "To A/C Set ID"
        '
        'FromDateLabel
        '
        Me.FromDateLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.FromDateLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FromDateLabel.Location = New System.Drawing.Point(7, 144)
        Me.FromDateLabel.Name = "FromDateLabel"
        Me.FromDateLabel.Size = New System.Drawing.Size(215, 38)
        Me.FromDateLabel.TabIndex = 19
        Me.FromDateLabel.Text = "From Date"
        '
        'FromAccSetIDLabel
        '
        Me.FromAccSetIDLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.FromAccSetIDLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FromAccSetIDLabel.Location = New System.Drawing.Point(7, 234)
        Me.FromAccSetIDLabel.Name = "FromAccSetIDLabel"
        Me.FromAccSetIDLabel.Size = New System.Drawing.Size(215, 38)
        Me.FromAccSetIDLabel.TabIndex = 26
        Me.FromAccSetIDLabel.Text = "From A/C Set ID"
        '
        'ToDateLabel
        '
        Me.ToDateLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.ToDateLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ToDateLabel.Location = New System.Drawing.Point(472, 144)
        Me.ToDateLabel.Name = "ToDateLabel"
        Me.ToDateLabel.Size = New System.Drawing.Size(185, 38)
        Me.ToDateLabel.TabIndex = 20
        Me.ToDateLabel.Text = "To Date"
        '
        'cmbToCustomerID
        '
        Me.cmbToCustomerID.DropDownHeight = 120
        Me.cmbToCustomerID.Font = New System.Drawing.Font("Microsoft Sans Serif", 13.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbToCustomerID.ForeColor = System.Drawing.SystemColors.InactiveCaptionText
        Me.cmbToCustomerID.FormattingEnabled = True
        Me.cmbToCustomerID.IntegralHeight = False
        Me.cmbToCustomerID.Location = New System.Drawing.Point(665, 188)
        Me.cmbToCustomerID.MaxDropDownItems = 3
        Me.cmbToCustomerID.Name = "cmbToCustomerID"
        Me.cmbToCustomerID.Size = New System.Drawing.Size(279, 39)
        Me.cmbToCustomerID.TabIndex = 25
        '
        'dtpToDate
        '
        Me.dtpToDate.CalendarForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.dtpToDate.CalendarTitleBackColor = System.Drawing.SystemColors.ControlText
        Me.dtpToDate.CalendarTitleForeColor = System.Drawing.SystemColors.MenuHighlight
        Me.dtpToDate.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.dtpToDate.Format = System.Windows.Forms.DateTimePickerFormat.[Short]
        Me.dtpToDate.Location = New System.Drawing.Point(665, 144)
        Me.dtpToDate.Name = "dtpToDate"
        Me.dtpToDate.Size = New System.Drawing.Size(279, 35)
        Me.dtpToDate.TabIndex = 21
        '
        'cmbFromCustomerID
        '
        Me.cmbFromCustomerID.DropDownHeight = 120
        Me.cmbFromCustomerID.Font = New System.Drawing.Font("Microsoft Sans Serif", 13.5!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.cmbFromCustomerID.ForeColor = System.Drawing.SystemColors.InactiveCaptionText
        Me.cmbFromCustomerID.FormattingEnabled = True
        Me.cmbFromCustomerID.IntegralHeight = False
        Me.cmbFromCustomerID.Location = New System.Drawing.Point(228, 188)
        Me.cmbFromCustomerID.MaxDropDownItems = 3
        Me.cmbFromCustomerID.Name = "cmbFromCustomerID"
        Me.cmbFromCustomerID.Size = New System.Drawing.Size(200, 39)
        Me.cmbFromCustomerID.TabIndex = 24
        '
        'FromCustomerIDLabel
        '
        Me.FromCustomerIDLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.FromCustomerIDLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.FromCustomerIDLabel.Location = New System.Drawing.Point(7, 188)
        Me.FromCustomerIDLabel.Name = "FromCustomerIDLabel"
        Me.FromCustomerIDLabel.Size = New System.Drawing.Size(215, 38)
        Me.FromCustomerIDLabel.TabIndex = 22
        Me.FromCustomerIDLabel.Text = "From Customer ID"
        '
        'ToCustomerIDLabel
        '
        Me.ToCustomerIDLabel.BackColor = System.Drawing.SystemColors.Menu
        Me.ToCustomerIDLabel.Font = New System.Drawing.Font("Microsoft Sans Serif", 12.0!, System.Drawing.FontStyle.Regular, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.ToCustomerIDLabel.Location = New System.Drawing.Point(472, 188)
        Me.ToCustomerIDLabel.Name = "ToCustomerIDLabel"
        Me.ToCustomerIDLabel.Size = New System.Drawing.Size(185, 38)
        Me.ToCustomerIDLabel.TabIndex = 23
        Me.ToCustomerIDLabel.Text = "To Customer ID"
        '
        'MainPanel
        '
        Me.MainPanel.BorderStyle = System.Windows.Forms.BorderStyle.FixedSingle
        Me.MainPanel.Controls.Add(Me.Label1)
        Me.MainPanel.Controls.Add(Me.btnShowReport)
        Me.MainPanel.Controls.Add(Me.ToCustomerIDLabel)
        Me.MainPanel.Controls.Add(Me.chkDetailJournals)
        Me.MainPanel.Controls.Add(Me.FromCustomerIDLabel)
        Me.MainPanel.Controls.Add(Me.cmbFromCustomerID)
        Me.MainPanel.Controls.Add(Me.cmbToAccSetID)
        Me.MainPanel.Controls.Add(Me.dtpToDate)
        Me.MainPanel.Controls.Add(Me.btnRefresh)
        Me.MainPanel.Controls.Add(Me.cmbToCustomerID)
        Me.MainPanel.Controls.Add(Me.cmbFromAccSetID)
        Me.MainPanel.Controls.Add(Me.ToDateLabel)
        Me.MainPanel.Controls.Add(Me.dtpFromDate)
        Me.MainPanel.Controls.Add(Me.FromAccSetIDLabel)
        Me.MainPanel.Controls.Add(Me.ToAccSetIDLabel)
        Me.MainPanel.Controls.Add(Me.FromDateLabel)
        Me.MainPanel.ForeColor = System.Drawing.SystemColors.ActiveCaptionText
        Me.MainPanel.Location = New System.Drawing.Point(80, 13)
        Me.MainPanel.Margin = New System.Windows.Forms.Padding(30)
        Me.MainPanel.Name = "MainPanel"
        Me.MainPanel.Padding = New System.Windows.Forms.Padding(20)
        Me.MainPanel.Size = New System.Drawing.Size(968, 427)
        Me.MainPanel.TabIndex = 32
        '
        'btnRefresh
        '
        Me.btnRefresh.FlatAppearance.BorderColor = System.Drawing.SystemColors.ButtonShadow
        Me.btnRefresh.FlatAppearance.MouseOverBackColor = System.Drawing.Color.White
        Me.btnRefresh.FlatStyle = System.Windows.Forms.FlatStyle.Flat
        Me.btnRefresh.Font = New System.Drawing.Font("Microsoft Sans Serif", 8.0!, System.Drawing.FontStyle.Bold, System.Drawing.GraphicsUnit.Point, CType(0, Byte))
        Me.btnRefresh.ForeColor = System.Drawing.SystemColors.ActiveBorder
        Me.btnRefresh.Image = CType(resources.GetObject("btnRefresh.Image"), System.Drawing.Image)
        Me.btnRefresh.Location = New System.Drawing.Point(869, 35)
        Me.btnRefresh.Margin = New System.Windows.Forms.Padding(0)
        Me.btnRefresh.Name = "btnRefresh"
        Me.btnRefresh.Padding = New System.Windows.Forms.Padding(5)
        Me.btnRefresh.Size = New System.Drawing.Size(65, 65)
        Me.btnRefresh.TabIndex = 17
        Me.btnRefresh.UseVisualStyleBackColor = True
        '
        'Form1
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(9.0!, 20.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(1118, 505)
        Me.Controls.Add(Me.MainPanel)
        Me.FormBorderStyle = System.Windows.Forms.FormBorderStyle.FixedDialog
        Me.MaximizeBox = False
        Me.Name = "Form1"
        Me.Padding = New System.Windows.Forms.Padding(50)
        Me.StartPosition = System.Windows.Forms.FormStartPosition.CenterScreen
        Me.Text = "AR Master Ledger"
        Me.MainPanel.ResumeLayout(False)
        Me.MainPanel.PerformLayout()
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents btnShowReport As Button
    Friend WithEvents chkDetailJournals As CheckBox
    Friend WithEvents Label1 As Label
    Friend WithEvents cmbToAccSetID As ComboBox
    Friend WithEvents cmbFromAccSetID As ComboBox
    Friend WithEvents dtpFromDate As DateTimePicker
    Friend WithEvents ToAccSetIDLabel As Label
    Friend WithEvents FromDateLabel As Label
    Friend WithEvents FromAccSetIDLabel As Label
    Friend WithEvents ToDateLabel As Label
    Friend WithEvents cmbToCustomerID As ComboBox
    Friend WithEvents dtpToDate As DateTimePicker
    Friend WithEvents cmbFromCustomerID As ComboBox
    Friend WithEvents FromCustomerIDLabel As Label
    Friend WithEvents ToCustomerIDLabel As Label
    Friend WithEvents MainPanel As Panel
    Friend WithEvents btnRefresh As Button
End Class
