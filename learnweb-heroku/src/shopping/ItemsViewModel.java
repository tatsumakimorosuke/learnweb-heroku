package shopping;

import java.util.List;

import items.ItemManager;

public class ItemsViewModel implements ItemSummaryView{
	public List<Item> itemList() {
		ItemSummaryView sumView = new ItemManager();
		return sumView.itemList ();
	}
}
