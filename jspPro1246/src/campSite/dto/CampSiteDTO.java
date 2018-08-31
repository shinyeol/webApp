package campSite.dto;

public class CampSiteDTO {
	
	private String locationName;
	private String siteType;
	private String arrivalDate;
	private String departureDate;
	private int numAdults;
	private int numKids;
	private int numInfants;
	private String equipmentType;
	private int siteWidth;
	private int siteLength;
	private int totalPrice;
	
	public CampSiteDTO() { }
	
	public CampSiteDTO(String locationName, String siteType, String arrivalDate, String departureDate, int numAdults,
			int numKids, int numInfants, String equipmentType, int siteWidth, int siteLength, int totalPrice) {
		super();
		this.locationName = locationName;
		this.siteType = siteType;
		this.arrivalDate = arrivalDate;
		this.departureDate = departureDate;
		this.numAdults = numAdults;
		this.numKids = numKids;
		this.numInfants = numInfants;
		this.equipmentType = equipmentType;
		this.siteWidth = siteWidth;
		this.siteLength = siteLength;
		this.totalPrice = totalPrice;
	}

	@Override
	public String toString() {
		return "GoSiteDTO [locationName=" + locationName + ", siteType=" + siteType + ", arrivalDate=" + arrivalDate
				+ ", departureDate=" + departureDate + ", numAdults=" + numAdults + ", numKids=" + numKids
				+ ", numInfants=" + numInfants + ", equipmentType=" + equipmentType + ", siteWidth=" + siteWidth
				+ ", siteLength=" + siteLength + ", totalPrice=" + totalPrice + "]";
	}

	public int getTotalPrice() {
		return totalPrice;
	}
	public void setTotalPrice(int totalPrice) {
		this.totalPrice = totalPrice;
	}
	public String getLocationName() {
		return locationName;
	}
	public void setLocationName(String locationName) {
		this.locationName = locationName;
	}
	public String getSiteType() {
		return siteType;
	}
	public void setSiteType(String siteType) {
		this.siteType = siteType;
	}
	public String getArrivalDate() {
		return arrivalDate;
	}
	public void setArrivalDate(String arrivalDate) {
		this.arrivalDate = arrivalDate;
	}
	public String getDepartureDate() {
		return departureDate;
	}
	public void setDepartureDate(String departureDate) {
		this.departureDate = departureDate;
	}
	public int getNumAdults() {
		return numAdults;
	}
	public void setNumAdults(int numAdults) {
		this.numAdults = numAdults;
	}
	public int getNumKids() {
		return numKids;
	}
	public void setNumKids(int numKids) {
		this.numKids = numKids;
	}
	public int getNumInfants() {
		return numInfants;
	}
	public void setNumInfants(int numInfants) {
		this.numInfants = numInfants;
	}
	public String getEquipmentType() {
		return equipmentType;
	}
	public void setEquipmentType(String equipmentType) {
		this.equipmentType = equipmentType;
	}
	public int getSiteWidth() {
		return siteWidth;
	}
	public void setSiteWidth(int siteWidth) {
		this.siteWidth = siteWidth;
	}
	public int getSiteLength() {
		return siteLength;
	}
	public void setSiteLength(int siteLength) {
		this.siteLength = siteLength;
	}
}
