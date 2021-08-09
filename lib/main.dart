import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:hexcolor/hexcolor.dart';
import 'package:news_app/Screens/FinalScreens/news_layout.dart';
import 'package:news_app/cubit/BottomNavBar/cubit_newsStates.dart';

import 'cubit/BottomNavBar/cubit_newsMain.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => CubitNews(),
      child: BlocConsumer<CubitNews,NewsStates>(
        listener: (context, state) {},
        builder:(context, state) {
          print('is dark in main ${CubitNews.get(context).isDark}');

         return MaterialApp(
            debugShowCheckedModeBanner: false,
            theme: ThemeData(
              textTheme: TextTheme(
                  headline6: TextStyle(
                      fontSize: 22,
                      color:Colors.black,
                      fontWeight: FontWeight.bold
                  ),
                  bodyText2: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w300,
                      color: Colors.black
                  ),
                  bodyText1: TextStyle(
                      fontSize: 14,
                      color: Colors.black
                  )
              ),
              bottomNavigationBarTheme: BottomNavigationBarThemeData(
                  backgroundColor: Colors.white,
                  type: BottomNavigationBarType.fixed,
                  elevation: 20,
                  showUnselectedLabels: true,
                  selectedItemColor: Colors.deepOrange,
                  unselectedItemColor: Colors.black87
              ),
              appBarTheme: AppBarTheme(
                  elevation: 0,
                  actionsIconTheme: IconThemeData(
                      color: Colors.black
                  ),
                  backwardsCompatibility: false,
                  systemOverlayStyle: SystemUiOverlayStyle(
                      statusBarColor: Colors.white,
                      statusBarIconBrightness: Brightness.dark
                  ),
                  color: Colors.white,
                  titleTextStyle: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 20,
                      color: Colors.black
                  )
              ),
            ),
            darkTheme:ThemeData(
                scaffoldBackgroundColor: HexColor('333739'),
                bottomNavigationBarTheme: BottomNavigationBarThemeData(
                    type: BottomNavigationBarType.fixed,
                    elevation: 20,
                    showUnselectedLabels: true,
                    selectedItemColor: Colors.deepOrange,
                    unselectedItemColor: Colors.grey,
                    backgroundColor: HexColor('333739')
                ),
                appBarTheme: AppBarTheme(
                    backgroundColor: HexColor('333739'),
                    elevation: 0,
                    actionsIconTheme: IconThemeData(
                        color: Colors.grey
                    ),
                    backwardsCompatibility: false,
                    systemOverlayStyle: SystemUiOverlayStyle(
                        statusBarColor: HexColor('333739'),
                        statusBarIconBrightness: Brightness.light
                    ),

                    titleTextStyle: TextStyle(
                        fontWeight: FontWeight.bold,
                        fontSize: 20,
                        color: Colors.grey
                    )
                ),
                textTheme: TextTheme(
                    headline6: TextStyle(
                        fontSize: 22,
                        color:Colors.white70,
                        fontWeight: FontWeight.bold
                    ),
                    bodyText2: TextStyle(
                        fontSize: 14,
                        fontWeight: FontWeight.w300,
                        color: Colors.white70
                    ),
                    bodyText1: TextStyle(
                        fontSize: 14,
                        color: Colors.white70
                    )
                )
            ) ,
          //  themeMode:(CubitNews.get(context).isDark)?ThemeMode.dark:ThemeMode.light,
           themeMode: CubitNews.get(context).isDark ? ThemeMode.dark:ThemeMode.light,
            initialRoute: NewsLayout.id,
            routes: {
              NewsLayout.id:(context)=>NewsLayout(),
            },
          );
        }
      ),
    );
  }
}

