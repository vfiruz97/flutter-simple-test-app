import 'package:flutter/material.dart';
import 'package:test_task/mixins/random_goods.dart';
import 'package:test_task/mixins/random_price.dart';

class SecondScreen extends StatefulWidget {
  SecondScreen({@required this.url, @required this.number});
  
  String url;
  int number;

  @override
  _SecondScreenState createState() => _SecondScreenState();
}

class _SecondScreenState extends State<SecondScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Container(
          margin: EdgeInsets.only(bottom: 10.0),
          padding: EdgeInsets.all(0.0),
          width: double.infinity,
          height: double.infinity,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Container(
                width: double.infinity,
                height: MediaQuery.of(context).size.width * 0.75,
                child: Image.network(
                  widget.url,
                  fit: BoxFit.cover,
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 15.0),
                child: Text(
                  'Произвольный текст как заголовок',
                  style: TextStyle(
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
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
              Expanded(
                child: ListView.builder(
                  itemCount: widget.number,
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
                          child: Image.network(
                            widget.url,
                            fit: BoxFit.cover,
                            width: 50.0,
                            height: 50.0,
                          ),
                        ),
                        title: Text(getRandomGoods()),
                        trailing: Text(
                            "${getRandomPrice(min: 5, max: 99).toString()} р."),
                      ),
                    );
                  },
                ),
              ),
              SizedBox(
                height: 10.0,
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
                    style: TextStyle(
                      fontSize: 26.0,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
