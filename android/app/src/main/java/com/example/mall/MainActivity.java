package com.example.mall;

import android.content.Intent;
import android.os.Bundle;
import android.widget.Button;

import io.flutter.app.FlutterActivity;
import io.flutter.plugin.common.MethodCall;
import io.flutter.plugin.common.MethodChannel;
import io.flutter.plugins.GeneratedPluginRegistrant;

public class MainActivity extends FlutterActivity {
  String   C_NAME="example.mall/call_native";//路径同步
    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        new MethodChannel(getFlutterView(),C_NAME).setMethodCallHandler(
                new MethodChannel.MethodCallHandler() {
                    @Override
                    public void onMethodCall(MethodCall methodCall, MethodChannel.Result result) {
                        if(methodCall.method.equals("NoValidationlanding")){
                            result.success("免验证");
                        }
                    else if(methodCall.method.equals("WeChatlanding")){

                            result.success("微信");
                        }
                        else if(methodCall.method.equals("Alipaylanding")){

                            result.success("支付宝");
                        }else if(methodCall.method.equals("call_native_method")){
                            
                            result.success("手机一键登陆");
                        }
                        else{
                            result.success("I don't know what you say");
                        }
                    }
                }
        );
        GeneratedPluginRegistrant.registerWith(this);
    }
}
