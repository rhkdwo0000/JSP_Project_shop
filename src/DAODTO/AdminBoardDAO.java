package DAODTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAODTO.AdminBoardDTO;;
public class AdminBoardDAO {
	
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	public AdminBoardDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
	
/* 관리자 게시판 글의 등록 */
	public boolean adminboardsave(AdminBoardDTO adminboardDTO) throws Exception {
		boolean result = false;
		con = pool.getConnection();
		String sql = "insert into adminboard values(null,?,?,?,?,?)";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, adminboardDTO.getCategory());
		ps.setString(2, adminboardDTO.getTitle());
		ps.setString(3, adminboardDTO.getCont());
		ps.setString(4, adminboardDTO.getDate());
		ps.setString(5, adminboardDTO.getName());
		
		int rs = ps.executeUpdate();
		if(rs > 0) {
			result = true;
		}
		
		pool.freeConnection(con, ps);
		incrementreset();
		return result;
	}
	
	
/*관리자 게시판의 글 목록 모두 가져오기*/
	public ArrayList<AdminBoardDTO> adminboardlist() throws Exception{
		con = pool.getConnection();
		String sql = "select * from adminboard";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<AdminBoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			AdminBoardDTO adminboarddto = new AdminBoardDTO();
			adminboarddto.setNum(rs.getInt("num"));
			adminboarddto.setCategory(rs.getString("category"));
			adminboarddto.setTitle(rs.getString("title"));
			adminboarddto.setCont(rs.getString("cont"));
			adminboarddto.setDate(rs.getString("date"));
			adminboarddto.setName(rs.getString("name"));
			list.add(adminboarddto);
		}
		pool.freeConnection(con, ps);
		return list;
	}
	
	/*autoincrement 재설정*/
	public void incrementreset() throws Exception {
		con = pool.getConnection();
		
		String sql2 = "alter table adminboard auto_increment=1";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.executeUpdate();
		
		String sql3 = "set @count=0";
		PreparedStatement ps3 = con.prepareStatement(sql3);
		ps3.executeUpdate();

		String sql4 = "UPDATE adminboard SET num=@COUNT:=@COUNT+1";
		PreparedStatement ps4 = con.prepareStatement(sql4);
		ps4.executeUpdate();
		
		pool.freeConnection(con, ps2);
		pool.freeConnection(con, ps3);
		pool.freeConnection(con, ps4);
		System.out.println("ok");
	}
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	
	/*글번호로 게시글 가져오기*/
	public ArrayList<AdminBoardDTO> adminBoardView(int num) throws Exception{
		con = pool.getConnection();
		String sql = "select * from adminboard where num = '" + num + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<AdminBoardDTO> list = new ArrayList<>();
		while(rs.next()) {
			AdminBoardDTO adminboarddto = new AdminBoardDTO();
			adminboarddto.setNum(rs.getInt("num"));
			adminboarddto.setCategory(rs.getString("category"));
			adminboarddto.setTitle(rs.getString("title"));
			adminboarddto.setCont(rs.getString("cont"));
			adminboarddto.setDate(rs.getString("date"));
			adminboarddto.setName(rs.getString("name"));
			list.add(adminboarddto);
		}
		pool.freeConnection(con, ps);
		return list;
	}
	
//공지사항의 목록 전체 가져오기	
//	public ArrayList<AdminBoardDTO> adminboardlist() throws Exception{
//			con = pool.getConnection();
//			String sql = "select * from adminboard";
//			ps = con.prepareStatement(sql);
//			ResultSet rs = ps.executeQuery();
//
//			ArrayList<AdminBoardDTO> list = new ArrayList<>();
//			
//			while(rs.next()) {
//				AdminBoardDTO adminboarddto = new AdminBoardDTO();
//				adminboarddto.setNum(rs.getInt("num"));
//				adminboarddto.setCategory(rs.getString("category"));
//				adminboarddto.setTitle(rs.getString("title"));
//				adminboarddto.setCont(rs.getString("cont"));
//				adminboarddto.setDate(rs.getString("date"));
//				adminboarddto.setName(rs.getString("name"));
//				list.add(adminboarddto);
//			}
//			
//			pool.freeConnection(con, ps);
//			return list;
//		}
//	
//	
	
	
	
	
}
