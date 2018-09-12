import 'package:event_bus/event_bus.dart';
import 'package:gank_io/eventbus/HttpErrorEvent.dart';

class Code{
  //网络错误
  static const NETWORK_ERROR = -1;
  //网络超时
  static const NETWORK_TIMEOUT = -2;
  //网络返回数据json解析错误
  static const NETWORK_JSON_EXCEPTION = -3;

  static const SUCCESS = 200;
  
  static final EventBus eventBus = new EventBus();

  static String errorHandlerFunction(int code,String message,bool noTip){
    if(noTip) return message;
    eventBus.fire(new HttpErrorEvent(code, message));
    return message;
  }



}