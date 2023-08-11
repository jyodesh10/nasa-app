import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:nasa_app/constants/base.dart';

import '../../models/apod_model.dart';
import 'package:http/http.dart' as http;
part 'nasa_state.dart';

class NasaCubit extends Cubit<NasaState> {
  NasaCubit() : super(NasaInitial());

  getApodData() async {
    try {
      emit(NasaLoadingState());
      final response = await http.get(Uri.parse("$baseUrl/planetary/apod?api_key=$apikey"));

      if(response.statusCode == 200) {
        final Map<String, dynamic> data = jsonDecode(response.body);
        emit(NasaLoadedState(data: ApodModel.fromJson(data)));
      }else{
        emit(NasaErrorState());
      }
    } on Exception catch (e) {
      if (kDebugMode) {
        print(e.toString());
      }
    }
  }
}
