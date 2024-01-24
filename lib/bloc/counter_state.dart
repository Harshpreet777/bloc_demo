class CounterStates {}
class InitialState extends CounterStates{}
class UpdateStates extends CounterStates{
  final int counter;
  UpdateStates(this.counter);
}
