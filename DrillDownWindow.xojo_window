#tag DesktopWindow
Begin DesktopWindow DrillDownWindow
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
   Height          =   504
   ImplicitInstance=   True
   MacProcID       =   0
   MaximumHeight   =   32000
   MaximumWidth    =   32000
   MenuBar         =   93390847
   MenuBarVisible  =   False
   MinimumHeight   =   200
   MinimumWidth    =   200
   Resizeable      =   True
   Title           =   "Users"
   Type            =   0
   Visible         =   True
   Width           =   1350
   Begin DesktopTextField FilterField
      AllowAutoDeactivate=   True
      AllowFocusRing  =   True
      AllowSpellChecking=   False
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Format          =   ""
      HasBorder       =   True
      Height          =   22
      Hint            =   "Filter results"
      Index           =   -2147483648
      Italic          =   False
      Left            =   10
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MaximumCharactersAllowed=   0
      Password        =   False
      ReadOnly        =   False
      Scope           =   0
      TabIndex        =   1
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   0
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      ValidationMask  =   ""
      Visible         =   True
      Width           =   244
   End
   Begin DesktopButton FilterButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Filter"
      Default         =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   266
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   2
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   76
   End
   Begin DesktopLabel DisplayCountLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   562
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   3
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   13
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   225
   End
   Begin DesktopLabel SelectedCountLabel
      AllowAutoDeactivate=   True
      Bold            =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   799
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   False
      Scope           =   0
      Selectable      =   False
      TabIndex        =   4
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   ""
      TextAlignment   =   3
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   310
   End
   Begin DesktopListBox DataList
      AllowAutoDeactivate=   True
      AllowAutoHideScrollbars=   False
      AllowExpandableRows=   False
      AllowFocusRing  =   False
      AllowResizableColumns=   True
      AllowRowDragging=   False
      AllowRowReordering=   False
      Bold            =   False
      ColumnCount     =   1
      ColumnWidths    =   ""
      DefaultRowHeight=   -1
      DropIndicatorVisible=   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      GridLineStyle   =   0
      HasBorder       =   True
      HasHeader       =   True
      HasHorizontalScrollbar=   True
      HasVerticalScrollbar=   True
      HeadingIndex    =   -1
      Height          =   441
      Index           =   -2147483648
      InitialValue    =   ""
      Italic          =   False
      Left            =   10
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      RequiresSelection=   False
      RowSelectionType=   1
      Scope           =   0
      TabIndex        =   0
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   43
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   1320
      _ScrollOffset   =   0
      _ScrollWidth    =   -1
   End
   Begin DesktopButton ReloadButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Reload"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      Italic          =   False
      Left            =   354
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   False
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   5
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   86
   End
   Begin DesktopButton ResizeButton
      AllowAutoDeactivate=   True
      Bold            =   False
      Cancel          =   False
      Caption         =   "Compact"
      Default         =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   0.0
      FontUnit        =   0
      Height          =   20
      Index           =   -2147483648
      InitialParent   =   ""
      Italic          =   False
      Left            =   1244
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   False
      LockRight       =   True
      LockTop         =   True
      MacButtonStyle  =   0
      Scope           =   0
      TabIndex        =   6
      TabPanelIndex   =   0
      TabStop         =   True
      Tooltip         =   ""
      Top             =   11
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   86
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  SelectedCountLabel.text = "0 Selected"
		  
		End Sub
	#tag EndEvent


	#tag MenuHandler
		Function FileCloseWindow(index as Integer) As Boolean Handles FileCloseWindow.Action
		  me.close
		  
		  Return True
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Sub display()
		  var label as String = dataDict.value("label")
		  self.Title = label + " as at " + app.selectedDate
		  
		  try
		    var sql as String = dataDict.value("drillDownSQL")
		    var rs as Rowset = app.database.SelectSQL(sql)
		    
		    var searching as Boolean = false
		    var searchString as String = FilterField.text
		    
		    if searchString <> "" then
		      searching = true
		    end
		    
		    If rs Is Nil Then Return
		    
		    //Clear the listbox
		    dataList.RemoveAllRows
		    
		    // Add the DB columns as the heades for the ListBox
		    dataList.ColumnCount = rs.ColumnCount // this sets up the columns correctly
		    
		    if rs.ColumnCount > 8 then
		      DataList.HasHorizontalScrollbar = true
		    end
		    
		    dataList.AllowAutoHideScrollbars = true
		    var columnwidths as String
		    
		    For i As Integer = 0 To rs.LastColumnIndex 
		      var name as string = rs.ColumnAt(i).Name
		      dataList.HeaderAt(i) = name
		      if name = "FirstName" then
		        columnwidths = columnwidths + "95,"
		      elseif name = "LastName" then
		        columnwidths = columnwidths + "95,"
		      elseif name = "Username" then
		        columnwidths = columnwidths + "115,"
		      elseif name = "Email" then
		        columnwidths = columnwidths + "250,"
		      elseif name = "SubscriptionTitle" then
		        columnwidths = columnwidths + "260,"
		      elseif name = "Created" then
		        columnwidths = columnwidths + "100,"
		      elseif name = "LastLogin" then
		        columnwidths = columnwidths + "100,"
		      elseif name = "LastAccess" then
		        columnwidths = columnwidths + "100,"
		      elseif name  = "uid" then
		        columnwidths = columnwidths + "38,"
		      elseif name  = "id" then
		        columnwidths = columnwidths + "38,"
		      else
		        columnwidths = columnwidths + "*,"
		      end 
		    Next
		    
		    columnWidths = Left(columnWidths, Len(columnWidths) - 1)
		    
		    DataList.ColumnWidths = columnwidths
		    
		    // Add the data from the table
		    While Not rs.AfterLastRow
		      
		      // check the values and only add if they match the search string
		      if searching then
		        for j as Integer = 0 to rs.ColumnCount -1 
		          if rs.ColumnAt(j).StringValue.contains(searchString) then
		            dataList.AddRow("")
		            For i As Integer = 0 To rs.LastColumnIndex
		              var value as Variant = rs.ColumnAt(i).StringValue
		              // tidy up the values for unset dates
		              if value = "1970-01-01" then 
		                value = "-"
		              end
		              dataList.CellTextAt(dataList.LastAddedRowIndex, i) = value
		              if rs.ColumnAt(i).name = "uid" then 
		                dataList.RowTagAt(dataList.LastAddedRowIndex) = value
		              end
		            Next
		            exit
		          end
		        next
		        
		      else
		        dataList.AddRow("")
		        For i As Integer = 0 To rs.LastColumnIndex
		          var value as Variant = rs.ColumnAt(i).StringValue
		          // tidy up the values for unset dates
		          if value = "1970-01-01" then 
		            value = "-"
		          end
		          
		          dataList.CellTextAt(dataList.LastAddedRowIndex, i) = value
		          if rs.ColumnAt(i).name = "uid" then 
		            dataList.RowTagAt(dataList.LastAddedRowIndex) = value
		          end
		        Next
		      end
		      
		      
		      rs.MoveToNextRow
		    Wend
		    
		  catch error as DatabaseException
		    // no data
		  end
		  
		  DisplayCountLabel.text = "Displaying " + DataList.RowCount.ToString
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		dataDict As Dictionary
	#tag EndProperty


#tag EndWindowCode

#tag Events FilterButton
	#tag Event
		Sub Pressed()
		  display
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events DataList
	#tag Event
		Sub DoublePressed()
		  var id as String
		  try 
		    // Open the user record, eg. on production website.
		    id = me.RowTagAt(me.SelectedRowIndex)
		    
		    if id <> "" then
		      MessageBox("Link to user with id " + id)
		    end if
		    
		  catch error as OutOfBoundsException
		    // they clicked an empty row, do nothing
		  end
		End Sub
	#tag EndEvent
	#tag Event
		Sub SelectionChanged()
		  var selected as String = me.SelectedRowCount.ToString
		  SelectedCountLabel.text = selected + " Selected"
		End Sub
	#tag EndEvent
	#tag Event
		Function RowComparison(row1 as Integer, row2 as Integer, column as Integer, ByRef result as Integer) As Boolean
		  // Sort the listbox
		  var one as Variant = me.CellTextAt(row1, column) 
		  var two as Variant = me.CellTextAt(row2, column)
		  
		  if one.IsNumeric  then
		    if one.IntegerValue > two.IntegerValue then
		      result=1
		    else
		      result=-1
		    End if
		    Return True
		  else
		    return false
		  end 
		End Function
	#tag EndEvent
#tag EndEvents
#tag Events ReloadButton
	#tag Event
		Sub Pressed()
		  filterfield.text = ""
		  display
		End Sub
	#tag EndEvent
#tag EndEvents
#tag Events ResizeButton
	#tag Event
		Sub Pressed()
		  // Ensure there are rows in the listbox
		  If datalist.RowCount = 0 Then
		    Return
		  End If
		  
		  // Get the number of columns
		  Dim numColumns As Integer = datalist.ColumnCount
		  
		  // Initialize an array to store maximum column widths
		  Dim columnWidths As String 
		  
		  
		  // these are the minimum widths
		  For i As Integer = 0 To numColumns - 1
		    var name as string = datalist.HeaderAt(i)
		    if name = "Email" then
		      columnwidths = columnwidths + "200,"
		    elseif name = "FirstName" then
		      columnwidths = columnwidths + "80,"
		    elseif name = "LastName" then
		      columnwidths = columnwidths + "80,"
		    elseif name = "Username" then
		      columnwidths = columnwidths + "100,"
		    elseif name = "Created" then
		      columnwidths = columnwidths + "100,"
		    elseif name = "LastLogin" then
		      columnwidths = columnwidths + "100,"
		    elseif name = "LastAccess" then
		      columnwidths = columnwidths + "100,"
		    elseif name  = "uid" then
		      columnwidths = columnwidths + "38,"
		    elseif name  = "id" then
		      columnwidths = columnwidths + "38,"
		    elseif name = "SubscriptionTitle" then
		      columnwidths = columnwidths + "180,"
		    else
		      columnwidths = columnwidths + "*,"
		    end 
		  Next
		  
		  columnWidths = Left(columnWidths, Len(columnWidths) - 1)
		  
		  DataList.ColumnWidths = columnWidths
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
