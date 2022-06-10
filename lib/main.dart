import 'package:flutter/material.dart';

import 'package:flutter_bloc/flutter_bloc.dart';

//ROUTES
import 'package:myapptest/src/routes/routes.dart';

//BLOC
import 'package:myapptest/src/bloc/home/home_bloc.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);


  @override
  Widget build(BuildContext context) {
    return MultiBlocProvider(
      providers:[
          BlocProvider<HomeBloc>(create: ( _ ) => HomeBloc()),
      ],
      child:MaterialApp(
        title: 'My App Graphql',
        theme: ThemeData(
          primarySwatch: Colors.blue,
        ),
        debugShowCheckedModeBanner:false,
        initialRoute:'/home',
        routes:routes,
      )
    );
  }
}
