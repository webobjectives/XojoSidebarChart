#tag Module
Protected Module sql
	#tag Method, Flags = &h0
		Function sqlAllMemberSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Member%'"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlAllMemberUsers() As String
		  return " and UserCategory like 'Member%'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlAllNonMemberUsers() As String
		  return " and UserCategory like 'Non-Member%'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlAllPlanSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Plan%'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlAllStaffSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Staff%'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlAllStaffUsers() As String
		  return " and UserCategory = 'Staff'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlBronzeSubscriptions() As String
		  return " and SubscriptionTitle like 'Bronze Subscription Plan'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlMemberBonusSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Member Bonus%'"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlMemberOrganisers() As String
		  return " and UserCategory = 'Member Organiser'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlMemberPlusSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Member Plus%'"
		  
		  
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlMemberSubscribers() As String
		  return " and UserCategory = 'Member Subscriber'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlNonMemberOrganisers() As String
		  return " and UserCategory = 'Non-Member Organiser'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlNonMemberSubscribers() As String
		  return " and UserCategory = 'Non-Member Subscriber'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSelectActiveUserCountForDate(date as String) As String
		  return "Select count(distinct(user)) from '" +  date + "' as count where userstatus = 'Active'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSelectActiveUserDetailsForDate(date as String) As String
		  return "SELECT  Firstname, Lastname, Username, Email, Created, LastLogin, LastAccess, SubscriptionTitle, User as uid, id FROM '" + date + "' WHERE userstatus = 'Active'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSelectUserCountForCategory(date as String, category as String) As String
		  return "Select count(user) from '" +  date + "' as count WHERE (SubscriptionCategory like '" + category + "%' OR UserCategory like '" + category + "%')"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSelectUserDetailsForCategory(date as String, category as String) As String
		  return "SELECT Firstname, Lastname, Username, Email, Created, LastLogin, LastAccess, SubscriptionTitle, User as uid, id  FROM '" + date  + "' WHERE (SubscriptionCategory like '" + category + "%' or UserCategory like '" + category + "%')"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSelectUserDetailsForDate(date as String) As String
		  return "SELECT Firstname, Lastname, Username, Email, Created, LastLogin, LastAccess, SubscriptionTitle, User as uid, id  FROM '" + date  + "' WHERE user = user"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSetSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Set%'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSilverSubscriptions() As String
		  return " and SubscriptionTitle like 'Silver Subscription Plan'"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSubscriptionCountForDate(date as String) As String
		  return "Select count(id) from '" +  date + "' as count WHERE SubscriptionCategory is not null"
		End Function
	#tag EndMethod

	#tag Method, Flags = &h0
		Function sqlSuiteSubscriptions() As String
		  return " and SubscriptionTitle LIKE '%Suite%'"
		End Function
	#tag EndMethod


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
	#tag EndViewBehavior
End Module
#tag EndModule
