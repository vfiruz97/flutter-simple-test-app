# test_task

Необходимо создать небольшое приложение из 2-х экранов

1 экран. 
содержит два поля ввода и кнопку
Поле ввода URL картинки (любая из сети)
Поле ввода целого числа. допустимые значения от 3 до 5

По нажатию на кнопку необходимо проверить чтобы оба поля ввода были заполнены
и если поля не заполнены или заполнены неверно, то показать сообщение.
Если поля заполнены верно, то необходимо открыть второй экран.

2 экран. Это небольшой фрагмент реального макета экрана корзины с заказами.
Макет второго экрана:

Картинка - без отступов, соотношение сторон ширина:высота - 4:3
картинка должна отображаться без искажения, даже если соотношение сторон
не равно 4:3. Допускается обрезка по вертикали и горизонтали 
Картинка должна загружаться из сети, URL картинки задается на первом экране
Картинка должна быть кэширована

Произвольный текст как заголовок - пусть такой текст и будет

Блок дополнительно служит для отображения дополнительных товаров к заказу:
состоит из нескольких виджетов, количество виджетов задается на первом экране
Виджет (его надо разработать) состоит из 4-х элементов:
Картинка - соотношение сторон 1:1. URL картинки тот же, что и для большой картинки, картинка должна быть закеширована
Название - произвольный текст из нескольких слов. отображать не более 3-х строк
Элемент выбора количества состоит из 3-х элементов: две круглые кнопки - и + и текстовое поле для отображения выбранного количества. Текстовое поле read only, первоначальное значение - 0. Количество не может быть больше 20 и меньше 0. Элемент выбора количества тоже виджет и его надо разработать. 
Цена - произвольное целое число от 5 до 99

Все 4 элемента Виджета должны быть отцентрированы относительно горизонтальной оси.

Информационный блок

Нас интересует правая часть
x0 - здесь будет сумма дополнительных товаров, количество которых задается в блоке Дополнительно.
0,00 - стоимость дополнительных товаров 
При изменении количества любого дополнительного товара информационный блок должен обновляться

На макете второго экрана не показан AppBar

Для отображения картинок используйте 
cached_network_image
https://pub.dev/packages/cached_network_image

Во время загрузки большой картинки, в качестве placeholder показывайте 
CircularProgressIndicator
https://api.flutter.dev/flutter/material/CircularProgressIndicator-class.html
для маленьких картинок placeholder использовать не надо

Информационный блок - для отображения точек используйте:
dotted_decoration
https://pub.dev/packages/dotted_decoration

При разработке виджетов следует использовать только стандартные средства Flutter, за исключением виджета для отображения картинки. Там следует использовать cached_network_image