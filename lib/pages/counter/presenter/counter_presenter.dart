import '../view/counter_view.dart';

abstract class CounterPresenter {
  set view(CounterView view);
  void increment();
  void incrementAndRedirect();
  void decrementAndMessage();
}
