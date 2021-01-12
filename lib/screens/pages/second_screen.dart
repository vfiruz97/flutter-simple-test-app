import 'package:dotted_decoration/dotted_decoration.dart';
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:test_task/mixins/random_goods.dart';
import 'package:test_task/mixins/random_img_url.dart';
import 'package:test_task/mixins/random_price.dart';
import 'package:test_task/models/order.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({@required this.url, @required this.number});

  String url;
  int number;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  int _totalCount = 0;
  double _totalPrice = 0.00;
  final List<Order> _list = [];

  @override
  void initState() {
    super.initState();

    for (int i = 0; i < widget.number; i++) {
      _list.add(Order(
          img: getRandomImageUrl(getRandomPrice(min: 0, max: 5)),
          name: getRandomGoods(),
          count: 0,
          price: getRandomPrice(min: 5, max: 99)));
    }
  }

  calculateCountAndPrice() {
    int count = 0;
    double price = 0;

    for (int i = 0; i < _list.length; i++) {
      count += _list[i].count;
      price += (_list[i].count * _list[i].price);
    }

    setState(() {
      _totalCount = count;
      _totalPrice = price;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          width: double.infinity,
          height: double.infinity,
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.75,
                child: CachedNetworkImage(
                  width: double.infinity,
                  height: MediaQuery.of(context).size.width * 0.75,
                  fit: BoxFit.cover,
                  imageUrl: widget.url,
                  placeholder: (context, url) => Container(
                    width: 50.0,
                    child: Center(
                      child: CircularProgressIndicator(),
                    ),
                  ),
                  errorWidget: (context, url, error) => Icon(Icons.error),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(
                  horizontal: 10.0,
                  vertical: 12.0,
                ),
                child: Text(
                  'Произвольный текст как заголовок',
                  style: const TextStyle(
                    fontSize: 36,
                    fontWeight: FontWeight.bold,
                    color: Colors.black54,
                  ),
                ),
              ),
              Container(
                color: Colors.blueGrey[50],
                alignment: Alignment.topLeft,
                margin: EdgeInsets.symmetric(
                  horizontal: 10.0,
                ),
                child: ListTile(
                  title: Text(
                    "Дополнительно",
                    style: const TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: _list.length,
                  itemBuilder: (context, index) {
                    return Container(
                      color: Colors.blueGrey[50],
                      alignment: Alignment.topLeft,
                      margin: EdgeInsets.symmetric(
                        horizontal: 10.0,
                      ),
                      padding: EdgeInsets.symmetric(
                        vertical: 10.0,
                      ),
                      child: ListTile(
                        leading: Container(
                          width: 50.0,
                          height: 50.0,
                          alignment: Alignment.topLeft,
                          child: CachedNetworkImage(
                            width: 50.0,
                            height: 50.0,
                            fit: BoxFit.cover,
                            imageUrl: _list[index].img,
                            errorWidget: (context, url, error) =>
                                Icon(Icons.error),
                          ),
                        ),
                        title: Text(_list[index].name),
                        trailing: Container(
                          height: double.infinity,
                          width: 200.0,
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              Container(
                                width: 40.0,
                                height: 40.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.blueGrey[100],
                                    onPressed: () => setState(() {
                                      if (_list[index].count > 0) {
                                        _list[index].count--;
                                        calculateCountAndPrice();
                                      }
                                    }),
                                    child: Text(
                                      '-',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Padding(
                                padding: EdgeInsets.symmetric(
                                  horizontal: 7.0,
                                ),
                                child: Text(
                                  "${_list[index].count}",
                                  style: const TextStyle(
                                    fontSize: 18.0,
                                  ),
                                ),
                              ),
                              Container(
                                width: 40.0,
                                height: 40.0,
                                child: FittedBox(
                                  child: FloatingActionButton(
                                    backgroundColor: Colors.blueGrey[50],
                                    onPressed: () => setState(() {
                                      if (_list[index].count < 20) {
                                        _list[index].count++;
                                        calculateCountAndPrice();
                                      }
                                    }),
                                    child: Text(
                                      '+',
                                      style: const TextStyle(
                                        color: Colors.black,
                                        fontSize: 36.0,
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 10.0,
                              ),
                              Text(
                                "+ ${_list[index].price.toString()} р.",
                                style: const TextStyle(
                                  fontWeight: FontWeight.bold,
                                  fontSize: 20.0,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
              ),
              Stack(
                children: [
                  Positioned(
                    child: Container(
                      decoration: DottedDecoration(
                        color: Colors.black,
                        dash: <int>[5, 10],
                        linePosition: LinePosition.top,
                      ),
                    ),
                  ),
                  Container(
                    color: Colors.blueGrey[200],
                    alignment: Alignment.topLeft,
                    child: ListTile(
                      title: Text(
                        "Дополнительно",
                        style: const TextStyle(
                          letterSpacing: 0.5,
                          fontSize: 26.0,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      trailing: Text(
                        "x${_totalCount}  ${_totalPrice} р.",
                        style: TextStyle(
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold,
                          color: Colors.black,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
