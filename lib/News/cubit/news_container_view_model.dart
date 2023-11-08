import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/repository/news/dataSource/news_remote_dataSource.dart';
import 'package:news_app/repository/news/repository/news_repo_impl.dart';

import '../../API/api_maneger.dart';
import '../../repository/news/news_repo_contract.dart';
import '../../repository/news_data_source.dart';
import 'news_staties.dart';

class NewsContainerViewModel extends Cubit<NewsSourceState> {
  NewsRepoContract newsRepoContract;
  NewsContainerViewModel(this.newsRepoContract):super(NewsLoadingState());

  void getNewsByCategoryId(String categoryId)async{
    try{
      emit(NewsLoadingState());
      var  response = await newsRepoContract.getNewsBySourceId(categoryId);
      if(response?.status == 'error'){
        emit(NewsErrorState(errorMessage: response?.message!));
      }else{
        emit(NewsSuccessState(newsList: response?.articles));
      }
    }catch(e){
      emit(NewsErrorState(errorMessage: e.toString()));
    }

  }

}