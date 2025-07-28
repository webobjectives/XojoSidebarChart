#tag Class
Protected Class App
Inherits DesktopApplication
	#tag Event
		Sub Opening()
		  Try
		    
		    var dbFile As FolderItem = SpecialFolder.Resource("SidebarChart.resource")
		    var folder as FolderItem = SpecialFolder.ApplicationData.child("SidebarChart")
		    
		    if not folder.Exists then
		      // create the folder
		      System.DebugLog("Installing Application Support subfolder")
		      folder.CreateFolder
		    end
		    
		    Var dest As FolderItem = folder.Child("SidebarChart.resource")
		    
		    if dest.Exists then
		      // replace it and use the latest database
		      dest.Remove
		    end
		    
		    dbFile.CopyTo(dest)
		    
		    System.DebugLog(dest.NativePath)
		    
		    var newdatabase as New SQLiteDatabase
		    newdatabase.DatabaseFile = dest
		    app.database = newdatabase
		    
		    // Open the database
		    If app.database.Connect Then
		      
		      // fetch all the tables from the database in creation order to display them in this popup
		      
		      var tables As RowSet = app.database.Tables
		      
		      // initialise the managers dictionary
		      chartManagers = new Dictionary
		      
		      var tableIndex as Integer = -1
		      
		      Try
		        For Each row As DatabaseRow In tables
		          tableIndex = tableIndex + 1
		          
		          // add each date-based table in the database to the Dates app property 
		          var tableName as String = row.ColumnAt(0).StringValue
		          System.DebugLog("Adding date: " + tableName)
		          
		          dates.add(tableName) // so it will show in the dropdown menu selector
		          
		          // run sql to update the database schema or transform data
		          updateDatabaseAndSchema(tableName)
		          
		          app.selectedDateindex = tableIndex
		          
		          // load the chart managers which manage the data for each chart and how it should be displayed
		          loadAllChartManagersForDate(tableName)
		          
		        Next
		        
		        tables.Close
		        
		      Catch error As DatabaseException
		        MessageBox("Error connecting To database.")
		        
		      End Try
		      
		    Else
		      MessageBox("Error connecting to the database: " + app.database.ErrorMessage)
		    End If
		    
		    
		  Catch error As RuntimeException
		    MessageBox("Runtime error " + error.Message)
		  Catch error As NilObjectException
		    MessageBox("This database has no tables.")
		  End Try
		  
		  System.DebugLog("App Opening Finished")
		  
		  
		End Sub
	#tag EndEvent

	#tag Event
		Function UnhandledException(error As RuntimeException) As Boolean
		  // Retrieve the stack trace
		  Dim stackTrace As String = String.FromArray(error.Stack, EndOfLine)
		  
		  // Optionally, log or display the error message and stack trace
		  System.DebugLog("Unhandled Exception: " + error.Message)
		  System.DebugLog("Stack Trace: " + stackTrace)
		  
		  if error.Message <> "" then
		    System.DebugLog("Error message:" +  error.Message)
		    System.DebugLog("Error number:" +  error.ErrorNumber.ToString)
		  end
		  
		End Function
	#tag EndEvent


	#tag MenuHandler
		Function NewWindowMenuItem() As Boolean Handles NewWindowMenuItem.Action
		  var v as new ChartWindow
		  v.show
		  
		  
		  Return True
		  
		  
		End Function
	#tag EndMenuHandler


	#tag Method, Flags = &h0
		Function getManagersForTabPanel(index as Integer) As ChartManager()
		  try
		    // Get the ChartManager for each date for each tabpanel
		    var panelManagers() as ChartManager
		    
		    // we need to get all the managers for all dates for the tabpanel at this index
		    for each date as String in app.dates 
		      // we only want the index of each date for this chart
		      try 
		        if app.chartManagers.HasKey(date) = false then
		          // Load the chart managers
		          app.loadAllChartManagersForDate(date)
		          
		        end
		        
		        var dateManagers() as ChartManager = app.chartManagers.value(date)
		        var manager as ChartManager = dateManagers(index)
		        panelManagers.add(manager)
		        
		      catch e as OutOfBoundsException
		        System.DebugLog("Error " + date)
		      end
		      
		    next
		    
		    return panelManagers
		    
		  catch error as RuntimeException
		    MessageBox(error.Message)
		  catch error as OutOfBoundsException
		    MessageBox(error.Message)
		  catch error as NilObjectException
		    MessageBox(error.Message)
		  end
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub loadAllChartManagersForDate(tableName as String)
		  var tableManagers() as ChartManager
		  
		  // load all tableManagers for this selectedDate
		  tableManagers.add( UserTypeManager.getManagerForDate(tableName) )
		  tableManagers.add( SubscriptionTypeManager.getManagerForDate(tableName) )
		  // add any other managers here
		  
		  // add to app properties
		  app.selectedDate = tableName 
		  app.chartManagers.value(selectedDate) = tableManagers
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub updateDatabaseAndSchema(tableName as String)
		  var sql as String
		  var rs as Rowset
		  
		  
		  try
		    
		    // Use updateDatabaseAndSchema to transform new data, or add database versioning
		    
		    app.database.BeginTransaction
		    
		    
		    // DELETE, UPDATE, INSERT, REPLACE, ALTER as required
		    // Example  update statement
		    'sql = "UPDATE '" + tableName + "' SET UserCategory = 'Staff' WHERE SubscriptionTitle like '%Staff%'"
		    'app.database.ExecuteSQL(sql)
		    
		    app.database.CommitTransaction
		    
		  catch error as DatabaseException
		    
		    app.database.RollbackTransaction
		    MessageBox ("SQL Update failed for " + tableName)
		    
		  end
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		chartContainers() As ChartContainer
	#tag EndProperty

	#tag Property, Flags = &h0
		#tag Note
			// managers is a dictionary with keys = date
			// the values are an array of managers with the index = panel
		#tag EndNote
		chartManagers As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		database As SQLiteDatabase
	#tag EndProperty

	#tag Property, Flags = &h0
		dates() As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedDate As String
	#tag EndProperty

	#tag Property, Flags = &h0
		selectedDateIndex As Integer
	#tag EndProperty


	#tag Constant, Name = kEditClear, Type = String, Dynamic = False, Default = \"&Delete", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"&Delete"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"&Delete"
	#tag EndConstant

	#tag Constant, Name = kFileQuit, Type = String, Dynamic = False, Default = \"&Quit", Scope = Public
		#Tag Instance, Platform = Windows, Language = Default, Definition  = \"E&xit"
	#tag EndConstant

	#tag Constant, Name = kFileQuitShortcut, Type = String, Dynamic = False, Default = \"", Scope = Public
		#Tag Instance, Platform = Mac OS, Language = Default, Definition  = \"Cmd+Q"
		#Tag Instance, Platform = Linux, Language = Default, Definition  = \"Ctrl+Q"
	#tag EndConstant


	#tag ViewBehavior
		#tag ViewProperty
			Name="ProcessID"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Name"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Index"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Super"
			Visible=false
			Group="ID"
			InitialValue=""
			Type="String"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Left"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Top"
			Visible=false
			Group="Position"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowAutoQuit"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="AllowHiDPI"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="BugVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Copyright"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="Description"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="LastWindowIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MajorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="MinorVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="NonReleaseVersion"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="RegionCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="StageCode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="Version"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="string"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="_CurrentEventTime"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectedDate"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="selectedDateIndex"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="database"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="SQLiteDatabase"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
