package cart.dto;

public class CartDTO {
	private int c_idx;
	private String id;
	private String name;
	private int p_idx;
	private String p_type;
	private String p_name;
	private int amount;
	private int price;
	private String c_img;
	private int money;
	
	@Override
	public String toString() {
		return "CartDTO [c_idx=" + c_idx + ", id=" + id + ", name=" + name + ", p_idx=" + p_idx + ", p_type=" + p_type
				+ ", p_name=" + p_name + ", amount=" + amount + ", price=" + price + ", c_img=" + c_img + ", money="
				+ money + "]";
	}
	
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public int getC_idx() {
		return c_idx;
	}
	public void setC_idx(int c_idx) {
		this.c_idx = c_idx;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public int getAmount() {
		return amount;
	}
	public void setAmount(int amount) {
		this.amount = amount;
	}
	public String getC_img() {
		return c_img;
	}
	public void setC_img(String c_img) {
		this.c_img = c_img;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public int getPrice() {
		return price;
	}
	public void setPrice(int price) {
		this.price = price;
	}
	public int getMoney() {
		return money;
	}
	public void setMoney(int money) {
		this.money = money;
	}
}
