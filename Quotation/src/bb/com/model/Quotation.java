package bb.com.model;

import java.io.Serializable;

public class Quotation implements Serializable {
	
	private static final long serialVersionUID = 1L;
	Client client;
	Project project;
	
	public Client getClient() {
		return client;
	}
	public void setClient(Client client) {
		this.client = client;
	}
	public Project getProject() {
		return project;
	}
	public void setProject(Project project) {
		this.project = project;
	}

}
