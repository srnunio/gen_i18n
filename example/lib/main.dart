import 'package:example/i18n/i18n.dart';
import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';

const _supportLocales = [Locale('en'), Locale('pt')];

Future<void> main() async {
  /// This is required
  WidgetsFlutterBinding.ensureInitialized();

  /// Initial Locate is critical to initializing the internationalization feature
  await I18n.initialize(
      defaultLocale: Locale('en'), /// This is required
      supportLocales: _supportLocales  /// This is optional
      );

  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      locale: I18n.currentLocate,
      supportedLocales: I18n.supportedLocales,
      localizationsDelegates: const [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  Locale _locale = Locale('en');

  /// update locate
  void onChanged(Locale? locale) async {
    if (locale == null) return;
    await I18n.updateLocate(locale);
    setState(() => _locale = locale);
  }

  /// item to list of locale
  DropdownMenuItem<Locale> _itemBuild(Locale item) {
    return DropdownMenuItem<Locale>(
      child: Text(item.toLanguageTag()),
      value: item,
    );
  }

  Widget _languageBody() {
    return DropdownButton<Locale>(
      value: _locale,
      items: _supportLocales.map(_itemBuild).toList(),
      onChanged: onChanged,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Text(
              'customMessage'.translate,
            ),
            _languageBody()
          ],
        ),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
