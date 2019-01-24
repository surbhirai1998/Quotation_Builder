package bb.com.model;

import java.io.Serializable;

public class Client  implements Serializable{
	
	private static final long serialVersionUID = 1L;
	int id;
	String clientName;
	String companyName;
	String email;
	String contactNumber;
	String city;
	String state;
	String country;
	
	public Client(){
	}
	
	public Client(int id, String clientName, String companyName, String email,
			String contactNumber,String city, String state, String country) {
		super();
		this.id = id;
		this.clientName = clientName;
		this.companyName = companyName;
		this.email = email;
		this.contactNumber = contactNumber;
		this.city = city;
		this.state = state;
		this.country = country;
	}

	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public String getCountry() {
		return country;
	}
	public void setCountry(String country) {
		this.country = country;
	}
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getClientName() {
		return clientName;
	}
	public void setClientName(String clientName) {
		this.clientName = clientName;
	}
	public String getCompanyName() {
		return companyName;
	}
	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getContactNumber() {
		return contactNumber;
	}
	public void setContactNumber(String contactNumber) {
		this.contactNumber = contactNumber;
	}
	
	
	
}
