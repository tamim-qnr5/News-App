import '../Model/NewsResponse.dart';

abstract class NewsRemoteDataSource{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}