package Coffee_Shop.menu;

import java.io.Serializable;

public class MenuDto implements Serializable {
	private static final long serialVersionUID = 1L;
	private String name;
	private int price;
	private int quantity;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public int getPrice() {
		return price;
	}

	public void setPrice(int price) {
		this.price = price;
	}

	public int getQuantity() {
		return quantity;
	}

	public void setQuantity(int quantity) {
		this.quantity = quantity;
	}

	public MenuDto(String name, int price, int quantity) {
		this.name = name;
		this.price = price;
		this.quantity = quantity;
	}

	public MenuDto() {
	}
}
