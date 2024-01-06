abstract class ApiConsumer {
  Future<dynamic> get(String pathe,{Map<String,dynamic>?queryParametes});
 Future<dynamic> post(String path,
      {Map<String, dynamic>? body, Map<String, dynamic>? queryParameters});
}
