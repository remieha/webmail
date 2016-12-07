alter table messages drop constraint if exists FK_sender;
alter table messages_users drop constraint if exists FK_message;
alter table messages_users drop constraint if exists FK_receiver;
drop table if exists users;
drop table if exists messages_users;
drop table if exists messages;

create table users (id serial primary key, last_name varchar(255) not null, 
						first_name varchar(255) not null, photo bytea, mail varchar(255) not null unique, 
						password varchar(255) not null);
						
create table messages (id serial primary key, subject varchar(255), text text not null, date timestamp,
						file1 bytea, file2 bytea, sender_id int not null);
						
create table messages_users (messages_id int not null, users_id int not null, primary key (messages_id, users_id));
						
alter table messages add constraint FK_sender foreign key(sender_id) references users(id);
alter table messages_users add constraint FK_message foreign key(messages_id) references messages(id);
alter table messages_users add constraint FK_receiver foreign key(users_id) references users(id);

--insert into messages (subject, text, date, time, sender_id) values ('subject1', 'text1', current_date, CURRENT_TIME, 4);
--insert into messages (subject, text, date, time, sender_id) values ('subject2', 'text2', current_date, CURRENT_TIME, 3);
--insert into messages (subject, text, date, time, sender_id) values ('subject3', 'text3', current_date, CURRENT_TIME, 4);
--insert into messages (subject, text, date, time, sender_id) values ('subject4', 'text4', current_date, CURRENT_TIME, 1);
--insert into messages (subject, text, date, time, sender_id) values ('subject5', 'text5', current_date, CURRENT_TIME, 3);
--insert into messages (subject, text, date, time, sender_id) values ('subject6', 'text6', current_date, CURRENT_TIME, 3);

insert into messages (subject, text, date, sender_id) values ('subject2', 'text2', localtimestamp, 1);
insert into messages (subject, text, date, sender_id) values ('subject3', 'text3', localtimestamp, 3);
insert into messages (subject, text, date, sender_id) values ('subject4', 'text4', localtimestamp, 4);
insert into messages (subject, text, date, sender_id) values ('subject5', 'text5', localtimestamp, 3);
insert into messages (subject, text, date, sender_id) values ('subject6', 'text6', localtimestamp, 1);
insert into messages (subject, text, date, sender_id) values ('subject7', 'text7', localtimestamp, 4);