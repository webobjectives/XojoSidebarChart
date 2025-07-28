#tag DesktopWindow
Begin DesktopContainer ChartContainer
   AllowAutoDeactivate=   True
   AllowFocus      =   False
   AllowFocusRing  =   False
   AllowTabs       =   True
   Backdrop        =   0
   BackgroundColor =   &cFFFFFF
   Composited      =   False
   Enabled         =   True
   HasBackgroundColor=   False
   Height          =   600
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
   Width           =   1000
   Begin DesktopLabel TitleLabel
      AllowAutoDeactivate=   True
      Bold            =   True
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   18.0
      FontUnit        =   0
      Height          =   32
      Index           =   -2147483648
      Italic          =   False
      Left            =   20
      LockBottom      =   False
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Multiline       =   True
      Scope           =   0
      Selectable      =   False
      TabIndex        =   11
      TabPanelIndex   =   0
      TabStop         =   True
      Text            =   "Title"
      TextAlignment   =   2
      TextColor       =   &c000000
      Tooltip         =   ""
      Top             =   17
      Transparent     =   False
      Underline       =   False
      Visible         =   True
      Width           =   660
   End
   Begin DesktopChart AdaptiveChart
      AllowAutoDeactivate=   True
      AllowFocus      =   False
      AllowFocusRing  =   True
      AllowPopover    =   True
      AllowTabs       =   False
      BackgroundColor =   &cFFFFFF
      Bold            =   False
      DoubleBuffer    =   False
      Enabled         =   True
      FontName        =   "System"
      FontSize        =   11.0
      FontUnit        =   0
      GridColor       =   &cA6A6A600
      HasLegend       =   False
      Height          =   453
      Index           =   -2147483648
      Italic          =   False
      Left            =   40
      LockBottom      =   True
      LockedInPosition=   False
      LockLeft        =   True
      LockRight       =   True
      LockTop         =   True
      Mode            =   3
      Scope           =   0
      TabIndex        =   10
      TabPanelIndex   =   0
      TabStop         =   True
      TextColor       =   &c000000
      Title           =   ""
      Tooltip         =   ""
      Top             =   81
      Underline       =   False
      Visible         =   True
      Width           =   620
   End
End
#tag EndDesktopWindow

#tag WindowCode
	#tag Event
		Sub Opening()
		  var index as Integer = me.PanelIndex
		  
		  If TargetWindows Then
		    // FIND OUT IF THIS INDEX IS FIXED ON WINDOWS
		    managers = app.getManagersForTabPanel( index-1 ) 
		  else
		    managers = app.getManagersForTabPanel( index ) 
		  end
		  
		  app.chartContainers.add( me )
		  
		  loadData
		End Sub
	#tag EndEvent


	#tag Method, Flags = &h0
		Sub loadData()
		  // get the manager for the selected date and the previous date
		  manager = managers(app.selectedDateindex)
		  
		  if app.selectedDateindex <> 0 then
		    previousManager = managers(app.selectedDateindex-1)
		  else
		    previousManager = manager
		  end
		  
		  var statsContainer as StatisticsContainer
		  var currentDict as Dictionary
		  var previousDict as Dictionary
		  
		  // Main data and Category Data
		  var mainValues() as Double
		  var mainColors() As Color
		  var mainLabels() as String
		  var mainPercentages() As Double
		  var mainTotal as Double = 0
		  var mainDrillDownDicts() as Dictionary
		  
		  // For categories we are going to need to know the buffer to add to make the chart labels work on Pie and Doughnut graphs
		  // this is stored in manager.labelBuffer
		  var categoryValues() as Double 
		  var categoryColors() As Color 
		  var categoryLabels() as String 
		  var categoryPercentages() as Double 
		  var categoryTotal as Double = 0
		  var categoryDrillDownDicts() as Dictionary
		  
		  // add the buffer to make the manager labels work properly
		  For i As Integer = 0 To manager.buffer -1
		    categoryValues.add(0.0)
		    categoryColors.add(Color.Clear)
		    categoryLabels.add("")
		    categoryDrillDownDicts.add(New Dictionary)
		  Next
		  
		  var value as Double
		  var percentage as Double
		  var label as String
		  
		  var bold as Boolean
		  var intotal as Boolean
		  var inchart as Boolean
		  'var level as Integer // WIP
		  var shouldShowStats as Boolean = false
		  var hideStats as Boolean = false
		  var displaycolor as Color
		  var previousValue as Double
		  var hideSidebar as Boolean = false
		  var top as Integer 
		  var height as integer 
		  var isMain as boolean
		  var defaultChartwidth as Integer 
		  var statsContainerIndex as integer 
		  var shouldExtendChart as Boolean = manager.shouldExtendChart
		  var categoryType as String = manager.categoryType
		  
		  // default amounts
		  height  = 36
		  top = 40  // this is needed to reset the tops of the sidebar each time the chart is refreshed
		  defaultChartwidth  = 550
		  statsContainerIndex = 1
		  
		  for i as integer = 0 to manager.data.KeyCount -1
		    
		    currentDict = manager.data.value(i)
		    
		    try
		      previousDict = previousManager.data.value(i)
		      previousValue = previousDict.value("value").DoubleValue
		      
		      // add the previous dates's value
		      currentDict.value("previous") = previousValue
		      
		    catch error as KeyNotFoundException
		      // no value for this date because the key ie. a month didn't exist in the previous dataset
		      currentDict.value("previous") = value
		      
		    end
		    
		    value = currentDict.value("value").DoubleValue
		    label = currentDict.value("label").StringValue
		    bold = currentDict.value("bold").BooleanValue
		    intotal = currentDict.value("total").BooleanValue
		    inchart = currentDict.value("chart").BooleanValue
		    displaycolor = currentDict.value("color").ColorValue
		    
		    if currentDict.hasKey("percentage") then // if there are any stat containers percentages 
		      percentage = currentDict.value("percentage").DoubleValue
		    end
		    
		    // if there is a level key then get the boolean value to decide wherther this is the Main or Category level
		    // from now on split the data into those levels
		    if currentDict.hasKey("mainlevel") then
		      isMain = currentDict.value("mainlevel").BooleanValue
		    else
		      isMain = true
		    end
		    
		    // if we have any stats that need to be shown then we need a sidebar, but if we have none, we can hide it
		    if currentDict.hasKey("hideStats") and currentDict.value("hideStats").BooleanValue = true then
		      // if there are any stat containers hidden then we can show the heading 
		      // but use the rest of the space for chart
		      hideStats = true
		      hideSidebar = true
		    else 
		      statsContainerIndex = statsContainerIndex + 1
		      shouldShowStats = true
		      hideStats = false
		      hideSidebar = false
		    end 
		    
		    
		    if intotal then // include in chart total // WIP for categories
		      if isMain then
		        mainTotal = mainTotal + value
		      else
		        categoryTotal = categoryTotal + value
		      end
		    end
		    
		    // add the drilldown and label to the tag of the dataset below
		    // since the whole dictionary is added to the sidebar statistics containers, their coloured rectangle buttons allow drilldown as well
		    if inchart then // show on chart
		      
		      // if the value is in the chart we need to add the drilldown sql queries to the correct index for the chart Pressed method to display them
		      // the statistics sidebar rectangles have each specific dictionary so they don't need to use these
		      if currentDict.hasKey("drillDownSQL") then
		        if isMain then
		          mainDrillDownDicts.add(currentDict)
		        else
		          categoryDrillDownDicts.add(currentDict)
		        end
		      end
		      
		      // if the value is in the chart we need to prepare the values, labels and colors in arrays to display them
		      if isMain then
		        mainValues.add(value)
		        mainLabels.add(label)
		        mainColors.add(displaycolor)
		        
		      else
		        // add to both the label arrays if there is a circular chart - check the manager buffer
		        if manager.buffer > 0 then
		          mainLabels.add(label) 
		        end
		        
		        categoryValues.add(value)
		        categoryLabels.add(label)
		        categoryColors.add(displaycolor)
		      end
		    end
		    
		    // if we should show a statistics container for this dict then show sidebar
		    if hideStats = false then
		      
		      if manager.hideZerosInSideBar = false OR (manager.hideZerosInSideBar = true and value <> 0) then
		        // adjust the top value to fit
		        top = top + height
		        
		        // give extra height to fit the larger bold text in statsContainer
		        if bold then
		          height = 35
		        else
		          height = 32
		        end 
		        
		        try
		          // if this fails it creates a new statsContainer - this is expected behaviour not an error or exception
		          // but it does stop when Xojo is set to Break on Exceptions
		          'var newindex as integer = i+2 // dont use this as it breaks when not all stats are included
		          
		          var control as Object = self.ControlAt(statsContainerIndex) 
		          statsContainer = StatisticsContainer(control)
		          statsContainer.Top = top
		        catch error as OutOfBoundsException
		          statsContainer = new StatisticsContainer
		          
		          if bold then // it this is bold leave more room above it 
		            'top = top + 5
		          end
		          
		          statsContainer.EmbedWithin(me, 740, top, 260, height) // sidebar left can change
		        end
		        statsContainer.setStatistics(currentDict)
		        statsContainer.LockTop = true
		        statsContainer.LockRight = true
		        statsContainer.LockLeft = false
		        statsContainer.LockBottom = false
		        
		        // it this is bold add more room underneath it for the subsequent stats
		        'if bold then 
		        'top = top + 6
		      end
		    end
		    
		  next
		  
		  // WIP for categories
		  for each v as Double in mainValues 
		    mainPercentages.add(v/mainTotal*100)
		  next
		  
		  for each y as Double in categoryValues 
		    categoryPercentages.add(y/categoryTotal*100)
		  next
		  
		  // PREPARE CHARTS
		  AdaptiveChart.RemoveAllDatasets
		  AdaptiveChart.RemoveAllLabels
		  AdaptiveChart.HasLegend = false
		  AdaptiveChart.Transparent = false
		  
		  // make room for the sidebar legend or hide it if it isnt needed
		  if shouldShowStats = false or shouldExtendChart = true then
		    // we can make the chart wider without the sidebar when the sidebar is not showing, or when the chart is underneath the sidebar stats
		    System.DebugLog("Changing chart width from: " + AdaptiveChart.Width.tostring)
		    AdaptiveChart.width = self.width - 80
		    System.DebugLog("to width: " + AdaptiveChart.Width.tostring)
		  end
		  
		  TitleLabel.text = manager.heading + " " + app.selectedDate
		  
		  var defaultcolor as Color = manager.MemberOrganiserColor
		  'var categorycolor as Color = manager.StaffCategoryColor
		  
		  var chartDataset As ChartDataset
		  var categoryChartDataset as ChartDataset
		  
		  // PIE AND DOUGHNUT CHARTS
		  if manager.type = "Circular" then
		    chartDataset = new ChartCircularDataset(manager.heading, mainPercentages, mainColors)
		    chartDataset.tag = mainDrillDownDicts
		    chartDataset.Transparency = 0
		    AdaptiveChart.AddDataset( chartDataset )
		    
		    if categoryValues.count > 0 then
		      categoryChartDataset = new ChartCircularDataset("Category", categoryPercentages, categoryColors)
		      categoryChartDataset.tag = categoryDrillDownDicts
		      categoryChartDataset.Transparency = 0
		      AdaptiveChart.AddDataset( categoryChartDataset )
		    end
		    
		    // LINEAR CHARTS
		  elseif manager.type = "Linear" then
		    var heading as String = manager.mainheading
		    if heading = "" then heading = manager.heading
		    
		    var mainChartDataset as ChartLinearDataset = new ChartLinearDataset(heading, manager.maincolor, true, mainValues)
		    mainChartDataset.tag = mainDrillDownDicts
		    mainChartDataset.Transparency = 0 // 30?
		    AdaptiveChart.AddDataset( mainChartDataset )
		    AdaptiveChart.GridColor = Color.clear
		    
		    
		    // BAR and STACKED CHARTS
		    if manager.mainChartType = "Bar" then
		      ChartLinearDataset(mainChartDataset).chartType = ChartLinearDataset.ChartTypes.Bar
		      AdaptiveChart.Mode = DesktopChart.Modes.Bar
		    elseif manager.mainChartType = "Stacked" then
		      ChartLinearDataset(mainChartDataset).chartType = ChartLinearDataset.ChartTypes.Bar
		      AdaptiveChart.Mode = DesktopChart.Modes.Stacked
		    else
		      ChartLinearDataset(mainChartDataset).chartType = ChartLinearDataset.ChartTypes.Line
		      AdaptiveChart.Mode = DesktopChart.Modes.Line
		    end
		    
		    // Add Category dataset
		    if categoryValues.count > 0 then
		      categoryChartDataset = new ChartLinearDataset(manager.categoryheading, manager.categorycolor, true, categoryValues)
		      categoryChartDataset.tag = categoryDrillDownDicts
		      categoryChartDataset.Transparency = 0
		      if manager.categoryChartType = "Bar" then
		        ChartLinearDataset(categoryChartDataset).chartType = ChartLinearDataset.ChartTypes.Bar
		      elseif manager.categoryChartType = "Stacked" then
		        ChartLinearDataset(categoryChartDataset).chartType = ChartLinearDataset.ChartTypes.Bar
		      else
		        ChartLinearDataset(categoryChartDataset).chartType = ChartLinearDataset.ChartTypes.Line
		      end
		      AdaptiveChart.AddDataset( categoryChartDataset )
		    end
		    
		    // SCATTER CHARTS
		  elseif manager.type = "Scatter" then
		    var datapoints() as ChartScatterDatapoint
		    'var radius as Double
		    
		    for i as Integer = 0 to mainValues.count - 1 
		      
		      var datapoint as ChartScatterDatapoint = new ChartScatterDatapoint(i, mainValues(i), mainValues(i)*20)
		      datapoints.add(datapoint)
		      
		    next
		    
		    chartDataset = new ChartScatterDataset(defaultcolor, datapoints) 
		    chartDataset.tag = mainDrillDownDicts
		    chartDataset.Transparency = 0
		    chartDataset.Tag = "date"
		    chartDataset.Label = "TEST LABEL"
		    chartDataset.Fill = true
		    
		    AdaptiveChart.AddDataset(chartDataset)
		    
		  end
		  
		  AdaptiveChart.Mode = manager.mode
		  AdaptiveChart.AddLabels(mainLabels)
		  AdaptiveChart.Format = manager.yaxisFormat
		  // try to add a yaxis limit for the chart when it's available
		  
		  
		End Sub
	#tag EndMethod


	#tag Property, Flags = &h0
		categoryheading As String
	#tag EndProperty

	#tag Property, Flags = &h0
		manager As ChartManager
	#tag EndProperty

	#tag Property, Flags = &h0
		managers() As ChartManager
	#tag EndProperty

	#tag Property, Flags = &h0
		previousManager As ChartManager
	#tag EndProperty


#tag EndWindowCode

#tag Events AdaptiveChart
	#tag Event
		Sub Opening()
		  
		End Sub
	#tag EndEvent
	#tag Event
		Sub Pressed(Dataset As ChartDataset, index As Integer)
		  // we need to get the dictionary at the index of all the addtoChart StatisicsContainers, some numbers are not in the chart and so getting the index won't work
		  
		  System.DebugLog("Dataset " + Dataset.label + " index " +  index.ToString)
		  
		  var dictArray() as Dictionary = dataset.tag
		  
		  if dictArray.count > index then
		    var dict as Dictionary = dictArray(index) // user dataset.label to find out if this is a category
		    
		    if dict.hasKey("drillDownSQL") then
		      var drillDownWindow as DrillDownWindow = new DrillDownWindow
		      drillDownWindow.dataDict = dict
		      drillDownWindow.display
		    else 
		      MessageBox("No available data")
		    end
		  else 
		    MessageBox("No available data")
		    
		  end
		End Sub
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
	#tag ViewProperty
		Name="categoryheading"
		Visible=false
		Group="Behavior"
		InitialValue=""
		Type="String"
		EditorType="MultiLineEditor"
	#tag EndViewProperty
#tag EndViewBehavior
