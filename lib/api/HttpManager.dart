import 'dart:async';
import 'dart:io';
import 'package:dio/dio.dart';
import 'package:event_bus/event_bus.dart';
import 'package:gank_io/eventbus/HttpErrorEvent.dart';
import 'package:gank_io/eventbus/DownloadEvent.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gank_io/config/Config.dart';
import 'ResultData.dart';
import 'package:path_provider/path_provider.dart';
import 'package:simple_permissions/simple_permissions.dart';
import 'package:fluttertoast/fluttertoast.dart';

class HttpManager {
  static final String basicUrl = 'http://gank.io/api';
  static final EventBus eventBus = new EventBus();
  static final Options mOptions = new Options(
      baseUrl: basicUrl, connectTimeout: 5000, receiveTimeout: 3000);

  ///get请求
  static Future<ResultData> get(String url,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      eventBus.fire(HttpErrorEvent('无网络连接'));
      return ResultData(true, null, '无网络连接');
    }

    Dio dio = Dio(mOptions);
    Response response;
    try {
      if (params != null && params.isNotEmpty) {
        response = await dio.get(url, data: params);
      } else {
        response = await dio.get(url);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        eventBus.fire(HttpErrorEvent('连接超时'));
        return ResultData(true, null, '连接超时');
      } else if (e.response != null) {
        eventBus.fire(HttpErrorEvent(e.message));
        return ResultData(true, null, e.message);
      } else {
        eventBus.fire(HttpErrorEvent('未知错误'));
        return ResultData(true, null, '未知错误');
      }
    } finally {
      if (Config.DEBUG) {
        print('请求url: ' + dio.options.baseUrl + url);
        if (response != null) {
          print('返回结果: ' + response.data.toString());
        }
      }
    }

    if (!response.data['error']) {
      return ResultData(false, response.data, null);
    } else {
      eventBus.fire(HttpErrorEvent('服务器内部错误'));
      return ResultData(true, null, '服务器内部错误');
    }
  }

  ///post请求
  static Future<ResultData> post(String url,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers}) async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      eventBus.fire(HttpErrorEvent('无网络连接'));
      return ResultData(true, null, '无网络连接');
    }

    Dio dio = Dio(mOptions);
    Response response;
    try {
      if (params != null && params.isNotEmpty) {
        response = await dio.get(url, data: params);
      } else {
        response = await dio.post(url);
      }
    } on DioError catch (e) {
      if (e.type == DioErrorType.CONNECT_TIMEOUT) {
        eventBus.fire(HttpErrorEvent('连接超时'));
        return ResultData(true, null, '连接超时');
      } else if (e.response != null) {
        eventBus.fire(HttpErrorEvent(e.message));
        return ResultData(true, null, e.message);
      } else {
        eventBus.fire(HttpErrorEvent('未知错误'));
        return ResultData(true, null, '未知错误');
      }
    } finally {
      if (Config.DEBUG) {
        String reqUrl = dio.options.baseUrl + url + "&";
        if (params != null) {
          params.forEach((key, value) {
            reqUrl = reqUrl + key + "=" + value + "&";
          });
        }
        if (reqUrl.endsWith('&')) {
          reqUrl = reqUrl.substring(0, reqUrl.length - 1);
        }
        print('请求url: ' + reqUrl);
        if (response != null) {
          print('返回结果: ' + response.data.toString());
        }
      }
    }

    if (!response.data['error']) {
      return ResultData(false, response.data, null);
    } else {
      eventBus.fire(HttpErrorEvent('服务器内部错误'));
      return ResultData(true, null, '服务器内部错误');
    }
  }

  static void downloadFile(String url, String fileName) async {
    var dio = new Dio();

    dio.onHttpClientCreate = (HttpClient client) {
      client.idleTimeout = new Duration(seconds: 0);
    };

    Directory appDocDir = await getApplicationDocumentsDirectory();
    String appDocPath = appDocDir.path;
    String path = '${appDocPath}/${fileName}';
    bool isFirst = true;

    if(Platform.isAndroid){
      path = '/storage/emulated/0/${fileName}';
    }

    SimplePermissions.requestPermission(Permission.WriteExternalStorage).then((status){
      if(status == PermissionStatus.authorized){
        dio.download(url,path ,
            onProgress: (received, total) {
              double progress  = received / total;;
              if(isFirst) {
                eventBus.fire(DownloadEvent(0));
                isFirst = false;
              }else{
                if(progress == 1){
                  eventBus.fire(DownloadEvent(1));
                  Fluttertoast.showToast(msg: '下载完成');
                }
              }

            });
      }
    });






  }
}
