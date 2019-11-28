create table vocabulary_english2(
	id int not null auto_increment,
    word_2 varchar(200),
    description_2 varchar(200),
	primary key (id)
) charset=utf8;

select * from vocabulary_english2;

INSERT INTO `vocabulary_english2` (`word_2`, `description_2`) VALUES
("loyalty", "[명사]충실, 충성 , 충성심"),
("department", "[명사](정부·기업체·대학 등과 같은 조직의 한) 부서"),
("donor", "[명사]기부자, 기증자 , 헌혈자, (장기) 기증자");