import 'package:flutter/material.dart';

class TrustBy extends StatefulWidget {
  const TrustBy({super.key});

  @override
  State<TrustBy> createState() => _TrustByState();
}

class _TrustByState extends State<TrustBy> {
  @override
  Widget build(BuildContext context) {
    return Center(
      child:Wrap(
        alignment: WrapAlignment.center,
        spacing: 10,
        children: [
          Image.asset('assets/images/img_lenvor.png' ,width: 100,height: 100,),
          Image.asset('assets/images/img_donald.png',width: 100,height: 100,),
          Image.asset('assets/images/img_myron.png',width: 100,height: 100,),
          Image.asset('assets/images/img_homler.png',width: 100,height: 100,),
        ],
      ),
    );
  }
}
