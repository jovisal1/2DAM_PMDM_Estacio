import 'package:dartz/dartz.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';

abstract class TweetRepository {
  Future<Either<String, List<Tweet>>> getTweets();

  Future<Either<String, void>> createTweet(
      String userId, String content, String? image);

  Future<Either<String, void>> deleteTweet(String tweetId);

  Future<Either<String, void>> likeTweet(String tweetId, String userId);

  Future<Either<String, void>> updateTweet(
      String userId, String? content, String? image);

  Future<Either<String, List<Tweet>>> getFollowUsersTweets(String userId);
}
