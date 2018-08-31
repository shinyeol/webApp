package member.dto;

import java.util.Date;

public class MemberDTO {
	private String id;
	private String email;
	private String passwd;
	private String name;
	private String birth;
	private String sex;
	private String hp;
	private String addr;
	private String addrDetail;
	private String zip;
	private String agreeAd;
	private Date join_date;
	
	public MemberDTO() { }

	@Override
	public String toString() {
		return "MemberDTO [id=" + id + ", email=" + email + ", passwd=" + passwd + ", name=" + name + ", birth=" + birth
				+ ", sex=" + sex + ", hp=" + hp + ", addr=" + addr + ", addrDetail=" + addrDetail + ", zip=" + zip
				+ ", agreeAd=" + agreeAd + ", join_date=" + join_date + "]";
	}

	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getBirth() {
		return birth;
	}
	public void setBirth(String birth) {
		this.birth = birth;
	}
	public String getSex() {
		return sex;
	}
	public void setSex(String sex) {
		this.sex = sex;
	}
	public String getHp() {
		return hp;
	}
	public void setHp(String hp) {
		this.hp = hp;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getAddrDetail() {
		return addrDetail;
	}
	public void setAddrDetail(String addrDetail) {
		this.addrDetail = addrDetail;
	}
	public String getZip() {
		return zip;
	}
	public void setZip(String zip) {
		this.zip = zip;
	}
	public String getAgreeAd() {
		return agreeAd;
	}
	public void setAgreeAd(String agreeAd) {
		this.agreeAd = agreeAd;
	}
	public Date getJoin_date() {
		return join_date;
	}
	public void setJoin_date(Date join_date) {
		this.join_date = join_date;
	}

}
