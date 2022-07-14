# gen_i18n
Add internationalization to your dart project

## Installation
```
dependencies:
    flutter_localizations:
        sdk: flutter 

dev_dependencies:
    gen_i18n: ^1.0.0

flutter: 
  assets:
    - assets/i18n/locale/
```
# Usage
Running this command will result in the creation of the following files: 

- **i18n.dart** : a dart file will be generated in ***lib/i18n/***. This dart file will be responsible for interpreting the translation files
```
{
  "customMessage": "Write is here your message"
}
```
- **locale** : directory where the translation files live. They will be generated in the folder ***assets/i18n/locale***

**Note**: The name of a translation file starts without the key `i18n_` example: `i18n_en.json`
```
flutter pub run gen_i18n:initialize
```

Supported arguments:

| Argument    | Description                                                                                                                                                                                                                |
|-------------|----------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------------|
| --locate    | By definition only one translation file is generated `i18n_en.json`. If you want to create more translation files for other languages just send the arguments. Example: `flutter pub run gen_i18n:initialize --locate-pt-es` |

## Example
Modifies the main method
```
Future<void> main() async {
  /// This is required
  WidgetsFlutterBinding.ensureInitialized();
  
  /// Initial locale is critical to initializing the internationalization feature
  await I18n.initialize(
      defaultLocale: Locale('en'),   /// This is required
      supportLocales: [Locale('en'),Locale('es')]  /// This is optional
  );
  ...
}
```

```
MaterialApp( 
      locale: I18n.currentLocate,
      supportedLocales: I18n.supportedLocales,
      localizationsDelegates: const [
        const I18nDelegate(),
        GlobalMaterialLocalizations.delegate,
        GlobalCupertinoLocalizations.delegate,
        GlobalWidgetsLocalizations.delegate
      ],
      ...
    )
```
To translate text, simply enter the key by calling the method `I18n.getValue('customMessage')` or `'customMessage'.translate`
```
Text(I18n.getValue('customMessage'))
```

```
Text('customMessage'.translate)
```

If you want to change the current locate simply call the `await I18n.updateLocate(Locale('es'))` method.
