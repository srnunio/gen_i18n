const _KEY = '--locale-';

/// [extractLocateValues] maps arguments intended to locate and returns a list
/// of language codes which you want to create the translation files
List<String> extractLocateValues({required List<String> args}) {
  var index = args.indexWhere((value) => value.trim().contains(_KEY));
  if (index < 0) return ['en'];

  var arg = args.elementAt(index).replaceAll(_KEY, '');

  var values = arg.split('-');

  values.removeWhere((value) => RegExp(r'^[^A-Za-z]').hasMatch(value.trim()));

  return values.map((item) => item.toLowerCase()).toSet().toList();
}
