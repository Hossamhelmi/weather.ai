import 'package:dartz/dartz.dart';
import 'package:weather_ai/festures/home/domain/repo/base_weather_repo.dart';

class GetPredectionUsecase {
  final BaseWeatherRepo repository;

  GetPredectionUsecase(this.repository);
  Future<Either<Exception, dynamic>> call(List<int> features) async {
    return await repository.getPrediction(features);
  }
}
