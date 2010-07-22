<%@ Application Language="C#" %>

<script runat="server">
    
    void Profile_MigrateAnonymous(object sender, ProfileMigrateEventArgs e)
    {       
        // get the anonymous profile
        ProfileCommon p = Profile.GetProfile(e.AnonymousID);
        
        if (p.Cart.Count > 0 && Profile.Cart.Count == 0)
        {
            // swap carts
            Profile.Cart = p.Cart;
        }
        else if (Profile.Cart.Count > 0 && p.Cart.Count > 0)
        {
            // put all anonymous items in the authenticated cart
            CartItem[] items = p.Cart.GetItems();
            
            foreach (CartItem item in items)
            {
                Profile.Cart.AddItem(item);
            }
        }
    
        // delete the anonymous profile data from the data store
        ProfileManager.DeleteProfile(e.AnonymousID);

        // clear the cookie that identifies the anonymous user
        AnonymousIdentificationModule.ClearAnonymousIdentifier();
    }
          
</script>
