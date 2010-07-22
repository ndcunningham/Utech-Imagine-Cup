using System;
using System.Collections;

// You must mark this class as serializable
// to get the Profile feature to work
[Serializable]
public class ShoppingCart
{
	SortedList cart = new SortedList();

    public int Count
    {
        get
        {
            return cart.Count;
        }
	}

	public void AddItem(CartItem item)
	{
		string productID = item.Product.ProductID;

		if (cart.ContainsKey(productID))
		{
			CartItem existingItem = (CartItem) cart[productID];

			existingItem.Quantity += item.Quantity;
		}
		else
			cart.Add(productID, item);
	}

	public CartItem[] GetItems()
	{
		CartItem[] items = new CartItem[cart.Count];

		for (int i = 0; i < cart.Count; i++)
			items[i] = (CartItem) cart.GetByIndex(i);

		return items;
	}

	public void Clear()
	{
		cart.Clear();
	}

	public void RemoveAt(int i)
	{
		cart.RemoveAt(i);
	}
}