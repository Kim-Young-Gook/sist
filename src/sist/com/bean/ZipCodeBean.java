package sist.com.bean;

/**
 * @author hyemi
 *
 */
public class ZipCodeBean {
	private String zipcode;
	private String sido;
	private String gugun;
	private String dong;
	private String bungi;
	
	
	public ZipCodeBean() {
		super();
	}
	public ZipCodeBean(String zipcode, String sido, String gugun, String dong, String bungi) {
		super();
		this.zipcode = zipcode;
		this.sido = sido;
		this.gugun = gugun;
		this.dong = dong;
		this.bungi = bungi;
	}
	public String getZipcode() {
		return zipcode;
	}
	public void setZipcode(String zipcode) {
		this.zipcode = zipcode;
	}
	public String getSido() {
		return sido;
	}
	public void setSido(String sido) {
		this.sido = sido;
	}
	public String getGugun() {
		return gugun;
	}
	public void setGugun(String gugun) {
		this.gugun = gugun;
	}
	public String getDong() {
		return dong;
	}
	public void setDong(String dong) {
		this.dong = dong;
	}
	public String getBungi() {
		return bungi;
	}
	public void setBungi(String bungi) {
		this.bungi = bungi;
	}
	@Override
	public String toString() {
		return "ZipCodeBean [zipcode=" + zipcode + ", sido=" + sido + ", gugun=" + gugun + ", dong=" + dong + ", bungi="
				+ bungi + "]";
	}
	
	
}
