package product.dto;

import java.util.Date;

public class ProductDTO {
	private int p_idx;
	private String p_name;
	private String p_country_of_origin;
	private int p_amount;
	private int p_price;
	private int p_point;	
	private String p_size;
	private String p_type;
	private String p_option1;
	private String p_option2;
	private String p_option3;
	private String p_product_date;
	private Date p_post_date;
	private String p_img_main;
	private String p_img1;
	private String p_img2;
	
	@Override
	public String toString() {
		return "ProductDTO [p_idx=" + p_idx + ", p_name=" + p_name + ", p_country_of_origin=" + p_country_of_origin
				+ ", p_amount=" + p_amount + ", p_price=" + p_price + ", p_point=" + p_point + ", p_size=" + p_size
				+ ", p_type=" + p_type + ", p_option1=" + p_option1 + ", p_option2=" + p_option2 + ", p_option3="
				+ p_option3 + ", p_product_date=" + p_product_date + ", p_post_date=" + p_post_date + ", p_img_main="
				+ p_img_main + ", p_img1=" + p_img1 + ", p_img2=" + p_img2 + "]";
	}
	
	public int getP_idx() {
		return p_idx;
	}
	public void setP_idx(int p_idx) {
		this.p_idx = p_idx;
	}
	public String getP_name() {
		return p_name;
	}
	public void setP_name(String p_name) {
		this.p_name = p_name;
	}
	public String getP_country_of_origin() {
		return p_country_of_origin;
	}
	public void setP_country_of_origin(String p_country_of_origin) {
		this.p_country_of_origin = p_country_of_origin;
	}
	public int getP_amount() {
		return p_amount;
	}
	public void setP_amount(int p_amount) {
		this.p_amount = p_amount;
	}
	public int getP_price() {
		return p_price;
	}
	public void setP_price(int p_price) {
		this.p_price = p_price;
	}
	public int getP_point() {
		return p_point;
	}
	public void setP_point(int p_point) {
		this.p_point = p_point;
	}
	public String getP_size() {
		return p_size;
	}
	public void setP_size(String p_size) {
		this.p_size = p_size;
	}
	public String getP_type() {
		return p_type;
	}
	public void setP_type(String p_type) {
		this.p_type = p_type;
	}
	public String getP_option1() {
		return p_option1;
	}
	public void setP_option1(String p_option1) {
		this.p_option1 = p_option1;
	}
	public String getP_option2() {
		return p_option2;
	}
	public void setP_option2(String p_option2) {
		this.p_option2 = p_option2;
	}
	public String getP_option3() {
		return p_option3;
	}
	public void setP_option3(String p_option3) {
		this.p_option3 = p_option3;
	}
	public String getP_product_date() {
		return p_product_date;
	}
	public void setP_product_date(String p_product_date) {
		this.p_product_date = p_product_date;
	}
	public Date getP_post_date() {
		return p_post_date;
	}
	public void setP_post_date(Date p_post_date) {
		this.p_post_date = p_post_date;
	}
	public String getP_img_main() {
		return p_img_main;
	}
	public void setP_img_main(String p_img_main) {
		this.p_img_main = p_img_main;
	}
	public String getP_img1() {
		return p_img1;
	}
	public void setP_img1(String p_img1) {
		this.p_img1 = p_img1;
	}
	public String getP_img2() {
		return p_img2;
	}
	public void setP_img2(String p_img2) {
		this.p_img2 = p_img2;
	}
}
