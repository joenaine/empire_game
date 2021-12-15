import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final int input;
  const Home({Key key, this.input}) : super(key: key);

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int input;
  List<String> imperials = [];

  TextEditingController _inputNumber = TextEditingController();

  void amount() {
    imperials.add(_inputNumber.text);
  }

  bool filled = false;
  /////////////////
  ///@2handaulet on Instagram
  ////////////////

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Color(0xffF6DEC8),
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        centerTitle: true,
        title: Text(
          '@2handaulet',
          style: TextStyle(color: Colors.black54),
        ),
        elevation: 0,
      ),
      floatingActionButton: filled
          ? FloatingActionButton(
              backgroundColor: Colors.redAccent,
              onPressed: () {
                setState(() {
                  filled = false;
                  imperials.clear();
                });
              },
              child: Icon(Icons.refresh),
            )
          : null,
      body: !filled
          ? Center(
              child: SingleChildScrollView(
                child: Container(
                  height: MediaQuery.of(context).size.height / 1.2,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      SizedBox(
                        height: 200,
                        width: 200,
                        child: Image.asset('assets/king.png'),
                      ),
                      Text(
                        'ИМПЕРИЯ',
                        style: TextStyle(
                            fontSize: 40,
                            fontWeight: FontWeight.bold,
                            color: Colors.redAccent),
                      ),
                      SizedBox(height: 70),
                      Container(
                        height: 70,
                        width: MediaQuery.of(context).size.width / 1.2,
                        child: TextField(
                          controller: _inputNumber,
                          textAlign: TextAlign.center,
                          decoration: InputDecoration(
                              suffixIcon: IconButton(
                                onPressed: () {
                                  _inputNumber.clear();
                                },
                                icon: Icon(Icons.cancel),
                              ),
                              alignLabelWithHint: true,
                              border: OutlineInputBorder(
                                  borderRadius: BorderRadius.circular(20)),
                              labelStyle: TextStyle(fontSize: 18)),
                          style: TextStyle(fontSize: 26),
                        ),
                      ),
                      SizedBox(height: 30),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          onPressed: () {
                            amount();
                            _inputNumber.clear();
                          },
                          padding: EdgeInsets.all(16),
                          color: Colors.redAccent,
                          child: Text(
                            'N E X T',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      ),
                      ClipRRect(
                        borderRadius: BorderRadius.circular(20),
                        child: MaterialButton(
                          onPressed: () {
                            setState(() {
                              imperials.shuffle();
                              filled = true;
                            });
                          },
                          padding: EdgeInsets.all(16),
                          color: Colors.greenAccent,
                          child: Text(
                            'S T O P',
                            style: TextStyle(color: Colors.white, fontSize: 24),
                          ),
                        ),
                      )
                    ],
                  ),
                ),
              ),
            )
          : SingleChildScrollView(
              child: Column(
                  children: imperials
                      .map((e) => Center(
                              child: Column(
                            children: [
                              Text(
                                e,
                                style: TextStyle(
                                    fontSize: 32,
                                    color: Colors.black54,
                                    fontWeight: FontWeight.bold),
                              ),
                            ],
                          )))
                      .toList()),
            ),
    );
  }
}
