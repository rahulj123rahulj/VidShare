 -- userAuth insertion
use mydb;
 
INSERT INTO `UserAuth` (`idUserAuth`, `userName`, `password`) VALUES (1, 'Saurabh_Kesarwani', 'Sau123@') ,
	(2, 'Rahul_Joshi', 'Rah123@'),(3, 'Abhinav_Mishra', 'Abh123@'),(4, 'Akash_Shukla', 'Aka123@'),
    (6, 'Krishnapal_Rajput', 'Kri123@'),(7, 'Kush_Sahu', 'Kus123@'),(8, 'Akash_ Rong', 'Akas123@'),
    (9, 'Sanjay123 ', 'San123@'),(10, 'Nitesh_ Agrarwal', 'Nit123@'),(11, 'Piyush_ Hirao', 'Piy123@'),
    (12, 'Vaibhav_Sethiya', 'Vai123@'),(13, 'Suman123', 'Sum123@'),(14, 'Ram_Gehlot', 'Ram123@');

INSERT INTO `UserAuth` (`idUserAuth`, `userName`, `password`) VALUES (15, 'Raju_bhai', 'Raju123@');

INSERT INTO `UserAuth` (`idUserAuth`, `userName`, `password`) VALUES (16, 'anchal_mishra', 'Anch123@');
select * from UserAuth;
delete from userAuth where idUserAuth=20;

alter table User modify phone BIGINT;
-- user table insertion 

-- -----------------------------------------------------
-- Data for table `User`
-- -----------------------------------------------------
INSERT INTO `User` (`idUser`, `firstName`, `lastName`, `emailID`, `gender`, `phone`, `CreateTime`, `userAuthId`) 
VALUES (101, 'Saurabh ', 'Kesarwani', 'saurabhnit121@gmail.com', 'F', 6394652453, '2022-09-01 10:05', 1),
	(102, 'Rahul', 'Joshi', 'rahulnit122@gmail.com', 'M', 7905810479, '2022-07-10 10:12', 2),
	(103, 'Abhinav', 'Mishra', 'abhinavnit123@gmail.com', 'M', 8317230838, '2022-08-12 10:14', 3),
	(104, 'Akash', 'Shukla', 'akashnit124@gmail.com', 'F', 9125634510, '2022-11-11 10:15', 4),
	(105, 'Hitesh', 'Yadav', 'hiteshnit125@gmail.com', 'M', 6394239851, '2022-12-6 10:16', 5),
	(106, 'Krishnapal', 'Rajput', 'krishnapalnit126@gmail.com', 'M', 8317054321, '2022-02-01 10:17', 6),
	(107, 'Kush', 'Sahu', 'kushnit127@gmail.com', 'M', 9125892039, '2022-01-04 10:18', 7),
	(108, 'Akash', 'Rong', 'akashnit128@gmail.com', 'M', 8317895437, '2022-07-18 10:19', 8),
	(109, 'Sanjay', 'Kumar', 'sanjaynit129@gmail.com', 'M', 9571453678, '2022-10-21 10:20', 9),
	(110, 'Nitesh', 'Agrawal', 'niteshnit1210@gmail.com', 'M', 9125289642, '2022-09-30 10:22', 10),
	(111, 'Piyush', 'Hirao', 'piyushnit1211@gmail.com', 'M', 8317341907, '2022-09-23 10:23', 11),
	(112, 'Vaibhav', 'Sethiya', 'vaibhavnit1212@gmail.com', 'M', 8317458218, '2022-09-13 10:26', 12),
	(113, 'Suman', 'Kumar', 'sumannit1213@gmail.com', 'M', 9125056739, '2022-09-06 10:27', 13),
	(114, 'Ram', 'Gehlot', 'ramnit@1214', 'M', 8317230856, '2022-09-12 10:28', 14);


select * from User;

-- insertions in Video Table 

alter table Video modify videoDesc LONGTEXT;

INSERT INTO `Video` (`idVideo`, `videoTitle`, `videoDesc`, `videoUrl`, `videoFileType`, `createTime`, `postedByUser`, `videoPath`) VALUES (220, 'Yes yes yes', 'This is the new one', NULL, 'mp4', ' 2023-03-29 16:07:54', 101, NULL);



INSERT INTO `Video` (`idVideo`, `videoTitle`, `videoDesc`, `videoUrl`, `videoFileType`, `createTime`, `postedByUser`, `videoPath`) VALUES (201, 'Rotete Array', 'This is the video under the series of DATA STRUCTURE & ALGORITHM. We are going to solve Questions from Leetcode  Rotation of Array in O(N) Time Complexity and O(1) space Complexity.', NULL, 'mp4', ' 2018-02-11 23:07:54', 101, NULL),
(202, 'Spirally traversing a matrix', 'In this video, I am going to discuss or solve Spirally traversing a matrix. I showed step by step process with Theory and code.', NULL, 'mp4', ' 2019-08-09 21:10:31', 102, NULL),
(203, 'Non Repeating Element', 'This is the video under the series of DATA STRUCTURE & ALGORITHM in a HASHING Playlist. We are going to solve the problem from geeks for geeks Non Repeating Element which is solved by using unordered_map in c++', NULL, 'mp4', ' 2017-11-02 16:17:28', 103, NULL),
(204, 'Allocate Minimum Number Of Pages', 'Given number of pages in n different books and m students. The books are arranged in ascending order of number of pages. Every student is assigned to read some consecutive books. The task is to assign books in such a way that the maximum number of pages assigned to a student is minimum.', NULL, 'mp4', ' 2019-08-22 23:11:50', 109, NULL),
(205, 'Maximum of all Subarrays of size k', 'Given an array arr[] of size N and an integer K. Find the maximum for each and every contiguous subarray of size K.', NULL, 'mp4', ' 2012-07-09 13:37:14', 102, NULL),
(206, 'Kadane\'s Algorithm', 'Hey guys, In this video, we\'ll be solving Largest Sum Contiguous Subarray Problem using Kadane\'s Algorithm.', NULL, 'mp4', ' 2022-04-29 17:49:09', 103, NULL),
(207, 'Burn a Tree', 'Hey guys, In this video, We\'re going to solve an interesting problem called: Minimum Time To Burn A Binary Tree Starting From The Leaf Node.', NULL, 'mp4', ' 2015-08-30 12:12:28', 107, NULL),
(208, 'Deletion in a binary Search Tree', 'In this video, we will see how deletion operation is performed in a binary search tree. This video will explain to you the cases involved in binary search deletion.', NULL, 'mp4', ' 2019-02-19 13:57:03', 109, NULL),
(209, 'B Tree and B+ Tree', 'This video explains   ||   B Trees and B+ Trees and how they are used in databases.', NULL, 'mp4', ' 2020-08-29 22:09:51', 108, NULL),
(210, 'Deletion from Binary Search Tree', 'Delete function is used to delete the specified node from a binary search tree. However, we must delete a node from a binary search tree in such a way, that the property of binary search tree doesn\'t violate.', NULL, 'mp4', ' 2019-08-09 03:07:45', 109, NULL),
(211, 'Funny boy dancing in rain', 'A boy dancing in rain slipped in puddle', NULL, 'mp4', ' 2018-02-11 23:19:54', 101, NULL);

delete from Video where VideoUrl=NULL;
alter table Video drop column videoPath;

select * from Video;


-- Insertion in subscriber table
-- 
-- 

INSERT INTO `Subscriber` (`idSubscriber`, `userId`, `createTime`, `subToId`) 
	VALUES (1, 101, '2022:01:10 10:12:13', 102),
	(2, 102, '2022:02:09 11:12:13', 104),(3, 101, '2022:03:15 09:12:13', 103),
	(4, 103, '2022:03:15 01:12:13', 105),(5, 105, '2022:04:15 12:12:13', 108),	
	(6, 106, '2022:05:15 10:12:13', 109),(7, 101, '2022:06:15 11:12:13', 106),
	(8, 109, '2022:08:15 13:12:13', 101),(9, 108, '2022:10:15 12:12:13', 101),
	(10, 106, '2022:08:15 12:12:13', 101),(11, 101, '2022:10:15 01:12:13', 114),		
	(12, 101, '2022:06:15 02:12:13', 113),(13, 104, '2022:09:15 16:12:13', 111),
	(14, 103, '2022:11:15 18:12:13', 112),(15, 102, '2022:12:15 19:12:13', 111);

SELECT * FROM subscriber;




INSERT INTO `VideoView` (`idVideoView`, `user_Id`, `createTime`, `video_Id`) VALUES (1, 102, '2019-02-23  23:04:23', 201),
(2, 101, '2022-12-24 12:20:13', 207),
(3, 101, '2022-12-20 13:20:13', 208),
(4, 101, '2022-12-22 01:20:13', 202),
(5, 108, '2017-05-16 13:45:56', 203),
(6, 108, '2017-05-18 15:45:56', 207),
(7, 110, '2020-11-28 23:08:23', 207),
(8, 109, '2015-10-23 15:34:27', 204);

select * from videoView;

INSERT INTO `WatchLater` (`idWatchLater`, `userId`, `videoId`, `createTime`) VALUES (1, 102, 201, '2015-12-23  12:09:23'),
(2, 103, 204, '2018-11-24  22:08:28'),
(3, 107, 201, '2019-10-21  17:04:25'),
(4, 101, 203, '2014-04-22  10:03:27'),
(5, 102, 205, '2016-05-18  12:04:28'),
(6, 101, 208,'2022-12-20  13:20:13'),
(7, 101, 202,'2022-12-22  01:20:13'),
(8, 108, 203,'2017-05-16  13:45:56' ),
(9, 108, 207,'2017-05-18  15:45:56'),
(10, 110, 207,'2020-11-03  23:08:23');

select * from watchlater;

INSERT INTO `VideoSpecCount` (`idVideoSpecCount`, `ViewCount`, `likeCount`, `commentCount`, `dislikeCount`) VALUES (202, 23, 20, 14, 1),
(201, 39, 30, 25, 0),
(203, 28, 19, 17, 9),
(204, 38, 30, 19, 5),
(205, 555, 489, 356, 34),
(206, 39, 30, 25, 0),
(207, 28, 19, 17, 9),
(208, 38, 30, 19, 5),
(209, 555, 489, 356, 34),
(210,76,66,03,5);

select * from VideoSpecCount;

INSERT INTO `PlaylistVideo` ( `videoId`, `playlistId`) VALUES ( 201, 3),
(203, 4),(203, 3),(201, 2),
(206, 1),(210, 2),(209, 1),
(204, 3),(203, 2),( 208, 3),( 211, 6);

select * from playlistVideo;

INSERT INTO `Playlist` (`idPlaylist`, `playlistNamel`, `userID`) VALUES (1, 'Array ,Matrices placement series', 108),
(2, 'Linked List in c language', 103),
(3, 'Tree data structure', 105),
(4, 'Placement series', 102),
(5, 'Motivational videos', 102),
(6, 'Funny Videos', 103);

select * from playlist;

INSERT INTO `Comment` (`idComment`, `content`, `userId`, `videoId`, `isReply`, `parentComment`, `createTime`) 
VALUES (1, 'what is time complexity of this method', 101, 201, 0, NULL,	'2022-01-23  23:01:55'),
(2, 'what is space complexity ' 				   , 102, 206, 0, NULL, '2022-01-19  12:26:23'),
(3, 'nice solution sir'                            , 101, 205, 0, NULL, '2022-12-22  18:17:26'),
(4, 'that was helpfull' 						   , 103, 210, 1, 2   , '2022-09-30  19:18:19'),
(5, 'thank you sir for providing free course'      , 103, 201, 1, 1	  , '2022-03-26  23:08:38'),
(6, 'very good explanation'                        , 101, 205, 1, 5, '2022-04-22  18:17:26'),
(7, 'keep up the good work'						   , 103, 210, 1, 2	  , '2022-05-30  19:18:19'),
(8, 'sir i am having an error'      				, 102, 201, 1, 1  ,'2022-06-26  23:08:38'),
(9, 'help those who are in need'                   , 101, 205, 0, NULL, '2022-07-22  18:17:26'),
(10, 'done'											, 103, 210, 1, 2  , '2022-09-30  19:18:19'),
(11, 'lets do this'								    , 101, 201, 1, 1  , '2022-02-26  23:08:38'),
(12, 'when will you upload next'                    , 101, 205, 1, 6, '2022-05-22  18:17:26'),
(13, 'try using master theorem buddy'				, 103, 210, 1, 2   , '2022-04-30  19:18:19'),
(14, 'what are you trying to do in this'	        , 109, 201, 1, 1    , '2022-03-26  23:08:38');

INSERT INTO `Comment` (`idComment`, `content`, `userId`, `videoId`, `isReply`, `parentComment`, `createTime`) 
VALUES  (1, 'hello bro'			, 101, 201 , 0, NULL,	'2022-01-12  23:01:55'),
		(2, 'I am fine '		, 103, null, 1, 1, '2022-01-23  12:26:23'),
		(3, 'How You all doing' , 104, null, 1, 2, '2022-12-22  18:17:26');

delete from Comment;
truncate table comment;
select * from comment;
update comment set parentComment =1 where idComment=5;
alter table Comment modify column parentComment INT NULL;

INSERT INTO `SearchHistory` (`idSearchHistory`, `searchContent`, `createTime`, `userId`) VALUES (1, 'Array placement videos', '2022-02-23  23:02:23', 103),
(2, 'how to draw a tree ', '2022-05-12  17:09:56', 106),
(3, 'latest honey singh songs', '2022-06-08  13:22:45', 104),
(4, 'darr ki khaufnaak tasveere', '2022-12-23  16:34:46', 106),
(5, 'black panther trailer', '2022-12-23  16:34:46', 101),
(6, 'funny boys dance memes', '2022-11-18  19:23:09', 103);
delete from searchHistory where idSearchHistory=7;
select * from searchhistory;



