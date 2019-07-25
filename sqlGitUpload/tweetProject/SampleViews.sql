## Creates view by getting all Tweets, including Content, Handle, Email Address, Time,
## and Number of Responses most popular first

CREATE OR REPLACE VIEW MostResponded AS
SELECT 	tb.Content,
		ta.AccountHandle,
		ta.AccountEmail,
		tb.TweetTime,
		COUNT(ResponseId) AS 'Number of Responses'
FROM TweetBody tb
		JOIN TweetAccount ta ON ta.AccountId = tb.AccountId
		JOIN TweetResponses tr ON tb.BodyId = tr.BodyId
GROUP BY 1,2,3,4
ORDER BY 5 DESC;


## Creates view by getting a list of all Account Handles and Associated Email Address
## Along with a number of followers, highest amount first

CREATE OR REPLACE VIEW NumberOfFollowers AS
SELECT 	ta.AccountHandle AS 'Account Handle',
		ta.AccountEmail  AS 'Account Email',
		COUNT(FollowerId) AS 'Number Of Followers'
FROM TweetAccount ta
	JOIN Followers f ON ta.AccountId = f.TweetAccountId
GROUP BY 1,2
ORDER BY 3 DESC;
