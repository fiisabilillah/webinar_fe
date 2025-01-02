import 'dart:developer';

import 'package:webinar_fe/data/code_con_repository.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CodeConRepository().testCheckReservation().then(
                (value) {
                  log(value);
                },
              );
            },
            child: const Text('Click Me!')),
      ),
    );
  }
}
