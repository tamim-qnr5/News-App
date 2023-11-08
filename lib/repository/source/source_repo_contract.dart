import '../../Model/SourceResponce.dart';

abstract class SourceRepoContract{
  Future<SourceResponse?> getSources(String categoryId);
}
abstract class SourceRemoteDataSource{
  Future<SourceResponse?> getSources(String categoryId);
}