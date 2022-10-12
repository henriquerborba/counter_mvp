import 'package:counter_mvp/pages/counter/presenter/counter_presenter.dart';
import 'package:counter_mvp/pages/counter/presenter/counter_presenter_impl.dart';
import 'package:counter_mvp/pages/counter/view/counter_view.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> implements CounterView {
  CounterPresenter presenter = CounterPresenterImpl();

  var counter = 0;

  @override
  void initState() {
    presenter.view = this;
    super.initState();
  }

  @override
  void refreshState(int newCounter) {
    setState(() {
      counter = newCounter;
    });
  }

  @override
  void redirect() {
    Navigator.of(context).pushNamed('/nova_tela', arguments: counter);
  }

  @override
  void showMessage(String s) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(s)));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Counter'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Text('Contador clicado X:'),
            Text('$counter'),
            ElevatedButton(
              onPressed: presenter.increment,
              child: const Text('Increment'),
            ),
            ElevatedButton(
              onPressed: presenter.incrementAndRedirect,
              child: const Text('Increment and redirect'),
            ),
            ElevatedButton(
                onPressed: presenter.decrementAndMessage,
                child: const Text('Decrement and message')),
          ],
        ),
      ),
    );
  }
}
