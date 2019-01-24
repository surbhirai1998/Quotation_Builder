package bb.com.model;

import java.util.ArrayList;

public class MainService {
	int id;
	String mainService;
	int cost;
	ArrayList<SubService> subServices;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getMainService() {
		return mainService;
	}
	public void setMainService(String mainService) {
		this.mainService = mainService;
	}
	public int getCost() {
		return cost;
	}
	public void setCost(int cost) {
		this.cost = cost;
	}
	public ArrayList<SubService> getSubServices() {
		return subServices;
	}
	public void setSubServices(ArrayList<SubService> subServices) {
		this.subServices = subServices;
	}
	
	
}
