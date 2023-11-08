import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/repository/news/dataSource/news_remote_dataSource.dart';
import 'package:news_app/repository/news/news_repo_contract.dart';
import '../../news_data_source.dart';

class NewsRepoImpl implements NewsRepoContract{
  NewsRemoteDataSource newsRemoteDataSource;
  NewsRepoImpl({required this.newsRemoteDataSource});

  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) {
    var response = newsRemoteDataSource.getNewsBySourceId(sourceId);
    return response;
  }

}
NewsRepoContract injectNewsRepoContract(){
  return NewsRepoImpl(newsRemoteDataSource: injectNewsRemoteDataSource());
}