using System;

// You must mark this class as serializable
// to get the personalization feature to work
[Serializable]
public class Product
{
    public string ProductID;
    public string Name;
    public string ShortDescription;
    public string LongDescription;
    public decimal UnitPrice;
    public string ImageFile;

    public Product()
	{
	}
}
