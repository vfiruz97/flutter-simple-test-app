import 'dart:math';

String getRandomGoods() {
  var list = ["Хлеб", "Томат", "Сок соус", "Суп", "Шашлык", "Фрукты"];
  int index = (new Random()).nextInt(list.length);
  return list[index];
}
