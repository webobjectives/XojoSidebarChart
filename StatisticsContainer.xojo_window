#tag DesktopWindow
Begin DesktopContainer StatisticsContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   35
   Index           =   -2147483648
   InitialParent   =   ""
   Left            =   0
   LockBottom      =   True
   LockLeft        =   True
   LockRight       =   True
   LockTop         =   True
   TabIndex        =   0
   TabPanelIndex   =   0
   TabStop         =   True
   Tooltip         =   ""
   Top             =   0
   Transparent     =   True
   Visible         =   True
   Width           =   414
   Begin DesktopLabel ValueLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      Height          =   16
      Index           =   -2147483648
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "value"
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   18
      Transparent     =   True
      Underline       =   False
      Visible         =   True
      Width           =   350
   End
   Begin DesktopRectangle LegendRectangle
      AllowAutoDeactivate=   True
      BorderColor     =   &c000000
      BorderThickness =   0.0
      CornerSize      =   0.0
      Enabled         =   True
      FillColor       =   &cFFFFFF
      Height          =   20
      Index           =   -2147483648
      Left            =   0
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      Tooltip         =   ""
      Top             =   10
      Transparent     =   True
      Visible         =   True
      Width           =   43
   End
   Begin DesktopLabel TitleLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   12.0
      FontUnit        =   0
      Height          =   22
      Index           =   -2147483648
      Italic          =   False
      Left            =   55
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "title"
      TextAlignment   =   1
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   0
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   350
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Method, Flags = &h0
		Sub setStatistics(dict as Dictionary)
		  // Prepare dictionary for drilldown data
		  datadict = dict
		  
		  var diff as Double 
		  var current as Double = dict.value("value").DoubleValue
		  var previous as Double = dict.value("previous").DoubleValue
		  var label as String = dict.value("label").StringValue
		  var bold as Boolean = dict.value("bold").BooleanValue
		  var displaycolor as Color = dict.value("color").ColorValue
		  var percentage as String = ""
		  
		  if dict.HasKey("drillDownSQL") then
		    var drillDownSQL as String = dict.value("drillDownSQL").StringValue
		  end
		  
		  if dict.hasKey("percentage") then
		    percentage = dict.value("percentage").StringValue
		  end
		  
		  TitleLabel.text = label
		  
		  if current = previous then
		    valueLabel.text = current.toString
		    valueLabel.TextColor = Color.Black
		    
		  else
		    
		    var negativeMeasure as boolean
		    If label.Contains("Never") or label.Contains("Cancel") or label.Contains("Zero") or label.Contains("Blocked") or label.BeginsWith("No Group")  or label.BeginsWith("No License") or label.BeginsWith("No License") or label.BeginsWith("All Other Users") Then
		      negativeMeasure = true
		    else
		      negativeMeasure = false
		    end
		    
		    
		    if current < previous then
		      // find out the difference  red if it is less unless the label contain "Never" "Cancel" or Zero" then switch the colours
		      If negativeMeasure = true Then
		        valueLabel.TextColor = &c008F0000 // green 
		      else
		        valueLabel.TextColor = &c94110000 // red
		      end
		      diff = previous - current
		      valueLabel.text = current.toString + " (-" + diff.tostring + ")"
		      
		    else
		      If negativeMeasure = true Then
		        valueLabel.TextColor = &c94110000 // red
		      else
		        valueLabel.TextColor = &c008F0000 // green
		      end
		      diff = current - previous
		      valueLabel.text = current.toString + " (+" + diff.tostring + ")"
		      
		    end
		  end
		  
		  if percentage <> "" and percentage <> "0%" then
		    valueLabel.text = valueLabel.text + " ~" + percentage
		  end
		  
		  if bold then
		    TitleLabel.Bold = true
		    ValueLabel.bold = true
		    
		    TitleLabel.FontSize = 12
		    ValueLabel.FontSize = 11
		  end
		  
		  if displaycolor <> Color.Black then
		    LegendRectangle.FillColor = displaycolor
		  else
		    LegendRectangle.Visible = false
		  end
		  
		  'end
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dataDict As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events LegendRectangle
	#tag Event
		Function MouseDown(x As Integer, y As Integer) As Boolean
		  if dataDict.hasKey("drillDownSql") then
		    var drillDownWindow as DrillDownWindow = new DrillDownWindow
		    drillDownWindow.dataDict = datadict
		    drillDownWindow.display
		  else 
		    MessageBox("No available data")
		  end
		End Function
	#tag EndEvent
#tag EndEvents
#tag ViewBehavior
	#tag ViewProperty
		Name="Name"
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
		Name="Index"
		Visible=true
		Group="ID"
		InitialValue="-2147483648"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Width"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Height"
		Visible=true
		Group="Size"
		InitialValue="300"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="InitialParent"
		Visible=false
		Group="Position"
		InitialValue=""
		Type="String"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Left"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Top"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockLeft"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockTop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockRight"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="LockBottom"
		Visible=true
		Group="Position"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabIndex"
		Visible=true
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabPanelIndex"
		Visible=false
		Group="Position"
		InitialValue="0"
		Type="Integer"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="TabStop"
		Visible=true
		Group="Position"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowAutoDeactivate"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Enabled"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Tooltip"
		Visible=true
		Group="Appearance"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocusRing"
		Visible=true
		Group="Appearance"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Visible"
		Visible=true
		Group="Appearance"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="BackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="&hFFFFFF"
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
		Name="HasBackgroundColor"
		Visible=true
		Group="Background"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowFocus"
		Visible=true
		Group="Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="AllowTabs"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Transparent"
		Visible=true
		Group="Behavior"
		InitialValue="True"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
	#tag ViewProperty
		Name="Composited"
		Visible=true
		Group="Window Behavior"
		InitialValue="False"
		Type="Boolean"
		EditorType=""
	#tag EndViewProperty
#tag EndViewBehavior
