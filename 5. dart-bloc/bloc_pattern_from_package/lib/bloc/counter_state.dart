class CounterState {
  int counter = 0;

  CounterState._();

  factory CounterState.initial() {
    return CounterState._()..counter = 0;
  }

  CounterState copyWith({int? counter}) {
    return CounterState._()..counter = counter ?? 0;
  }

  @override
  String toString() {
    return "CounterState { counter: $counter }";
  }
}
