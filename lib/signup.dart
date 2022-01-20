import 'package:agpay/constants.dart';
import 'package:agpay/reusable_widgets.dart';
import 'package:flutter/material.dart';

class SignUp extends StatefulWidget {
  final bool? isSignupBtn;
  const SignUp({Key? key, this.isSignupBtn}) : super(key: key);

  @override
  _SignUpState createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {
  TextEditingController username = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController email = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: OrientationBuilder(builder: (context, orientation) {
        return Container(
          color: Colors.white,
          width: MediaQuery.of(context).size.width,
          // color: Colors.yellowAccent,
          child: SingleChildScrollView(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.18),
                  child: const Text(
                    'monibag',
                    style: TextStyle(fontSize: 30, fontWeight: FontWeight.w600),
                  ),
                ),
                Row(
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 30),
                      child: Text(
                        widget.isSignupBtn! ? 'Sign Up' : 'Login',
                        style: const TextStyle(
                            color: AppColors.darkYellow,
                            fontSize: 30,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                  ],
                ),
                txtFields(username,
                    hintTxt: 'Enter your Name', labelTxt: 'User Name'),
                txtFields(password,
                    hintTxt: 'Enter your Password', labelTxt: 'Password'),
                widget.isSignupBtn!
                    ? txtFields(email,
                        hintTxt: 'Enter your Email', labelTxt: 'Email')
                    : Container(),
                widget.isSignupBtn!
                    ? Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: const [
                          Padding(
                            padding: EdgeInsets.symmetric(horizontal: 30),
                            child: Text(
                              'Forgot Password ?',
                              style: TextStyle(color: AppColors.darkYellow),
                            ),
                          )
                        ],
                      )
                    : Container(),
                Container(
                  padding: EdgeInsets.symmetric(
                      vertical: MediaQuery.of(context).size.height * 0.05),
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
                        child: Center(
                          child: Text(
                              widget.isSignupBtn!
                                  ? AppStrings.strCreate
                                  : AppStrings.strContinue,
                              style: const TextStyle(
                                  fontSize: 18,
                                  color: Colors.white,
                                  fontWeight: FontWeight.w600)),
                        )),
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
                RichText(
                  textAlign: TextAlign.center,
                  text: const TextSpan(children: <TextSpan>[
                    TextSpan(
                        text: "Don't have and account?",
                        style: TextStyle(color: Colors.black87)),
                    TextSpan(
                        text: " SignUp",
                        style: TextStyle(
                            color: AppColors.darkYellow,
                            fontWeight: FontWeight.bold)),
                  ]),
                )
              ],
            ),
          ),
        );
      }),
    );
  }

  Widget txtFields(TextEditingController txtController,
      {String? labelTxt, String? hintTxt}) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 16),
      child: TextField(
          controller: txtController,
          decoration: InputDecoration(
            labelText: labelTxt, //babel text
            hintText: hintTxt ?? '', //hint text
            prefixIcon: const Icon(Icons.people), //prefix iocn
            hintStyle: const TextStyle(
                fontSize: 18, fontWeight: FontWeight.normal), //hint text style
            labelStyle:
                const TextStyle(fontSize: 13, color: Colors.grey), //label style
          )),
    );
  }
}
