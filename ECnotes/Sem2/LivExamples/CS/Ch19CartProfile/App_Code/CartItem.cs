using System;

// You must mark this class as serializable
// to get the Profile feature to work
[Serializable]
public class CartItem
{
    public Product Product;
    public int Quantity;

    public String display
    {
        get
        {
            return this.Product.Name + " (" + this.Quantity.ToString()
                + " at " + this.Product.UnitPrice.ToString("c") + " each)";
        }
    }
}
