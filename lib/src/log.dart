library print_tool;

import 'package:ansicolor/ansicolor.dart';

void showInfo(String info) {
  AnsiPen pen = new AnsiPen()..gray();
  print(pen('[INFO]: $info'));
}

void showWarning(String warning) {
  AnsiPen pen = new AnsiPen()..yellow();
  print(pen('[WARNING]: $warning'));
}

void showComplete(String warning) {
  AnsiPen pen = new AnsiPen()..green(bold: true);
  print(pen('[COMPLETED]: $warning'));
}

void showSuccess(String warning) {
  AnsiPen pen = new AnsiPen()..green(bold: true);
  print(pen('[SUCCESS]: $warning'));
}

void showError(String error) {
  AnsiPen pen = new AnsiPen()..red(bold: true);
  print(pen('[ERROR]: $error'));
}
