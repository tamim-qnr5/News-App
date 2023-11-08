import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Model/NewsResponse.dart';
import 'package:news_app/repository/news_data_source.dart';

class NewsRemoteDataSourceImpl implements NewsRemoteDataSource {
  ApiManager apiManager;
  NewsRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<NewsResponse?> getNewsBySourceId(String sourceId) async {
    var response = await apiManager.getNewsBySourceId(sourceId);
    return response;

  }
}
NewsRemoteDataSource injectNewsRemoteDataSource(){
  return NewsRemoteDataSourceImpl(apiManager: ApiManager.getApiManagerInstance());
}
// ApiManager injectApiManager(){
//   return ApiManager();
// }
