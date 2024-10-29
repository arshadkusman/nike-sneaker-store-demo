import 'package:flutter_bloc/flutter_bloc.dart';
import 'details_event.dart';
import 'details_state.dart';

class DetailsBloc extends Bloc<DetailsEvent, DetailsState> {
  DetailsBloc() : super(DetailsInitial()) {
    on<LoadShoeDetailsEvent>((event, emit) {
      emit(DetailsLoaded(shoe: event.shoe));
    });
  }
}
