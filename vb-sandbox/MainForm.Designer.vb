<Global.Microsoft.VisualBasic.CompilerServices.DesignerGenerated()> _
Partial Class MainForm
    Inherits System.Windows.Forms.Form

    'フォームがコンポーネントの一覧をクリーンアップするために dispose をオーバーライドします。
    <System.Diagnostics.DebuggerNonUserCode()> _
    Protected Overrides Sub Dispose(ByVal disposing As Boolean)
        Try
            If disposing AndAlso components IsNot Nothing Then
                components.Dispose()
            End If
        Finally
            MyBase.Dispose(disposing)
        End Try
    End Sub

    'Windows フォーム デザイナーで必要です。
    Private components As System.ComponentModel.IContainer

    'メモ: 以下のプロシージャは Windows フォーム デザイナーで必要です。
    'Windows フォーム デザイナーを使用して変更できます。  
    'コード エディターを使って変更しないでください。
    <System.Diagnostics.DebuggerStepThrough()>
    Private Sub InitializeComponent()
        Me.yellowPanel = New System.Windows.Forms.Panel()
        Me.redPanel = New System.Windows.Forms.Panel()
        Me.bluePanel = New System.Windows.Forms.Panel()
        Me.SuspendLayout()
        '
        'yellowPanel
        '
        Me.yellowPanel.BackColor = System.Drawing.Color.Yellow
        Me.yellowPanel.Location = New System.Drawing.Point(225, 79)
        Me.yellowPanel.Name = "yellowPanel"
        Me.yellowPanel.Size = New System.Drawing.Size(127, 116)
        Me.yellowPanel.TabIndex = 2
        '
        'redPanel
        '
        Me.redPanel.BackColor = System.Drawing.Color.Red
        Me.redPanel.Location = New System.Drawing.Point(38, 79)
        Me.redPanel.Name = "redPanel"
        Me.redPanel.Size = New System.Drawing.Size(127, 116)
        Me.redPanel.TabIndex = 3
        '
        'bluePanel
        '
        Me.bluePanel.BackColor = System.Drawing.Color.Blue
        Me.bluePanel.Location = New System.Drawing.Point(407, 79)
        Me.bluePanel.Name = "bluePanel"
        Me.bluePanel.Size = New System.Drawing.Size(127, 116)
        Me.bluePanel.TabIndex = 3
        '
        'MainForm
        '
        Me.AutoScaleDimensions = New System.Drawing.SizeF(6.0!, 12.0!)
        Me.AutoScaleMode = System.Windows.Forms.AutoScaleMode.Font
        Me.ClientSize = New System.Drawing.Size(585, 306)
        Me.Controls.Add(Me.bluePanel)
        Me.Controls.Add(Me.redPanel)
        Me.Controls.Add(Me.yellowPanel)
        Me.Name = "MainForm"
        Me.Text = "Form1"
        Me.ResumeLayout(False)

    End Sub

    Friend WithEvents yellowPanel As Panel
    Friend WithEvents redPanel As Panel
    Friend WithEvents bluePanel As Panel
End Class
