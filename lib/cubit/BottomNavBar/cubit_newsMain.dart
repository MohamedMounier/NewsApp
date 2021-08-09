
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/Screens/BottomNavScreens/business_screen.dart';
import 'package:news_app/Screens/BottomNavScreens/science_screen.dart';
import 'package:news_app/Screens/BottomNavScreens/settings_screen.dart';
import 'package:news_app/Screens/BottomNavScreens/sports_screen.dart';
import 'package:news_app/cubit/BottomNavBar/cubit_newsStates.dart';




 class CubitNews extends Cubit<NewsStates>{
  CubitNews():super (InitialState());

  static CubitNews get(context)=>BlocProvider.of(context);

  int currentIndex=0;
  List<BottomNavigationBarItem> buttomItems=[
    BottomNavigationBarItem(
        icon: Icon(Icons.business),
      label: 'Business',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.sports),
      label: 'Sports',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.science),
      label: 'Science',
    ),
    BottomNavigationBarItem(
      icon: Icon(Icons.settings),
      label: 'Settings',
    )
  ];

  List<Widget> screens=[
    BusinessScreen(),
    SportsScreen(),
    ScienceScreen(),
    SettingsScreen()
  ];

  ChangeNavBar(index){
    currentIndex=index;
    emit(InitialState());
  }

  bool isDark=false;
   void ChangeTheme(){
    isDark=!isDark;
    emit(ChangeThemeState());
  }



}