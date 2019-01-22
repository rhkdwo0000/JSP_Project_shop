package DAODTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class AdminBoardComDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	
	public AdminBoardComDAO() {
		pool = DBConnectionMgr.getInstance();
	}

// 공지사항의 게시판의 댓글 등록
	public boolean adminboardcom(AdminBoardComDTO adminboardcomdto) throws Exception {
		boolean result = false;
		con = pool.getConnection();
		String sql = "insert into adminreply values(?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		
		ps.setInt(1, adminboardcomdto.getNum());
		ps.setString(2, adminboardcomdto.getName());
		ps.setString(3, adminboardcomdto.getDate());
		ps.setString(4, adminboardcomdto.getCont());
		
		
		int rs = ps.executeUpdate();
		if(rs > 0) {
			result = true;
		}
		pool.freeConnection(con, ps);
		return result;
	}
	
// 공지사항의 게시판의 댓글 리스트	
	public ArrayList<AdminBoardComDTO> adminboardcomlist(int num) throws Exception{
		con = pool.getConnection();
		String sql = "select * from adminreply where num ='" +num + "'";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<AdminBoardComDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			AdminBoardComDTO adminboardcomdto = new AdminBoardComDTO();
			adminboardcomdto.setNum(rs.getInt("num"));
			adminboardcomdto.setName(rs.getString("name"));
			adminboardcomdto.setDate(rs.getString("date"));
			adminboardcomdto.setCont(rs.getString("cont"));
			
			list.add(adminboardcomdto);
		}
		
		pool.freeConnection(con, ps);
		return list;
	}


}
