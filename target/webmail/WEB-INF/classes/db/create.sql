alter table messages drop constraint if exists FK_sender;
alter table messages_users drop constraint if exists FK_message;
alter table messages_users drop constraint if exists FK_receiver;
drop table if exists users;
drop table if exists messages_users;
drop table if exists messages;

create table users (id serial primary key, last_name varchar(255) not null, 
						first_name varchar(255) not null, photo bytea, mail varchar(255) not null, 
						password varchar(255) not null);
						
create table messages (id serial primary key, subject varchar(255), text varchar(255) not null, date date,
						file1 bytea, file2 bytea, sender_id int not null);
						
create table messages_users (messages_id int not null, users_id int not null, primary key (messages_id, users_id));
						
alter table messages add constraint FK_sender foreign key(sender_id) references users(id);
alter table messages_users add constraint FK_message foreign key(messages_id) references messages(id);
alter table messages_users add constraint FK_receiver foreign key(users_id) references users(id);