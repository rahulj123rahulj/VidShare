-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- 					Queries for UserAuth table  				--
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
use mydb;


select * from userAuth;
select * from user;
select * from video;
select * from videoSpecCount;
select * from videoView;
select * from subscriber;
describe videoView;
select * from comment;
select * from playlist;
select * from playlistVideo;
select * from watchlater;
select * from searchHistory;
select * from watchhistory;
select * from watchlater;
select * from likes;
DESCRIBE videoview;

select video.* from watchlater left outer join video on watchlater.videoId=video.idVideo where watchlater.userId=101;
describe video;

describe comment;

describe videospeccount;

describe likes;



select * from subscriber where userId=133 and subToId=102;

-- ----------------------------------------------------
-- 					subscribers
-- ----------------------------------------------------

create trigger subscribed_trigger
after insert on subscriber
FOR EACH ROW
  UPDATE user
  SET subscribed = subscribed + 1
  WHERE user.idUser = NEW.userId;

create trigger unsubscribed_trigger
after delete on subscriber
FOR EACH ROW
  UPDATE user
  SET subscribed = subscribed - 1
  WHERE user.idUser = OLD.userId;



create trigger subscriber_trigger
after insert on subscriber
FOR EACH ROW
  UPDATE user
  SET subscribers = subscribers + 1
  WHERE user.idUser = NEW.subToId;
  
create trigger unsubscriber_trigger
after delete on subscriber
FOR EACH ROW
  UPDATE user
  SET subscribers = subscribers - 1
  WHERE user.idUser = OLD.subToId;

drop trigger subscriber_trigger;
drop trigger subscribed_trigger;

-- ----------------------------------------------------
--  Trigger to create VideoSpecCount
-- ----------------------------------------------------

create trigger create_video_spec_count
 after insert on video 
for each row 
insert into videospeccount(idVideoSpecCount,ViewCount,likeCount,CommentCount,dislikeCount) 
values(NEW.idVideo,0,0,0,0) ;


CREATE TRIGGER update_view_count
AFTER INSERT ON videoView
FOR EACH ROW
  UPDATE VideoSpecCount
  SET ViewCount = ViewCount + 1
  WHERE idVideoSpecCount = NEW.video_Id;




CREATE TRIGGER update_like_count
AFTER INSERT ON likes
FOR EACH ROW
  UPDATE VideoSpecCount
  SET likeCount = likeCount + 1
  WHERE idVideoSpecCount = NEW.video_Id;
  


  
CREATE TRIGGER update_unlike_count
AFTER DELETE ON likes
FOR EACH ROW
  UPDATE VideoSpecCount
  SET likeCount = likeCount - 1
  WHERE idVideoSpecCount = OLD.video_Id;
  
  
select * from likes;
  
select * from videoSpecCount;

CREATE TRIGGER update_comment_count
AFTER INSERT ON comment
FOR EACH ROW
  UPDATE VideoSpecCount
  SET commentCount = commentCount + 1
  WHERE idVideoSpecCount = NEW.videoId;

select * from comment;
-- --------------------------------------------------------------
-- To check if the user exists in the system
-- ----------------------------------------------------------------

SELECT COUNT(*) FROM UserAuth WHERE userName="Saurabh_Kesarwani" and password="Sau123@";

 
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
-- 					Queries for User table 						--
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------



-- ------------------------------------------
-- get all videos made by a user
-- ----------------------------------------

select User.iduser,User.firstName,user.lastName,Video.idVideo,Video.VideoTitle,Video.videoDesc 
from Video join user 
on Video.postedByUser=User.idUser 
where postedByUser='102' or postedByUser="101";


select * from Video;

-- -------------------------------------------------------------------------------------
-- list of user that posted highest number of videos;
-- -------------------------------------------------------------------------------------
 
select postedbyUser,User.firstName,count(postedByUser) as Video_count 
from Video inner join User on Video.postedByUser=User.idUser 
group by postedByUser
order by Video_count desc;


-- ---------------------------------------------------------------------------------------------------
-- List of all the users subscribed by a particular user according to the sequence the user subscribed;
-- ---------------------------------------------------------------------------------------------------

select * from subscriber;

SELECT subscriber.userId,u2.firstName as subscribed_to_name,subscriber.createTime,subscriber.subToId as subscribedto_id FROM subscriber JOIN user as u1  join user as u2 on u1.idUser=subscriber.userId and  subscriber.subToId=u2.idUser WHERE u1.idUser = '101' ORDER BY createTime ASC;


-- alter table  playlist rename column  playlistNamel to playlistName;
select * from playlist;

-- --------------------------------------------------------
-- 	all the playlist of a user;
-- --------------------------------------------------------

select iduser,firstName,lastName,playlistName 
from playlist join user 
on userId=idUser;

-- ----------------------------------------------------------------
-- all the video of the plalist of a specified user
-- ----------------------------------------------------------------

select * from playlistVideo;
select * from playlist;

select User.idUser,firstName,user.lastName,playlist.idplaylist,playlist.playlistName,Video.videoTitle
 from user join playlist on  idUser=userId 
 join playlistVideo on idPlaylist=playlistId 
 join video on videoId=idVideo where iduser=103;

-- ---------------------------------------------------------------
-- videos of all the user that 102 subscribe to 
-- ----------------------------------------------------------------

select * from subscriber;

select u1.idUser as user,u1.firstName,u1.lastName,u2.idUser as sub_toId,u2.firstname,u2.lastName,v.videoTitle
 from user as u1 join subscriber as sub on  u1.idUser=sub.userId 
 join user as u2 on sub.subToID=u2.idUser
  right join video as v on sub.subToID=v.postedByUser 
 where u1.idUser=101;

select u1.idUser as user,u1.firstName,u1.lastName,u2.idUser as sub_toId,u2.firstname,u2.lastName
 from user as u1 join subscriber as sub on  u1.idUser=sub.userId 
 join user as u2 on sub.subToID=u2.idUser
 where u1.idUser=102;
 


select v.idVideo,v.videotitle,v.videoDesc,v.createTime
 from user as u1 join subscriber as sub on  u1.idUser=sub.userId 
 join user as u2 on sub.subToID=u2.idUser
  join video as v on sub.subToID=v.postedByUser 
 where u1.idUser=101
 order by v.createTime DESC;

 SELECT * FROM Video ORDER BY RAND() LIMIT 10;
 
 
-- ---------------------------------------------------------------
-- All text search history according to the recent ones;		 
-- ---------------------------------------------------------------

select * from searchhistory;

select * from searchhistory where userId=106
	order by createTime ASC;
    
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------
--  					Queries for Videos
-- ---------------------------------------------------------------
-- ---------------------------------------------------------------

-- ---------------------------------------------------------------
-- 						Videos with all of their specification
-- ----------------------------------------------------------------
select idVideo,videoTitle,likeCount,commentCount,viewCount from video
join videoSpecCount
on idVideo=idVideoSpecCount;


-- --------------------------------------------------------------
-- 				video with most number of likes
-- --------------------------------------------------------------
select videoId,videoTitle,likeCount from video
join videoSpecCount
on idVideo=videoId order by likeCount DESC LIMIT 2;

-- -------------------------------------------------------------
-- 				order videos by latest uploaded manner
-- -------------------------------------------------------------

select idVideo,videoTitle,videodesc,createTime from video
order by createTime DESC;


-- ------------------------------------------------------------
-- ------------------------------------------------------------
-- 						Comments
-- ------------------------------------------------------------
-- ------------------------------------------------------------
-- ------------------------------------------------------------
-- show comments on particular videos
-- ------------------------------------------------------------

select * from comment where videoId=201;

-- ------------------------------------------------------------
-- 				all replies to the comment;
-- ------------------------------------------------------------
select * from comment ;

select c1.idComment,c1.content,c1.videoId,c2.content as reply,c2.userId as replyByUser,c2.createTime 
from comment as c1 join comment as c2 
on c1.idComment=c2.parentComment where c2.isReply=1 and c1.idComment=1; 

use mydb;


with recursive replies as (
SELECT idComment as parent_id,content as parent_content,NULL as child_id,NULL as reply,NULL as creationtime from comment WHERE isReply = 0
UNION ALL
SELECT * FROM 
(SELECT c1.idComment as parent_id,c1.content as parent_content,c2.idComment as child_id,c2.content as reply,c2.createTime as creationtime 
from comment c1 join comment c2 on c2.parentComment=c1.idcomment 
WHERE c2.isReply = 1 ) as child order by creationtime)
select * from replies where child_id is not NULL;

select * from comment;



-- 
select * from video;
-- 108 akash rong 209 video id
select * from user join video where idUser=postedByUser ;
SET FOREIGN_KEY_CHECKS=0; -- to disable them
SET FOREIGN_KEY_CHECKS=1; -- to re-enable them

delete from User where idUser=108;

select * from user;
-- ----------------------------------------------
-- 		all videos in watch later
-- ----------------------------------------------

select watchlater.userId,watchlater.videoId,watchlater.createTime,video.videoTitle,video.videoDesc 
from watchlater join video on videoId=idVideo where watchlater.userId=102;

ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Rahul@123';



ALTER USER 'root'@'localhost' IDENTIFIED WITH mysql_native_password BY 'Rahul@123';
