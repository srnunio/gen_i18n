library print_tool;

import 'package:colorize/colorize.dart';

void showInfo(String message, {String operator = ''}) {
  var led = Colorize('$operator[INFO]:').darkGray();
  print('$led $message');
}

void showWarning(String message, {String operator = ''}) {
  var led = Colorize('$operator[WARNING]:').bold().yellow();
  print('$led $message');
}

void showComplete(String message, {String operator = ''}) {
  var led = Colorize('$operator[COMPLETED]:').bold().green();
  print('$led $message');
}

void showCreated(String message, {String operator = ''}) {
  var led = Colorize('$operator[CREATED]:').bold().green();
  print('$led $message');
}

void showError(String message, {String operator = ''}) {
  var led = Colorize('$operator[ERROR]:').bold().red();
  print('$led $message');
}
