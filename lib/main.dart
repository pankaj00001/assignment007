import 'dart:async';

import 'package:assignment07/helper.dart';
import 'package:easy_sidemenu/easy_sidemenu.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(

        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;


  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;

  TextEditingController textEditingController = new TextEditingController();
  var currentText;
  FocusNode focusNode = FocusNode();
  String? datePass;
  int? datePasslength;
  bool passCodeMatch=false;
  PageController page = PageController();

  var digit;

  int? _currentDigit;
  var _firstDigit;
  var _secondDigit;
  var _thirdDigit;
  var _fourthDigit;
  var _fifthDigit;
  var _sixthDigit;

  void _incrementCounter() {
    setState(() {

      _counter++;
    });
  }
  double? height,width;
  TabController? tabController;
  final _key = UniqueKey();
  final _key2 = UniqueKey();
  final _key3 = UniqueKey();
  final _key4 = UniqueKey();
  final _key5 = UniqueKey();


  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    _getPass();
  }

  @override
  void dispose() {

    super.dispose();
  }

  Future<void> _getPass()async{
    int pass= DateTime.now().year*DateTime.now().month*DateTime.now().day;
    datePasslength=pass.toString().length;
    if(pass.toString().length==5 || pass.toString().length==4 ||pass.toString().length==3){

      // datePass=pass.toString().padLeft(6,'0');
      pass=pass*10;
      datePass=pass.toString();
      print('datePass $datePass');
    }else if(pass.toString().length==4 ||pass.toString().length==3){

      pass=pass*100;
      datePass=pass.toString();
      print('datePass $datePass');
    }else if(pass.toString().length==3){

      pass=pass*1000;
      datePass=pass.toString();
      print('datePass $datePass');
    }else{
      datePass=pass.toString();
      print('datePass $datePass');

    }
  }

  @override
  Widget build(BuildContext context) {
    height=MediaQuery.of(context).size.height;
    width =MediaQuery.of(context).size.width;
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeLeft,
      DeviceOrientation.landscapeRight,
    ]);
    return MaterialApp(
      home: passCodeMatch==false?DefaultTabController(
        length: 3,
        child: Scaffold(
          appBar: AppBar(

            leading: InkWell(
              child: const Icon(
                Icons.settings,
                color: Colors.white,
              ),
              onTap: ()async{
                // _showPasscode();
                TextEditingController textEditingController2=new TextEditingController();
                setState(() {
                  _showPasscode2(textEditingController2);

                });
              },
            ),
            backgroundColor: Color.fromRGBO(0, 38, 51, 1),
            title: Container(
              margin: EdgeInsets.only(top: 5,bottom: 5),
              color: Color(Helper.darkColor),
              width: width,
              alignment: Alignment.center,
              child:Container(
                width: width!*0.5,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: Color.fromRGBO(1, 85, 116,1),

                ),
                child: TabBar(

                  indicator: ShapeDecoration(
                      shape: RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(10))),
                      color: Colors.white
                  ),
                  unselectedLabelColor: Colors.white,
                  indicatorSize: TabBarIndicatorSize.tab,
                  labelColor: Color.fromRGBO(1, 85, 116,1),
                  indicatorPadding: EdgeInsets.all(10),
                  tabs: [
                    Tab(text: 'Home'),
                    Tab(text: 'About us'),
                    Tab(text: 'Updates'),

                  ],
                ),
              ),),
          ),
          body:  /*SingleChildScrollView(
            child: */TabBarView(
            physics: NeverScrollableScrollPhysics(),
              children: [
                /*Container(
                  height: 100,
                    child:*/ WebView(
                        key: _key,
                        javascriptMode: JavascriptMode.unrestricted,
                        zoomEnabled: true,
                        initialUrl: 'https://krishworks.com')/*)*/,
                WebView(
                    key: _key2,
                    javascriptMode: JavascriptMode.unrestricted,
                    zoomEnabled: true,
                    initialUrl: 'https://krishworks.com/about/'),
                WebView(
                    key: _key3,
                    javascriptMode: JavascriptMode.unrestricted,
                    zoomEnabled: true,
                    initialUrl: 'https://krishworks.com/updates/')
              ],
            ),
         /* ),*/
        ),
      ):Scaffold(
        appBar: AppBar(

          title: Container(
            width: width!*0.2,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                GestureDetector(
                  child: Text('Close',style: TextStyle(
                      fontWeight: FontWeight.w200
                  ),),
                  onTap: ()async{
                    setState(() {
                      passCodeMatch=false;

                    });
                  },
                ),
                Container(
                  margin: EdgeInsets.only(left: 20),
                ),
                GestureDetector(
                  child: Text('Setting',style: TextStyle(
                      fontWeight: FontWeight.w200

                  ),),
                  onTap: (){
                  },
                ),
              ],
            ),
          ),
          backgroundColor: Color.fromRGBO(0, 38, 51, 1),


        ),
        body: Container(
          margin: EdgeInsets.zero,
          padding: EdgeInsets.zero,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              SideMenu(
                controller: page,
                style: SideMenuStyle(

                  displayMode: SideMenuDisplayMode.auto,
                  hoverColor: Colors.blue[100],
                  selectedColor: Color.fromRGBO(0, 38, 51, 1),
                  selectedTitleTextStyle: TextStyle(color: Color.fromRGBO(255, 173, 51, 1)),
                  openSideMenuWidth: width!*0.3,
                  // backgroundColor: Colors.yellow
                ),

                items: [
                  SideMenuItem(
                    priority: 0,
                    title: 'Gallery',
                    onTap: () {
                      page.jumpToPage(0);
                    },
                    icon: Icon(null),
                  ),
                  SideMenuItem(
                    priority: 1,
                    title: 'Contact Us',
                    onTap: () {
                      page.jumpToPage(1);
                    },
                    icon: Icon(null),
                  ),

                ],
              ),
              Expanded(
                child: PageView(
                  controller: page,
                  physics: NeverScrollableScrollPhysics(),
                  children: [
                    Container(
                      child: WebView(
                          key: _key4,
                          javascriptMode: JavascriptMode.unrestricted,
                          zoomEnabled: true,
                          initialUrl: 'https://krishworks.com/gallery/')
                    ),
                    Container(
                      child:  WebView(
                          key: _key5,
                          javascriptMode: JavascriptMode.unrestricted,
                          zoomEnabled: true,
                          initialUrl: 'https://krishworks.com/contact/')
                    ),


                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }


   Future<void> _showPasscode2(TextEditingController textEditingController2) async{
    showDialog(context: context, builder: (BuildContext context){
      return StatefulBuilder(
          builder: (context,StateSetter setState){
        return Scaffold(
          backgroundColor: Colors.transparent,
          body:SingleChildScrollView(
            child: Container(
              width: width,
              alignment: Alignment.center,
              height: height/*!*0.32*/,

              color: Colors.transparent,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    color: Colors.white,
                    margin: EdgeInsets.only(left: width!*0.2,right: width!*0.2),
                    padding: EdgeInsets.only(left: 20,right: 20),

                    child: Column(
                      children: [
                        SizedBox(
                          height: 10,
                        ),
                        Text('Developer Passcode',style: TextStyle(color: Colors.black,fontSize: 16,fontWeight: FontWeight.w500),),
                        SizedBox(
                          height: 10,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                          children: <Widget>[
                            _otpTextField(_firstDigit),
                            _otpTextField(_secondDigit),
                            _otpTextField(_thirdDigit),
                            _otpTextField(_fourthDigit),
                            _otpTextField(_fifthDigit),
                            _otpTextField(_sixthDigit),
                          ],
                        ),
                        SizedBox(
                          height: 20,
                        ),
                      ],
                    ),
                  ),


                  SingleChildScrollView(
                    scrollDirection: Axis.horizontal,
                    child: Container(
                      margin: EdgeInsets.only(left:5,right:5,top: height!*0.25),
                      width: width,
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: <Widget>[
                          _otpKeyboardInputButton(
                              label: "1",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(1,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "2",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(2,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "3",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(3,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "4",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(4,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "5",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(5,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "6",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(6,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "7",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(7,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "8",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(8,setState);

                                });
                              }),
                          _otpKeyboardInputButton(
                              label: "9",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(9,setState);

                                });
                              }),_otpKeyboardInputButton(
                              label: "0",
                              onPressed: () {
                                setState(() {
                                  _setCurrentDigit(0,setState);

                                });
                              }),
                          Material(
                            color: Colors.transparent,
                            child:  InkWell(
                              onTap: (){
                                setState(() {
                                  _firstDigit=null;
                                  _secondDigit=null;
                                  _thirdDigit=null;
                                  _fourthDigit=null;
                                  _fifthDigit=null;
                                  _sixthDigit=null;
                                });
                              },
                              borderRadius:  BorderRadius.circular(40.0),
                              child:  Container(
                                alignment: Alignment.center,
                                // margin: EdgeInsets.only(left: 5,right: 5),
                                height: 55.0,
                                width: 55.0,
                                decoration:  BoxDecoration(
                                    color: Colors.grey.shade700,
                                    borderRadius: BorderRadius.circular(10)
                                ),
                                child:  Center(
                                  child:  Text(
                                    'Clr',
                                    style:  TextStyle(
                                      fontSize: 18.0,
                                      color: Colors.white,
                                    ),
                                  ),
                                ),
                              ),
                            ),
                          )
                        ],
                      ),
                    ),)
                ],
              ),
            ),
          ),
        );
      });

    }
    ).then((value) {
      setState(() {
        print('here in this');
        _firstDigit=null;
        _secondDigit=null;
        _thirdDigit=null;
        _fourthDigit=null;
        _fifthDigit=null;
        _sixthDigit=null;
      });
    });
  }


  void onPressed() {

  }

  Widget _otpKeyboardInputButton({String? label, VoidCallback? onPressed}) {
    return  Material(
      color: Colors.transparent,
      child:  InkWell(
        onTap: onPressed,
        borderRadius:  BorderRadius.circular(40.0),
        child:  Container(
          alignment: Alignment.center,
          // margin: EdgeInsets.only(left: 5,right: 5),
          height: 55.0,
          width: 55.0,
          decoration:  BoxDecoration(
            color: Colors.grey.shade700,
            borderRadius: BorderRadius.circular(10)
          ),
          child:  Center(
            child:  Text(
              label!,
              style:  TextStyle(
                fontSize: 18.0,
                color: Colors.white,
              ),
            ),
          ),
        ),
      ),
    );
  }

  void _setCurrentDigit(int i, StateSetter setState) {
    setState(() {
      _currentDigit = i;
      if (_firstDigit == null) {
        _firstDigit = _currentDigit;
      } else if (_secondDigit == null) {
        _secondDigit = _currentDigit;

      } else if (_thirdDigit == null) {
        _thirdDigit = _currentDigit;

      } else if (_fourthDigit == null) {
        _fourthDigit = _currentDigit;

      } else if (_fifthDigit == null) {
        _fifthDigit = _currentDigit;

      } else if (_sixthDigit == null) {
        _sixthDigit = _currentDigit;

        var otp = _firstDigit.toString() +
            _secondDigit.toString() +
            _thirdDigit.toString() +
            _fourthDigit.toString()+_fifthDigit.toString()+_sixthDigit.toString();

        print('otp is $otp');

        if(otp.toString()==datePass){
          textEditingController.text=otp.toString();
          passCodeMatch=true;
          _firstDigit=null;
          _secondDigit=null;
          _thirdDigit=null;
          _fourthDigit=null;
          _fifthDigit=null;
          _sixthDigit=null;
          Navigator.pop(context);
        }else{
          ScaffoldMessenger.of(context).showSnackBar(SnackBar(
            content: Text("PassCode Not Matched"),
          ));
        }

        // Verify your otp by here. API call
      }
    });

  }

  Widget _otpTextField(var digit) {
    return  Container(
      width: 40.0,
      height: 45.0,
      alignment: Alignment.center,
      child:  Text(
        digit != null ? digit.toString() : "",
        style:  TextStyle(
          fontSize: 30.0,
          color: Colors.black,
        ),
      ),
      decoration: BoxDecoration(
          border: Border(
              bottom: BorderSide(
                width: 2.0,
                color: Colors.grey.shade300,
              ),top: BorderSide(
                width: 2.0,
            color: Colors.grey.shade300,
              ),left: BorderSide(
                width: 2.0,
            color: Colors.grey.shade300,
              ),right: BorderSide(
                width: 2.0,
            color: Colors.grey.shade300,
              ),
          ),
        // borderRadius: BorderRadius.circular(5),
        // color: Colors.black,
      ),
    );
  }}
