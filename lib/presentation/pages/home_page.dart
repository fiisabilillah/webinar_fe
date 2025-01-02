import 'dart:developer';

import 'package:webinar_fe/data/code_con_repository.dart';
import 'package:webinar_fe/domain/duitku_entities/create_reservation_params.dart';
import 'package:webinar_fe/domain/entities/tresult.dart';
import 'package:flutter/material.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: ElevatedButton(
            onPressed: () {
              CodeConRepository()
                  .createReservation(
                      params: CreateReservationParams(
                          paymentMethod: 'VA',
                          orderId: 'ORD-123888',
                          customerName: 'John Wick',
                          customerEmail: 'wick@blackpink.com',
                          returnUrl: '',
                          totalPayment: 350000))
                  .then(
                (value) {
                  switch (value) {
                    case Success(:var data):
                      {
                        log(data.orderId);
                        log(data.email);
                        log(data.name);
                        log(data.status);
                        log(data.paymentUrl);
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
