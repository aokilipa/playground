import 'package:flutter/material.dart';
import 'package:n52_week_challenge_flutter/contribution_model.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        primarySwatch: Colors.teal,
      ),
      home: MyHomePage(title: '#52WeekChallenge'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _counter = 0;
  List<Contribution> contrib = [];

  // Create a text controller and use it to retrieve the current value
  // of the TextField.
  final totalControl = TextEditingController();

  @override
  void initState() {
    super.initState();
    //_calculator(int.parse(myController.text.toString()))
  }

  @override
  void dispose() {
    super.dispose();
  }

  void _calculator(int deposit) {
    int newDeposit = 0;
    int totalAmount = 0;
    contrib.clear();
    for (var i = 1; i <= 52; i++) {
      newDeposit += deposit;
      totalAmount += newDeposit;
      contrib.add(new Contribution(i, newDeposit, totalAmount));
    }
    totalControl.text = totalAmount.toString();
  }

  @override
  Widget build(BuildContext context) {
    Widget topSection = Container(
      padding: const EdgeInsets.all(16),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: <Widget>[
          Flexible(
            //padding: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                keyboardType: TextInputType.number,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Starting amount',
                ),
                onChanged: (text) {
                  print("First text field: $text");
                  var deposit = int.parse(text);
                  _calculator(deposit);
                  setState(() {});
                },
              ),
            ),
          ),
          Flexible(
            //padding: const EdgeInsets.only(bottom: 16),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextField(
                enabled: false,
                controller: totalControl,
                decoration: InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Total Savings',
                ),
              ),
            ),
          )
        ],
      ),
    );
    Widget resultSection = Container(
      padding: const EdgeInsets.all(16),
      child: ListView.builder(
                scrollDirection: Axis.vertical,
                shrinkWrap: true,
                itemCount: contrib.length,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                    height: 50,
                    color: Colors.amber,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: <Widget>[
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('#Week'),
                              Text(contrib[index].currentweek.toString())
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Deposit'),
                              Text(contrib[index].deposit.toString())
                            ],
                          ),
                        ),
                        Container(
                          child: Column(
                            children: <Widget>[
                              Text('Total'),
                              Text(contrib[index].total.toString())
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
    );
    return Scaffold(
      appBar: AppBar(
        // Here we take the value from the MyHomePage object that was created by
        // the App.build method, and use it to set our appbar title.
        title: Text(widget.title),
      ),
      body: Container(
        //child: Column(
        //mainAxisAlignment: MainAxisAlignment.center,
        child: ListView(
          // mainAxisAlignment: MainAxisAlignment.start,
          // mainAxisSize: MainAxisSize.max,
          children: <Widget>[
            topSection,
            resultSection,
            // Text(
            //   'You have presses the button ' + '$_counter' +' time(s):',
            // ),
            // Text(
            //   '$_counter',
            //   style: Theme.of(context).textTheme.display1,
            // ),
          ],
        ),

        //),
      ),
      // floatingActionButton: FloatingActionButton(
      //   onPressed: _incrementCounter,
      //   tooltip: 'Increment',
      //   child: Icon(Icons.add),
      // ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
