package DAODTO;

public class MemberDTO {

	private String id;//회원아이디
	private String name;//회원이름
	private String pw;//회원 비밀번호
	private String email;//회원 이메일
	private String tel;//회원 전화번호
	private String addr;//회원 주소
	private String date;//회원가입한 날짜 (자동생성)
	
	
	public MemberDTO() {//기본생성자
		super();
	}
	
	public MemberDTO(String id, String name, String pw, String email, String tel, String addr) {// 회원정보가져올때 사용할 매개변수가 존재하는 생성자(날짜제외)
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
	}
	
	
	public MemberDTO(String id, String name, String pw, String tel , String email , String addr, String date) {// 회원정보가져올때 사용할 매개변수가 존재하는 생성자(날짜포함)
		super();
		this.id = id;
		this.name = name;
		this.pw = pw;
		this.email = email;
		this.tel = tel;
		this.addr = addr;
		this.date = date;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getDate() {
		return date;
	}
	public void setDate(String date) {
		this.date = date;
	}
	
	
}//클래스 끝
