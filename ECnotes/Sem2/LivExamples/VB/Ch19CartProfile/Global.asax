<%@ Application Language="VB" %>

<script runat="server">
    
    Public Sub Profile_MigrateAnonymous(ByVal sender As Object, _
            ByVal e As ProfileMigrateEventArgs)

        ' get the anonymous profile
        Dim AnonProfile As ProfileCommon = Profile.GetProfile(e.AnonymousID)
        
        If AnonProfile.Cart.Count > 0 And Profile.Cart.Count = 0 Then
            ' swap carts
            Profile.Cart = AnonProfile.Cart
        ElseIf Profile.Cart.Count > 0 And AnonProfile.Cart.Count > 0 Then
            ' put all anonymous items in the authenticated cart
            Dim Item As CartItem
            For Each Item In AnonProfile.Cart.GetItems
                If Not Item Is Nothing Then
                    Profile.Cart.AddItem(Item)
                End If
            Next Item
        End If
    
        ' delete the anonymous profile data from the data store
        ProfileManager.DeleteProfile(e.AnonymousID)

        ' clear the cookie that identifies the anonymous user
        AnonymousIdentificationModule.ClearAnonymousIdentifier()
    End Sub
          
</script>
