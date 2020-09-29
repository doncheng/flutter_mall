import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();
EventBus personalDataBus = EventBus();

class LoginEvent {
  bool isLogin;
  String nickName;
  String url;
  String mytradingnum1;
  String mytradingnum2;
  String mytradingnum3;
  String mytradingnum4;
  String shoppingcartfootprintnum1;
  String shoppingcartfootprintnum2;
  String shoppingcartfootprintnum3;
  String shoppingcartfootprintnum4;

  LoginEvent(
    this.isLogin, {
    this.nickName,
    this.url,
    this.mytradingnum1,
    this.mytradingnum2,
    this.mytradingnum3,
    this.mytradingnum4,
    this.shoppingcartfootprintnum1,
    this.shoppingcartfootprintnum2,
    this.shoppingcartfootprintnum3,
    this.shoppingcartfootprintnum4,
  });
}

class PersonalDataEvent {
  String nickName;
  String url;

  PersonalDataEvent({
    this.nickName,
    this.url,
  });
}
