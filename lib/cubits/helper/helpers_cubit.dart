import 'package:bloc/bloc.dart';
import 'package:book_cubit_working/data/model/helper/helper_model.dart';

import '../../data/repositories/helper_repsitory.dart';

part 'helpers_state.dart';

class HelpersCubit extends Cubit<HelpersState> {
  HelpersCubit({
    required this.helperRepository,
  }) : super(HelpersInitial());

  final HelperRepository helperRepository;

  void getLanguages() async {
    emit(GetLanguagesInProgress());
    try {
      var languages = await helperRepository.getLanguages();
      emit(GetLanguagesInSuccess(languages: languages));
    } catch (error) {
      emit(GetLanguagesInFailure(errorText: error.toString()));
    }
  }

  void getGenres() async {
    emit(GetGenresInProgress());
    try {
      var genres = await helperRepository.getLanguages();
      emit(GetGenresInSuccess(genres: genres));
    } catch (error) {
      emit(GetGenresInFailure(errorText: error.toString()));
    }
  }
}