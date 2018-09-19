import 'dart:async';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:gank_io/eventbus/HttpErrorEvent.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gank_io/config/Config.dart';
import 'ResultData.dart';

class HttpManager {
  static final String basicUrl = ' http://gank.io/api';
  static final EventBus eventBus = new EventBus();
  static Options mOptions = new Options(
      baseUrl: basicUrl, connectTimeout: 5000, receiveTimeout: 3000);

  ///get请求
  static Future<ResultData> get(String url,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      eventBus.fire(new HttpErrorEvent('无网络连接'));
      return new ResultData(true, null, '无网络连接');
    }
    //添加header
    if (headers != null && headers.isNotEmpty) {
      mOptions.headers = headers;
    }
    //修改baseUrl
    if (baseUrl != null && baseUrl.isNotEmpty) {
      mOptions.baseUrl = baseUrl;
    }
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.get(url, data: params, options: mOptions);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        eventBus.fire(new HttpErrorEvent('连接超时'));
        return new ResultData(true, null, '连接超时');
      }else if (e.response != null) {
        eventBus.fire(new HttpErrorEvent(e.message));
        return new ResultData(true, null,e.message);
      } else {
        eventBus.fire(new HttpErrorEvent('未知错误'));
        return new ResultData(true, null,'未知错误');
      }


    } finally {
      if (Config.DEBUG) {
        print('请求url: ' + url);
        if (mOptions.headers.toString().isNotEmpty) {
          print('请求header: ' + mOptions.headers.toString());
        }
        if (response != null) {
          print('返回结果: ' + response.toString());
        }
      }
    }

    if (!response.data['error']) {
      return new ResultData(false,response.data, null);
    } else {
      eventBus.fire(new HttpErrorEvent('服务器内部错误'));
      return new ResultData(true,null, '服务器内部错误');
    }
  }

  ///post请求
  static Future<ResultData> post(String url,
      {Map<String, dynamic> params,
        String baseUrl,
        Map<String, String> headers}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      eventBus.fire(new HttpErrorEvent('无网络连接'));
      return new ResultData(true, null, '无网络连接');
    }
    //添加header
    if (headers != null && headers.isNotEmpty) {
      mOptions.headers = headers;
    }
    //修改baseUrl
    if (baseUrl != null && baseUrl.isNotEmpty) {
      mOptions.baseUrl = baseUrl;
    }
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.post(url, data: params, options: mOptions);
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        eventBus.fire(new HttpErrorEvent('连接超时'));
        return new ResultData(true, null, '连接超时');
      }else if (e.response != null) {
        eventBus.fire(new HttpErrorEvent(e.message));
        return new ResultData(true, null,e.message);
      } else {
        eventBus.fire(new HttpErrorEvent('未知错误'));
        return new ResultData(true, null,'未知错误');
      }


    } finally {
      if (Config.DEBUG) {
        print('请求url: ' + url);
        if (mOptions.headers.toString().isNotEmpty) {
          print('请求header: ' + mOptions.headers.toString());
        }
        if (response != null) {
          print('返回结果: ' + response.toString());
        }
      }
    }

    if (!response.data['error']) {
      return new ResultData(false,response.data, null);
    } else {
      eventBus.fire(new HttpErrorEvent('服务器内部错误'));
      return new ResultData(true,null, '服务器内部错误');
    }
  }
}
