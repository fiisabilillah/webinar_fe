import 'package:webinar_fe/data/domain/duitku_entities/get_payment_method_params.dart';
import 'package:webinar_fe/data/domain/entities/payment_method.dart';
import 'package:webinar_fe/data/domain/entities/tresult.dart';
import 'package:dio/dio.dart';

class CodeConRepository {
  final Dio _dio;
  final String baseUrl = 'code-con-course-be.globeapp.dev';

  CodeConRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<TResult<List<PaymentMethod>>> getPaymentMethods(
      {GetPaymentMethodParams? params}) async {
    try {
      final response = await _dio.post('https://$baseUrl/getPaymentMethods',
          data: params?.toJson() ?? {});

      final paymentMethods = (response.data['paymentFee'] as List)
          .map(
            (m) => PaymentMethod.fromJson(m),
          )
          .toList();

      return Success(paymentMethods);
    } on DioException catch (e) {
      return Failure(e.response?.data.toString() ?? e.message.toString());
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
