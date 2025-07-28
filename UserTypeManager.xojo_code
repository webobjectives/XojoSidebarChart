#tag Class
Protected Class UserTypeManager
Inherits ChartManager
	#tag Method, Flags = &h0
		Shared Function getManagerForDate(date as String) As UserTypeManager
		  ///////////////////////                    USER TYPES CHART MANAGER                    //////////////////////
		  
		  // PREPARE MANAGER
		  var manager as UserTypeManager = new UserTypeManager
		  manager.buffer = 5  // this is the total number of measures added to the chart Main level, this is needed so that the category labels are correctly displayed
		  
		  manager.date = date
		  manager.data = new Dictionary
		  manager.type = "Circular"
		  manager.mode = DesktopChart.Modes.Pie
		  manager.index = 0
		  manager.popovers = false
		  manager.heading = "All Users by Type"
		  manager.chartData().RemoveAll
		  
		  // main and category settings 
		  manager.mainChartType = "Pie"
		  manager.categoryChartType = "Doughnut" // may need cateqgory chart type for stacked/bar charts
		  
		  // CATEGORY TITLES
		  const MemberCategory as String = "Member"
		  const NonMemberCategory as String = "Non-Member"
		  const StaffCategory as String = "Staff"
		  
		  // USE SQL QUERIES TO DETERMINE EACH VALUE IN THE CHART
		  // MEASURES ARE SHOWN IN THE ORDER BELOW
		  
		  var row as rowset
		  var sql as String
		  var drillDownSQL as String
		  var value as Double
		  
		  //  All user counts
		  sql = sqlSelectActiveUserCountForDate(date)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  manager.addToDataDictionary("All Users", value, dontAddToTotal, dontAddToChart, boldStyle, blackColor)
		  
		  // Member Organiser counts
		  sql = sqlSelectActiveUserCountForDate(date) + sqlMemberOrganisers
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectActiveUserDetailsForDate(date) + sqlMemberOrganisers 
		  manager.addToDataDictionary("Member Organisers", value, addToTotal, addToChart, plainStyle, MemberOrganiserColor, drillDownSQL)
		  
		  // Member Subscriber counts
		  sql = sqlSelectActiveUserCountForDate(date) + sqlMemberSubscribers
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectActiveUserDetailsForDate(date) + sqlMemberSubscribers 
		  manager.addToDataDictionary("Members Subscribers", value, addToTotal, addToChart, plainStyle, MemberSubColor, drillDownSQL)
		  
		  // Staff Count
		  sql = sqlSelectActiveUserCountForDate(date) + sqlAllStaffUsers
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectActiveUserDetailsForDate(date) + sqlAllStaffUsers 
		  manager.addToDataDictionary("Staff Users", value, addToTotal, addToChart, plainStyle, StaffColor, drillDownSQL)
		  
		  // Non-member Organiser counts
		  sql = sqlSelectActiveUserCountForDate(date) + sqlNonMemberOrganisers
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectActiveUserDetailsForDate(date) + sqlNonMemberOrganisers 
		  manager.addToDataDictionary("Non-Member Organisers", value, addToTotal, addToChart, plainStyle, OrganiserColor, drillDownSQL)
		  
		  // Non-Member Subscriber counts
		  sql = sqlSelectActiveUserCountForDate(date) + sqlNonMemberSubscribers
		  row = app.database.SelectSQL(sql) 
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectActiveUserDetailsForDate(date) + sqlNonMemberSubscribers 
		  manager.addToDataDictionary("Non-Member Subscribers", value, addToTotal, addToChart, plainStyle, SubColor, drillDownSQL)
		  
		  
		  // ADD CATEGORIES 
		  
		  // MEMBER CATEGORY LEVEL
		  sql = sqlSelectUserCountForCategory(date, MemberCategory)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForCategory(date, MemberCategory)
		  manager.addToDataDictionary("All Member Users", value, addToTotal, addToChart, boldStyle, MemberColor, drillDownSQL, showStats, 0, CategoryLevel)
		  
		  // STAFF CATEGORY LEVEL
		  sql = sqlSelectUserCountForCategory(date, StaffCategory)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForCategory(date, StaffCategory)
		  manager.addToDataDictionary("All Staff Users", value, addToTotal, addToChart, boldStyle, StaffCategoryColor, drillDownSQL, showStats, 0, CategoryLevel)
		  
		  // NON-MEMBER CATEGORY LEVEL
		  sql = sqlSelectUserCountForCategory(date, NonMemberCategory)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForCategory(date, NonMemberCategory)
		  manager.addToDataDictionary("All Non-Member Users", value, addToTotal, addToChart, boldStyle, NonMemberColor, drillDownSQL, showStats, 0, CategoryLevel)
		  
		  
		  return manager
		  
		  
		End Function
	#tag EndMethod


	#tag ViewBehavior
		#tag ViewProperty
			Name="sidebarAdjustment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="yaxisFormat"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="hideZerosInSideBar"
			Visible=false
			Group="Behavior"
			InitialValue="false"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="shouldExtendChart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mainheading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="maincolor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="categorycolor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mainChartType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryChartType"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryheading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="buffer"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="popovers"
			Visible=false
			Group="Behavior"
			InitialValue="true"
			Type="Boolean"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="mode"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="DesktopChart.Modes"
			EditorType="Enum"
			#tag EnumValues
				"0 - Line"
				"1 - Bar"
				"2 - Radar"
				"3 - Pie"
				"4 - Doughnut"
				"5 - PolarArea"
				"6 - Bubble"
				"7 - Scatter"
				"8 - Stacked"
			#tag EndEnumValues
		#tag EndViewProperty
		#tag ViewProperty
			Name="type"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="heading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="Index"
			Visible=true
			Group="ID"
			InitialValue="-2147483648"
			Type="Integer"
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
			Name="date"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
