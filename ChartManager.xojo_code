#tag Class
Protected Class ChartManager
	#tag Method, Flags = &h0
		Sub addToDataDictionary(label as String, value as Double, total as Boolean, chart as Boolean, bold as Boolean, displaycolor as Color)
		  // set up dictionary to display in chart container
		  // manager.addToDataDictionary("Active Users on " + date, value, dontAddToTotal, dontAddToChart, bold, blackColor)
		  
		  var dict as Dictionary = new Dictionary
		  
		  dict.value("label") = label //  label
		  dict.value("value") =  value // double value
		  dict.value("total") =  total // include in total for chart
		  dict.value("chart") =  chart // include in chart
		  dict.value("bold") =  bold // show as bold
		  dict.value("color") =  displaycolor// chart color
		  
		  data.value(index) = dict
		  
		  // keep a separate array for the chart index for drill down
		  if chart then
		    chartData.add(dict)
		  end
		  
		  index = index + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addToDataDictionary(label as String, value as Double, total as Boolean, chart as Boolean, bold as Boolean, displaycolor as Color, drillDownSQL as String)
		  // set up dictionary to display in chart container
		  // manager.addToDataDictionary("Active Users on " + date, value, dontAddToTotal, dontAddToChart, bold, blackColor)
		  
		  var dict as Dictionary = new Dictionary
		  
		  dict.value("label") = label //  label
		  dict.value("value") =  value // double value
		  dict.value("total") =  total // include in total for chart
		  dict.value("chart") =  chart // include in chart
		  dict.value("bold") =  bold // show as bold
		  dict.value("color") =  displaycolor// chart color
		  dict.Value("drillDownSQL") = drillDownSQL
		  
		  data.value(index) = dict
		  
		  // keep a separate array for the chart index for drill down
		  if chart then
		    chartData.add(dict)
		  end
		  
		  index = index + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addToDataDictionary(label as String, value as Double, total as Boolean, chart as Boolean, bold as Boolean, displaycolor as Color, drillDownSQL as String, hideStats as Boolean)
		  // set up dictionary to display in chart container
		  // manager.addToDataDictionary("Active Users on " + date, value, dontAddToTotal, dontAddToChart, bold, blackColor)
		  
		  var dict as Dictionary = new Dictionary
		  
		  dict.value("label") = label //  label
		  dict.value("value") =  value // double value
		  dict.value("total") =  total // include in total for chart
		  dict.value("chart") =  chart // include in chart
		  dict.value("bold") =  bold // show as bold
		  dict.value("color") =  displaycolor// chart color
		  dict.Value("drillDownSQL") = drillDownSQL
		  dict.Value("hideStats") = hideStats
		  
		  data.value(index) = dict
		  
		  // keep a separate array for the chart index for drill down
		  if chart then
		    chartData.add(dict)
		  end
		  
		  index = index + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addToDataDictionary(label as String, value as Double, total as Boolean, chart as Boolean, bold as Boolean, displaycolor as Color, drillDownSQL as String, hideStats as Boolean, percentage as Double)
		  // set up dictionary to display in chart container
		  // manager.addToDataDictionary("Active Users on " + date, value, dontAddToTotal, dontAddToChart, bold, blackColor)
		  
		  var dict as Dictionary = new Dictionary
		  
		  dict.value("label") = label //  label
		  dict.value("value") =  value // double value
		  dict.value("total") =  total // include in total for chart
		  dict.value("chart") =  chart // include in chart
		  dict.value("bold") =  bold // show as bold
		  dict.value("color") =  displaycolor// chart color
		  dict.Value("drillDownSQL") = drillDownSQL
		  dict.Value("hideStats") = hideStats
		  dict.Value("percentage") = percentage.ToString(Locale.Current, "#") + "%" 
		  
		  data.value(index) = dict
		  
		  // keep a separate array for the chart index for drill down
		  if chart then
		    chartData.add(dict)
		  end
		  
		  index = index + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Sub addToDataDictionary(label as String, value as Double, total as Boolean, chart as Boolean, bold as Boolean, displaycolor as Color, drillDownSQL as String, hideStats as Boolean, percentage as Double, level as boolean)
		  // set up dictionary to display in chart container
		  // manager.addToDataDictionary("Active Users on " + date, value, dontAddToTotal, dontAddToChart, bold, blackColor)
		  
		  var dict as Dictionary = new Dictionary
		  
		  dict.value("label") = label //  label
		  dict.value("value") =  value // double value
		  dict.value("total") =  total // include in total for chart
		  dict.value("chart") =  chart // include in chart
		  dict.value("bold") =  bold // show as bold
		  dict.value("color") =  displaycolor// chart color
		  dict.Value("drillDownSQL") = drillDownSQL
		  dict.Value("hideStats") = hideStats
		  dict.Value("percentage") = percentage.ToString(Locale.Current, "#") + "%" 
		  dict.Value("mainlevel") = level
		  
		  // add this dictionary to the data dictionary
		  data.value(index) = dict
		  
		  // keep a separate array for the chart index for drill down
		  // this may need to change to support categories
		  // may not need all the values in the dictionary for this
		  if chart then
		    chartData.add(dict)
		  end
		  
		  index = index + 1
		End Sub
	#tag EndMethod

	#tag Method, Flags = &h0
		Shared Function getManagerForDate(date as String) As ChartManager
		  ///////////////////////                   CHART MANAGER - EXAMPLE USER TYPES CHART                    //////////////////////
		  
		  // handle this method in the subclass - it needs to set the data dictionaries in a new chart manager
		  
		  
		End Function
	#tag EndMethod


	#tag Property, Flags = &h0
		buffer As Integer = 0
	#tag EndProperty

	#tag Property, Flags = &h0
		categoryChartType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		categoryColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		categoryHeading As String
	#tag EndProperty

	#tag Property, Flags = &h0
		categoryType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		chartData() As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		data As Dictionary
	#tag EndProperty

	#tag Property, Flags = &h0
		date As String
	#tag EndProperty

	#tag Property, Flags = &h0
		heading As String
	#tag EndProperty

	#tag Property, Flags = &h0
		hideZerosInSideBar As Boolean = false
	#tag EndProperty

	#tag Property, Flags = &h0
		index As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		mainChartType As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mainColor As Color
	#tag EndProperty

	#tag Property, Flags = &h0
		mainHeading As String
	#tag EndProperty

	#tag Property, Flags = &h0
		mode As DesktopChart.Modes
	#tag EndProperty

	#tag Property, Flags = &h0
		popovers As Boolean = true
	#tag EndProperty

	#tag Property, Flags = &h0
		shouldExtendChart As Boolean
	#tag EndProperty

	#tag Property, Flags = &h0
		sidebarAdjustment As Integer
	#tag EndProperty

	#tag Property, Flags = &h0
		type As String
	#tag EndProperty

	#tag Property, Flags = &h0
		yaxisFormat As String = "0"
	#tag EndProperty


	#tag Constant, Name = addToChart, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = addToTotal, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BarChart, Type = String, Dynamic = False, Default = \"Bar", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BlackColor, Type = Color, Dynamic = False, Default = \"&c00000000", Scope = Public
	#tag EndConstant

	#tag Constant, Name = boldStyle, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = BronzeColor, Type = Color, Dynamic = False, Default = \"&cC18862", Scope = Public
	#tag EndConstant

	#tag Constant, Name = CategoryLevel, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = dontAddToChart, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = dontAddToTotal, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = DoughnutChart, Type = String, Dynamic = False, Default = \"Doughnut", Scope = Public
	#tag EndConstant

	#tag Constant, Name = FreeColor, Type = Color, Dynamic = False, Default = \"&c194389", Scope = Public
	#tag EndConstant

	#tag Constant, Name = hideStats, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = LineChart, Type = String, Dynamic = False, Default = \"Line", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MainLevel, Type = Boolean, Dynamic = False, Default = \"true", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MemberColor, Type = Color, Dynamic = False, Default = \"&c3456F6", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MemberOrganiserColor, Type = Color, Dynamic = False, Default = \"&c273FB2", Scope = Public
	#tag EndConstant

	#tag Constant, Name = MemberSubColor, Type = Color, Dynamic = False, Default = \"&c6BADD3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NegativeColor, Type = Color, Dynamic = False, Default = \"&cDC5F5B", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NegativeSidebarColor, Type = Color, Dynamic = False, Default = \"&cEEA09B", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NonMemberColor, Type = Color, Dynamic = False, Default = \"&c4D874E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = NonSubscribersColor, Type = Color, Dynamic = False, Default = \"&cCAA861", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OrganiserColor, Type = Color, Dynamic = False, Default = \"&c14672600", Scope = Public
	#tag EndConstant

	#tag Constant, Name = OtherColor, Type = Color, Dynamic = False, Default = \"&cE6BF6F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PaidColor, Type = Color, Dynamic = False, Default = \"&cE4B019", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PieChart, Type = String, Dynamic = False, Default = \"Pie", Scope = Public
	#tag EndConstant

	#tag Constant, Name = plainStyle, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = PlusColor, Type = Color, Dynamic = False, Default = \"&c4E6BB3", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SetColor, Type = Color, Dynamic = False, Default = \"&cF8DF1E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = showStats, Type = Boolean, Dynamic = False, Default = \"false", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SilverColor, Type = Color, Dynamic = False, Default = \"&c534C4E", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StaffCategoryColor, Type = Color, Dynamic = False, Default = \"&c7F817F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = StaffColor, Type = Color, Dynamic = False, Default = \"&c9E9E9F", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SubColor, Type = Color, Dynamic = False, Default = \"&c7E9E37", Scope = Public
	#tag EndConstant

	#tag Constant, Name = SuiteColor, Type = Color, Dynamic = False, Default = \"&cF4CB34", Scope = Public
	#tag EndConstant


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
			Name="heading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="date"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
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
			Name="buffer"
			Visible=false
			Group="Behavior"
			InitialValue="0"
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryHeading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mainHeading"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="String"
			EditorType="MultiLineEditor"
		#tag EndViewProperty
		#tag ViewProperty
			Name="mainColor"
			Visible=false
			Group="Behavior"
			InitialValue="&c000000"
			Type="Color"
			EditorType=""
		#tag EndViewProperty
		#tag ViewProperty
			Name="categoryColor"
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
			Name="shouldExtendChart"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Boolean"
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
			Name="sidebarAdjustment"
			Visible=false
			Group="Behavior"
			InitialValue=""
			Type="Integer"
			EditorType=""
		#tag EndViewProperty
	#tag EndViewBehavior
End Class
#tag EndClass
