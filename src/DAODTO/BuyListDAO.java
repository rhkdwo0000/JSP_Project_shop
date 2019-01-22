package DAODTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class BuyListDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	
	public BuyListDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	public boolean buylistsave(BuyListDTO bulistdto) throws Exception {
		boolean result = false;
		con = pool.getConnection();
		String sql = "insert into buylist values(?,?,?,?,?,?,?,?,?,?,?,?,?)"; 
		PreparedStatement ps = con.prepareStatement(sql);

		ps.setString(1,bulistdto.getBname());
		ps.setString(2,bulistdto.getTel());
		ps.setString(3,bulistdto.getAddr());
		ps.setString(4,bulistdto.getPay());
		ps.setString(5,bulistdto.getMemo());
		ps.setInt(6,bulistdto.getTotal());
		ps.setString(7,bulistdto.getThum());
		ps.setString(8,bulistdto.getPname());
		ps.setString(9,bulistdto.getSize());
		ps.setString(10,bulistdto.getColor());
		ps.setInt(11,bulistdto.getQuantity());
		ps.setString(12,bulistdto.getId());
		ps.setString(13,bulistdto.getToday());
		
		int rs = ps.executeUpdate();
		if(rs>0) {
			result = true;
		}
		pool.freeConnection(con, ps);
		return result;
	}
	
	
	
	
	
	
}
