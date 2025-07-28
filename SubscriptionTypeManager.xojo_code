#tag Class
Protected Class SubscriptionTypeManager
Inherits ChartManager
	#tag Method, Flags = &h0
		Shared Function getManagerForDate(date as String) As SubscriptionTypeManager
		  ///////////////////////                   SUBSCRIPTION TYPES CHART MANAGER                //////////////////////
		  
		  
		  // PREPARE MANAGER
		  var manager as SubscriptionTypeManager = new SubscriptionTypeManager
		  manager.buffer = 7 // this is the total number of measures added to the chart Main level, this is needed so that the category labels are correctly displayed
		  manager.date = date
		  manager.data = new Dictionary
		  manager.type = "Circular"
		  manager.mode = DesktopChart.Modes.Pie
		  manager.index = 0
		  manager.heading = "All Subscriptions by Type"
		  manager.chartData().RemoveAll
		  
		  // chart settings 
		  manager.mainChartType = "Pie"
		  manager.categoryChartType = "Doughnut" // may need category chart type for stacked/bar charts
		  
		  // CATEGORY TITLES
		  const FreeCategory as String = "Free Sub"
		  const PaidCategory as String = "Paid Sub"
		  
		  // USE SQL QUERIES TO DETERMINE EACH VALUE IN THE CHART
		  // MEASURES ARE SHOWN IN THE ORDER BELOW
		  
		  var row as rowset
		  var sql as String
		  var drillDownSQL as String
		  var value as Double
		  
		  // All Subscriptions
		  sql = sqlSubscriptionCountForDate(date) 
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date)
		  manager.addToDataDictionary("All Subscriptions", value, dontAddToTotal, dontAddToChart, boldStyle, BlackColor)
		  
		  // Member bonus counts
		  sql = sqlSubscriptionCountForDate(date) + sqlMemberBonusSubscriptions 
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlMemberBonusSubscriptions 
		  manager.addToDataDictionary("Bonus Plans", value, addToTotal, addToChart, plainStyle, MemberOrganiserColor, drillDownSQL)
		  
		  // Member Plus counts
		  sql = sqlSubscriptionCountForDate(date) + sqlMemberPlusSubscriptions 
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlMemberPlusSubscriptions 
		  manager.addToDataDictionary("Plus Plans", value, addToTotal, addToChart, plainStyle, PlusColor, drillDownSQL)
		  
		  // Staff counts
		  sql = sqlSubscriptionCountForDate(date) + sqlAllStaffSubscriptions
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlAllStaffSubscriptions 
		  manager.addToDataDictionary("Staff Plans", value, addToTotal, addToChart, plainStyle, StaffColor, drillDownSQL)
		  
		  // Silver Plan counts
		  sql = sqlSubscriptionCountForDate(date) + sqlSilverSubscriptions
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlSilverSubscriptions 
		  manager.addToDataDictionary("Silver Plans", value, addToTotal, addToChart, plainStyle, SilverColor, drillDownSQL)
		  
		  // Bronze Plan counts
		  sql = sqlSubscriptionCountForDate(date) + sqlBronzeSubscriptions
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlBronzeSubscriptions 
		  manager.addToDataDictionary("Bronze Plans", value, addToTotal, addToChart, plainStyle, BronzeColor, drillDownSQL)
		  
		  // Suite counts
		  sql = sqlSubscriptionCountForDate(date) + sqlSuiteSubscriptions
		  row = app.database.SelectSQL(sql)
		  value= row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlSuiteSubscriptions
		  manager.addToDataDictionary("Accounting Suites", value, addToTotal, addToChart, plainStyle, SuiteColor, drillDownSQL)
		  
		  // Set counts
		  sql = sqlSubscriptionCountForDate(date) + sqlSetSubscriptions
		  row = app.database.SelectSQL(sql)
		  value= row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForDate(date) + sqlSetSubscriptions
		  manager.addToDataDictionary("Accounting Sets", value, addToTotal, addToChart, plainStyle, SetColor, drillDownSQL)
		  
		  
		  // ADD CATEGORIES 
		  
		  // FREE CATEGORY LEVEL
		  sql = sqlSelectUserCountForCategory(date, FreeCategory)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForCategory(date, FreeCategory)
		  manager.addToDataDictionary("All Free Subscriptions", value, addToTotal, addToChart, boldStyle, FreeColor, drillDownSQL, showStats, 0, CategoryLevel)
		  
		  // PAID CATEGORY LEVEL
		  sql = sqlSelectUserCountForCategory(date, PaidCategory)
		  row = app.database.SelectSQL(sql)
		  value = row.ColumnAt(0).DoubleValue
		  drillDownSQL = sqlSelectUserDetailsForCategory(date, PaidCategory)
		  manager.addToDataDictionary("All Paid Subscriptions", value, addToTotal, addToChart, boldStyle, PaidColor, drillDownSQL, showStats, 0, CategoryLevel)
		  
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
