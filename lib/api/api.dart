class Api {
  //static const String BASE_URL = 'http://192.168.190.84:8080/mall-app';
  //static const String BASE_URL = 'http://192.168.190.84:8080';
//  static const String BASE_URL='http://192.168.190.35:8082/wx';
//测试更改上传2
  // static const String BASE_URL = 'http://120.25.226.11:8080/mall-app/wx';
  static const String BASE_URL = 'http://api.jiaoyibei.com/wx';
  static const String HOME_URL = BASE_URL + '/home/index'; //首页数据
  static const String BANNER_URL = BASE_URL + '/home/banner'; //获取首页banner图
  static const String CATEGORY_URL = BASE_URL + '/home/categories'; //获取首页分类
  static const String COUPON_URL = BASE_URL + '/home/couponList'; //优惠券
  static const String GROUP_BY_URL = BASE_URL + '/home/groupBuy'; //团购专区
  static const String HOME_PRODUCT_URL = BASE_URL + '/home/newProduct'; //新品
  static const String HOME_HOT_PRODUCT_URL = BASE_URL + '/home/hotProduct'; //新品
  static const String HOME_FIRST_CATEGORY =
      BASE_URL + '/catalog/getfirstcategory'; //商品分类第一级
  static const String HOME_SECOND_CATEGORY =
      BASE_URL + '/catalog/getsecondcategory'; //商品分类第二级
  static const String GOODS_TOTAL_NUMBER = BASE_URL + '/goods/count'; //获取商品总数
  static const String GOODS_CATEGORY_URL =
      BASE_URL + '/goods/category/list'; //分类下的商品分类
  static const String GOODS_LIST_URL = BASE_URL + '/goods/list'; //分类下的商品列表
  static const String GOODS_DETAILS_URL = BASE_URL + '/goods/detail'; //商品详情
  static const String REGISTER = BASE_URL + '/auth/register'; //注册
  static const String LOGIN = BASE_URL + '/auth/login'; //登录
  static const String ADD_CART = BASE_URL + '/cart/add'; //加入购物车
  static const String FAST_BUY = BASE_URL + '/cart/fastadd'; //立即购买
  static const String COLLECT_ADD_DELETE =
      BASE_URL + '/collect/addordelete'; //添加或取消收藏
  static const String CART_LIST = BASE_URL + '/cart/index'; //购物车数据
  static const String CART_UPDATE = BASE_URL + '/cart/update'; //更新购物车
  static const String CART_DELETE = BASE_URL + '/cart/delete'; //删除购物车数据
  static const String CART_CHECK = BASE_URL + '/cart/checked'; //购物车商品勾选
  static const String CART_BUY = BASE_URL + '/cart/checkout'; //购物车下单
  static const String COUPON_LIST = BASE_URL + '/coupon/selectlist'; //优惠券列表
  static const String ADDRESS_LIST = BASE_URL + '/address/list'; //地址列表
  static const String ADDRESS_SAVE = BASE_URL + '/address/save'; //增加地址
  static const String ADDRESS_DELETE = BASE_URL + '/address/delete'; //删除地址
  static const String ADDRESS_DETAIL = BASE_URL + '/address/detail'; //地址详情
  static const String ORDER = BASE_URL + '/order'; //生成订单
  static const String FEED_BACK = BASE_URL + '/feedback/submit'; //意见反馈
  static const String MINE_COUPON_LIST = BASE_URL + '/coupon/mylist'; //所有优惠券
  static const String MINE_FOOTPRINT = BASE_URL + '/footprint/list'; //足迹
  static const String MINE_FOOTPRINT_DELETE =
      BASE_URL + '/footprint/delete'; //删除足迹
  static const String MINE_COLLECT = BASE_URL + '/collect/list'; //收藏列表
  static const String SUBMIT_ORDER = BASE_URL + '/order/submit'; // 提交订单
  static const String MINE_ORDERS = BASE_URL + '/order/list'; //我的订单
  static const String MINE_ORDER_DETAIL = BASE_URL + "/order/detail"; //订单详情
  static const String MINE_ORDER_CANCEL = BASE_URL + "/order/cancel"; //取消订单
  static const String MINE_ORDER_DELETE = BASE_URL + "/order/delete"; //取消订单
  static const String SEARCH_GOODS = BASE_URL + '/search/helper'; //商品搜索
  static const String PROJECT_SELECTION_DETAIL =
      BASE_URL + '/topic/detail'; //专题精选详情
  static const String PROJECT_SELECTION_RECOMMEND =
      BASE_URL + '/topic/related'; //推荐
  static const String CATEGORY_LIST = BASE_URL + "/goods/category"; //获取分类下的子类
  static const String BRAND_DETAIL = BASE_URL + "/brand/detail"; //品牌制造商详情
  static const String RECEIVE_COUPON = BASE_URL + "/coupon/receive"; //领取优惠券
  static const String LOGIN_OUT = BASE_URL + "/auth/logout"; //退出登录
  static const String Apple_Verify = BASE_URL + "auth/appleVerify"; //苹果登录认证接口

}
