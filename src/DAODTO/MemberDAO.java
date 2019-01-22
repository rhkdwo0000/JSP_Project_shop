package DAODTO;

import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

public class MemberDAO{

	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	public MemberDAO() {
		pool = DBConnectionMgr.getInstance();
	}
	
/*로그인*/
	public String loginMember(String id) {
		try {
		// DB 연결
		con = pool.getConnection();
		// sql 문 작성
		String sql = "SELECT pw FROM member  WHERE id = ?;";
				
		// 오류 처리
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ResultSet result = ps.executeQuery();

		String selectedPW = null;

		while (result.next()) {
				selectedPW = result.getString("PW");
		} // 비밀번호 존재시 비밀번호 반환
		pool.freeConnection(con, ps ,result);
		return selectedPW;
			// 비밀번호 반환
		} catch (Exception e) {
			System.err.println("MemberDAO-loginMember(String id) : 메서드 오류");
			e.printStackTrace();
		}
		return null;
	}// joinMember() : 메서드 종료
	
	
	/*이메일중복체크*/
	boolean emailResult;
	public boolean emailCheck(String email) {
		try {
			con = pool.getConnection();
			String sql = "select * from member where email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, email);
			ResultSet rs = ps.executeQuery();
			if (rs.next()) {
					emailResult = true;
			}
			pool.freeConnection(con, ps, rs);
			return emailResult;
			
		} catch (Exception e) {
			e.printStackTrace();
			return emailResult;
		}
	}
	
	  
	// 일반회원가입을 하는 메서드
	public String joinMember(MemberDTO memberDTO) {
		try {
			// DB 연결
			con = pool.getConnection();
			// sql 문 작성
			String sql = "INSERT INTO member VALUES(?,?,?,?,?,?,default);";
			// 오류 처리
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, memberDTO.getId());
			ps.setString(2, memberDTO.getPw());
			ps.setString(3, memberDTO.getName());
			ps.setString(4, memberDTO.getTel());
			ps.setString(5, memberDTO.getEmail());
			ps.setString(6, memberDTO.getAddr());
			ps.executeUpdate();
			
			pool.freeConnection(con, ps);
			return "1";
		} catch (Exception e) {
			e.printStackTrace();
			return "2";
		}

	}// joinMember() : 메서드 종료
	
	
	// 네이버회원이 회원가입을 하는 메서드
	public void naverLogin(String id) {
		int rs = 0;
		try {
			// DB 연결
			con = pool.getConnection();
			// sql 문 작성
			String sql = "INSERT INTO member VALUES(?,'','',null,null,'',default)";
			PreparedStatement ps = con.prepareStatement(sql);// sql문 객체화
			ps.setString(1, id);
			rs = ps.executeUpdate();
			
			pool.freeConnection(con, ps);
			System.out.println(rs + "이면 네이버db성공");
		} catch (Exception e) {
			System.out.println("이면 네이버db실패");
			e.printStackTrace();
		}

	}//naverLogin() 메서드 종료 
	
	
	//카카오톡 회원이 회원가입하는 메서드
	public void kakaoLogin(String id) {
		int rs = 0;
		try {
			// DB 연결
			con = pool.getConnection();
			//sql문 작성
			String sql = "INSERT INTO member VALUES(?,'','',null,null,'',default)";
			PreparedStatement ps = con.prepareStatement(sql);// sql문 객체화
			ps.setString(1, id);
			rs = ps.executeUpdate();
			
			pool.freeConnection(con, ps);
			System.out.println(rs + "이면 카카오db연동성공");
		} catch (Exception e) {
			System.out.println("카카오 db연동 실패");
			e.printStackTrace();
		}
	}//kakaoLogin() 메서드 종료 
	
	
	
	//중복확인을 하는 메서드 
	public String idCheck(String id) {
		try {
			// DB 연결
			con = pool.getConnection();
			// sql 문 작성
			String sql = "SELECT id FROM member WHERE id = ?;";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			String tempId = "";
			while (rs.next()) {
				tempId = rs.getString("id");
			
			}
			pool.freeConnection(con, ps ,rs);
			if (tempId == null) {
				tempId = "";
			}
			return tempId;
			
		} catch (Exception e) {
			e.printStackTrace();
		} 
		
		return "";
	}//중복확인을 하는 메서드  끝
	
	
	/* 정보수정 */
	public void update(MemberDTO dto) {

		try {
			// DB 연결
			con = pool.getConnection();
			String sql = "update member set name = ?,pw = ?,email = ?, tel = ?, addr = ? where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getName());
			ps.setString(2, dto.getPw());
			ps.setString(3, dto.getEmail());
			ps.setString(4, dto.getTel());
			ps.setString(5, dto.getAddr());
			ps.setString(6, dto.getId());
			ps.executeUpdate();
			pool.freeConnection(con, ps);
			System.out.println("정보수정완료");

		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	/*회원탈퇴*/
	public void secession(String id) {			
		
		try {
		
			//DB 연결
			con = pool.getConnection();
			
			String sql ="delete from member where id =?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ps.executeUpdate();
			pool.freeConnection(con, ps);
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
	
	public ArrayList<MemberDTO> bring(String id) throws Exception {		/*정보수정눌렀을때값가져오기*/
		con = pool.getConnection();
		String sql = "select * from member where id = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, id);
			ResultSet rs = ps.executeQuery();
			ArrayList<MemberDTO> list = new ArrayList<>();
			if(rs.next()) {
				System.out.println("if문통과");
				id = rs.getString(1);
				String pw = rs.getString(2);
				String name = rs.getString(3);
				String tel = rs.getString(4);
				String email = rs.getString(5);
				String addr = rs.getString(6);
				String date = rs.getString(7);
				MemberDTO dto = new MemberDTO(id,name,pw,tel,email,addr,date);
				list.add(dto);
			}
			pool.freeConnection(con, ps, rs);
			return list;
	}

		
	public boolean inputPw(String id, String pw) throws Exception { /* 마이페이지 들어가기전에 패스워드입력 */
		boolean result;
		con = pool.getConnection();
		String sql = "select * from member where id = ? and pw= ?";
		PreparedStatement ps = con.prepareStatement(sql);
		ps.setString(1, id);
		ps.setString(2, pw);
		ResultSet rs = ps.executeQuery();
		if (rs.next()) {
			pool.freeConnection(con, ps ,rs);
			result = true;
		} else {
			pool.freeConnection(con, ps ,rs);
			result = false;
		}
		pool.freeConnection(con, ps ,rs);
		return result;
	}
	
	
	public ArrayList<MemberDTO> memberAll() throws Exception{ /* 모든 회원의 검색 */
		con = pool.getConnection();
		String sql = "select * from member";
		PreparedStatement ps = con.prepareStatement(sql);
		ArrayList<MemberDTO> list = new ArrayList<>();
		
		ResultSet rs = ps.executeQuery();
		while(rs.next()) {
			MemberDTO dto = new MemberDTO();
			dto.setId(rs.getString("id"));
			dto.setName(rs.getString("name"));
			dto.setPw(rs.getString("pw"));
			dto.setEmail(rs.getString("email"));
			dto.setTel(rs.getString("tel"));
			dto.setAddr(rs.getString("addr"));
			dto.setDate(rs.getString("date"));
			
			list.add(dto);
		}
		pool.freeConnection(con, ps ,rs);
		return list;
	}
	
	
	/*임시비밀번호등록*/
	public void temporary(MemberDTO dto) {
		try {
			con = pool.getConnection();
			String sql="update member set pw = ? where id = ? and name = ? and email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getPw());
			ps.setString(2, dto.getId());
			ps.setString(3, dto.getName());
			ps.setString(4, dto.getEmail());
			ps.executeUpdate();
			System.out.println("비밀번호수정완료");
		} catch (Exception e) {
			e.printStackTrace();
			System.out.println("비밀번호수정실패");
		}
	}

	/*비밀번호찾기*/
	public boolean forgotPassword(MemberDTO dto) {
		boolean result = false;
		try {
			con = pool.getConnection();
			String sql="select * from member where id =? and name = ? and email = ?";
			PreparedStatement ps = con.prepareStatement(sql);
			ps.setString(1, dto.getId());
			ps.setString(2, dto.getName());
			ps.setString(3, dto.getEmail());
			ResultSet rs = ps.executeQuery();
			if(rs.next()) { 
				result = true;
			}
		} catch (Exception e) {
			e.printStackTrace();
				result = false;
		}
		return result;
	}
	
}//MemberDAO 클래스 끝



