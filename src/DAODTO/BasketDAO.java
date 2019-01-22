package DAODTO;


import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import DAODTO.BasketDTO;;


public class BasketDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	public BasketDAO() {
		pool = DBConnectionMgr.getInstance();
	}

/* 장바구니에 상품 추가 */
	public void basketSave(BasketDTO basketdto) throws Exception {
		con = pool.getConnection();
		String sql = "insert into basket values(default,?,?,?,?,?,?,?,?)"; 
		PreparedStatement ps = con.prepareStatement(sql);
		System.out.println(basketdto.getThum());
		System.out.println(basketdto.getName());
		System.out.println(basketdto.getSize());
		System.out.println(basketdto.getColor());
		System.out.println(basketdto.getQuantity());
		System.out.println(basketdto.getPrice()*basketdto.getQuantity());
		System.out.println(basketdto.getId());
		System.out.println(basketdto.getToday());
		
		
		ps.setString(1,basketdto.getThum());
		ps.setString(2,basketdto.getName());
		ps.setString(3,basketdto.getSize());
		ps.setString(4,basketdto.getColor());
		ps.setInt(5,basketdto.getQuantity());
		ps.setInt(6,basketdto.getPrice()*basketdto.getQuantity());
		ps.setString(7,basketdto.getId());
		ps.setString(8,basketdto.getToday());
		ps.executeUpdate();
		pool.freeConnection(con, ps);
		
		/*autoincrement 재설정*/
		incrementreset();
	}
	
/* 해당아이디가 담아놓은 장바구니 목록 가져오기 */
	public ArrayList<BasketDTO> basketlist(String id) throws Exception {
		con = pool.getConnection();
		String sql = "select * from basket where id='" + id + "'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<BasketDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			BasketDTO basketdto = new BasketDTO();
			basketdto.setNum(rs.getInt("num"));
			basketdto.setThum(rs.getString("thum"));
			basketdto.setName(rs.getString("name"));
			basketdto.setSize(rs.getString("size"));
			basketdto.setColor(rs.getString("color"));
			basketdto.setQuantity(rs.getInt("quantity"));
			basketdto.setPrice(rs.getInt("price"));
			basketdto.setId(rs.getString("id"));
			basketdto.setToday(rs.getString("today"));
			list.add(basketdto);
		}
		
		pool.freeConnection(con, ps);
		return list;
	}

	
	
	
	
	
/*장바구니의 선택한 상품 삭제하기*/
	public boolean basketdel(String id , String sql2) throws Exception{
		
		boolean result = false;
		con = pool.getConnection();
		String sql = "delete from basket where "+sql2+" and id='"+id +"'";
		PreparedStatement ps = con.prepareStatement(sql);
		int rs = ps.executeUpdate();
		
		if(rs >0) {
			result = true;
		}
		pool.freeConnection(con, ps);
		/*autoincrement 재설정*/
		incrementreset();
		return result;
	}
	
/* 상품번호로 선택한 값 가져오기 */
	public ArrayList<BasketDTO> purchaselist1(String id , String sql2) throws Exception{
		con = pool.getConnection();
		String sql = "select * from basket where "+sql2+" and id='"+id +"'";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<BasketDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			BasketDTO basketdto = new BasketDTO();
			basketdto.setNum(rs.getInt("num"));
			
			basketdto.setThum(rs.getString("thum"));
			
			basketdto.setName(rs.getString("name"));
			
			basketdto.setSize(rs.getString("size"));
			basketdto.setColor(rs.getString("color"));
			basketdto.setQuantity(rs.getInt("quantity"));
			basketdto.setPrice(rs.getInt("price"));
			basketdto.setId(rs.getString("id"));
			basketdto.setToday(rs.getString("today"));
			list.add(basketdto);
		}
		
		pool.freeConnection(con, ps);
		return list;
	}
	
/*autoincrement 재설정*/
	public void incrementreset() throws Exception {
		con = pool.getConnection();
		
		String sql2 = "alter table basket auto_increment=1";
		PreparedStatement ps2 = con.prepareStatement(sql2);
		ps2.executeUpdate();
		
		String sql3 = "set @count=0";
		PreparedStatement ps3 = con.prepareStatement(sql3);
		ps3.executeUpdate();

		String sql4 = "UPDATE basket SET num=@COUNT:=@COUNT+1";
		PreparedStatement ps4 = con.prepareStatement(sql4);
		ps4.executeUpdate();
		
		pool.freeConnection(con, ps2);
		pool.freeConnection(con, ps3);
		pool.freeConnection(con, ps4);
	}
	
/*상품번호로 장바구니 정보 가져오기*/
	public ArrayList<BasketDTO> basketinfo(String num) throws Exception {
		con = pool.getConnection();
		System.out.println(num);
		String sql = "select * from basket where num="+num+"";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ArrayList<BasketDTO> list = new ArrayList<>();
		
		while(rs.next()) {
			BasketDTO basketdto = new BasketDTO();
			basketdto.setNum(rs.getInt("num"));
			
			basketdto.setThum(rs.getString("thum"));
			
			basketdto.setName(rs.getString("name"));
			
			basketdto.setSize(rs.getString("size"));
			basketdto.setColor(rs.getString("color"));
			basketdto.setQuantity(rs.getInt("quantity"));
			basketdto.setPrice(rs.getInt("price"));
			basketdto.setId(rs.getString("id"));
			basketdto.setToday(rs.getString("today"));
			list.add(basketdto);
		}
		pool.freeConnection(con, ps);
		return list;
	}
	
	
	
}
