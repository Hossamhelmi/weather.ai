import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:weather_ai/festures/home/presentation/cubits/predection_cubit/predection_cubit.dart';
import 'package:weather_ai/festures/home/presentation/cubits/weather_cubit/weather_cubit.dart';

class PredectionWidget extends StatelessWidget {
  const PredectionWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<PredectionCubit, PredectionState>(
      builder: (context, state) {
        if (state is PredectionLoaded) {
          return Column(
            children: [
              Text(
                state.predectedMessage,
                style: TextStyle(color: Colors.white, fontSize: 25),
              ),
            ],
          );
        } else if (state is PredectioError) {
          return Text(
            state.message,
            style: TextStyle(fontSize: 30),
          );
        } else if (state is PredectioLoading) {
          return Center(child: CircularProgressIndicator());
        } else {
          return ElevatedButton(
            onPressed: () {
              if(context.read<WeatherCubit>().state is WeatherLoaded){
                 context.read<PredectionCubit>().getPrediction(
                  context.read<WeatherCubit>().myWeather.getAiList());
              }
             
            },
            child: Text('Get Predection'),
          );
        }
      },
    );
  }
}
