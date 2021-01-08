import 'package:flutter/material.dart';
import 'package:states_rebuilder/states_rebuilder.dart';

import 'models/event.dart';
import 'models/eventList.dart';
import 'theme/themeProvider.dart';
import 'views/home/home.dart';

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return Injector(
      inject: [
        Inject(() => Event()),
        Inject(() => EventList()),
        Inject(() => ThemeProvider()),
      ],
      builder: (BuildContext context) {
        final ReactiveModel<ThemeProvider> themeProvider =
            Injector.getAsReactive<ThemeProvider>();
        return MaterialApp(
          debugShowCheckedModeBanner: false,
          theme: themeProvider.state.getTheme,
          home: HomePage(),
        );
      },
    );
  }
}
