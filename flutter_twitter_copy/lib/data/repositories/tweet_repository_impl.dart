import 'package:dartz/dartz.dart';
import 'package:flutter_twitter_copy/data/datasources/tweet_remote_datasource.dart';
import 'package:flutter_twitter_copy/data/models/tweet_model.dart';
import 'package:flutter_twitter_copy/domain/entities/tweet.dart';
import 'package:flutter_twitter_copy/domain/repositories/tweet_repository.dart';

class TweetRepositoryImpl implements TweetRepository {
  final TweetRemoteDataSource remoteDataSource;

  TweetRepositoryImpl({required this.remoteDataSource});

  @override
  Future<Either<String, List<Tweet>>> getTweets() async {
    try {
      final response = await remoteDataSource.getTweets();
      final tweets =
          response.map<Tweet>((json) => TweetModel.fromJson(json)).toList();
      return Right(tweets);
    } catch (e) {
      return Left('Fallo al btener los tweets: $e');
    }
  }

  @override
  Future<Either<String, void>> createTweet(
      String userId, String content, String? image) async {
    try {
      await remoteDataSource.createTweet(userId, content, image);
      return const Right(null);
    } catch (e) {
      return Left('Fallo al crear el tweet: $e');
    }
  }

  @override
  Future<Either<String, void>> deleteTweet(String tweetId) async {
    try {
      await remoteDataSource.deleteTweet(tweetId);
      return const Right(null);
    } catch (e) {
      return Left('Failed al eliminar el tweet: $e');
    }
  }

  @override
  Future<Either<String, void>> likeTweet(String tweetId, String userId) async {
    try {
      await remoteDataSource.likeTweet(tweetId, userId);
      return const Right(null);
    } catch (e) {
      return Left('Fallo al hacer like en el tweet: $e');
    }
  }

  @override
  Future<Either<String, void>> updateTweet(
      String tweetId, String? content, String? image) async {
    try {
      await remoteDataSource.updateTweet(tweetId, content, image);
      return const Right(null);
    } catch (e) {
      return Left('Fallo al modificar el tweet: $e');
    }
  }

  @override
  Future<Either<String, List<Tweet>>> getFollowUsersTweets(
      String userId) async {
    try {
      final response = await remoteDataSource.getFollowUsersTweets(userId);
      final tweets =
          response.map<Tweet>((json) => TweetModel.fromJson(json)).toList();
      return Right(tweets);
    } catch (e) {
      return Left('Fallo al obtener los tweets: $e');
    }
  }
}
