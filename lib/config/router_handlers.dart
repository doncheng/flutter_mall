import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/page/bill/balance_recharge.dart';
import 'package:mall/page/bill/capital_subsidiary.dart';
import 'package:mall/page/bill/freeze_funds.dart';
import 'package:mall/page/bill/my_assets.dart';
import 'package:mall/page/bill/wallet_card.dart';
import 'package:mall/page/bill/withdrawal.dart';
import 'package:mall/page/home/mall.dart';
import 'package:mall/page/home/nicknamechange.dart';
import 'package:mall/page/home/personaldata.dart';
import 'package:mall/page/home/user_phone.dart';
import 'package:mall/page/home/webview.dart';
import 'package:mall/page/login/landing.dart';
import 'package:mall/page/mine/recharge.dart';
import 'package:mall/page/splash/splash.dart';
import 'package:mall/page/goods/category_goods_list.dart';
import 'package:mall/page/login/register.dart';
import 'package:mall/page/login/login.dart';
import 'package:mall/utils/string_util.dart';
import 'package:mall/page/goods/goods_detail.dart';
import 'package:mall/page/goods/fill_in_order.dart';
import 'package:mall/page/mine/address.dart';
import 'package:mall/page/mine/edit_address.dart';
import 'package:mall/page/mine/feedback.dart';
import 'package:mall/page/mine/coupon.dart';
import 'package:mall/page/mine/footprint.dart';
import 'package:mall/page/mine/collect.dart';
import 'package:mall/page/mine/about.dart';
import 'package:mall/page/mine/order.dart';
import 'package:mall/page/mine/order_detail.dart';
import 'package:mall/page/goods/search_goods.dart';
import 'package:mall/page/goods/project_selection_detail.dart';
import 'package:mall/widgets/webview.dart';
import 'package:mall/utils/fluro_convert_utils.dart';
import 'package:mall/page/home/brand_detail.dart';
import 'package:mall/page/home/settings.dart';
import 'package:mall/page/home/placetheorder.dart';

var settingsPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SettingsPage();
});

var goPlacetheorderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return PlacetheorderPage();
});

//手机进入的第一个界面
var homeHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return MallMainView();
});
// var homeHandler = Handler(
//     handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
//   return webviewPage();
// });

var splashHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SplashView();
});

var categoryGoodsListHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var cateforyName =
      StringUtils.decode(parameters["categoryName"].first).toString();
  print("cateforyName" + cateforyName);
  print("categoryId" + parameters["categoryId"].first);
  var categoryId = int.parse(parameters["categoryId"].first);
  return CategoryListView(categoryName: cateforyName, categoryId: categoryId);
});

var registerHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return RegisterView();
});
//***************************路由配置添加**************************************//
var goAssetsPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  //return回要跳转的页面

  return AssetsPage();
});

var goCapitalPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CapitalPage();
});

var goFreezePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FreezePage();
});

var goBalanceRechargePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return BalanceRechargePage();
});

var goWithdrawalPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return WithdrawalPage();
});
var goWalletCardPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return WalletCardPage();
});

//
var loginHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return landingPage();
});

var UserPhonePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return UserPhonePage();
});
var nicknamechangePageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return nicknamechangePage();
});
var personaldataPageHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return personaldataPage();
});
var goodsDetailsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<Object>> parameters) {
  var goodsId = int.parse(parameters["goodsId"].first);
  return GoodsDetail(goodsId: goodsId);
});

var fillInOrderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var cartId = int.parse(parameters["cartId"].first);
  return FillInOrderView(cartId);
});

var addressHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AddressView();
});

var addressEditHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var addressId = int.parse(parameters["addressId"].first);
  return EditAddressView(addressId);
});
var feedbackHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FeedBackView();
});

var mineCouponHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CouponView();
});
var footPrintHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return FootprintView();
});
var collectHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return CollectView();
});
var aboutHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return AboutUsView();
});

var orderHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return OrderView();
});
var orderDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  int orderId = int.parse(parameters["orderId"].first);
  String token = parameters["token"].first;
  return OrderDetail(orderId, token);
});

var searchGoodsHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  return SearchGoodsView();
});

var projectSelectionDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var id = int.parse(parameters["id"].first);
  return ProjectSelectionDetailView(id);
});

var webViewHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var title = FluroConvertUtil.fluroCnParamsDecode(parameters["title"].first);
  var url = FluroConvertUtil.fluroCnParamsDecode(parameters["url"].first);
  return WebViewPage(url, title);
});

var brandDetailHandler = Handler(
    handlerFunc: (BuildContext context, Map<String, List<String>> parameters) {
  var titleName =
      FluroConvertUtil.fluroCnParamsDecode(parameters["titleName"].first);
  var id = parameters["id"].first;
  return BrandDetailView(titleName, id);
});
