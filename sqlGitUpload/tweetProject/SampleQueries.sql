###SAMPLE QUERIES ###
##Find Tweets and Hashtags w/ Particular Keyword(s)
SELECT 	Content, Hashtag
FROM TweetBody
	LEFT JOIN BodyHashtag USING (BodyId)
	LEFT JOIN Hashtags USING (HashtagId)
WHERE Hashtag LIKE '%ama%'
		OR Content LIKE '%dep%';


##Get a list of all Account Handles and number of Total Responses, sorted by most responses##
SELECT DISTINCT AccountHandle AS 'Account Handle',
		COUNT(ResponseId)
FROM TweetAccount
	JOIN AccountResponses USING (AccountId)
ORDER BY 2 DESC;

## Get a list of every account Handle along with the account Handle that respondes the most to that one

## Get a list of the most popular Hash Tags
SELECT DISTINCT Hashtag,
		COUNT(HashtagId) AS 'Times Used'
FROM Hashtags
	JOIN BodyHashtag USING (HashtagId)
ORDER BY 2 DESC;

## Get a list of all tweets using the most popular hashtag

SELECT Content
FROM TweetBody
	JOIN BodyHashtag USING (BodyId)
WHERE HashtagId = (	SELECT HashtagId
					FROM BodyHashtag
					GROUP BY HashtagId
					ORDER BY COUNT(*) DESC
					LIMIT 1);
