import 'file_utils.dart';

const _content = '''
{
  "customMessage": "Write is here your message"
}
''';

/// generate files for translate
Future<bool> exportLocaleJson(
    {List<String> localeCodeList = const ['en']}) async {
  for (var code in localeCodeList)
    await newFile(file: getJsonFile(code: code), content: _content);
  return true;
}
