
USE `mydb` ;

-- -----------------------------------------------------
-- Table `mydb`.`UserAuth`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`UserAuth` (
  `idUserAuth` INT NOT NULL,
  `userName` VARCHAR(45) NULL,
  `password` VARCHAR(45) NULL,
  PRIMARY KEY (`idUserAuth`),
  UNIQUE INDEX `idUserAuth_UNIQUE` (`idUserAuth` ASC) VISIBLE)
ENGINE = InnoDB;

SET FOREIGN_KEY_CHECKS = 0;
ALTER TABLE UserAuth MODIFY COLUMN idUserAuth INT NOT NULL auto_increment;

ALTER TABLE comment MODIFY COLUMN idComment INT NOT NULL auto_increment;

drop table comment;

select * from userAuth;
-- -----------------------------------------------------
-- Table `mydb`.`User`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`User` (
  `idUser` INT NOT NULL,
  `firstName` VARCHAR(45) NULL,
  `lastName` VARCHAR(45) NULL,
  `emailID` VARCHAR(45) NULL,
  `gender` CHAR NULL,
  `phone` INT NULL,
  `CreateTime` DATETIME NULL,
  `userAuthId` INT NULL,
  PRIMARY KEY (`idUser`),

    FOREIGN KEY (`userAuthId`)
    REFERENCES `mydb`.`UserAuth` (`idUserAuth`)
)
ENGINE = InnoDB;
SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE User MODIFY COLUMN idUser INT NOT NULL auto_increment;
ALTER TABLE User ADD CONSTRAINT FOREIGN KEY (userAuthId) REFERENCES UserAuth(idUserAuth) ON DELETE CASCADE;

ALTER TABLE User ADD COLUMN subscribers INT default 0;
ALTER TABLE User ADD COLUMN subscribed INT default 0;
ALTER TABLE User ADD COLUMN userImg VARCHAR(255);


-- -----------------------------------------------------
-- Table `mydb`.`Video`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Video` (
  `idVideo` INT NOT NULL,
  `videoTitle` VARCHAR(45) NULL,
  `videoDesc` VARCHAR(45) NULL,
  `videoUrl` VARCHAR(45) NULL,
  `videoFileType` VARCHAR(45) NULL,
  `createTime` DATETIME NULL,
  `postedByUser` INT NULL,
  `videoPath` VARCHAR(45) NULL,
  PRIMARY KEY (`idVideo`),
    FOREIGN KEY (`postedByUser`)
    REFERENCES `mydb`.`User` (`idUser`))
ENGINE = InnoDB;


ALTER TABLE Video ADD COLUMN vidImg VARCHAR(255);
ALTER TABLE Video MODIFY COLUMN videoUrl VARCHAR(255);




select * from video;
ALTER TABLE Video ADD CONSTRAINT FOREIGN KEY (`postedByUser`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;


SET FOREIGN_KEY_CHECKS = 1;
ALTER TABLE Video MODIFY COLUMN idVideo INT NOT NULL auto_increment;


ALTER TABLE Video ADD CONSTRAINT FOREIGN KEY (`postedByUser`) REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;

-- -----------------------------------------------------
-- Table `mydb`.`Playlist`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Playlist` (
  `idPlaylist` INT NOT NULL,
  `playlistNamel` VARCHAR(45) NULL,
  `userID` INT NULL,
  PRIMARY KEY (`idPlaylist`),
    FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`)
)
ENGINE = InnoDB;

drop table playlist;

ALTER TABLE Playlist MODIFY COLUMN idPlaylist INT NOT NULL auto_increment;


ALTER TABLE Playlist ADD CONSTRAINT FOREIGN KEY (`userID`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;


-- -----------------------------------------------------
-- Table `mydb`.`PlaylistVideo`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`PlaylistVideo` (
  `videoId` INT  NOT NULL,
  `playlistId` INT NOT NULL,
  PRIMARY KEY (`videoId`,`playlistId`),
    FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`),
    FOREIGN KEY (`playlistId`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`))
ENGINE = InnoDB;

use mydb;

drop table PlaylistVideo;


ALTER TABLE PlaylistVideo ADD CONSTRAINT FOREIGN KEY (`playlistId`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`) ON DELETE cascade;
ALTER TABLE PlaylistVideo ADD CONSTRAINT FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE cascade;

select * from Video;
select * from PlaylistVideo;

ALTER TABLE PlaylistVideo ADD CONSTRAINT FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE CASCADE;
alter table playlistVideo add constraint FOREIGN KEY (`playlistId`)
    REFERENCES `mydb`.`Playlist` (`idPlaylist`) ON DELETE CASCADE;
-- -----------------------------------------------------
-- Table `mydb`.`VideoView`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VideoView` (
  `idVideoView` INT NOT NULL,
  `userId` INT NULL,
  `createTime` DATETIME NULL,
  `videoId` INT NULL,
  PRIMARY KEY (`idVideoView`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`),
    FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`)
)
ENGINE = InnoDB;

ALTER TABLE videoview MODIFY COLUMN idVideoView INT NOT NULL auto_increment;
ALTER TABLE watchlater MODIFY COLUMN idWatchLater INT NOT NULL auto_increment;


select * from videoView;
ALTER TABLE VideoView ADD CONSTRAINT FOREIGN KEY (`user_Id`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE set NULL;
alter table VideoView add constraint FOREIGN KEY (`video_Id`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE set NULL;

-- -----------------------------------------------------
-- Table `mydb`.`Comment`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Comment` (
  `idComment` INT NOT NULL auto_increment,
  `content` VARCHAR(255) NULL,
  `userId` INT NULL,
  `videoId` INT NULL,
  `isReply` TINYINT NULL,
  `parentComment` INT NULL,
  `createTime` DATETIME NULL,
  PRIMARY KEY (`idComment`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE,
    FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE CASCADE,
    FOREIGN KEY (`parentComment`)
    REFERENCES `mydb`.`Comment` (`idComment`) ON DELETE CASCADE
)
ENGINE = InnoDB;

ALTER TABLE Comment ADD CONSTRAINT FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;
alter table Comment add constraint FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE CASCADE;
ALTER TABLE Comment ADD CONSTRAINT FOREIGN KEY (`parentComment`)
    REFERENCES `mydb`.`Comment` (`idComment`) ON DELETE CASCADE;
-- -----------------------------------------------------
-- Table `mydb`.`VideoSpecCount`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`VideoSpecCount` (
  `idVideoSpecCount` INT NOT NULL,
  `ViewCount` INT NULL,
  `likeCount` INT NULL,
  `commentCount` INT NULL,
  `dislikeCount` INT NULL,
  PRIMARY KEY (`idVideoSpecCount`),

    FOREIGN KEY (`idVideoSpecCount`)
    REFERENCES `mydb`.`Video` (`idVideo`) on delete cascade)
ENGINE = InnoDB;

drop table VideoSpecCount;
alter table VideoSpecCount drop column videoId;

alter TABLE `VideoSpecCount`
drop FOREIGN key `videospeccount_ibfk_4`;

ALTER TABLE personal_info DROP FOREIGN KEY `personal_info_ibfk_1`;

ALTER TABLE VideoSpecCount DROP column videoId ;


ALTER TABLE VideoSpecCount ADD FOREIGN KEY  (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE CASCADE;

-- -----------------------------------------------------
-- Table `mydb`.`WatchLater`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`WatchLater` (
  `idWatchLater` INT NOT NULL,
  `userId` INT NULL,
  `videoId` INT NULL,
  `createTime` DATETIME NULL,
  PRIMARY KEY (`idWatchLater`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`),
    FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`))
ENGINE = InnoDB;


ALTER TABLE WatchLater ADD CONSTRAINT FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;
ALTER TABLE WatchLater ADD CONSTRAINT FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE CASCADE;
    
-- -----------------------------------------------------
-- Table `mydb`.`SearchHistory`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`SearchHistory` (
  `idSearchHistory` INT NOT NULL,
  `searchContent` VARCHAR(120) NULL,
  `createTime` DATETIME NULL,
  `userId` INT NULL,
  PRIMARY KEY (`idSearchHistory`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`))
ENGINE = InnoDB;

ALTER TABLE SearchHistory ADD CONSTRAINT FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;


-- ----------------------------------------------------
-- Table `mydb`.`WatchHistory`
-- ----------------------------------------------------

CREATE TABLE IF NOT EXISTS `mydb`.`WatchHistory` (
  `videoId` INT NOT NULL,
  `createTime` DATETIME NULL,
  `userId` INT NOT NULL,
  PRIMARY KEY (`videoId`,`userId`),
    FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE cascade,
    FOREIGN KEY (`videoId`)
    REFERENCES `mydb`.`Video` (`idVideo`) ON DELETE cascade)
ENGINE = InnoDB;


-- -----------------------------------------------------
-- Table `mydb`.`Subscriber`
-- -----------------------------------------------------
CREATE TABLE IF NOT EXISTS `mydb`.`Subscriber` (
  `idSubscriber` INT NOT NULL,
  `userId` INT NULL,
  `createTime` DATETIME NULL,
  `subToId` INT NULL,
  PRIMARY KEY (`idSubscriber`),
    FOREIGN KEY (`subToId`)
    REFERENCES `mydb`.`User` (`idUser`))
ENGINE = InnoDB;

alter table subscriber add primary key(`userId`,`subToId`);

CREATE TABLE likes (
    user_id INT NOT NULL,
    video_id INT NOT NULL,
    created_at datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
    PRIMARY KEY (user_id, video_id),
    FOREIGN KEY (user_id) REFERENCES user(idUser),
    FOREIGN KEY (video_id) REFERENCES video(idVideo)
);


ALTER TABLE Subscriber ADD CONSTRAINT FOREIGN KEY (`subToId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;

ALTER TABLE Subscriber MODIFY COLUMN idSubscriber INT NOT NULL auto_increment;


ALTER TABLE Subscriber ADD CONSTRAINT FOREIGN KEY (`userId`)
    REFERENCES `mydb`.`User` (`idUser`) ON DELETE CASCADE;

SET SQL_MODE=@OLD_SQL_MODE;
SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS;
SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS;
