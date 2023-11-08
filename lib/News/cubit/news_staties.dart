import '../../Model/NewsResponse.dart';
import '../../Model/SourceResponce.dart';

abstract class NewsSourceState{}
class NewsInitialState extends NewsSourceState{}
class NewsLoadingState extends NewsSourceState{}
class NewsErrorState extends NewsSourceState{
  String? errorMessage;
  NewsErrorState({required this.errorMessage});
}
class NewsSuccessState extends NewsSourceState{
  List<News>? newsList;
  NewsSuccessState({required this.newsList});
}