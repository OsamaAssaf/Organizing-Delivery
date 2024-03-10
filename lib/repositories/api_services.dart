import '../resources/helpers/all_imports.dart';
import 'package:http/http.dart' as http;

class ApiServices {
  ApiServices._();

  static final _instance = ApiServices._();
  factory ApiServices() => _instance;

  Future<http.Response> get(String endPoint) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    final http.Response response = await http
        .get(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  Future<http.Response> post({
    required String endPoint,
    required String body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    final http.Response response = await http
        .post(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  Future<http.Response> put({
    required String endPoint,
    required body,
  }) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    final http.Response response = await http
        .put(
      Uri.parse(url),
      body: body,
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }

  Future<http.Response> delete(String endPoint) async {
    final String url = '${DotenvManager.apiPath}/$endPoint';
    final http.Response response = await http
        .delete(
      Uri.parse(url),
    )
        .timeout(
      ExceptionManager().timedOutDuration,
      onTimeout: () {
        return http.Response(ExceptionManager.timedOutException, 408);
      },
    );
    ExceptionManager().checkTimedOut(response.statusCode);
    return response;
  }
}
