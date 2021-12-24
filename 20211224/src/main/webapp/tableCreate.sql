select * from member;

insert into member values('micol@abc.com','1234','홍길동','ADMIN',null,null,null,null);

insert into member values('park@abc.com','1234','박길동','USER',null,null,null,null);


commit;

select * from member where id = 'parkpark@abc.com';