-- zboard
create table board
(
	no      int auto_increment comment 'post_number', -- post_number
	subject varchar(200)       comment 'subject',     -- subject
	body    text               comment 'contents',    -- contents
	wdate   datetime           comment 'post_date',   -- post_date
	mdate	datetime		   comment 'modify_date', -- modify_date
	hit     int default 0      comment 'view_number', -- view_number
	primary key(no)
);

-- attachment
create table attach
(
	fno     int auto_increment primary key comment 'file_number', -- file_number
	no   	int					  		   comment 'post_number', -- post_number
	fname   varchar(255)                   comment 'file_name',   -- file_name
	foreign key(no)            references board(no)
);

insert into board
(subject,body,wdate)
values
("Good night from Norway",
"It was a long day again, good job guys, good night then~",
curdate());