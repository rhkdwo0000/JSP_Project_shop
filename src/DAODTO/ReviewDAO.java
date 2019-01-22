package DAODTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ReviewDAO {

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;

	public ReviewDAO() {
		pool = DBConnectionMgr.getInstance();
	}

	public int insertReview(ReviewDTO dto) {//리뷰 등록하는 메서드

		int rs = 0;

		try {
			con = pool.getConnection();
			String sql = "insert into review values(default,?,?,?,?,?,?,default)";
			ps = con.prepareStatement(sql);

			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getTitle());
			ps.setString(4, dto.getContent());
			ps.setString(5, dto.getGrade());
			ps.setString(6, dto.getImg());

			rs = ps.executeUpdate();

			pool.freeConnection(con, ps);
			System.out.println(rs + "면 성공");
			return rs;

		} catch (Exception e) {
			System.out.println("실패");
			e.printStackTrace();
		}
		return 0;
	}//리뷰 등록하는 메서드 끝

	public ArrayList<ReviewDTO> selectAll() {// 전체리뷰 메서드

		ArrayList<ReviewDTO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select * from Review";
			ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int num =rs.getInt(1);
				String id = rs.getString(2);
				String name = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String grade = rs.getString(6);
				String img = rs.getString(7);

				ReviewDTO dto = new ReviewDTO(num ,id, name, title, content, grade, img);
				list.add(dto);
			}
			pool.freeConnection(con, ps, rs);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}// 전체리뷰 메서드 끝

	public ArrayList<ReviewDTO> selectId(String id) {// 아이디별 리뷰전체 메서드

		ArrayList<ReviewDTO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select * from Review where id = '" + id + "'";
			ps = con.prepareStatement(sql);

			ResultSet rs = ps.executeQuery();
			while (rs.next()) {
				int num = rs.getInt(1);
				id = rs.getString(2);
				String name = rs.getString(3);
				String title = rs.getString(4);
				String content = rs.getString(5);
				String grade = rs.getString(6);
				String img = rs.getString(7);

				ReviewDTO dto = new ReviewDTO(num , id, name, title, content, grade, img);
				list.add(dto);
			}
			pool.freeConnection(con, ps, rs);
			return list;

		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// 아이디별 리뷰전체 메서드 끝

	public ArrayList<ReviewDTO> selectGrade(String cate) {// 카테고리별 상품당 별점 평균 메서드

		ArrayList<ReviewDTO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select avg(grade),review.name from review,product where product.cate =? and review.name = product.name group by review.name";
			ps = con.prepareStatement(sql);
			ps.setString(1, cate);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				double grade = rs.getDouble("avg(grade)");
				String name = rs.getString("name");
				ReviewDTO dto = new ReviewDTO(name, grade);
				list.add(dto);
			}
			System.out.println("list도착");
			pool.freeConnection(con, ps, rs);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}// 카테고리별 상품당 별점 평균 메서드 끝

	public ArrayList<ReviewDTO> selectGradeBest() {// 카테고리별 상품당 별점 평균 메서드

		ArrayList<ReviewDTO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			String sql = "select avg(grade),review.name from review,product where review.name = product.name group by review.name";
			ps = con.prepareStatement(sql);
			ResultSet rs = ps.executeQuery();

			while (rs.next()) {
				double grade = rs.getDouble("avg(grade)");
				String name = rs.getString("name");
				ReviewDTO dto = new ReviewDTO(name, grade);
				list.add(dto);
			}
			System.out.println("list도착");
			pool.freeConnection(con, ps, rs);
			return list;
		} catch (Exception e) {
			e.printStackTrace();
			return null;
		}
	}// 카테고리별 상품당 별점 평균 메서드 끝

	
	
	public int deleteReview(int num) {
		int rn = 0;
		
		try {
			con = pool.getConnection();
		String sql = "delete from review where num = ?";
		ps = con.prepareStatement(sql);
		ps.setInt(1, num);
		rn = ps.executeUpdate();
		
		pool.freeConnection(con, ps);
		return rn;
		
		} catch (Exception e) {
			e.printStackTrace();
			return rn;
		}
	}
	
	
	public int updateReview(int num, String title, String content, String file) {
		int rn = 0;
		try {
			con = pool.getConnection();
			String sql = "update review set title = ?, content = ? , img = ? where num = ? ";	
			ps = con.prepareStatement(sql);
			ps.setString(1, title);
			ps.setString(2, content);
			ps.setString(3, file);
			ps.setInt(4, num);
			rn = ps.executeUpdate();
			
			pool.freeConnection(con, ps);
			return rn;
			
		} catch (Exception e) {
			e.printStackTrace();
			return rn;
		}
		
	}
	
	   public int semiUpdateReview(int num, String title, String content) {
		      int rn = 0;
		      try {
		         con = pool.getConnection();
		         String sql = "update review set title = ?, content = ? where num = ? ";   
		         ps = con.prepareStatement(sql);
		         ps.setString(1, title);
		         ps.setString(2, content);
		         ps.setInt(3, num);
		         rn = ps.executeUpdate();
		         pool.freeConnection(con, ps);
		         return rn;
		         
		      } catch (Exception e) {
		         e.printStackTrace();
		         return rn;
		      }
		      
		   }
		   
}// 클래스 끝
