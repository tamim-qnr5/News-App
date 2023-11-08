import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Model/SourceResponce.dart';
import 'package:news_app/repository/source/dataSource/source_remote_dataSource_impl.dart';
import 'package:news_app/repository/source/source_repo_contract.dart';

class SourceRepoImpl implements SourceRepoContract{
  SourceRemoteDataSource remoteDataSource;
  SourceRepoImpl({required this.remoteDataSource});
  @override
  Future<SourceResponse?> getSources(String categoryId) {
    var response = remoteDataSource.getSources(categoryId);
    return response;
  }
}
SourceRepoContract injectSourceRepoContract(){
  return SourceRepoImpl(remoteDataSource: injectSourceRemoteDataSource());
}

