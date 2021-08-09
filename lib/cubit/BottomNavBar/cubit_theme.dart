
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/BottomNavBar/cubit_themeState.dart';
class CubitTheme extends Cubit<ThemeState>{
  CubitTheme():super(InitialTheme());

  static CubitTheme themeget(context)=>BlocProvider.of(context);
  bool dark=false;
  ChangeTheme2(){
    dark=!dark;
    emit(ThemeChangeStat2());
  }

}