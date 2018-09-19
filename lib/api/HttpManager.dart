import 'dart:async';
import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gank_io/config/Config.dart';
import 'ResultData.dart';
import 'Code.dart';

class HttpManager {
  static final String basicUrl = ' http://gank.io/api';

  static Options mOptions = new Options(
      baseUrl: basicUrl, connectTimeout: 5000, receiveTimeout: 3000);

  ///get请求
  static Future<ResultData> get(String url,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers,
      bool noTip = false,
      String progressTip}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      return new ResultData(Code.errorHandlerFunction(Code.NETWORK_ERROR, '无网络连接', noTip), true, Code.NETWORK_ERROR);
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
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: Code.UNKNOW_ERROR);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandlerFunction(errorResponse.statusCode, e.message, noTip), true, errorResponse.statusCode);
    }finally{
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

    if(!response.data['error']){
      return new ResultData(response.data, false, Code.SUCCESS);
    }else{
      return new ResultData(Code.errorHandlerFunction(Code.SERVER_ERROR, '服务器内部错误', noTip), true, Code.SUCCESS);
    }


  }

  ///post请求
  static Future<ResultData> post(String url,
      {Map<String, dynamic> params,
        String baseUrl,
        Map<String, String> headers,
        bool noTip = false,
        String progressTip}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      return new ResultData(Code.errorHandlerFunction(Code.NETWORK_ERROR, '无网络连接', noTip), true, Code.NETWORK_ERROR);
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
      Response errorResponse;
      if (e.response != null) {
        errorResponse = e.response;
      } else {
        errorResponse = new Response(statusCode: Code.UNKNOW_ERROR);
      }
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        errorResponse.statusCode = Code.NETWORK_TIMEOUT;
      }
      return new ResultData(Code.errorHandlerFunction(errorResponse.statusCode, e.message, noTip), true, errorResponse.statusCode);
    }finally{
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

    if(!response.data['error']){
      return new ResultData(response.data, false, Code.SUCCESS);
    }else{
      return new ResultData(Code.errorHandlerFunction(Code.SERVER_ERROR, '服务器内部错误', noTip), true, Code.SUCCESS);
    }


  }
}
