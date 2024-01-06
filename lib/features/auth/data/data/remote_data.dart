import 'package:finjan/core/api/api_consumer.dart';
import 'package:finjan/core/api/api_endpoints.dart';
import 'package:finjan/features/auth/data/model/UserRegister_model.dart';
import 'package:finjan/features/auth/data/model/success_register_model.dart';

abstract class RemoteDataSource {
  Future<SuccessRegister> register(UserRegisterModel userRegisterModel);
}

class RemoteDataSourceImpl implements RemoteDataSource {
  ApiConsumer apiConsumer;
  RemoteDataSourceImpl({required this.apiConsumer});

  @override
  Future<SuccessRegister> register(UserRegisterModel userRegisterModel) async {
    final response = await apiConsumer.post(APIEndPoints.regiter, body: {
      "name": userRegisterModel.name,
      "email": userRegisterModel.email,
      "password": userRegisterModel.password,
      "phone": userRegisterModel.phone
    });
    return SuccessRegister.fromJson(response);
  }
}
