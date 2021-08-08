package shopping;

import img.ImageManager;
import items.ItemManager;

public class ItemDetailViewModel {
	private String itemCd;

	public ItemDetailViewModel (String itemCd) {
		this.itemCd = itemCd;
	}

	public Item itemDetail() {
		ItemDetailView detailView = new ItemManager();
		Item item = detailView.itemDetail(itemCd);

		ItemImageView imageView = new ImageManager();
		imageView.itemImage(item);

		return item;
	}
}
