import 'package:dio/dio.dart';

Future<String> getHttpTest() async {
  try {
    Response response = await Dio().get("http://www.baidu.com");
    print(response);
    return response.toString();
  } catch (e) {
    print(e);
  }
  return "";
}
