import '../../Model/SourceResponce.dart';

abstract class CategorySourceState{}
class SourceInitialState extends CategorySourceState{}
class SourceLoadingState extends CategorySourceState{}
class SourceErrorState extends CategorySourceState{
  String? errorMessage;
  SourceErrorState({required this.errorMessage});
}
class SourceSuccessState extends CategorySourceState{
  List<Source>? sourceList;
  SourceSuccessState({required this.sourceList});
}