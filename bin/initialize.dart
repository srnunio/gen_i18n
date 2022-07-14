import 'package:gen_i18n/src/args.dart';
import 'package:gen_i18n/src/export_i18n_class.dart';
import 'package:gen_i18n/src/export_translate_json.dart';
import 'package:gen_i18n/src/file_utils.dart';
import 'package:gen_i18n/src/log.dart';

main(List<String> args) async {
  showInfo('STARTED');
  if (await initializeCodeFolder()) {
    await exportI18nClass();
  }
  if (await initializeAssents()) {
    var _localeCodeList = extractLocateValues(args: args);
    await exportLocaleJson(localeCodeList: _localeCodeList);
  }
  showComplete('FINSIH');
}
