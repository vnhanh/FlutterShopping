
sealed class CounterState {}

class Loading extends CounterState {}

class Success extends CounterState {
  int count = 0;

  Success(this.count);
}
