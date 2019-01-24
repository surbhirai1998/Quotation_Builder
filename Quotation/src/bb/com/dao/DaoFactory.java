package bb.com.dao;


public final class DaoFactory {
	static ClientDao cdao;
	static ProjectDao pdao;
	static MainServiceDao msdao;
	static SubServiceDao ssdao;
	static  OriginalSSDao  ossdao;
	static OriginalMSDao omsdao;
	static AdminDao adao;
	private DaoFactory(){
	}
	public static ClientDao getClientDao(){
		if(cdao==null){
			//cdao= new ClientDaoOracleImpl();
			cdao= new ClientDaoMySQLImpl();
		}
		return cdao;
	}
	
	public static ProjectDao getProjectDao(){
		if(pdao==null){
			//pdao=new ProjectDaoOracleImpl();
			pdao=new ProjectDaoMySQLImpl();
		}
		return pdao;
	}
	public static MainServiceDao getMainServiceDao(){
		if(msdao==null){
			//msdao=new MainServiceDaoOracleImpl();
			msdao=new MainServiceDaoMySQLImpl();
		}
		return msdao;
	}
	public static SubServiceDao getSubServiceDao() {
		if(ssdao==null){
			//ssdao=new SubServiceDaoOracleImpl();
			ssdao=new SubServiceDaoMySQLImpl();
		}
		return ssdao;
	}
	
	
	public static OriginalSSDao getOriginalSSDao() {
		if(ossdao==null){
			//ossdao=new OriginalSSDaoOracleImpl();
			ossdao=new OriginalSSDaoMySQLImpl();
		}
		return ossdao;
	}
	public static OriginalMSDao getOriginalMSDao() {
		if(omsdao==null){
			//omsdao=new OriginalMSDaoOracleImpl();
			omsdao=new OriginalMSDaoMySQLImpl();
		}
		return omsdao;
	}
	
	public static AdminDao getAdminDao() {
		if(adao==null){
			//adao=new AdminDaoOracleImpl();
			adao=new AdminDaoMySQLImpl();
		}
		return adao;
	}
	
	
	
}
