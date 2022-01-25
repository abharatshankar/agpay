import 'package:agpay/constants.dart';
import 'package:agpay/reusable_widgets.dart';
import 'package:agpay/signup.dart';
import 'package:flutter/material.dart';

class OnBoard extends StatefulWidget {
  const OnBoard({Key? key}) : super(key: key);

  @override
  _OnBoardState createState() => _OnBoardState();
}

class _OnBoardState extends State<OnBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          color: Colors.white,
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Image.asset(
                  AppStrings.onboardImg,
                  alignment: Alignment.centerLeft,
                  width: MediaQuery.of(context).size.width,
                  height: orientation == Orientation.portrait
                      ? MediaQuery.of(context).size.height * 0.3
                      : MediaQuery.of(context).size.height * 0.6,
                  fit: BoxFit.fill,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 16),
                  child: Text(
                    'Welcome to',
                    style: TextStyle(
                      fontSize: 18,
                      fontFamily: AppFonts.poppinsFont,
                    ),
                  ),
                ),
                Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 30,
                    ),
                    child: Image.asset(
                      AppStrings.monibaglogo,
                      height: 40,
                    )
                    // child: Text(
                    //   'Monibag',
                    //   style: TextStyle(
                    //       fontSize: 32,
                    //       fontWeight: AppFonts.mediumFont,
                    //       fontFamily: AppFonts.poppinsFont),
                    // ),
                    ),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 16, 30, 10),
                  child: Text(AppStrings.onboardPageStr,
                      style: TextStyle(
                        fontFamily: AppFonts.poppinsFont,
                      )),
                ),
                const Padding(
                    padding: EdgeInsets.fromLTRB(30, 0, 30, 15),
                    child: Text(
                      AppStrings.sendMonneyStr,
                      style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: AppColors.darkYellow),
                    )),
                const Padding(
                  padding: EdgeInsets.fromLTRB(30, 16, 30, 10),
                  child: Text(AppStrings.joinForFreeStr),
                ),
                Container(
                  padding: const EdgeInsets.symmetric(vertical: 34),
                  width: MediaQuery.of(context).size.width,
                  color: Colors.white,
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceAround,
                    children: [
                      InkWell(
                        child: const SignUpBtn(),
                        onTap: () {
                          Navigator.of(context).push(MaterialPageRoute(
                              builder: (context) => const SignUp(
                                    isSignupBtn: true,
                                  )));
                        },
                      ),
                      InkWell(
                          onTap: () {
                            Navigator.of(context).push(MaterialPageRoute(
                                builder: (context) => const SignUp(
                                      isSignupBtn: false,
                                    )));
                          },
                          child: const SignInBtn()),
                    ],
                  ),
                ),
                const TxtBetweenLines(),
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.width * 0.1),
                  child: Container(
                    width: MediaQuery.of(context).size.width,
                    color: Colors.white,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SocialImg(
                          imgStr: AppStrings.gmImg,
                        ),
                        SizedBox(
                          width: MediaQuery.of(context).size.width * 0.1,
                        ),
                        const SocialImg(imgStr: AppStrings.fbImg),
                      ],
                    ),
                  ),
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 30, vertical: 15),
                  child: Center(
                    child: Text(
                      AppStrings.termsConditions,
                      style: TextStyle(
                          fontSize: 20,
                          color: AppColors.darkYellow,
                          fontWeight: FontWeight.w600),
                    ),
                  ),
                ),
              ],
            ),
          ),
        );
      }),
    );
  }
}
