package DAODTO;

public class ReviewDTO {
   
   private int num;//고유번호 
   private String id;//사용자 아이디
   private String name;//상품 이름
   private String title;//리뷰 제목
   private String content;//리뷰 내용
   private String grade;//별점
   private String img;//이미지
   private String date;//날짜
   private double tempGrade;//
   
   
   public ReviewDTO(String name, double tempGrade) {
      super();
      this.name = name;
      this.tempGrade = tempGrade;
   }

   public ReviewDTO() {//기본생성자
      super();
   }
   
   public ReviewDTO(int num,String id, String name, String title, String content, String grade, String img) {
      super();
      this.num = num;
      this.id = id;
      this.name = name;
      this.title = title;
      this.content = content;
      this.grade = grade;
      this.img = img;
   
   }
   
   public ReviewDTO(String id, String name, String title, String content, String grade, String img, String date) {
      super();
      this.id = id;
      this.name = name;
      this.title = title;
      this.content = content;
      this.grade = grade;
      this.img = img;
      this.date = date;
   }


   
   
   
   public int getNum() {
      return num;
   }

   public void setNum(int num) {
      this.num = num;
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
   public String getContent() {
      return content;
   }
   public void setContent(String content) {
      this.content = content;
   }
   public String getGrade() {
      return grade;
   }
   public void setGrade(String grade) {
      this.grade = grade;
   }
   public String getImg() {
      return img;
   }
   public void setImg(String img) {
      this.img = img;
   }
   public String getDate() {
      return date;
   }
   public void setDate(String date) {
      this.date = date;
   }

   public String getTitle() {
      return title;
   }

   public void setTitle(String title) {
      this.title = title;
   }

   public double getTempGrade() {
      return tempGrade;
   }

   public void setTempGrade(double tempGrade) {
      this.tempGrade = tempGrade;
   }
   
}//클래스 끝

//리뷰테이블
//create table review(
//   id varchar(20) primary key,
//   name varchar(20),
//   content varchar(250),
//   grade varchar(20),
//   img varchar(100),
//   date TIMESTAMP DEFAULT NOW()
