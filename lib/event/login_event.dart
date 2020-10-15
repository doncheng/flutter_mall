import 'package:event_bus/event_bus.dart';

EventBus loginEventBus = EventBus();
EventBus personalDataBus = EventBus();

class LoginEvent {
  bool isLogin;
  String nickName;
  String url;
  String token;
  String phoneNumber;
  int gender;

  LoginEvent(
    this.isLogin, {
    this.nickName,
    this.url,
    this.token,
    this.phoneNumber,
    this.gender,
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
