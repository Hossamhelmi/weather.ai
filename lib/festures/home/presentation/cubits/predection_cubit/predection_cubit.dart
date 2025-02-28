

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ai/festures/home/domain/use_case/get_predection_usecase.dart';

part 'predection_state.dart';

class PredectionCubit extends Cubit<PredectionState> {
    final GetPredectionUsecase getPredectionUsecase;
      late String predectedMessage;


  PredectionCubit(this.getPredectionUsecase) : super(PredectionInitial());
   Future<void> getPrediction(List<int> features) async {
    emit(PredectioLoading());

    final result = await getPredectionUsecase(features);
    result.fold(
      (error) => emit(PredectioError(error.toString())),
      (predect) {
         if (predect[0] == 1) {
            predectedMessage = 'It is a good day to go out';
          } else {
            predectedMessage = 'It is not a good day to go out';
          }
        emit(PredectionLoaded(predectedMessage));
      },
    );
  }
}
