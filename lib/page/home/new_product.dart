import 'dart:math';

import 'package:flutter/material.dart';
import 'package:mall/entity/home_entity.dart';
import 'package:mall/utils/navigator_util.dart';
import 'package:mall/widgets/cached_image.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_staggered_grid_view/flutter_staggered_grid_view.dart';

class ProductView extends StatelessWidget {
  List<Goods> productList;

  ProductView(this.productList);

  @override
  Widget build(BuildContext context) {
    return StaggeredGridView.countBuilder(
      physics: NeverScrollableScrollPhysics(), //禁用滑动事件
      shrinkWrap: true, //解决无限高度问题
      padding: const EdgeInsets.all(8.0),
      crossAxisCount: 4,
      itemCount: productList.length,
      itemBuilder: (context, index) {
        return _getGridViewItem(context, productList[index]);
      },
      staggeredTileBuilder: (index) => new StaggeredTile.fit(2),
      // staggeredTileBuilder: (int index) =>
      //     new StaggeredTile.count(2, index == 0 ? 2.5 : 3), //
      mainAxisSpacing: 10.0,
      crossAxisSpacing: 10.0,
    );
  }

/*


return Container(
      padding: EdgeInsets.all(5.0),
      child: GridView.builder(
          shrinkWrap: true,
          itemCount: productList.length,
          physics: NeverScrollableScrollPhysics(),
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
              crossAxisCount: 2, childAspectRatio: 0.90),
          itemBuilder: (BuildContext context, int index) {
            return _getGridViewItem(context, productList[index]);
          }),
    );



    child: CachedImageView(
                      ScreenUtil.instance.setHeight(200.0),
                      ScreenUtil.instance.setHeight(200.0),
                      productEntity.picUrl)
*/
  _goGoodsDetail(BuildContext context, Goods goods) {
    NavigatorUtils.goGoodsDetails(context, goods.id);
  }

  // double a = 6;
  Widget _getGridViewItem(BuildContext context, Goods productEntity) {
    return Container(
      child: InkWell(
        onTap: () => _goGoodsDetail(context, productEntity),
        child: Card(
          elevation: 2.0,
          margin: EdgeInsets.all(6.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              Container(
                  margin: EdgeInsets.all(5.0),
                  width: ScreenUtil.instance.setHeight(200.0),
                  constraints: BoxConstraints(maxHeight: double.infinity),
                  child: Image.network(
                    productEntity.picUrl,
                    fit: BoxFit.cover,
                    width: ScreenUtil.instance.setHeight(200.0),
                    // height: a++ * 20,
                  )),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                padding: EdgeInsets.only(left: 15.0, top: 4.0),
                alignment: Alignment.centerLeft,
                child: Text(
                  productEntity.name,
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(color: Colors.black54, fontSize: 14.0),
                ),
              ),
              Padding(
                padding: EdgeInsets.only(top: 4.0),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 20),
                padding: EdgeInsets.only(left: 4.0, top: 4.0),
                alignment: Alignment.center,
                child: Text(
                  "￥${productEntity.retailPrice}",
                  style: TextStyle(color: Colors.red, fontSize: 12.0),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
