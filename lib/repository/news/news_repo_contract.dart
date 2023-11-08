import '../../Model/NewsResponse.dart';

abstract class NewsRepoContract{
  Future<NewsResponse?> getNewsBySourceId(String sourceId);
}
