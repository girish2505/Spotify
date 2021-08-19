create database spotify;

use spotify;

create table userDetails(
id int primary key,
userName varchar(100));

insert into userDetails values (1,'girish'),(2,'eswar'),(3,'pavan'),(4,'sai');

select * from userDetails;

create table playlist(
playlistId int primary key);

alter table playlist
add playlistName varchar(100); 

alter table userDetails
add playlistId int; 

alter table userDetails
add foreign key (playlistId) references playlist(playlistId);

insert into playlist values (7,'playlist1'),(9,'playlist2'),(4,'playlist3'),(12,'playlist4');
update playlist set playlistName = 'pop' where playlistId = 7;

select * from playlist;

select * from userDetails;

update userDetails set playlistId = 7 where id = 1;

update userDetails set playlistId = 9 where id = 2;

update userDetails set playlistId = 4 where id = 3;

update userDetails set playlistId = 12 where id = 4;


create table track(
trackId int primary key,
userid int foreign key references userDetails(id),
playlistId int foreign key references playlist(playlistId));

insert into track values (29,1,7),(17,2,9),(45,3,4),(32,4,12);

select * from track;

select userDetails.id,userDetails.userName,track.playlistId,track.trackId from userDetails LEFT JOIN track on userDetails.id = track.userid where track.trackId = 32;
