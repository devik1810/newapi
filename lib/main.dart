import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:newapi/contrry_scrren/provider/country_provider.dart';


import 'package:provider/provider.dart';

import 'contrry_scrren/view/country_view.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (context) => CountryProvider()),
      ],
      child: MaterialApp(
        debugShowCheckedModeBanner: false,
        routes: {
          '/': (context) => CountryView(),
        },
      ),
    ),
  );
}
