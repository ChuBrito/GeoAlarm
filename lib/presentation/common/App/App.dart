import 'package:flutter/material.dart';
import 'package:geoAlarm/application/login/login_bloc.dart';
import 'package:geoAlarm/presentation/login/login.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:geoAlarm/presentation/splash/splash.dart';

class App extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SafeArea(
        child: Scaffold(
          appBar: AppBar(
            title: Text("Login"),
            centerTitle: true,
          ),
          resizeToAvoidBottomPadding: false,
          body: FutureBuilder(
              future: Firebase.initializeApp(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  print('something went wrong');
                }
                if (snapshot.connectionState == ConnectionState.done) {
                  return BlocProvider(
                      create: (BuildContext context) => LoginBloc(),
                      child: Login());
                }
                return Spinner();
              }),
        ),
      ),
    );
  }
}
