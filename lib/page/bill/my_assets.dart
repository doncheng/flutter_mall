import 'package:flutter/material.dart';
import 'package:mall/utils/navigator_util.dart';

class AssetsPage extends StatefulWidget {
  AssetsPage({Key key}) : super(key: key);

  @override
  _AssetsPageState createState() => _AssetsPageState();
}

class _AssetsPageState extends State<AssetsPage> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffcf1322),
        title: Row(
          children: [
            SizedBox(
              width: (screenWidth / 2) - 106,
            ),
            Container(
              height: 40,
              width: 72,
              child: Center(
                child: Text(
                  '我的资产',
                  style: TextStyle(fontSize: 18, color: Colors.white),
                ),
              ),
            ),
            SizedBox(
              width: (screenWidth / 2) - 106,
            ),
            Container(
              width: 50,
              height: 40,
              child: Center(
                  child: InkWell(
                onTap: () {
                  setState(() {
                    _toCapitalPage();
                  });
                },
                child: Text(
                  '资金明细',
                  style: TextStyle(fontSize: 12, color: Colors.white),
                ),
              )),
            )
          ],
        ),
        // centerTitle: true,
      ),
      body: AssetsBody(),
    );
  }

  _toCapitalPage() {
    NavigatorUtils.goCapitalPage(context);
  }
}

class AssetsBody extends StatefulWidget {
  AssetsBody({Key key}) : super(key: key);

  @override
  _AssetsBodyState createState() => _AssetsBodyState();
}

class _AssetsBodyState extends State<AssetsBody> {
  _toFreezePage() {
    NavigatorUtils.goFreezePage(context);
  }

  _toBalanceRechargePage() {
    NavigatorUtils.goBalanceRechargePage(context);
  }

  _toWithdrawalPage() {
    NavigatorUtils.goWithdrawalPage(context);
  }

  _toWalletCardPage() {
    NavigatorUtils.goWalletCardPage(context);
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final screenWidth = size.width;
    final screenHeight = size.height;
    return Column(
      children: [
        Container(
          height: 120,
          width: screenWidth,
          color: Color(0xffCF1322),
          child: Column(
            children: [
              SizedBox(
                height: 26,
              ),
              Text(
                '可用余额',
                style: TextStyle(fontSize: 12, color: Colors.white),
              ),
              Text(
                '2255.00',
                style: TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.w800,
                    color: Colors.white),
              )
            ],
          ),
        ),
        Container(
          height: 70,
          width: double.infinity,
          color: Color(0xffA8071A),
          child: Row(
            children: [
              SizedBox(
                width: 39,
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  // padding: EdgeInsets.only(),
                  width: screenWidth / 2 - 40,
                  child: InkWell(
                    onTap: () {},
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "保证金",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xeeffffff)),
                        ),
                        Text(
                          '1000',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffffffff)),
                        )
                      ],
                    ),
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 18, bottom: 18),
                width: 2,
                color: Colors.white,
              ),
              Container(
                  // padding: EdgeInsets.only(),
                  width: screenWidth / 2 - 40,
                  child: InkWell(
                    onTap: () {
                      setState(() {
                        _toFreezePage();
                      });
                    },
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          "冻结资金",
                          style:
                              TextStyle(fontSize: 12, color: Color(0xeeffffff)),
                        ),
                        Text(
                          '0',
                          style:
                              TextStyle(fontSize: 18, color: Color(0xffffffff)),
                        )
                      ],
                    ),
                  )),
              SizedBox(
                width: 39,
              ),
            ],
          ),
        ),
        InkWell(
            onTap: () {
              setState(() {
                _toBalanceRechargePage();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 2),
              height: 64,
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=781566647,131809619&fm=15&gp=0.jpg"),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      '余额充值',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth - 190),
                    width: 4,
                    child: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                  )
                ],
              ),
            )),
        InkWell(
            onTap: () {
              setState(() {
                _toWithdrawalPage();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 2),
              height: 64,
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=781566647,131809619&fm=15&gp=0.jpg"),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 80,
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      '提现',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth - 190),
                    width: 4,
                    child: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                  )
                ],
              ),
            )),
        InkWell(
            onTap: () {
              setState(() {
                _toWalletCardPage();
              });
            },
            child: Container(
              margin: EdgeInsets.only(top: 2),
              height: 64,
              width: double.infinity,
              padding: EdgeInsets.all(18),
              child: Row(
                children: [
                  Image.network(
                      "https://ss0.bdstatic.com/70cFuHSh_Q1YnxGkpoWK1HF6hhy/it/u=781566647,131809619&fm=15&gp=0.jpg"),
                  SizedBox(
                    width: 8,
                  ),
                  Container(
                    width: 90,
                    margin: EdgeInsets.only(left: 8),
                    child: Text(
                      '收款账户管理',
                      style: TextStyle(
                        fontSize: 14,
                      ),
                    ),
                  ),
                  Container(
                    margin: EdgeInsets.only(left: screenWidth - 200),
                    width: 4,
                    child: Icon(
                      Icons.arrow_right,
                      size: 30,
                    ),
                  )
                ],
              ),
            )),
      ],
    );
  }
}
