import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart';
import 'package:friut_hub/core/endpoints/endpoints.dart';
import 'package:friut_hub/features/e_commerce/order/domain/entities/create_order_param.dart';

abstract class OrderRemoteDataSource {
  Future<Unit> createOrder(CreateOrderParamEntity orderParam);
}

class OrderDsWithDio implements OrderRemoteDataSource {
  final Dio dio;

  OrderDsWithDio({required this.dio});

  @override
  Future<Unit> createOrder(CreateOrderParamEntity orderParam) async {
    final response = await dio.post(
      Endpoints.createOrder,
      data: {
        'customerFullName': orderParam.customerFullName,
        'customerAddress': orderParam.customerAddress,
        'customerCity': orderParam.customerCity,
        'customerDepartment': orderParam.customerDepartment,
        'customerPhoneNumber': orderParam.customerPhoneNumber,
      },
    );

    print("status code for create Order: ${response.statusCode}");
    print("getting the create Order ${response.data}");

    return unit;
  }
}
