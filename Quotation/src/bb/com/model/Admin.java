package bb.com.model;

import java.io.Serializable;

public class Admin implements Serializable{

	private static final long serialVersionUID = 1L;
String name;
String userName;
public String getName() {
	return name;
}
public void setName(String name) {
	this.name = name;
}
public String getUserName() {
	return userName;
}
public void setUserName(String userName) {
	this.userName = userName;
}
}
