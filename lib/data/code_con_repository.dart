import 'package:webinar_fe/domain/duitku_entities/create_reservation_params.dart';
import 'package:webinar_fe/domain/duitku_entities/get_payment_method_params.dart';
import 'package:webinar_fe/domain/entities/payment_method.dart';
import 'package:webinar_fe/domain/entities/reservation.dart';
import 'package:webinar_fe/domain/entities/tresult.dart';
import 'package:dio/dio.dart';

class CodeConRepository {
  final Dio _dio;
  final String baseUrl = 'https://webinar-be-9d58.globeapp.dev';

  CodeConRepository({Dio? dio}) : _dio = dio ?? Dio();

  Future<TResult<List<PaymentMethod>>> getPaymentMethods(
      {GetPaymentMethodParams? params}) async {
    try {
      final response = await _dio.post('$baseUrl/getPaymentMethods',
          data: params?.toJson() ?? {});

      final paymentMethods = (response.data['paymentFee'] as List)
          .map(
            (m) => PaymentMethod.fromJson(m),
          )
          .toList();

      return Success(paymentMethods);
    } on DioException catch (e) {
      return Failure('${e.response?.data ?? e.message}');
    }
  }

  Future<TResult<Reservation>> createReservation(
      {required CreateReservationParams params}) async {
    try {
      final response =
          await _dio.post('$baseUrl/makingReservation', data: params.toJson());

      final reservation = Reservation.fromJson(response.data['data']);
      return Success(reservation);
    } on DioException catch (e) {
      return Failure('${e.response?.data ?? e.message}');
    }
  }

  Future<String> testCheckReservation() async {
    try {
      final response = await _dio.post('$baseUrl/checkReservation',
          data: {'email': 'rambo@blackpink.com'});
      return response.data.toString();
    } on DioException catch (e) {
      return 'Error: ${e.message}';
    }
  }
}
