<!doctype html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <meta name="Generator" content="EditPlus®">
  <meta name="Author" content="">
  <meta name="Keywords" content="">
  <meta name="Description" content="">
  <title>Explanation</title>
 </head>
 <body bgcolor="black">
  <font size="+1" color="#71f717"><pre>1)  User Behavioral Based
 	
	i)Burstiness:
		Spammers, usually write their spam reviews in short period of time for two reasons:
		first, because they want to impact readers and other users, 
		second because they are temporal users, they have to write as much as reviews
		they can in short time.                  
							   
		Score=1-( Last Review of item Date - First Review of item Date)/28;

		Threshold value =0.5
			Score > 0.5 => spam
			Score < 0.5  => not spam

		For Ex:
		1 -  [(14/09/17) - (13/ 09/17)]/28;
		1 - (1/28) => 0.96 > 0.5 
		Spam.

		</pre>
 </font></body>
</html>
