#tag DesktopWindow
Begin DesktopWindow ChartWindow
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composite       =   False
   DefaultLocation =   2
   FullScreen      =   False
   HasBackgroundColor=   False
   HasCloseButton  =   True
   HasFullScreenButton=   False
   HasMaximizeButton=   True
   HasMinimizeButton=   True
   HasTitleBar     =   True
   Height          =   800
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   93390847
   MenuBarVisible  =   False
   MinimumHeight   =   650
   MinimumWidth    =   800
   Resizeable      =   True
   Title           =   "Sidebar Chart"
   Type            =   0
   Visible         =   True
   Width           =   1100
   Begin DesktopButton SaveReportButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Save report"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   986
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   94
   End
   Begin DesktopTabPanel ChartSelector
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   719
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Panels          =   ""
      Scope           =   0
      SmallTabs       =   False
      TabDefinition   =   "User Types\rSubscription Types"
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   62
      Transparent     =   False
      Underline       =   False
      Value           =   1
      Visible         =   True
      Width           =   1060
      Begin DesktopRectangle UserChartBackgroundRectangle
         AllowAutoDeactivate=   True
         BorderColor     =   &c000000
         BorderThickness =   0.0
         CornerSize      =   20.0
         Enabled         =   True
         FillColor       =   &cFFFFFF
         Height          =   661
         Index           =   -2147483648
         InitialParent   =   "ChartSelector"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   2
         TabPanelIndex   =   1
         Tooltip         =   ""
         Top             =   100
         Transparent     =   False
         Visible         =   True
         Width           =   1020
         Begin ChartContainer UserChartContainer
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   False
            AllowTabs       =   True
            Backdrop        =   0
            BackgroundColor =   &cFFFFFF
            categoryheading =   ""
            Composited      =   False
            Enabled         =   True
            HasBackgroundColor=   False
            Height          =   621
            Index           =   -2147483648
            InitialParent   =   "UserChartBackgroundRectangle"
            Left            =   60
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   0
            TabPanelIndex   =   1
            TabStop         =   True
            Tooltip         =   ""
            Top             =   120
            Transparent     =   True
            Visible         =   True
            Width           =   980
         End
      End
      Begin DesktopRectangle SubscriptionChartBackgroundRectangle
         AllowAutoDeactivate=   True
         BorderColor     =   &c000000
         BorderThickness =   0.0
         CornerSize      =   20.0
         Enabled         =   True
         FillColor       =   &cFFFFFF
         Height          =   661
         Index           =   -2147483648
         InitialParent   =   "ChartSelector"
         Left            =   40
         LockBottom      =   True
         LockedInPosition=   False
         LockLeft        =   True
         LockRight       =   True
         LockTop         =   True
         Scope           =   0
         TabIndex        =   0
         TabPanelIndex   =   2
         Tooltip         =   ""
         Top             =   100
         Transparent     =   False
         Visible         =   True
         Width           =   1020
         Begin ChartContainer SubscriptionChartContainer
            AllowAutoDeactivate=   True
            AllowFocus      =   False
            AllowFocusRing  =   False
            AllowTabs       =   True
            Backdrop        =   0
            BackgroundColor =   &cFFFFFF
            categoryheading =   ""
            Composited      =   False
            Enabled         =   True
            HasBackgroundColor=   False
            Height          =   621
            Index           =   -2147483648
            InitialParent   =   "SubscriptionChartBackgroundRectangle"
            Left            =   60
            LockBottom      =   True
            LockedInPosition=   False
            LockLeft        =   True
            LockRight       =   True
            LockTop         =   True
            Scope           =   0
            TabIndex        =   2
            TabPanelIndex   =   2
            TabStop         =   True
            Tooltip         =   ""
            Top             =   120
            Transparent     =   True
            Visible         =   True
            Width           =   980
         End
      End
   End
   Begin DesktopPopupMenu PopupMenu1
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   150
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      SelectedRowIndex=   1
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   149
   End
   Begin DesktopLabel DatabaseTablesLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Select report date"
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   118
   End
   Begin DesktopButton PreviousDateButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "<"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   311
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   39
   End
   Begin DesktopButton NextDateButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   ">"
      Default         =   False
      Enabled         =   False
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   355
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   7
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   39
   End
   Begin DesktopButton AnimationButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Animate First to Last"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   471
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   8
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   20
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   158
   End
   Begin Timer Timer1
      Enabled         =   True
      Index           =   -2147483648
      LockedInPosition=   False
      Period          =   1000
      RunMode         =   0
      Scope           =   0
      TabPanelIndex   =   0
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow(index as Integer) As Boolean Handles FileCloseWindow.Action
		  me.close
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function OpenMenuItem() As Boolean Handles OpenMenuItem.Action
		  var v as new ChartWindow
		  v.show
		  
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function PrintMenuItem() As Boolean Handles PrintMenuItem.Action
		  savePDF
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler

	#tag MenuHandler
		Function SaveMenuItem() As Boolean Handles SaveMenuItem.Action
		  savePDF
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub savePDF()
		  try
		    
		    Var name As String = "Sidebar Chart Example Report " + PopupMenu1.SelectedRowText 
		    Var pdfFileName As String = name + ".pdf"
		    
		    // resize the window to fit the container printed 
		    self.width = 1000 // good for printing on A4
		    self.height = 700 // good for printing on A4
		    
		    // we need to cycle through the panels and end up on the current one
		    System.DebugLog("SelectedPanelIndex " + ChartSelector.SelectedPanelIndex.toString)
		    
		    Var f As FolderItem = FolderItem.ShowSaveFileDialog("", pdfFileName)
		    
		    If f <> Nil Then
		      
		      var startingPanelIndex as Integer = ChartSelector.SelectedPanelIndex
		      
		      Var d As New PDFDocument(self.width, self.height)
		      // (PDFDocument.PageSizes.Legal) none of the defaults are right, so use exact dimensions 
		      'd.Landscape = true // dont need to landscape if we are using exact dimensions
		      
		      var date as DateTime = DateTime.now
		      Var now As String = date.ToString(Locale.Current, DateTime.FormatStyles.Long, DateTime.FormatStyles.Short)
		      
		      var g As Graphics = d.Graphics
		      
		      // draw coversheet
		      g.FontSize = 30
		      g.Bold = true
		      g.DrawText(name, 100,200)
		      g.Bold = false
		      g.DrawText("Prepared on " + now, 100,300)
		      
		      for i as Integer = 0 to ChartSelector.PanelCount -1
		        
		        g.NextPage
		        
		        ChartSelector.SelectedPanelIndex = i
		        
		        // Bar charts used to have a problem with drawinto on Windows, hence the exception handling
		        // https://tracker.xojo.com/xojoinc/xojo/-/issues/75382
		        try
		          ChartSelector.DrawInto(g, 20, 40) // the top value cannot be less than 0 - blank page
		          
		        catch error as UnsupportedOperationException
		          // if there is an exception then we can't add this chart to the PDF yet, check this
		          
		          System.DebugLog(error.Message)
		          var p as new Picture( me.width, me.height, 16)
		          var gheight as Integer = g.width/p.width*p.height
		          
		          me.DrawInto(p.Graphics, 0, 0)
		          
		          g.DrawPicture(p, 20, 40, g.width, gheight, 20, 50, p.width, p.height)
		          
		          
		        end
		      next
		      
		      ChartSelector.PanelIndex = startingPanelIndex
		      
		      d.Save(f)
		      f.open
		      
		    End If
		    
		    
		  catch error as NilObjectException
		    MessageBox("Sorry couldn't save the PDF")
		  catch error as RuntimeException
		    MessageBox("Sorry couldn't save the PDF:" + error.Message)
		  end
		  
		  
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub showNextPanel()
		  // change the popup and enable/disable this button
		  if PopupMenu1.SelectedRowIndex <> PopupMenu1.RowCount -1 then
		    PopupMenu1.SelectedRowIndex = PopupMenu1.SelectedRowIndex + 1
		    PreviousDateButton.enabled = true 
		  end
		  
		  if PopupMenu1.SelectedRowIndex = PopupMenu1.RowCount -1 then
		    NextDateButton.enabled = false
		  end 
		  
		End Sub
	#tag EndMethod


#tag EndWindowCode

#tag Events SaveReportButton
	#tag Event
		Sub Pressed()
		  if AnimationButton.caption = "Stop Animation" then
		    timer1.enabled = false
		    AnimationButton.caption = "Animate First to Last"
		  end
		  
		  SavePDF
		  
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ChartSelector
	#tag Event
		Sub PanelChanged()
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PopupMenu1
	#tag Event
		Sub Opening()
		  'System.DebugLog("Popup1 Opening Finished")
		  
		  me.addAllRows(app.dates)
		  me.SelectedRowIndex = app.dates.count-1
		  
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged(item As DesktopMenuItem)
		  
		  if app.selectedDate <> me.SelectedRowText then
		    // redraw cart if it another date is selected
		    
		    app.selectedDate = me.SelectedRowText
		    app.selectedDateIndex = me.SelectedRowIndex
		    
		    
		    if me.SelectedRowIndex = 0 then
		      PreviousDateButton.Enabled = false
		      NextDateButton.Enabled = true
		    elseif me.SelectedRowIndex = me.RowCount -1 then
		      PreviousDateButton.Enabled = true
		      NextDateButton.Enabled = false
		    else
		      PreviousDateButton.Enabled = true
		      NextDateButton.Enabled = true
		    end
		    
		    for each container as ChartContainer in app.chartContainers
		      if container.window = me.window then
		        container.loadData
		      end
		    next
		    
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events PreviousDateButton
	#tag Event
		Sub Pressed()
		  // change the popup and enable/disable this button
		  if PopupMenu1.SelectedRowIndex <> 0 then
		    PopupMenu1.SelectedRowIndex = PopupMenu1.SelectedRowIndex - 1
		    NextDateButton.enabled = true 
		  end
		  
		  if PopupMenu1.SelectedRowIndex = 0  then
		    me.enabled = false
		  end 
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events NextDateButton
	#tag Event
		Sub Pressed()
		  self.showNextPanel
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events AnimationButton
	#tag Event
		Sub Pressed()
		  if me.caption = "Animate First to Last" then
		    me.caption = "Stop animation"
		    popupMenu1.selectedRowIndex = 0 
		    timer1.enabled = true
		    timer1.runMode = Timer.RunModes.Multiple
		  else
		    timer1.enabled = false
		    popupMenu1.selectedRowIndex = popupMenu1.LastRowIndex
		    me.caption = "Animate First to Last"
		  end
		  
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events Timer1
	#tag Event
		Sub Action()
		  // Turn off the timer when the animation reaches the last date
		  if PopupMenu1.SelectedRowIndex = PopupMenu1.RowCount -1 then
		    timer1.RunMode = Timer.RunModes.off
		    AnimationButton.caption = "Animate First to Last"
		  else
		    showNextPanel
		  end
		End Sub
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="HasTitleBar"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Name"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Interfaces"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Super"
		Visible=true
		Group="ID"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="600"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="400"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumWidth"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MinimumHeight"
		Visible=true
		Group="Size"
		InitialValue="64"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumWidth"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MaximumHeight"
		Visible=true
		Group="Size"
		InitialValue="32000"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Type"
		Visible=true
		Group="Frame"
		InitialValue="0"
		Type="Types"
		EditorType="Enum"
		#tag EnumValues
			"0 - Document"
			"1 - Movable Modal"
			"2 - Modal Dialog"
			"3 - Floating Window"
			"4 - Plain Box"
			"5 - Shadowed Box"
			"6 - Rounded Window"
			"7 - Global Floating Window"
			"8 - Sheet Window"
			"9 - Modeless Dialog"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Title"
		Visible=true
		Group="Frame"
		InitialValue="Untitled"
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasCloseButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMaximizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasMinimizeButton"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasFullScreenButton"
		Visible=true
		Group="Frame"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Resizeable"
		Visible=true
		Group="Frame"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composite"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MacProcID"
		Visible=false
		Group="OS X (Carbon)"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="FullScreen"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="DefaultLocation"
		Visible=true
		Group="Behavior"
		InitialValue="2"
		Type="Locations"
		EditorType="Enum"
		#tag EnumValues
			"0 - Default"
			"1 - Parent Window"
			"2 - Main Screen"
			"3 - Parent Window Screen"
			"4 - Stagger"
		#tag EndEnumValues
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="ImplicitInstance"
		Visible=true
		Group="Window Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&cFFFFFF"
		Type="ColorGroup"
		EditorType="ColorGroup"
	#tag EndViewProperty
	#tag ViewProperty
		Name="Backdrop"
		Visible=true
		Group="Background"
		InitialValue=""
		Type="Picture"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBar"
		Visible=true
		Group="Menus"
		InitialValue=""
		Type="DesktopMenuBar"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="MenuBarVisible"
		Visible=true
		Group="Deprecated"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
