alter table messages drop constraint if exists FK_sender;
alter table message_receiver drop constraint if exists FK_message;
alter table message_receiver drop constraint if exists FK_receiver;
drop table if exists users;
drop table if exists message_receiver;
drop table if exists messages;

create table users (id serial primary key, last_name varchar(255) not null, 
						first_name varchar(255) not null, photo bytea, mail varchar(255) not null, 
						password varchar(255) not null);
						
create table messages (id serial primary key, subject varchar(255), text varchar(255) not null, 
						file1 bytea, file2 bytea, users_id int not null);
						
create table message_receiver (messages_id int not null, users_id int not null, primary key (messages_id, users_id));
						
alter table messages add constraint FK_sender foreign key(users_id) references users(id);
alter table message_receiver add constraint FK_message foreign key(messages_id) references messages(id);
alter table message_receiver add constraint FK_receiver foreign key(users_id) references users(id);