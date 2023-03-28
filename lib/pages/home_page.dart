import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../widgets/text_button_widget.dart';
import '../widgets/springy_slider_widget.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(15.0),
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.white,
          elevation: 0,
          systemOverlayStyle: const SystemUiOverlayStyle(
            statusBarColor: Colors.black38,
            statusBarIconBrightness: Brightness.light,
          ),
          iconTheme: IconThemeData(color: Theme.of(context).primaryColor),
          leading: IconButton(
            icon: const Icon(
              Icons.menu,
            ),
            onPressed: () {},
          ),
          actions: [
            TextButtonWidget(text: 'settings'.toUpperCase(), isOnLight: true),
          ],
        ),
        body: Column(
          children: <Widget>[
            Expanded(
              child: SpringySliderWidget(
                markCount: 11,
                positiveColor: Theme.of(context).primaryColor,
                negativeColor: Theme.of(context).scaffoldBackgroundColor,
              ),
            ),
            Container(
              color: Theme.of(context).primaryColor,
              child: Row(
                children: [
                  TextButtonWidget(
                      text: 'more'.toUpperCase(), isOnLight: false),
                  const Spacer(),
                  TextButtonWidget(
                      text: 'stats'.toUpperCase(), isOnLight: false)
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
