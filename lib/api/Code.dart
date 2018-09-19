import 'package:event_bus/event_bus.dart';
import 'package:gank_io/eventbus/HttpErrorEvent.dart';

class Code{
  //网络错误
  static const NETWORK_ERROR = -1;
  //网络超时
  static const NETWORK_TIMEOUT = -2;
  //网络返回数据json解析错误
  static const JSON_EXCEPTION_ERROR = -3;
  //服务器错误
  static const SERVER_ERROR = -4;
  //未知错误
  static const UNKNOW_ERROR = -5;

  static const SUCCESS = 200;
  
  static final EventBus eventBus = new EventBus();

  static String errorHandlerFunction(int code,String message,bool noTip){
    if(noTip) return message;
    eventBus.fire(new HttpErrorEventHttpErrorEvent(code, message));
    return message;
  }



}