import 'package:dio/dio.dart';

class CodeConRepository {
  final Dio _dio;
  final String baseUrl = 'code-con-course-be.globeapp.dev';

  CodeConRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<String> testGetPaymentMethods() async {
    try {
      final response =
          await _dio.post('https://$baseUrl/getPaymentMethods', data: {
        'amount': 100000,
      });
      return response.data.toString();
    } on DioException catch (e) {
      return 'Error: ${e.message}';
    }
  }

  Future<String> testMakingReservation() async {
    try {
      final response =
          await _dio.post('https://$baseUrl/makingReservation', data: {
        "paymentMethod": "VA",
        "orderId": "ORD-123999",
        "customerName": "John Rambo",
        "customerEmail": "rambo@blackpink.com",
        "returnUrl": "",
        "totalPayment": 250000,
        "orderDescription": "CodeCon Ticket"
      });
      return response.data.toString();
    } on DioException catch (e) {
      return 'Error: ${e.message}';
    }
  }

  Future<String> testCheckReservation() async {
    try {
      final response = await _dio.post('https://$baseUrl/checkReservation',
          data: {'email': 'rambo@blackpink.com'});
      return response.data.toString();
    } on DioException catch (e) {
      return 'Error: ${e.message}';
    }
  }
}
