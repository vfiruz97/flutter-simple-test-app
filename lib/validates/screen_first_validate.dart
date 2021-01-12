import 'package:test_task/lang/ru.dart';

String urlValide(value) {
  bool urlCorrect;

  if (value.isEmpty || value == '') return enterUrl;

  try {
    urlCorrect = Uri.parse(value).isAbsolute;
  } catch (e) {
    return uncorrectUrl;
  }

  if (urlCorrect == false) return uncorrectUrl;
  return null;
}

String numberValide(value) {
  int number;

  if (value.isEmpty) return enterNum;

  try {
    number = int.parse(value);
  } catch (e) {
    return uncorrectNum;
  }

  if (number < 3 || number > 5) return 'Допустимые значения от 3 до 5';

  return null;
}
