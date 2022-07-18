import 'package:gen_i18n/src/args.dart';
import 'package:gen_i18n/src/export_i18n_class.dart';
import 'package:gen_i18n/src/export_translate_json.dart';
import 'package:gen_i18n/src/file_utils.dart';
import 'package:test/test.dart';

void main() {
  test('generate folder and i18n class', () async {
    var result = await initializeCodeFolder();

    expect(result, true);

    result = await exportI18nClass();

    expect(result, true);
  });

  test('check args', () async {
    var args = ["--locale-pt-en-fr"];

    var _localeCodeList = extractLocateValues(args: args);

    expect(_localeCodeList.isNotEmpty, true);

    print('_localeCodeList: $_localeCodeList');
  });

  test('generate files for translate', () async {
    var result = await initializeAssents();

    expect(result, true);

    result = await exportLocaleJson(localeCodeList: ['en', 'pt']);

    expect(result, true);
  });
}
