import 'package:bloc/bloc.dart';
import 'package:bloc_pattern_from_package/bloc/counter_event.dart';
import 'package:bloc_pattern_from_package/bloc/counter_state.dart';

class CounterBloc extends Bloc<CounterEvent, CounterState> {
  
  CounterBloc() : super(CounterState.initial()) {
    on<IncrementEvent>(_mapIncrementEventToState);
    on<DecrementEvent>(_mapDecrementEventToState);
  }

  _mapIncrementEventToState(IncrementEvent event, Emitter<CounterState> emit) {
    int counter = state.counter;
    emit(state.copyWith(counter: counter + 1));
  }

  _mapDecrementEventToState(DecrementEvent evemt, Emitter<CounterState> emit) {
    int counter = state.counter;
    emit(state.copyWith(counter: counter - 1));
  }

  @override
  void onChange(Change<CounterState> change) {
    super.onChange(change);
    print(change);
  }

  @override
  void onTransition(Transition<CounterEvent, CounterState> transition) {
    super.onTransition(transition);
    print(transition);
  }
  
}