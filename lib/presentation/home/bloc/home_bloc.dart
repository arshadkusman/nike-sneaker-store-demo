import 'package:flutter_bloc/flutter_bloc.dart';
import '../../../domain/usecases/get_shoes.dart';
import 'home_event.dart';
import 'home_state.dart';


class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetShoesUseCase getShoesUseCase;

  HomeBloc(this.getShoesUseCase) : super(HomeLoading()) {
    on<LoadShoesEvent>((event, emit) async {
      try {
        final shoes = await getShoesUseCase.call();
        emit(HomeLoaded(shoes: shoes));
      } catch (e) {
        emit(HomeError(message: 'Failed to load shoes'));
      }
    });
  }
}
