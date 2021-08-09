
import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:news_app/model/NewsModel.dart';

class BusinessScreen extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    double heightMedia = MediaQuery.of(context).size.height;
    double widthMedia = MediaQuery.of(context).size.width;
    return Scaffold(
      body: FutureBuilder<List<NewsModel>>(
          future: GetData(),
          builder: (context, snapshot) {
            if (snapshot.connectionState != ConnectionState.done) {
              return Center(child: CircularProgressIndicator());
            } else if (snapshot.hasError) {
              print(snapshot.error.toString());
              return Center(
                  child: Text(
                'Kindly Check your internet connection',
                style: TextStyle(fontSize: 22),
              ));
            } else if (snapshot.hasData) {
              List<NewsModel> listN = snapshot.data;
              return ListView.builder(
                itemCount: listN.length,
                itemBuilder: (context, index) => Padding(
                  padding: EdgeInsets.symmetric(
                      horizontal: widthMedia * .03,
                      vertical: heightMedia * .005),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Row(
                        children: [
                          Container(
                              width: widthMedia * .4,
                              height: heightMedia * .25,
                              decoration: BoxDecoration(
                                  image: DecorationImage(
                                image: NetworkImage(listN[index].urlToImage !=
                                    null
                                    ? listN[index].urlToImage
                                    : 'https://stugcearar.com/wp-content/uploads/2018/07/empty_baslik.png'),
                                    fit: BoxFit.cover,)),
                              child: null),
                          Expanded(
                            child: Padding(
                              padding: EdgeInsetsDirectional.only(
                                  start: widthMedia * .01,
                                  bottom: heightMedia * .02),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  Text(
                                    '${listN[index].title}',
                                    style:
                                        Theme.of(context).textTheme.headline6,
                                    maxLines: 3,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: heightMedia * .01),
                                    child: Text(
                                      ' ${listN[index].sourceName} :-المصدر',
                                      style:
                                          Theme.of(context).textTheme.bodyText1,
                                    ),
                                  ),
                                  Padding(
                                    padding:
                                        EdgeInsets.only(top: heightMedia * .01),
                                    child: Text('${listN[index].publishedAt}',
                                        style: Theme.of(context)
                                            .textTheme
                                            .bodyText2),
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Container(
                          child: Divider(
                        thickness: 1,
                      ))
                    ],
                  ),
                ),
              );
            } else {
              return Center(child: CircularProgressIndicator());
            }
          }),
    );
  }

  Future<List<NewsModel>> GetData() async {
    List<NewsModel> list = [];
    try {
      var response = await Dio().get(
          'https://newsapi.org/v2/top-headlines?country=eg&category=business&apiKey=d664d364ad884e0081774ae75472317b');
      print(response.data);
      var listData = response.data['articles'];
      for (var map in listData) {
        list.add(NewsModel.fromJson(map));
      }
      print(' the list is $list');
    } catch (e) {
      print(e.toString());
    }

    return list;
  }
}
