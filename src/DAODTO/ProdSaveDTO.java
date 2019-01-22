package DAODTO;

public class ProdSaveDTO {
	private String code;
	private String thum;
	private String cate;
	private String name;
	private int price;
	private String detail;
	private String color;
	private String size;
	 
	public ProdSaveDTO(String code, String thum, String cate, String name, int price) {
		super();
		this.code = code;
		this.thum = thum;
		this.cate = cate;
		this.name = name;
		this.price = price;
	}


	public ProdSaveDTO(String code, String thum, String cate, String name, int price, String detail, String color,
			String size) {
		super();
		this.code = code;
		this.thum = thum;
		this.cate = cate;
		this.name = name;
		this.price = price;
		this.detail = detail;
		this.color = color;
		this.size = size;
	}


	public ProdSaveDTO() {
		super();
	}
	
	
	public ProdSaveDTO(String name, String cate) {
		super();
		this.cate = cate;
		this.name = name;
	}


	public String getCode() {
		return code;
	}


	public void setCode(String code) {
		this.code = code;
	}


	public String getThum() {
		return thum;
	}


	public void setThum(String thum) {
		this.thum = thum;
	}


	public String getCate() {
		return cate;
	}


	public void setCate(String cate) {
		this.cate = cate;
	}


	public String getName() {
		return name;
	}


	public void setName(String name) {
		this.name = name;
	}


	public int getPrice() {
		return price;
	}


	public void setPrice(int price) {
		this.price = price;
	}


	public String getDetail() {
		return detail;
	}


	public void setDetail(String detail) {
		this.detail = detail;
	}


	public String getColor() {
		return color;
	}


	public void setColor(String color) {
		this.color = color;
	}


	public String getSize() {
		return size;
	}


	public void setSize(String size) {
		this.size = size;
	}
}
