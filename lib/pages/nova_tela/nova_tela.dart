import 'package:flutter/material.dart';

class NovaTela extends StatelessWidget {
  const NovaTela({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Nova Tela'),
      ),
      body: Center(
        child: Text('${ModalRoute.of(context)?.settings.arguments}'),
      ),
    );
  }
}
