import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:news_app/cubit/BottomNavBar/cubit_newsMain.dart';
import 'package:news_app/cubit/BottomNavBar/cubit_newsStates.dart';


class NewsLayout extends StatelessWidget {
  static String id ='NewsLayout';
  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context)=> CubitNews(),
      child: BlocConsumer<CubitNews,NewsStates>(
        listener: (context, state) => (){},
        builder: (context, state) {

          var cubit= CubitNews.get(context);
          return Scaffold(
            body: cubit.screens[cubit.currentIndex],
            appBar: AppBar(
              title: Text('NewsApp'),
              actions: [
                Icon(Icons.search),
                IconButton(
                  icon: Icon(Icons.brightness_4_outlined),
                  onPressed: (){
                    CubitNews.get(context).ChangeTheme();
                    print(CubitNews.get(context).isDark);
                  },
                )
              ],
            ),
            bottomNavigationBar: BottomNavigationBar(
              currentIndex: cubit.currentIndex,
              onTap: (index){
                cubit.ChangeNavBar(index);
              },
              items: cubit.buttomItems,

            ),
          );
        },
      ),
    );
  }
}
