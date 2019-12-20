drop table worker;
create table worker(          
    id          varchar2(20)  primary key,
    pwd         varchar2(20),
    name        varchar2(40),
    phone       varchar2(20)
);

alter table member drop primary key cascade;
drop table member;
create table member(   
    id         varchar2(20)  primary key,
    pwd        varchar2(20),     
    name       varchar2(40),
    email      varchar2(40),
    zip_num    varchar2(7),
    address    varchar2(100),
    phone      varchar2(20),
    useyn      char(1)       default 'y',
    indate     date          default sysdate
);

--------------------------------------------------
alter table product drop primary key cascade;
drop table product;
create table product(
    pseq       number(5)     primary key,
    name       varchar2(100),
    kind       char(1),   
    price1     number(7)     default '0',
    price2     number(7)     default '0',
    price3     number(7)     default '0',
    content    varchar2(500),
    image      varchar2(50)  default 'default.jpg',
    fImage		varchar2(50)  default 'null',
    sImage		varchar2(50)  default 'null',
    tImage 		varchar2(50)  default 'null',
    useyn      char(1)       default 'y',
    bestyn     char(1)       default 'n',
    indate     date          default sysdate  
);
drop sequence product_seq;
create sequence product_seq start with 1;
------------------------------------------------------

alter table cart drop primary key cascade;
drop table cart;
create table cart (
  cseq         number(10)    primary key,  -- 장바구니번호
  id           varchar(16)   references member(id),  -- 주문자 아이디(FK :　member.id) 
  pseq         number(5)     references product(pseq), -- 주문 상품번호(FK :product.pseq) 
  quantity     number(5)     default 1,        -- 주문 수량
  result       char(1)       default '1',      -- 1:미처리 2:처리
  indate       date          default SYSDATE   -- 주문일
);
drop sequence cart_seq;
create sequence cart_seq start with 1;

alter table orders drop primary key cascade;
drop table orders;
create table orders(
  oseq        number(10)    primary key,           -- 주문번호  
  id          varchar(16)   references member(id), -- 주문자 아이디
  indate      date          default sysdate       -- 주문일
);
drop sequence orders_seq;
create sequence orders_seq start with 1;

alter table order_detail drop primary key cascade;
drop table order_detail;
create table order_detail(
  odseq       number(10)   primary key,        -- 주문상세번호
  oseq        number(10)   references orders(oseq),   -- 주문번호  
  pseq        number(5)    references product(pseq),  -- 상품번호
  quantity    number(5)    default 1,                 -- 주문수량
  result      char(1)      default '1'                -- 1: 미처리 2: 처리     
);
drop sequence order_detail_seq;
create sequence order_detail_seq start with 1;

--Q&A 게시판은 고객이 쇼핑몰에서 제품의 문의사항 또는 배송문의와 같은 제반적인 사항에 대해서 질문을 하고자 할 때 사용한다. 
alter table qna drop primary key cascade;
drop table qna;
create table qna (
  qseq        number(5)    primary key,  -- 글번호 
  subject     varchar(300),            -- 제목
  content     varchar(1000),          -- 문의내용
  reply       varchar(1000),           -- 답변내용
  id          varchar(20),                 -- 작성자(FK : member.id) 
  rep         char(1)       default '1',        --1:답변 무  2:답변 유  
  indate      date default  sysdate     -- 작성일
); 
drop sequence qna_seq;
create sequence qna_seq start with 1;

-- 샘플 데이터 입력
insert into worker values('admin', 'admin', '홍관리', '010-777-7777');
insert into worker values('pinksung', 'pinksung', '명강사', '010-999-9696');

insert into member(id, pwd, name, email ,zip_num, address, phone) values
('one', '1111', '김나리', 'ppp123@gmail.com', '133-110', '서울시성동구성수동1가 1번지21호', '010-777-7777');
insert into member(id, pwd, name,email, zip_num, address, phone) values
('two', '2222', '이백합','bobo42@gmail.com', '130-120','서울시송파구잠실2동 리센츠 아파트 201동 505호', '011-123-4567');

--outer--
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '조넌롱코트', '1', '40000', '53900', '13900', '여성미 물씬 롱 코트입니다.', 'o1.gif','o1001.jpg','o1002.jpg','o1003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'뽀글이오픈가디건', '1', '20000', '28900', '8900', '귀여운 꼬불이 가디건입니다.', 'o2.gif','o2001.jpg', 'o2002.jpg', 'o2003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'트랜치 더블 코트', '1', '50000', '69800', '19800', '멋진 여자 스타일 아이템.', 'o3.gif','o3001.jpg', 'o3002.jpg', 'o3003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'누빔안감 숏 카라코트', '1', '30000', '44900', '14900', '귀여운 스타일 자켓.', 'o4.gif','o4001.jpg', 'o4002.jpg', 'o4003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'오버핏 퀄팅 패딩', '1', '40000', '60300', '20300', '찬바람이 불어와도 멋스럽게 연출하는 아이템입니다..', 'o5.gif','o5001.jpg', 'o5002.jpg', 'o5003.jpg','y');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'밍크안감 패딩점퍼', '1', '60000', '119000', '59000', '여성스러운 스타일 아이템.', 'o6.gif','o6001.jpg', 'o6002.jpg', 'o6003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '헤링본 더블 자켓', '1', '20000', '29900', '9900', '멋스러움 가득한 패딩입니다.', 'o7.gif','o7001.jpg', 'o7002.jpg', 'o7003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '안감 배색 롱 후드 패딩', '1', '30000', '44900', '14900', '멋스러움 가득한 패딩입니다.', 'o8.gif','o8001.jpg', 'o8002.jpg', 'o8003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'와주본딩 컬러 롱코트', '1', '50000', '69800', '19800', '멋진 여자 스타일 아이템.', 'o9.gif','o9001.jpg', 'o9002.jpg', 'o9003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'라운드 넥 롱 패딩', '1', '50000', '69800', '19800', '멋진 여자 스타일 아이템.', 'o10.gif','o10001.jpg', 'o10002.jpg', 'o10003.jpg','y');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval,'라쿤 퍼 숏패딩', '1', '40000', '69800', '29800', '멋스러움 가득한 패딩입니다.', 'o11.gif', 'o11001.jpg', 'o11002.jpg', 'o11003.jpg','n');



--top--
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '팔패드후드맨투맨 ', '2', 20000, 29800, 9800,'팔꿈치 패드 포인트 맨투맨 귀엽워요.',  't1.gif','t1001.jpg','t1002.jpg','t1003.jpg', 'y');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '나뭇잎자수 니트', '2', '15000', '20900', '5900', '이중넥 귀여운 니트', 't2.gif','t2001.jpg','t2002.jpg','t2003.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '도톰 울 혼방 후드셔츠', '2', '10000', '23900', '13900', '편안하면서 멋스러운 아이템입니다.', 't3.gif','t3001.jpg','t3002.jpg','t3003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage,bestyn) values(
product_seq.nextval, '지그제그 터틀넥 니트 ', '2', '10000', '19800', '9800','고급져 보이는 니트.', 't4.gif', 't4001.jpg','t4002.jpg','t4003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '도톰 백리본 니트조끼', '2', '10000', '19800', '9800', '이중넥 귀여운 니트', 't5.gif', 't5001.jpg','t5002.jpg','t5003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '도톰 세로 배색 니트', '2', '10000', '19800', '9800', '편안하고 멋스러운 아이템입니다..','t6.gif', 't6001.jpg','t6002.jpg','t6003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '팔꿈치 패치 티셔츠 ', '2', '10000', '19800', '9800','편안하고 멋스러운 디자인.', 't7.gif', 't7001.jpg','t7002.jpg','t7003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '언발 반목 니트', '2', '15000', '22900', '7900', '편안하고 멋스러운 니트', 't8.gif', 't8001.jpg','t8002.jpg','t8003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '펀칭 레이스 반목니트', '2', '10000', '22500', '12500', '부드럽고 여성스러운 아이템입니다.', 't9.gif','t9001.jpg','t9002.jpg','t9003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '드롭숄더 브이넥 니트', '2', '10000', '22500', '12500', '부드럽고 여성스러운 아이템입니다.', 't10.gif','t10001.jpg','t10002.jpg','t10003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '1+1포근한 기본니트', '2', '10000', '29800', '19800', '포근한 기본 니트 아이템입니다.', 't11.gif','t11001.jpg','t11002.jpg','t11003.jpg','n');



--pants--
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '기모 절개포켓 일자진', '3', '20000', '36800', '16800', '날씬하고 길어보이는 아이템입니다.', 'j1.gif', 'j1001.jpg','j1002.jpg','j1003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '잔체크기모슬렉스', '3', '20000', '29800', '9800', '신축성 좋은 슬렉스 다리도 길어보여요.', 'j2.gif','j2001.jpg','j2002.jpg','j2003.jpg','y');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '잔청세미부츠컷진', '3', '20000', '37900', '17900', '쭉쭉 짱짱 놀라운 신축력.', 'j3.gif','j3001.jpg','j3002.jpg','j3003.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '중청 슬림 일자진', '3', '10000', '29800', '19800', '다리가 곧아 보이는 예쁜 스타일.', 'j4.gif', 'j4001.jpg','j4002.jpg','j4003.jpg', 'n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '스판 기모 배기팬츠', '3', '10000', '26800', '16800', '레깅스처럼 쭉쭉 입은듯 안입은듯 편안해요.','j5.gif', 'j5001.jpg','j5002.jpg','j5003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '밍크 안감 일자진', '3', '20000', '35900', '15900', '밍크안감으로 따뜻해요.','j6.gif','j6001.jpg','j6002.jpg','j6003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '베레즈 기모 일자핏 카고진', '3', '10000', '28900', '18900', '밍크안감으로 따뜻해요.','j7.gif','j7001.jpg','j7002.jpg','j7003.jpg', 'n');


--onepiece-
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '니트후드롱원피스', '4', '10000', '19800', '9800', '날씬하고 길어보이는 아이템입니다.', 'os1.gif', 'os1001.jpg','os1002.jpg','os1003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, 'wool니트 원피스', '4', '10000', '19800', '9800', '부드럽고 여성스러운 아이템입니다.', 'os2.gif','os2001.jpg','os2002.jpg','os2003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '뷔스티에 트임 원피스', '4', '10000', '19800', '9800', '부드럽고 여성스러운 아이템입니다.', 'os3.gif','os3001.jpg','os3002.jpg','os3003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '벨트장식 헤링본 원피스', '4', '20000', '32900', '12900', '부드럽고 여성스러운 아이템입니다.', 'os4.gif','os4001.jpg','os4002.jpg','os4003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '헤이츠 체크스커트', '4', '10000', '22900', '12900', '부드럽고 여성스러운 아이템입니다.', 'os5.gif','os5001.jpg','os5002.jpg','os503.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '뒤트임 체크스커트', '4', '20000', '33900', '13900', '부드럽고 여성스러운 아이템입니다.', 'os6.gif','os6001.jpg','os6002.jpg','os6003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '스웨이드 단추스커트', '4', '10000', '19800', '9800', '부드럽고 여성스러운 아이템입니다.', 'os7.gif','os7001.jpg','os7002.jpg','os7003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '터틀넥 니트 원피스', '4', '10000', '24900', '14900', '부드럽고 여성스러운 아이템입니다.', 'os9.gif','os9001.jpg','os9002.jpg','os9003.jpg','n');



--sale--

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '뒤트임 롱 스커트', '5', '5000', '9900', '4900', '날씬하고 길어보이는 아이템입니다.', 's1.gif','s1001.jpg','s1002.jpg','s1003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '기모 폴라티 ', '5', '5000', '9900', '4900', '따듯한 폴라 미리 준비하세요.', 's2.gif','s2001.jpg','s2002.jpg','s2003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '면스판화이트진 ', '5', '10000', '15900', '5900', '다리가 길어 보이는 핏이에요.', 's3.gif','s3001.jpg','s3002.jpg','s3003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '베로나 롱코트 ', '5', '20000', '30600', '10600', '넘나 여성스러운  코트입니다.', 's4.gif', 's4001.jpg','s4002.jpg','s4003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '오리털 컬러 롱패딩', '5', '50000', '69800', '19800', '한 겨울까지 따뜻하게 착한가격으로 왔습니다..', 's5.gif', 's5001.jpg','s5002.jpg','s5003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, 'fur 카라넥 패딩', '5', '30000', '44900', '14900', '한 겨울 까지 포근한 착용감을 유지합니다.', 's6.gif', 's6001.jpg','s6002.jpg','s6003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '쉬폰 배색 니트', '5', '10000', '14900', '4900', '부드럽고 여성스러운 아이템입니다.', 's7.gif','s7001.jpg','s7002.jpg','s7003.jpg','n');

insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '옆트임 기모 슬렉스 ', '5', '20000', '24900', '4900', '다리가 길어보이는 아이템입니다.', 's8.gif','s8001.jpg','s8002.jpg','s8003.jpg','n');


--new--
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval,'오버핏 후드배색 패딩', '1', '30000', '47900', '17900', '후두및 배색으로 귀여움을 한껏 업 시켜줍니다.', 'o12.gif','o12001.jpg','o12002.jpg','o12003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '울 브이넥 원피스', '4', '10000', '24900', '14900', '부드럽고 여성스러운 아이템입니다.', 'os8.gif','os8001.jpg','os8002.jpg','os8003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '도로나 두줄 트레이닝', '3', '5000', '14900', '9900', '밍크안감으로 따뜻해요.','j8.gif', 'j8001.jpg','j8002.jpg','j8003.jpg','n');
insert into product(pseq, name, kind, price1, price2, price3, content, image,fImage,sImage,tImage, bestyn) values(
product_seq.nextval, '폴라 롤링 니트', '2', '15000', '20900', '5900', '목선이 길어보이는 아이템입니다..','t12.gif', 't12001.jpg','t12002.jpg','t12003.jpg','n');













insert into cart(cseq,id, pseq, quantity) values(cart_seq.nextval, 'one', 1, 1);

insert into orders(oseq, id) values(orders_seq.nextval, 'one');
insert into orders(oseq, id) values(orders_seq.nextval, 'one');
insert into orders(oseq, id) values(orders_seq.nextval, 'two');

insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 1, 1, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 1, 2, 5);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 2,  4, 3);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 3, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 2, 1);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 6, 2);
insert into order_detail(odseq, oseq, pseq, quantity) 
values(order_detail_seq.nextval, 3, 1, 2);

insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '테스트', '질문내용1', 'one');
update qna SET reply='답변내용', rep='2';

insert into qna (qseq, subject, content, id)
values(qna_seq.nextval, '테스트2', '질문내용2', 'one');
commit;

create or replace view cart_view
as
select o.cseq, o.id, o.pseq, m.name mname, p.name pname, 
o.quantity, o.indate, p.price2, o.result 
from cart o, member m, product p 
where o.id = m.id and o.pseq = p.pseq
and result='1';

create or replace view order_view
as
select d.odseq, o.oseq, o.id, o.indate, d.pseq,d.quantity, m.name mname,
m.zip_num, m.address, m.phone, p.name pname, p.price2, d.result   
from orders o, order_detail d, member m, product p 
where o.oseq=d.oseq and o.id = m.id and d.pseq = p.pseq;
           
-- 베스트 상품
create or replace view best_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from product  
      where bestyn='y' 
      order by indate desc)
where  rownum <=4;

-- 신상품
create or replace view new_pro_view
as
select pseq, name, price2, image 
from( select rownum, pseq, name, price2, image 
      from product  
      where useyn='y' 
      order by indate desc)
where  rownum <=4;