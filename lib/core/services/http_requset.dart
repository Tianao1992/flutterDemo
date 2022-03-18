import 'package:dio/dio.dart';
import 'conifg.dart';

class HttpRequest {
  static final BaseOptions baseOption = BaseOptions(
      baseUrl: httpConfig.baseURL, connectTimeout: httpConfig.timeout);
  static final Dio dio = Dio(baseOption);
  static Future<T> requset<T>(String url,
      {String method = 'get',
      Map<String, dynamic>? params,
      Interceptor? inter}) async {
    //单独配置
    final option = Options(method: method);

    Interceptor dInter = InterceptorsWrapper(onRequest: (options, handler) {
      return handler.next(options); //continue
    }, onResponse: (response, handler) {
      // Do something with response data
      return handler.next(response); // continue
      // 如果你想终止请求并触发一个错误,你可以 reject 一个`DioError`对象,如`handler.reject(error)`，
      // 这样请求将被中止并触发异常，上层catchError会被调用。
    }, onError: (DioError e, handler) {
      // Do something with response error
      return handler.next(e); //continue
      // 如果你想完成请求并返回一些自定义数据，可以resolve 一个`Response`,如`handler.resolve(response)`。
      // 这样请求将会被终止，上层then会被调用，then中返回的数据将是你的自定义response.
    });

    List<Interceptor> inters = [dInter];
    if (inter != null) {
      inters.add(inter);
    }
    dio.interceptors.addAll(inters);
    //发送网络请求
    try {
      Response res =
          await dio.request(url, queryParameters: params, options: option);
      return res.data;
    } on DioError catch (e) {
      // 错误的网络请求
      return Future.error(e);
    }
  }
}
