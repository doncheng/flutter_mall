import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();
EventBus personalDataBus = EventBus();

class LoginEvent {
  bool isLogin;
  String nickName;
  String url;

  int shoppingcartfootprintnum1;
  int shoppingcartfootprintnum2;
  int shoppingcartfootprintnum3;
  int shoppingcartfootprintnum4;

  LoginEvent(
    this.isLogin, {
    this.nickName,
    this.url,
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
