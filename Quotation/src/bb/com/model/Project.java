package bb.com.model;

import java.io.Serializable;
import java.util.ArrayList;

public class Project implements Serializable {
	private static final long serialVersionUID = 1L;
	int pid;
	String projectName;
	String term;
	String senderName;
	String extraNote;
	ArrayList<MainService> mainServices;
	
	public Project(){
	}
	
	
	public String getSenderName() {
		return senderName;
	}
	
	public void setSenderName(String senderName) {
		this.senderName = senderName;
	}
	
	public String getExtraNote() {
		return extraNote;
	}

	public void setExtraNote(String extraNote) {
		this.extraNote = extraNote;
	}

	public ArrayList<MainService> getMainServices() {
		return mainServices;
	}

	public void setMainServices(ArrayList<MainService> mainServices) {
		this.mainServices = mainServices;
	}

	
	
	public int getPid() {
		return pid;
	}
	public void setPid(int p_id) {
		this.pid = p_id;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	
	public String getTerm() {
		return term;
	}
	public void setTerm(String term) {
		this.term = term;
	}
	
	
	
}
