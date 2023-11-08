import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Model/SourceResponce.dart';
import 'package:news_app/repository/source/source_repo_contract.dart';

class SourceRemoteDataSourceImpl implements SourceRemoteDataSource {
  ApiManager apiManager;
  SourceRemoteDataSourceImpl({required this.apiManager});
  @override
  Future<SourceResponse?> getSources(String categoryId) async {
    var response = await apiManager.getSource(categoryId);
    return response;
  }
}
SourceRemoteDataSource injectSourceRemoteDataSource(){
  return SourceRemoteDataSourceImpl(apiManager: ApiManager.getApiManagerInstance());
}
// ApiManager injectApiManager(){
//   return ApiManager();
// }
