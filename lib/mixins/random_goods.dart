import 'dart:math';

String getRandomGoods() {
  var list = ["Хлеб", "Томат", "Сок", "Суп", "Шашлык", "Фрукты"];
  int index = (new Random()).nextInt(list.length);
  return list[index];
}
