import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'ResultData.dart';
import 'Code.dart';
import 'dart:async';

class Api{
  static final String basicUrl = ' http://gank.io/api';

  static Options optionGet = new Options(
    method: 'GET',
    baseUrl:basicUrl,
    connectTimeout:5000,
    receiveTimeout:3000
  );

  static Options optionsPost = new Options(
      method: 'GET',
      baseUrl:basicUrl,
      connectTimeout:5000,
      receiveTimeout:3000
  );


  ///get请求
  static Future<ResultData> get(String url,{Map<String, dynamic> params, String baseUrl,Map<String, String> headers,bool noTip = false}) async{
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      return new ResultData(null, true, Code.errorHandlerFunction(Code.NETWORK_ERROR, '网络连接失败，请打开网络再试', noTip));
    }
    //添加header
    if(headers != null && headers.isNotEmpty){
      optionGet.headers = headers;
    }
    //修改baseUrl
    if(baseUrl !=null && baseUrl.isNotEmpty){
      optionGet.baseUrl = baseUrl;
    }
    if(params !=null && params.isNotEmpty){
      params.forEach((key,value){
        url = url+key+value.toString();
      });
      if(url.endsWith('&')){
        url = url.substring(0,url.length-2);
      }
    }
    Dio dio = new Dio();
    Response response;
    try {
      response = await dio.get(url, options: optionGet).catchError(onError);
    }on DioError catch(e) {

    }
    return null;


  }



}