import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/API/api_maneger.dart';
import 'package:news_app/Catagory/cubit/staties.dart';
import 'package:news_app/repository/source/dataSource/source_remote_dataSource_impl.dart';
import 'package:news_app/repository/source/repository/source_repo_impl.dart';
import 'package:news_app/repository/source/source_repo_contract.dart';

class CategoryDetailsViewModel extends Cubit<CategorySourceState> {
  SourceRepoContract repoContract;

  CategoryDetailsViewModel(this.repoContract) : super(SourceLoadingState());

  void getSourceByCategoryId(String categoryId) async {
    try {
      emit(SourceLoadingState());
      var response = await repoContract.getSources(categoryId);
      if (response?.status == 'error') {
        emit(SourceErrorState(errorMessage: response!.message));
      } else {
        emit(SourceSuccessState(sourceList: response?.sources));
      }
    } catch (e) {
      emit(SourceErrorState(errorMessage: e.toString()));
    }
  }
}
