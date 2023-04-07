import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../provider/news_provider.dart';

class NewsView extends StatefulWidget {
  const NewsView({Key? key}) : super(key: key);

  @override
  State<NewsView> createState() => _NewsViewState();
}

class _NewsViewState extends State<NewsView> {
  @override
  void initState() {
    // TODO: implement initState
    Provider.of<NewsProvider>(context, listen: false).NewsApiCall();
    super.initState();
  }

  NewsProvider? newsproviderT;
  NewsProvider? newsproviderF;

  @override
  Widget build(BuildContext context) {
    newsproviderT = Provider.of<NewsProvider>(context, listen: true);
    newsproviderF = Provider.of<NewsProvider>(context, listen: false);

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: Text("News"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            SizedBox(
              height: 10,
            ),
            Expanded(
              child: ListView.builder(
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(
                      "${newsproviderT!.NewsList![index].author}",
                    ),
                    subtitle: Text("${newsproviderT!.NewsList![index].title}",
                        style: TextStyle(color: Colors.grey.shade700)),
                   leading: Container(
                       height:150,width:50,
                       child: CircleAvatar(backgroundImage: NetworkImage("${newsproviderT!.NewsList[index].urltoimg}"),))
                  );
                },
                itemCount: newsproviderF!.NewsList.length,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
