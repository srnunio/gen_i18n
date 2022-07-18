import 'dart:async';
import 'dart:io';
import 'package:path/path.dart' as path;
import 'package:gen_i18n/src/log.dart';

final Directory _current = Directory.current;

/// [_newFolder] this create new folder if not exist
Future<bool> _newFolder(Directory file) async {
  try {
    if (!await file.exists()) await file.create(recursive: true);
    if (await file.exists()) showCreated(file.path, operator: '\t');
    return true;
  } catch (error) {
    showError(file.path);
  }
  showError(file.path);
  return false;
}

/// [newFile] create a new file if there is no
Future<bool> newFile({required File file, required String content}) async {
  try {
    if (await file.exists()) return true;

    if (await (await file.writeAsString(content)).exists())
      showCreated(file.path, operator: '\t');

    return true;
  } catch (error) {
    showError(file.path);
  }
  showError(file.path);
  return false;
}

/// [initializeAssents] Folder where the translation files will be
Future<bool> initializeAssents() async {
  var _path = Directory(path.join(_current.path, 'assets/i18n/locale'));
  if (!await _path.exists()) return await _newFolder(_path);
  showWarning(_path.path, operator: '\t');
  return true;
}

/// [initializeCodeFolder] folder that will contain the class responsible for
/// the internationalization
Future<bool> initializeCodeFolder() async {
  var _path = Directory(path.join(_current.path, 'lib/i18n'));
  if (!await _path.exists()) {
    return await _newFolder(_path);
  }
  showWarning(_path.path, operator: '\t');
  return true;
}

/// [getCodeFolder] draw the path of the file to be created
File getCodeFile() {
  var _path = Directory(path.join(_current.path, 'lib/i18n')).path;
  return File(path.join(_path, 'i18n.dart'));
}

/// [getJsonFile] draw the path of the file to be created
File getJsonFile({required String code}) {
  var _path = Directory(path.join(_current.path, 'assets/i18n/locale')).path;
  return File(path.join(_path, 'i18n_$code.json'));
}
