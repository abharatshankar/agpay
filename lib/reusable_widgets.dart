import 'package:flutter/material.dart';

import 'constants.dart';

class TxtBetweenLines extends StatelessWidget {
  const TxtBetweenLines({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Container(
            height: 1,
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 6),
            child: Text(
              'or with',
              style: TextStyle(color: Colors.grey),
            ),
          ),
          Container(
            height: 1,
            color: Colors.grey,
            width: MediaQuery.of(context).size.width * 0.35,
          ),
        ],
      ),
    );
  }
}

class SocialImg extends StatelessWidget {
  final String? imgStr;
  const SocialImg({Key? key, this.imgStr}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 48,
      height: 48,
      decoration: BoxDecoration(

          //color: Colors.green.withOpacity(0.25), // border color
          shape: BoxShape.circle,
          border: Border.all(color: Colors.blueAccent)),
      child: Padding(
        padding: const EdgeInsets.all(8), // border width
        child: Container(
          // or ClipRRect if you need to clip the content
          decoration: const BoxDecoration(
            shape: BoxShape.circle,
            color: Colors.blue, // inner circle color
          ),
          child: Image.asset(
            imgStr!,
            fit: BoxFit.fill,
            height: 40,
            width: 40,
          ), // inner content
        ),
      ),
    );
  }
}

class SignInBtn extends StatelessWidget {
  const SignInBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          boxShadow: <BoxShadow>[
            BoxShadow(
                color: AppColors.brightYellow,
                blurRadius: 15.0,
                offset: const Offset(0.0, 0.75))
          ],
          color: AppColors.darkYellow,
          border: Border.all(width: 1.0, color: AppColors.darkYellow),
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: const Padding(
          padding: EdgeInsets.symmetric(vertical: 16),
          child: Center(child: Text('Sign in')),
        ));
  }
}

class SignUpBtn extends StatelessWidget {
  const SignUpBtn({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        width: MediaQuery.of(context).size.width * 0.4,
        decoration: BoxDecoration(
          border: Border.all(width: 1.0, color: AppColors.darkYellow),
          borderRadius: const BorderRadius.all(
              Radius.circular(10.0) //                 <--- border radius here
              ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 16),
              child: Row(
                children: const [
                  Text('Sign Up',
                      style: TextStyle(color: AppColors.darkYellow)),
                  SizedBox(
                    width: 5,
                  ),
                  Icon(
                    Icons.arrow_forward,
                    size: 20,
                  )
                ],
              ),
            ),
          ],
        ));
  }
}
