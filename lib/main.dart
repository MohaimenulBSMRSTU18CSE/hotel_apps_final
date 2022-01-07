import 'package:flutter/material.dart';
import 'package:hotel_app/widgets/suggesiton/complains.dart';
import './app_drawer.dart';
import './data/room_data.dart';
import './data/user_provider.dart';

import './widgets/checkout/checkout_main.dart';
import './widgets/checkout/checkout_provider.dart';

import './widgets/details/details_main_page.dart';
import './widgets/first_page.dart';
import './widgets/home/home_main.dart';
import './widgets/profile/profile_main.dart';
import './widgets/signup/signin.dart';
import './widgets/signup/signup_main.dart';
import 'package:provider/provider.dart';

import 'widgets/rooms/rooms.dart';
import 'widgets/rooms/rooms_main_page.dart';
import 'widgets/selected/selected.dart';
import 'widgets/suggesiton/suggestion.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider.value(value: UserProvider()),
        ChangeNotifierProvider.value(value: RoomProvider()),
        ChangeNotifierProvider.value(value: CheckOutProvider())
      ],
      child: MaterialApp(
        //home: MyApp(),
        //home: SignUpMainPage(),
        //home: DetailsMainPage(),
        initialRoute: '/',
        routes: {
          '/': (context) => const FirstPage(),
          '/home': (context) => MyApp(),
          '/profile': (context) => Profile(),
          '/sign-up': (context) => const SignUpMainPage(),
          '/log-in': (context) => const SignIn(),
          '/details': (context) => const DetailsMainPage(),
          '/selected': (context) => const Selected(),
          '/rooms': (context) => Rooms(),
          '/selected-rooms': (context) => const RoomsPage(),
          '/checkout': (context) => const CheckOutMain(),
          '/complains': (context) => const Complain(),
          '/suggestions': (context) => const Suggestion()
        },
        debugShowCheckedModeBanner: false,
      ),
    ),
  );
}

class MyApp extends StatefulWidget {
  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //const MyApp({Key? key}) : super(key: key);
  final scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        key: scaffoldKey,
        body: CustomScrollView(
          slivers: [
            SliverAppBar(
              centerTitle: true,
              actions: [
                TextButton(
                  onPressed: () {
                    scaffoldKey.currentState!.openEndDrawer();
                  },
                  child: Icon(
                    Icons.more_vert,
                    color: Colors.white,
                  ),
                ),
              ],
              expandedHeight: 60,
              flexibleSpace: FlexibleSpaceBar(
                title: Text('SMART HOTEL'),
              ),
            ),
            SliverList(delegate: SliverChildListDelegate([HomeMainPage()]))
          ],
        ),
        // appBar: AppBar(
        //   backgroundColor: Colors.red.shade200,
        //   title: Text("Kanchenjunga"),
        //   centerTitle: true,
        //   actions: [
        //     TextButton(
        //       onPressed: () {
        //         scaffoldKey.currentState!.openEndDrawer();
        //       },
        //       child: Icon(
        //         Icons.more_vert,
        //         color: Colors.white,
        //       ),
        //     ),
        //   ],
        // ),

        // body: SingleChildScrollView(
        //   //physics: const NeverScrollableScrollPhysics(),
        //   child: HomeMainPage(),
        // ),
        endDrawer: AppDrawer());
  }
}
