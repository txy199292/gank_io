import 'package:dio/dio.dart';
import 'package:connectivity/connectivity.dart';
import 'package:gank_io/config/Config.dart';
import 'ResultData.dart';
import 'Code.dart';

class Api {
  static final String basicUrl = ' http://gank.io/api';

  static Options mOptions = new Options(
      baseUrl: basicUrl, connectTimeout: 5000, receiveTimeout: 3000);

  ///get请求
  static get(String url, Function onSuccess, Function onError,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers,
      bool noTip = false,
      String progressTip,
      Function onProgress,
      Function onComplete}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      if (onProgress != null) {
        onProgress(progressTip);
      }
      onError('网络未连接,请稍后重试！');
      if (onComplete != null) {
        onComplete();
      }
      return;
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
      dio.interceptor.request.onSend = (Options options) {
        //请求之前添加拦截器
        if (progressTip != null && progressTip.isNotEmpty) {
          if (onProgress != null) {
            onProgress(info: progressTip);
          }
        } else {
          onProgress();
        }
        return options;
      };
      response = await dio.get(url, data: params, options: mOptions);
      if (response.data['error']) {
        onSuccess(response.data['results']);
      } else {
        onError('服务器错误，请稍后重试！');
      }
    } on DioError catch (e) {
      onError(e.message);
    } finally {
      if (onComplete != null) {
        onComplete();
      }
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
  }

  ///post请求
  static post(String url, Function onSuccess, Function onError,
      {Map<String, dynamic> params,
      String baseUrl,
      Map<String, String> headers,
      bool noTip = false,
      String progressTip,
      Function onProgress,
      Function onComplete}) async {
    var connectivityResult = await (new Connectivity().checkConnectivity());
    //无网络连接
    if (connectivityResult == ConnectivityResult.none) {
      if (onProgress != null) {
        onProgress(progressTip);
      }
      onError('网络未连接,请稍后重试！');
      if (onComplete != null) {
        onComplete();
      }
      return;
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
      dio.interceptor.request.onSend = (Options options) {
        //请求之前添加拦截器
        if (progressTip != null && progressTip.isNotEmpty) {
          if (onProgress != null) {
            onProgress(info: progressTip);
          }
        } else {
          onProgress();
        }
        return options;
      };
      response = await dio.post(url, data: params, options: mOptions);
      if (response.data['error']) {
        onSuccess(response.data['results']);
      } else {
        onError('服务器错误，请稍后重试！');
      }
    } on DioError catch (e) {
      onError(e.message);
    } finally {
      if (onComplete != null) {
        onComplete();
      }
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
  }
}
