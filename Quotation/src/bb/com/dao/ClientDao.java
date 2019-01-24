package bb.com.dao;

import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;

import bb.com.model.Client;

public interface ClientDao {
	Client addClient(Client client);
	void deleteClient(int id) throws SQLException;
	Client getClient(int id);
	ArrayList<Client> getAllClients();
	void updateClient(Client client);
	int getClientId(String client_name);
	int getMaxClientId();
	Client getClient(Connection con, int c_id) throws SQLException;
	String getSenderName(Connection con, int c_id) throws SQLException;
	int getClientCount();
}
