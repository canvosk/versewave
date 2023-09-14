import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:versewave/config/theme/colors.dart';

class MySplashScreen extends StatefulWidget {
  const MySplashScreen({super.key});

  @override
  State<MySplashScreen> createState() => _MySplashScreenState();
}

class _MySplashScreenState extends State<MySplashScreen> {

  @override
  void initState() {
    super.initState();
    loadPage();
  }

  loadPage() async{
    Future.delayed(const Duration(seconds: 3),(){
      context.go("/dailyNews");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: mainColor,
      child: Center(
        child: Image.asset("assets/images/logo.png"),
      ),
    );
  }
}