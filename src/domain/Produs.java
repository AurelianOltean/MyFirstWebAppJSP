package domain;

public class Produs {
	
	private String id;
	private String name;
	private String color;
	private String stoc;
	private String price;
	
	
	
	
	public Produs(String id, String name, String color, String stoc, String price) {
		super();
		setId(id);
		setName(name);
		setColor(color);
		setStoc(stoc);
		setPrice(price);
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getColor() {
		return color;
	}
	public void setColor(String color) {
		this.color = color;
	}
	public String getPrice() {
		return price;
	}
	public void setPrice(String price) {
		this.price = price;
	}
	public String getStoc() {
		return stoc;
	}
	public void setStoc(String stoc) {
		this.stoc = stoc;
	}

	@Override
	public String toString() {
		return "\nProdus [id=" + id + ", name=" + name + ", color=" + color + ", price=" + price + ", stoc=" + stoc + "]";
	}
	
	

}
