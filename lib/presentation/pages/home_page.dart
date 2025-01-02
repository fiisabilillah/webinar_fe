import 'dart:developer';

import 'package:webinar_fe/data/code_con_repository.dart';
import 'package:webinar_fe/data/domain/entities/tresult.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CodeConRepository().getPaymentMethods().then(
                (value) {
                  switch (value) {
                    case Success(:var data):
                      for (final method in data) {
                        log(method.name);
                      }
                    case Failure(:var message):
                      log(message);
                  }
                },
              );
            },
            child: const Text('Click Me!')),
      ),
    );
  }
}
