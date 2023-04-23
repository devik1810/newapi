import 'package:flutter/material.dart';
import 'package:newapi/contrry_scrren/model/country_model.dart';
import 'package:newapi/contrry_scrren/provider/country_provider.dart';
import 'package:newapi/utils/contrry_helper.dart';
import 'package:provider/provider.dart';

class CountryView extends StatefulWidget {
  const CountryView({Key? key}) : super(key: key);

  @override
  State<CountryView> createState() => _CountryViewState();
}

class _CountryViewState extends State<CountryView> {
  CountryProvider? countryProviderT;
  CountryProvider? countryProviderF;

  @override
  Widget build(BuildContext context) {
    countryProviderT = Provider.of<CountryProvider>(context, listen: true);
    countryProviderF = Provider.of<CountryProvider>(context, listen: false);
    return SafeArea(
      child: Scaffold(backgroundColor: Colors.grey.shade200,
        appBar: AppBar(
          title: Text("Country"),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                TextButton(
                  onPressed: () {
                    countryProviderT!.changeConrty('in');
                  },
                  child: Text(
                    "in",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    countryProviderT!.changeConrty('us');
                  },
                  child: Text(
                    "us",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    countryProviderT!.changeConrty('ch');
                  },
                  child: Text(
                    "ch",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
                TextButton(
                  onPressed: () {
                    countryProviderT!.changeConrty('ca');
                  },
                  child: Text(
                    "ca",
                    style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: Colors.grey.shade700),
                  ),
                ),
              ],
            ),
            Expanded(
              child: FutureBuilder(
                  builder: (context, snapshot) {
                    if (snapshot.hasError) {
                      return Text("${snapshot.error}");
                    } else if (snapshot.hasData) {
                      CountryModel? counrtry = snapshot.data;
                      return ListView.builder(
                          itemBuilder: (context, index) {
                            return Align(
                                alignment: Alignment.topLeft,

                                child: Column(
                                  children: [
                                    Row(
                                      children: [
                                        SizedBox(width: 10),
                                        Container(
                                          height: 120,
                                          width: 150,
                                          child: Image.network(
                                              "${counrtry.articles[index].urlToImage}"),
                                        ),
                                        SizedBox(
                                          width: 10,
                                        ),
                                        Container(
                                            width: 180,
                                            child: Column(
                                              children: [
                                                Text(
                                                    "${counrtry.articles[index].title}",style: TextStyle(fontWeight: FontWeight.bold),),
                                                SizedBox(height: 10),
                                                Text(
                                                    "${counrtry.articles[index].author}")
                                              ],
                                            ))
                                      ],
                                    ),
                                  ],
                                ));
                          },
                          itemCount: counrtry!.articles.length);
                    }
                    return Container(child: CircularProgressIndicator());
                  },
                  future: CountryHelper()
                      .CountryApi("${countryProviderT!.SelectedCountry}")),
            ),
          ],
        ),
      ),
    );
  }
}
