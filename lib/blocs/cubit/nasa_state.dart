part of 'nasa_cubit.dart';

class NasaState extends Equatable {
  const NasaState();

  @override
  List<Object> get props => [];
}

class NasaInitial extends NasaState {}
class NasaLoadingState extends NasaState {}
class NasaLoadedState extends NasaState {
  final ApodModel data;
  const NasaLoadedState({required this.data});

  @override
  List<Object> get props => [data];
}
class NasaErrorState extends NasaState {}
