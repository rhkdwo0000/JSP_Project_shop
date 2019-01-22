package DAODTO;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ProdSaveDAO {
	DBConnectionMgr pool;
	Connection con;
	PreparedStatement ps;
	public ProdSaveDAO() {
		pool = DBConnectionMgr.getInstance();
}

	
/*상품등록하기*/	
	public boolean prodsave(ProdSaveDTO prodsavedto) throws Exception {
		con = pool.getConnection();
		boolean result = false;

		String sql = "insert into product values(?,?,?,?,?,?,?,?)";
		
		ps = con.prepareStatement(sql);

		ps.setString(1, prodsavedto.getCode());
		ps.setString(2, prodsavedto.getThum());
		ps.setString(3, prodsavedto.getCate());
		ps.setString(4, prodsavedto.getName());
		ps.setInt(5, prodsavedto.getPrice());
		ps.setString(6, prodsavedto.getDetail());
		ps.setString(7, prodsavedto.getColor());
		ps.setString(8, prodsavedto.getSize());
		int rs = ps.executeUpdate();

		if (rs > 0) {
			result = true;
		}
		pool.freeConnection(con, ps);
		return result;
	}
	
//전체상품 목록 가져오기
	public ArrayList<ProdSaveDTO> prodlist() throws Exception {
		con = pool.getConnection();
		String sql = "select * from product";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<ProdSaveDTO> list = new ArrayList<>();

		while (rs.next()) {
			ProdSaveDTO prodsavedto = new ProdSaveDTO();
				prodsavedto.setCode(rs.getString("code"));
				prodsavedto.setThum(rs.getString("thum"));
				prodsavedto.setCate(rs.getString("cate"));
				prodsavedto.setName(rs.getString("name"));
				prodsavedto.setPrice(rs.getInt("price"));
				prodsavedto.setDetail(rs.getString("detail"));
				prodsavedto.setColor(rs.getString("color"));
				prodsavedto.setSize(rs.getString("size"));
				list.add(prodsavedto);
			}

			pool.freeConnection(con, ps);
			return list;
		}	
	
	
//TOP카테고리 상품 가져오기
	public ArrayList<ProdSaveDTO> toplist() throws Exception {
		con = pool.getConnection();

		String sql = "select * from product where product.cate = 'TOP'";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<ProdSaveDTO> list = new ArrayList<>();

		while (rs.next()) {
			ProdSaveDTO dto = new ProdSaveDTO();
			dto.setCode(rs.getString("code"));
			dto.setThum(rs.getString("thum"));
			dto.setCate(rs.getString("cate"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getInt("price"));
			dto.setDetail(rs.getString("detail"));
			list.add(dto);
		}
			pool.freeConnection(con, ps);
			return list;
	}
	
//BOTTOM카테고리 상품 가져오기
	public ArrayList<ProdSaveDTO> bottomlist() throws Exception {
		con = pool.getConnection();

		String sql = "select * from product where product.cate = 'BOTTOM'";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<ProdSaveDTO> list = new ArrayList<>();

		while (rs.next()) {
			ProdSaveDTO bottomlist = new ProdSaveDTO();
			bottomlist.setCode(rs.getString("code"));
			bottomlist.setThum(rs.getString("thum"));
			bottomlist.setCate(rs.getString("cate"));
			bottomlist.setName(rs.getString("name"));
			bottomlist.setPrice(rs.getInt("price"));
			bottomlist.setDetail(rs.getString("detail"));
			list.add(bottomlist);
		}
			pool.freeConnection(con, ps);
			return list;
		}
	

	
	
//제품코드로 상품 정보 가져오기(상세페이지)	
	public ProdSaveDTO prodinfo(String code) throws Exception {
		con = pool.getConnection();

		String sql = "select * from product where code='" + code + "'";

		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ProdSaveDTO dto = new ProdSaveDTO();
		while (rs.next()) {
			dto.setCode(rs.getString("code"));
			dto.setThum(rs.getString("thum"));
			dto.setCate(rs.getString("cate"));
			dto.setName(rs.getString("name"));
			dto.setPrice(rs.getInt("price"));
			dto.setDetail(rs.getString("detail"));
			dto.setColor(rs.getString("Color"));
			dto.setSize(rs.getString("Size"));
		}
		pool.freeConnection(con, ps);
		return dto;
	}	
	
	

//理쒓렐蹂� �긽�뭹紐⑸줉
	public ProdSaveDTO prod_viewlist(String code) throws Exception {
		con = pool.getConnection();
		String sql = "select thum,name from product where code='"+code+"'";
		
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		ProdSaveDTO productSavedto = new ProdSaveDTO();
		while (rs.next()) {
			productSavedto.setThum(rs.getString("thum"));
			productSavedto.setName(rs.getString("name"));
		}
		pool.freeConnection(con, ps);
		return productSavedto;
	}


	
//�젣�뭹�쓽 �긽�꽭�럹�씠吏��뿉 �젣�뭹 �젙蹂� 蹂댁뿬二쇨린
	

//援щℓ�씠�젰 �닚�쐞蹂꾨줈 蹂댁뿬二쇨린
	public ArrayList<ProdSaveDTO> prodlistAll(String kind) throws Exception {
		con = pool.getConnection();
		
		String sql = "select pname , cate , temp , case\r\n" + 
				"when @pre=temp then @rank\r\n" + 
				"when @pre:=temp then @rank := @rank+1\r\n" + 
				"end as rank\r\n" + 
				"from (select pname, cate, count( * ) as temp  , @pre:= null , @rank:=0 from (select  buylist.pname , product.cate from buylist,product where product.name = buylist.pname) AS asd   where cate=? group by pname order by  cate desc ,  temp desc ) as qt limit 10;\r\n" + 
				"";
		ps = con.prepareStatement(sql);
		ps.setString(1, kind);
		ResultSet rs = ps.executeQuery();

		ArrayList<ProdSaveDTO> list = new ArrayList<>();

		while (rs.next()) {
			ProdSaveDTO dto = new ProdSaveDTO();
			dto.setName(rs.getString("pname"));
			dto.setSize(rs.getString("temp"));
			dto.setCate(rs.getString("cate"));
			dto.setColor(rs.getString("rank"));
			list.add(dto);
		}
		
		pool.freeConnection(con, ps ,rs);
		return list;
	}	
	
	public ArrayList<ProdSaveDTO> prodlistAllBest() throws Exception {
		con = pool.getConnection();
		
		String sql = "select pname , cate , temp , case\r\n" + 
					"when @pre=temp then @rank\r\n" + 
					"when @pre:=temp then @rank := @rank+1\r\n" + 
					"end as rank\r\n" + 
					"from (select pname, cate, count( * ) as temp  , @pre:= null , @rank:=0 from (select  buylist.pname , product.cate from buylist,product where product.name = buylist.pname) AS asd  group by pname order by temp desc ) as qt limit 10;\r\n" + 
					"";
		ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();

		ArrayList<ProdSaveDTO> list = new ArrayList<>();

		while (rs.next()) {
			ProdSaveDTO dto = new ProdSaveDTO();
			dto.setName(rs.getString("pname"));
			dto.setSize(rs.getString("temp"));
			dto.setCate(rs.getString("cate"));
			dto.setColor(rs.getString("rank"));
			list.add(dto);
		}
		
		pool.freeConnection(con, ps ,rs);
		return list;
	}		
	
//踰좎뒪�듃 �긽�뭹 紐⑸줉 媛��졇�삤湲�	
	public ArrayList<ProdSaveDTO> bestSelect(String[] best) {
		
		ArrayList<ProdSaveDTO> list = new ArrayList<>();
		try {
			con = pool.getConnection();
			ResultSet rs = null;
			for (int i = 0; i < 5; i++) {
				String sql = "select * from Product where name = '"+ best[i].split(",")[0]+"'";
				ps = con.prepareStatement(sql);
				rs = ps.executeQuery();
				while (rs.next()) {
					String code = rs.getString("code");
					String thum = rs.getString("thum");
					String cate = rs.getString("cate");
					String name = rs.getString("name");
					int price = rs.getInt("price");
					ProdSaveDTO dto = new ProdSaveDTO(code, thum, cate, name, price);
					list.add(dto);
				}
			}
			
			pool.freeConnection(con, ps ,rs);
			return list;
			
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}	

//�븘�씠�뵒蹂� 援щℓ�븳 �긽�뭹�씠由꾧낵 移댄뀒怨좊━ 媛��졇�삤湲�
	public ArrayList<ProdSaveDTO> select(String id) {
		ArrayList<ProdSaveDTO> list = new ArrayList<>();
	try {
		con = pool.getConnection();
		String sql = "select DISTINCT buylist.pname,cate from product,buylist where buylist.id = '" + id + "' and product.name = buylist.pname";
		PreparedStatement ps = con.prepareStatement(sql);
		ResultSet rs = ps.executeQuery();
		
		while (rs.next()) {
			String name = rs.getString(1);
			String cate = rs.getString(2);
			ProdSaveDTO dto = new ProdSaveDTO(name,cate);
			list.add(dto);
		}
		pool.freeConnection(con, ps, rs);
		return list;
	
	} catch (Exception e) {
		e.printStackTrace();
		return null;
	}
}
	
	
}