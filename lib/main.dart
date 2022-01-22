import 'dart:async';

import 'package:agpay/constants.dart';
import 'package:agpay/onboard.dart';
import 'package:dots_indicator/dots_indicator.dart';
import 'package:flutter/material.dart';
import 'package:loading_animation_widget/loading_animation_widget.dart';

const Color _kAppColor = Color(0xFFFDDE6F);
const double _kSize = 100;
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
        // This is the theme of your application.

        primarySwatch: Colors.blue,
      ),
      home: const SplashScreen(),
    );
  }
}

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  Timer? _timer;
  int _start = 20;

  @override
  void initState() {
    super.initState();
    startTimer();
  }

  @override
  void dispose() {
    _timer!.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          width: MediaQuery.of(context).size.width,
          decoration: BoxDecoration(
            gradient: LinearGradient(
                colors: [AppColors.darkYellow, AppColors.brightYellow],
                begin: const FractionalOffset(0.0, 0.5),
                end: const FractionalOffset(0.0, 1.0),
                stops: const [0.0, 1.0],
                tileMode: TileMode.clamp),
          ),
          // based on _start time we are manipulating UI
          child: _start == 1 ? titleWithAnimation() : dotAnimation(),
        );
      }),
    );
  }

  Widget titleWithAnimation() {
    return Container(
      width: 100,
      decoration: BoxDecoration(
        gradient: LinearGradient(
            colors: [AppColors.darkYellow, AppColors.brightYellow],
            begin: const FractionalOffset(0.0, 0.5),
            end: const FractionalOffset(0.0, 1.0),
            stops: const [0.0, 1.0],
            tileMode: TileMode.clamp),
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          LoadingAnimationWidget.bouncingBall(
            color: Colors.white,
            size: 20,
          ),
          Image.asset(
            AppStrings.monibagImg,
            height: 35,
            fit: BoxFit.fitWidth,
          )
        ],
      ),
    );
  }

  Widget dotAnimation() {
    return Center(
      child: LoadingAnimationWidget.bouncingBall(
        color: AppColors.whiteColor,
        size: _kSize,
      ),
    );
  }

//After timer name animation will appear
  void startTimer() {
    const oneSec = Duration(seconds: 1);
    _timer = Timer.periodic(
      oneSec,
      (Timer timer) {
        if (_start == 1) {
          setState(() {
            timer.cancel();
          });
          Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                  builder: (BuildContext context) => const Welcome()));
        } else if (_start == 10) {
          setState(() {
            _start--;
          });
        } else {
          setState(() {
            _start--;
          });
        }
      },
    );
  }
}

class Welcome extends StatefulWidget {
  const Welcome({Key? key}) : super(key: key);

  @override
  _WelcomeState createState() => _WelcomeState();
}

class _WelcomeState extends State<Welcome> {
  int? currentIndexPage;
  int? pageLength;

  @override
  void initState() {
    currentIndexPage = 0;
    pageLength = 3;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        backgroundColor: Colors.white,
        body: OrientationBuilder(builder: (context, orientation) {
          return Stack(
            children: <Widget>[
              Positioned(
                top: 0,
                child: Container(
                  color: Colors.white,
                  // padding: const EdgeInsets.symmetric(vertical: 20),
                  width: MediaQuery.of(context).size.width,
                  height: MediaQuery.of(context).size.height * 0.65,
                  child: PageView(
                    children: const <Widget>[
                      Walkthrougth(
                        textContent: AppStrings.page1Content,
                        title: AppStrings.page1Title,
                        imageStr: AppStrings.page1Img,
                      ),
                      Walkthrougth(
                        textContent: AppStrings.page2Content,
                        title: AppStrings.page2Title,
                        imageStr: AppStrings.page2Img,
                      ),
                      Walkthrougth(
                        textContent: AppStrings.page3Content,
                        title: AppStrings.page3Title,
                        imageStr: AppStrings.page3Img,
                      ),
                    ],
                    onPageChanged: (value) {
                      setState(() => currentIndexPage = value);
                    },
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.74,
                // left: MediaQuery.of(context).size.width * 0.35,
                child: Container(
                  width: MediaQuery.of(context).size.width,
                  child: Center(
                    child: DotsIndicator(
                      dotsCount: pageLength ?? 0,
                      position: currentIndexPage?.toDouble() ?? 0.00,
                      decorator: DotsDecorator(
                        color: Colors.grey.shade200, // Inactive color
                        activeColor: const Color(0xffE3BB2D),
                      ),
                      // dotColor: Colors.black87,
                      // dotActiveColor: Colors.amber),
                    ),
                  ),
                ),
              ),
              Positioned(
                top: MediaQuery.of(context).size.height * 0.85,
                child: InkWell(
                  onTap: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) => const OnBoard()));
                  },
                  child: Container(
                    color: Colors.white,
                    width: MediaQuery.of(context).size.width,
                    child: Center(
                      child: Container(
                          width: orientation == Orientation.portrait
                              ? MediaQuery.of(context).size.width * 0.7
                              : MediaQuery.of(context).size.width * 0.4,
                          padding: EdgeInsets.symmetric(
                              vertical:
                                  MediaQuery.of(context).size.height * 0.02),
                          decoration: BoxDecoration(
                              borderRadius:
                                  const BorderRadius.all(Radius.circular(10)),
                              boxShadow: <BoxShadow>[
                                BoxShadow(
                                    color: AppColors.brightYellow,
                                    blurRadius: 15.0,
                                    offset: const Offset(0.0, 0.75))
                              ],
                              color: AppColors.darkYellow),
                          child: const Center(
                            child: Text(AppStrings.strContinue,
                                style: TextStyle(
                                    fontSize: 18,
                                    color: Colors.white,
                                    fontWeight: FontWeight.w600)),
                          )),
                    ),
                  ),
                ),
              )
            ],
          );
        }));
  }
}

// user will walkthrough these intro screens with help  of Walkthrougth widget
class Walkthrougth extends StatelessWidget {
  final String? textContent;
  final String? title;
  final String? imageStr;
  const Walkthrougth(
      {Key? key,
      @required this.textContent,
      @required this.title,
      @required this.imageStr})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: AppColors.whiteColor),
      // width: MediaQuery.of(context).size.width,
      // height: MediaQuery.of(context).size.height,
      child: Column(
        children: [
          Container(
              height: MediaQuery.of(context).size.height * 0.4,
              color: Colors.white,
              child: Image.asset(
                imageStr!,
                fit: BoxFit.fill,
              )),
          // SizedBox(
          //   height: MediaQuery.of(context).size.height * 0.5,
          // ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              title ?? '',
              style: const TextStyle(fontSize: 35, fontWeight: FontWeight.w600),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
            child: Text(
              textContent ?? '',
              textAlign: TextAlign.center,
              maxLines: 3,
              overflow: TextOverflow.ellipsis,
              style: const TextStyle(
                fontSize: 17,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
