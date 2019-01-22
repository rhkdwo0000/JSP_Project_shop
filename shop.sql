/*회원 테이블*/
create table member(
	id varchar(20) primary key not null,
	pw varchar(20),
	name varchar(15),
	tel varchar(15) unique,
	email varchar(40) unique,
	addr varchar(120),
	date TIMESTAMP DEFAULT NOW()
);


/*리뷰게시판 */
create table review(
	num int auto_increment primary key,
	id varchar(20),
	name varchar(20),
	title varchar(100),
	content varchar(250),
	grade varchar(20),
	img varchar(100),
	date TIMESTAMP DEFAULT NOW()
);
/*관리자 게시판의 댓글*/
create table adminreply(
	num int(15),
	name varchar(15),
	date varchar(10),
	cont varchar(50)
);

/*장바구니 리스트*/
create table basket(
	num int auto_increment primary key,
	thum varchar(100),
	name varchar(50),
	size varchar(10),
	color varchar(10),
	quantity int,
	price int,
	id varchar(30),
	today varchar(20)
);


/*구매내역*/
create table buylist (
	bname varchar(20),
	tel varchar(15),
	addr varchar(120),
	pay varchar(20),
	memo varchar(5000),
	total int,
	thum varchar(50),
	pname varchar(20),
	size varchar(500),
	color varchar(500),
	quantity int,
	id varchar(30),
	today varchar(20)
);

/*상품목록 테이블*/
create table product(
	code varchar(10) primary key,
	thum varchar(50),
	cate varchar(10),
	name varchar(20),
	price int(10),
	detail varchar(5000),
	color varchar(500),
	size varchar(500)
);

/*관리자 게시판*/
create table adminboard(
	num int auto_increment primary key,
	category varchar(10),
	title varchar(50) not null,
	cont varchar(1000) not null,
	date varchar(10),
	name varchar(10)
);

/*각 테이블 목록보기*/
select * from member;
select * from product;
select * from buylist;
select * from basket;
select * from review;

/*테이블 삭제 */
drop table member;
drop table product;
drop table buylist;
drop table basket;
drop table review;

/*관리자 아이디*/
insert into member values('admin123','*admin123*','관리자','01020908019','choimy1118@naver.com','경기도 시흥시 정왕동',default);


/*상품등록*/
insert into product values('19011001','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011002','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011003','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011004','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011005','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011006','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011007','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011008','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011009','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011010','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011011','top1.gif','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011012','bottom2.gif','Bottom','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');


insert into product values('19012001','top01.png','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012002','bottom01.png','Bottom','상품6',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012003','top02.png','Top','상품2',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012004','bottom02.png','Bottom','상품7',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012005','top03.png','Top','상품3',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012006','bottom03.png','Bottom','상품8',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012007','top04.png','Top','상품4',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012008','bottom04.png','Bottom','상품9',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012009','top05.png','Top','상품5',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012010','bottom05.png','Bottom','상품10',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');



/*관리자 게시판의 게시물 등록*/
insert into adminboard values(default,'[배송정보]','테스트1','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트2','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트3','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트4','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트5','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트6','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트7','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트8','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트9','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트10','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트11','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트12','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트13','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트14','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트15','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트16','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트17','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트18','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트19','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트20','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트21','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트22','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트1','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트2','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트3','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트4','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트5','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트6','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트7','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트8','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트9','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트10','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트11','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트12','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트13','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트14','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트15','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트16','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트17','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트18','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트19','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트20','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트21','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트22','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트22','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트23','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트24','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트25','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트26','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트27','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트28','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트29','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트30','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트31','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트32','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트33','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트34','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트35','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트36','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트37','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트38','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트39','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트40','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트41','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트42','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트43','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트44','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트45','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트46','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트47','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트48','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트49','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트50','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트51','<p>테스트입니다.</p>','2019-01-06','관리자');
insert into adminboard values(default,'[배송정보]','테스트52','<p>테스트입니다.</p>','2019-01-06','관리자');





insert into product values('19012001','top01.png','Top','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012002','bottom01.png','Bottom','상품6',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012003','top02.png','Top','상품2',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012004','bottom02.png','Bottom','상품7',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012005','top03.png','Top','상품3',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012006','bottom03.png','Bottom','상품8',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012007','top04.png','Top','상품4',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012008','bottom04.png','Bottom','상품9',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012009','top05.png','Top','상품5',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19012010','bottom05.png','Bottom','상품10',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');

insert into buylist values('aa','01000000000','aa','aa','aa',50000,'top01.png','상품1','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'top02.png','상품2','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'top03.png','상품3','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'top04.png','상품4','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'top05.png','상품5','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom01.png','상품6','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom02.png','상품7','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom03.png','상품8','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom04.png','상품9','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품1','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품2','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품3','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품4','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품5','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품6','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품7','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품8','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품9','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom05.png','상품10','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'bottom05.png','상품10','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품1','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품2','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품11','S','red','1','rhkdwo000000','2019-01-21');
insert into buylist values('aa','01000000000','aa','aa','aa',50000,'item1.jpg','상품11','S','red','1','rhkdwo000000','2019-01-21');

select  buylist.pname , product.cate from buylist,product where product.name = buylist.pname;

select DISTINCT buylist.pname,cate from product,buylist where buylist.id = 'rhkdwo000000' and product.name = buylist.pname;

select avg(grade),review.name from review,product where product.cate = 'top' and review.name = product.name group by review.name;

select count(distinct name) from productBuy where name;

select productBuy.name, count( * ) as size from productBuy,product group by productBuy.name desc order by size desc where product.cate ='top' and product.name = productBuy.name;

select name, cate, count( * ) as temp from (select  productBuy.name , product.cate from productBuy,product where product.code = productBuy.code) AS asd   where cate='TOP' group by name order by  cate desc ,  temp desc ;

select * from (select  productBuy.name , product.cate from productBuy,product where product.code = productBuy.code) AS asd;

select  productBuy.name , product.cate from productBuy,product where product.code = productBuy.code;


set @pre = null;
set @rank = 0;
select name , cate , temp , case
when @pre=temp then @rank
when @pre:=temp then @rank := @rank+1
end as rank
from (select name, cate, count( * ) as temp from (select  productBuy.name , product.cate from productBuy,product where product.code = productBuy.code) AS asd   where cate='TOP' group by name order by  cate desc ,  temp desc ) as qt limit 10;

select pname , cate , temp , case
when @pre=temp then @rank
when @pre:=temp then @rank := @rank+1
end as rank
from (select pname, cate, count( * ) as temp  , @pre:= null , @rank:=0 from (select  buylist.pname , product.cate from buylist,product where product.name = buylist.pname) AS asd  group by pname order by temp desc ) as qt limit 10;

select avg(grade),review.name from review,product where review.name = product.name group by review.name;


/*회원테이블 임시 값 넣기 */
insert into member values('aaaaaaaaaa','aaaaaaaaaa!','테스트ㄱ','01011111111','naver@1naver.com','충북');
insert into member values('aaaaaaaaab','aaaaaaaaaa!','테스트ㄴ','01011111112','naver@2naver.com','충북');
insert into member values('aaaaaaaaac','aaaaaaaaaa!','테스트ㄷ','01011111113','naver@3naver.com','충북');
insert into member values('aaaaaaaaad','aaaaaaaaaa!','테스트ㄹ','01011111114','naver@4naver.com','충북');
insert into member values('aaaaaaaaae','aaaaaaaaaa!','테스트ㅁ','01011111115','naver@5naver.com','충북');
insert into member values('aaaaaaaaaf','aaaaaaaaaa!','테스트ㅂ','01011111116','naver@6naver.com','충북');
insert into member values('aaaaaaaaag','aaaaaaaaaa!','테스트ㅅ','01011111117','naver@7naver.com','충북');
insert into member values('aaaaaaaaah','aaaaaaaaaa!','테스트ㅇ','01011111118','naver@8naver.com','충북');
insert into member values('aaaaaaaaai','aaaaaaaaaa!','테스트ㅈ','01011111119','naver@9naver.com','충북');
insert into member values('aaaaaaaaaj','aaaaaaaaaa!','테스트ㅊ','01011111120','naver@0naver.com','충북');
insert into member values('aaaaaaaaak','aaaaaaaaaa!','테스트ㅋ','01011111121','naver@10naver.com','충북');


/*상품등록 테스트*/
insert into product values('1','2!','top','1','5','6','7','8');
insert into product values('2','2!','top','2','5','6','7','8');
insert into product values('3','2!','top','3','5','6','7','8');
insert into product values('4','2!','top','4','5','6','7','8');
insert into product values('5','2!','top','5','5','6','7','8');
insert into product values('6','2!','top','6','5','6','7','8');
insert into product values('7','2!','bottom','11','5','6','7','8');
insert into product values('8','2!','bottom','22','5','6','7','8');
insert into product values('9','2!','bottom','33','5','6','7','8');
insert into product values('10','2!','bottom','44','5','6','7','8');
insert into product values('11','2!','bottom','55','5','6','7','8');
insert into product values('12','2!','bottom','66','5','6','7','8');


insert into product values('19011001','item1.jpg','TOP','상품1',25600,'상품1에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011002','item2.jpg','TOP','상품2',25600,'상품2에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');

insert into product values('19011011','item10.jpg','TOP','상품11',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011012','item10.jpg','TOP','상품12',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011013','item10.jpg','TOP','상품13',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011014','item10.jpg','TOP','상품14',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011015','item10.jpg','TOP','상품15',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011016','item10.jpg','TOP','상품16',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011017','item10.jpg','TOP','상품17',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011018','item10.jpg','TOP','상품18',25600,'상품10에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');
insert into product values('19011019','item11.jpg','BOTTOM','상품19',25600,'상품11에대한 설명입니다.','/Red/Orange/Yellow/Blue/Sky/Violet/','/S/M/L');

/*상품 리뷰 테스트*/
insert into review values(default,'rhkdwo0000','상품1','19011016','1','1','top01.png',default);
insert into review values(default,'rhkdwo0000','상품2','19011016','1','2','top02.png',default);
insert into review values(default,'rhkdwo0000','상품3','19011016','1','3','top03.png',default);
insert into review values(default,'rhkdwo0000','상품4','19011016','1','4','top04.png',default);
insert into review values(default,'rhkdwo0000','상품5','19011016','1','5','top05.png',default);
insert into review values(default,'rhkdwo0000','상품6','19011016','1','1','bottom01.png',default);
insert into review values(default,'rhkdwo0000','상품7','19011016','1','2','bottom02.png',default);
insert into review values(default,'rhkdwo0000','상품8','19011016','1','3','bottom03.png',default);
insert into review values(default,'rhkdwo0000','상품9','19011016','1','4','bottom04.png',default);
insert into review values(default,'rhkdwo0000','상품10','19011016','1','5','bottom05.png',default);
insert into review values(default,'rhkdwo0000','상품8','19011016','1','1','15.png',default);
insert into review values(default,'rhkdwo0000','상품10','19011016','1','2','16.png',default);
insert into review values(default,'rhkdwo0000','상품1','19011016','1','3','17.png',default);
insert into review values(default,'rhkdwo0000','상품2','19011016','1','4','18.png',default);
insert into review values(default,'rhkdwo0000','상품4','19011016','1','5','19.png',default);

insert into review values(default,'rhkdwo0000','상품5','19011016','1','1','1.png',default);
insert into review values(default,'rhkdwo0000','상품8','19011016','1','2','1.png',default);
insert into review values(default,'rhkdwo0000','상품10','19011016','1','3','6',default);
insert into review values(default,'rhkdwo0000','상품1','19011016','1','4','6',default);
insert into review values(default,'rhkdwo0000','상품2','19011016','1','5','6',default);
insert into review values(default,'rhkdwo0000','상품4','19011016','1','1','6',default);
insert into review values(default,'rhkdwo0000','상품5','19011016','1','2','6',default);
insert into review values(default,'rhkdwo0000','상품8','19011016','1','3','6',default);
insert into review values(default,'rhkdwo0000','상품10','19011016','1','4','6',default);


/*리뷰게시판 id에 맞는 상품 이름 가져오기 select문*/
select productBuy.name,cate from product,productBuy where productBuy.id = 'rhkdwo0000' and product.name = productBuy.name;

/* 테스트용 select문*/
select productBuy.name,cate from product,productBuy where productBuy.id = '1' and product.name = (select name from productBuy where thum ='2');


/*어드민 계정*/
insert into member values('admin','admin','관리자','01011111121','naver@10naver.com','충북',default);









