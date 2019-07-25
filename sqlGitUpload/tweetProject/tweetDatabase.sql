
DROP DATABASE IF EXISTS TWEET_DATA;
CREATE DATABASE TWEET_DATA;
USE TWEET_DATA;

CREATE TABLE TweetAccount
(
AccountId INT AUTO_INCREMENT PRIMARY KEY,
AccountHandle VARCHAR(45),
AccountEmail VARCHAR(45)
);

CREATE TABLE Followers
(
TweetAccountId INT,
FollowerId INT,
CONSTRAINT TweetAccountId_FK FOREIGN KEY (TweetAccountId) REFERENCES TweetAccount (AccountId),
CONSTRAINT FollowerId_FK FOREIGN KEY (FollowerId) REFERENCES TweetAccount (AccountId)
);

CREATE TABLE TweetBody
(
BodyId INT AUTO_INCREMENT PRIMARY KEY,
AccountId INT,
Content VARCHAR(140),
TweetTime DATETIME,
TweetLiked INT,
TweetRetweeted INT,
IsDeleted BOOLEAN);

CREATE TABLE Hashtags
(
HashtagId INT AUTO_INCREMENT PRIMARY KEY,
Hashtag VARCHAR(140)
);

CREATE TABLE BodyHashtag
(
BodyId INT,
HashtagId INT,
CONSTRAINT BodyId_FK FOREIGN KEY (BodyId) REFERENCES TweetBody (BodyId),
CONSTRAINT HashtagId_BodyHashtag_FK FOREIGN KEY (HashtagId) REFERENCES Hashtags (HashtagId)
);

CREATE TABLE TweetResponses
(
ResponseId INT AUTO_INCREMENT PRIMARY KEY,
BodyId INT,
TweetResponse VARCHAR(144),
TweetTime DATETIME,
ResponseLikes INT,
ResponseRetweets INT,
IsDeleted BOOLEAN,
CONSTRAINT BodyId_TweetResponses_FK FOREIGN KEY (BodyId) REFERENCES TweetBody (BodyId)
)
;

CREATE TABLE AccountResponses
(AccountId INT,
ResponseId INT,
CONSTRAINT AccountId_FK FOREIGN KEY (AccountId) REFERENCES TweetAccount (AccountId),
CONSTRAINT ResponseId_FK FOREIGN KEY (ResponseId) REFERENCES TweetResponses (ResponseId)
);

CREATE TABLE HashtagResponses
(HashtagId INT,
ResponseId INT,
CONSTRAINT HashtagId_Responses_FK FOREIGN KEY (HashtagId) REFERENCES Hashtags (HashtagId),
CONSTRAINT ResponseId_Responses_FK FOREIGN KEY (ResponseId) REFERENCES TweetResponses (ResponseId)
);


INSERT INTO tweetaccount
VALUES
	(DEFAULT, 'FlaviousMaximus', 'lebourdain@something.com'),
    (DEFAULT, 'JohnDorian', 'eeeeeeagle@something.com'),
    (DEFAULT, 'chocolatebear', 'turkleton@something.com'),
    (DEFAULT, 'NomDePlume', 'ghostwriter@something.com');


INSERT INTO tweetbody
VALUES
	(DEFAULT, 1, 'White House for irredeemable deplorable peeps https://t.co/tyhqz3xFVK', '2016-02-20 01:51:50', 6, 2, FALSE),
    (DEFAULT, 2, 'Can I send you some crayons? A coloring book, legos, or some Hot Cocoa?? https://t.co/uWKdAVpjmN', '2016-02-29 2:53:50', 60, 20, TRUE),
    (DEFAULT, 2, 'Fun!!!! https://t.co/8CVp1oEQfV', '2016-02-28 3:55:50', 600, 2, FALSE),
    (DEFAULT, 2, 'Nicest guy on TV https://t.co/6Cfn1AjKey', '2016-04-27 4:41:50', 6000, 40, TRUE),
    (DEFAULT, 3, 'Starting tomorrow I''ll be down in Washington', '2016-04-26 5:43:50', 140, 100, FALSE),
    (DEFAULT, 3, 'So proud of @TrevorNoah   Awesome effort', '2016-04-15 6:45:50', 12, 2000, FALSE),
    (DEFAULT, 4, 'Lowest home ownership rate in OH GOD IT''S ALL ON FIRE!!', '2016-08-14 7:31:50', 80, 10, FALSE);


INSERT INTO tweetresponses
VALUES
    (DEFAULT, 1, 'How did u know. Haha https://t.co/9eqCCVJVvo', '2016-11-20 22:33:50', 8, 1, FALSE),
    (DEFAULT, 1, 'Be happy FOR US!! https://t.co/Pkt1M7M9sG', '2016-11-11 23:35:50', 66, 2, TRUE),
    (DEFAULT, 2, 'Another view https://t.co/K3p3yF8ipu', '2016-11-01 22:21:50', 602, 3, TRUE),
    (DEFAULT, 2, 'Roosevelt room https://t.co/gPvB5gWsLo', '2016-10-20 21:23:50', 4000, 4, FALSE),
    (DEFAULT, 2, 'Last night!! https://t.co/a3Sv8tEArb', '2016-12-11 12:25:50', 2, 5, FALSE),
    (DEFAULT, 3, 'Radio prep in DC https://t.co/izuPR2fw0H', '2016-12-11 19:11:50', 1, 6, TRUE),
    (DEFAULT, 3, 'Numbers? ', '2016-08-30 18:13:50', 99, 7, TRUE),
    (DEFAULT, 4, 'The wait is almost over... preview tomorrow', '2016-09-20 17:15:50', 724, 8, TRUE),
    (DEFAULT, 4, 'Brad can we get back to Noah.', '2016-09-10 16:1:50', 63, 11, FALSE),
    (DEFAULT, 4, '@TrevorNoah gets better and better every year.', '2016-10-10 15:3:50', 36, 100, FALSE),
    (DEFAULT, 4, 'Steve Harvey...', '2016-10-20 14:5:50', 88, 1000, FALSE);


INSERT INTO hashtags
VALUES
	(DEFAULT, 'amazing'),
    (DEFAULT, 'sadness'),
    (DEFAULT, 'nope'),
    (DEFAULT, 'coffeesolvesproblmes');


INSERT INTO accountresponses
VALUES
	(1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,1),
    (3,4),
    (4,1),
    (4,3);


INSERT INTO bodyhashtag
VALUES
	(1,1),
    (1,2),
    (2,2),
    (2,3),
    (3,3),
    (3,4),
    (4,4),
    (4,1);

INSERT INTO followers
VALUES
	(1,1),
    (1,2),
    (2,2),
    (2,3),
    (3,3),
    (3,4),
    (4,4),
    (4,1);


INSERT INTO hashtagresponses
VALUES
	(1,2),
    (1,3),
    (2,1),
    (2,3),
    (3,1),
    (3,4),
    (4,1),
    (4,3);
