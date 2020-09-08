import 'package:fluro/fluro.dart';
import 'package:flutter/material.dart';
import 'package:mall/config/application.dart';
import 'package:mall/config/routers.dart';
import 'package:mall/utils/string_util.dart';
import 'package:mall/utils/fluro_convert_utils.dart';

class NavigatorUtils {
  static goMallMainPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.home,
        transition: TransitionType.native, replace: true);
  }

//**********************************路由配置************************************//
//跳转方法调用
  static goAssetsPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goAssetsPage,
        transition: TransitionType.native);
  }

  static goCapitalPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goCapitalPage,
        transition: TransitionType.native);
  }

  static goFreezePage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goFreezePage,
        transition: TransitionType.native);
  }

  static goBalanceRechargePage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goBalanceRechargePage,
        transition: TransitionType.native);
  }

  static goWithdrawalPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goWithdrawalPage,
        transition: TransitionType.native);
  }

  static goWalletCardPage(BuildContext context) {
    Application.router.navigateTo(context, Routers.goWalletCardPage,
        transition: TransitionType.native);
  }

//
  static goCategoryGoodsListPage(
      BuildContext context, String categoryName, int categoryId) {
    var categoryNameText = StringUtils.encode(categoryName);

    Application.router.navigateTo(
        context,
        Routers.categoryGoodsList +
            "?categoryName=$categoryNameText&categoryId=$categoryId",
        transition: TransitionType.native);
  }

  static goRegister(BuildContext context) {
    Application.router.navigateTo(context, Routers.register,
        transition: TransitionType.native);
  }

  static goLogin(BuildContext context) {
    Application.router
        .navigateTo(context, Routers.login, transition: TransitionType.native);
  }

  static goSettings(BuildContext context) {
    Application.router.navigateTo(context, Routers.settingsPage,
        transition: TransitionType.native);
  }

  static goUserPhonePage(BuildContext context) {
    Application.router.navigateTo(context, Routers.UserPhonePage,
        transition: TransitionType.native);
  }

  static gonicknamechangePage(BuildContext context) {
    Application.router.navigateTo(context, Routers.nicknamechangePage,
        transition: TransitionType.native);
  }

  static goPersonalData(BuildContext context) {
    Application.router.navigateTo(context, Routers.personaldataPage,
        transition: TransitionType.native);
  }

  static goPlacetheorder(BuildContext context) {
    Application.router.navigateTo(context, Routers.goPlacetheorder,
        transition: TransitionType.native);
  }

  static goGoodsDetails(BuildContext context, int goodsId) {
    Application.router.navigateTo(
        context, Routers.goodsDetail + "?goodsId=$goodsId",
        transition: TransitionType.native);
  }

  static popRegister(BuildContext context) {
    Application.router.pop(context);
  }

  static goFillInOrder(BuildContext context, int cartId) {
    Application.router.navigateTo(
        context, Routers.fillInOrder + "?cartId=$cartId",
        transition: TransitionType.native);
  }

  static Future goAddress(BuildContext context) async {
    return await Application.router.navigateTo(context, Routers.address,
        transition: TransitionType.native);
  }

  static Future goAddressEdit(BuildContext context, int addressId) {
    return Application.router.navigateTo(
        context, Routers.addressEdit + "?addressId=$addressId",
        transition: TransitionType.native);
  }

  static goFeedback(BuildContext context) {
    Application.router.navigateTo(context, Routers.feedback,
        transition: TransitionType.native);
  }

  static goCoupon(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineCoupon,
        transition: TransitionType.native);
  }

  static goFootprint(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineFootprint,
        transition: TransitionType.native);
  }

  static goCollect(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineCollect,
        transition: TransitionType.native);
  }

  static goAboutUs(BuildContext context) {
    Application.router.navigateTo(context, Routers.aboutUs,
        transition: TransitionType.native);
  }

  static submitOrderSuccessPop(BuildContext context) {
    Application.router.navigateTo(context, Routers.home,
        clearStack: true, transition: TransitionType.native);
  }

  static goOrder(BuildContext context) {
    Application.router.navigateTo(context, Routers.mineOrder,
        transition: TransitionType.native);
  }

  static Future goOrderDetail(BuildContext context, int orderId, String token) {
    return Application.router.navigateTo(
        context, Routers.mineOrderDetail + "?orderId=$orderId&token=$token",
        transition: TransitionType.native);
  }

  static goSearchGoods(BuildContext context) {
    Application.router.navigateTo(context, Routers.searchGoods,
        transition: TransitionType.native);
  }

  static goProjectSelectionDetail(BuildContext context, int id, bool replace) {
    Application.router.navigateTo(
        context, Routers.projectSelectionDetail + "?id=$id",
        replace: replace, transition: TransitionType.native);
  }

  static goWebView(BuildContext context, String title, String url) {
    var titleName = FluroConvertUtil.fluroCnParamsEncode(title);
    var urlEncode = FluroConvertUtil.fluroCnParamsEncode(url);
    // Application.router.navigateTo(
    //        context, Routers.webView + "?title=${Uri.encodeComponent(title)}&url=${Uri.encodeComponent(url)}",
    //        transition: TransitionType.inFromRight);
    Application.router.navigateTo(
        context, Routers.webView + "?title=$titleName&&url=$urlEncode",
        transition: TransitionType.native);
  }

  static goBrandDetail(BuildContext context, String titleName, int id) {
    var title = FluroConvertUtil.fluroCnParamsEncode(titleName);
    Application.router.navigateTo(
        context, Routers.brandDetail + "?titleName=$title&id=$id",
        transition: TransitionType.native);

    // Navigator.pushNamed(
    //     context, Routers.brandDetail + "?titleName=$title&id=$id");
  }
}
