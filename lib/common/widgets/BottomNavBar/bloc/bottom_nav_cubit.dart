import 'package:bloc/bloc.dart';

// Cubit that manages the Bottom Navigation state
class BottomNavCubit extends Cubit<int> {
  BottomNavCubit() : super(0); // Initialize with the first tab (index 0)

  void updateIndex(int index) {
    emit(index); // Emit the selected index directly as an integer
  }
}
