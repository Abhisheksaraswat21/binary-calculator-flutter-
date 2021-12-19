import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Binary Calculator App'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  //statseful wodgetds can change their state with respect to users work

  const MyHomePage({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String output = "0";
  String _output = "0";
  //this variable will hold the temprary output..and its value will be provided to final output once
  //calculation is completed

  double num1 = 0.0;
  double num2 = 0.0;
  String operand = "";

  buttonPressed(String buttonText) {
    //   print(buttonText);

    if (buttonText == "CLEAR") {
       output = "0";
       _output = "0";

       num1 = 0.0;
       num2 = 0.0;
       operand = "";
    } else if (buttonText == "+" ||
        buttonText == "-" ||
        buttonText == "/" ||
        buttonText == "X") {
      num1 = double.parse(output);
      //num1 is double and output is a string so we parse output to double and then store it in num1
      operand = buttonText;
      //jo operand click hua abhi uusko operand me daal denge

      _output = "0";
      //button dbaate hi output 0 krre hai filhaal
    } else if (buttonText == ".") {
      if (_output.contains(".")) {
        //output contains se hum check krre hai ki . pehle se hai ya ni
        print("Already contains decimal");
        return;
      } else {
        _output = _output + buttonText;
        //ni hai ti usko seudo output me daal denge

      }
    } else if (buttonText == "=") {
      num2 = double.parse(output);
      //output ko num2 me daal dia ab

      if (operand == "+") {
        _output = (num1 + num2).toString();
      }

      if (operand == "-") {
        _output = (num1 - num2).toString();
      }

      if (operand == "X") {
        _output = (num1 * num2).toString();
      }

      if (operand == "/") {
        _output = (num1 / num2).toString();
      }

      num1 = 0.0;
      num2 = 0.0;
      operand = "";
    } else {
      _output = _output + buttonText;
      //we are appending button text to our output

    }

    print(_output);

    setState(() {
      output = double.parse(_output).toStringAsFixed(2);
      //setstate ke andr daala taaki output ki state apne aap update hoti rhe
      //_output is a string it can contain leading 0s...so we paas it as a double
      //and convert it back to the string, and restrict its presision to 2 decimal
      //places
      


    });
  }

//buttons ke liye ek nya widget bna dia yha pe
//we are working in column so it will take all the vertical space

  Widget buildButton(String buttonText) {
    //this functnion has a return type of widget

    return new Expanded(
      //expanded se space is divided between all the expnded widgets
      //so here all the space will be divide between the



      child: new OutlineButton(
        //jb tk inpresse ni lagaoge button pe tab tak wo button press ni hoga

    


        //ab yha pe button ko style krdia hai humne...buttontext function hai jaha se button me text likha hai
        child: new Text(buttonText,
            style: 
            
            TextStyle(
              fontSize: 20.0,
              fontWeight: FontWeight.bold,
         
            ),),

          //   ButtonStyle(
          //       backgroundColor: MaterialStateProperty.all<Color>(Colors.green),
          //  // backgroundcolor = Colors.blueGrey,
          //   ),
        onPressed: () => buttonPressed(buttonText),
        padding: new EdgeInsets.all(24.0),
        //on padding we applied edgeinsets widget on all sides 24 device independent pixels
      // child: new Container( color: Colors.blueGrey,)
       // color: Colors.blueGrey,
        // textColor: Colors.white,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(widget.title),
          //it is receiving title from myapp stateless widget
          backgroundColor: Colors.deepOrange[200],
        ),
        body: new Container(
            child: new Column(
          children: <Widget>[
//column can have more than one child so it has property called children which is an array of widgets
//ab mtlb iske andar ke elements column me aayenge

            new Container(
                alignment: Alignment.centerRight,
                padding: EdgeInsets.symmetric(vertical: 24.0, horizontal: 12.0),
                child: new Text(output,
                    //yha pe text humne output variable se dia hai
                    //jo output variable me hoga wo yha peupar dikhega

                    style: TextStyle(
                      fontSize: 36.0,
                      fontWeight: FontWeight.bold,
                    ))),

            new Expanded(
              child: new Divider(),
            ),
//divider se text upar hojayega
//divider takes the space and widget ko niche krdega page ke
//to ye saara available space lelega

            new Column(children: [
              //is tarike se pehle rows bani hai ab columns bane hai....mtlb ek grid typeka milega hume buttons ka
              //columns me children property hoti hai
              new Row(
                  //row has children which is an array of widgets so we wrapped everything inside an array
                  //ab row me aajayenge children
                  children: [
                    buildButton("7"),
                    //is function se button hi bna rhe hai...iski declaration humn
                    //upar_ MyhomeState ke niche di hai

                    buildButton("8"),
                    buildButton("9"),
                    buildButton("/"),
                  ]),

              new Row(
                  //row has children which is an array of widgets so we wrapped everything inside an array
                  //ab row me aajayenge children
                  children: [
                    buildButton("4"),
                    //is function se button hi bna rhe hai...iski declaration humn
                    //upar_ MyhomeState ke niche di hai

                    buildButton("5"),
                    buildButton("6"),
                    buildButton("X"),
                  ]),

              new Row(
                  //row has children which is an array of widgets so we wrapped everything inside an array
                  //ab row me aajayenge children
                  children: [
                    buildButton("1"),
                    //is function se button hi bna rhe hai...iski declaration humn
                    //upar_ MyhomeState ke niche di hai

                    buildButton("2"),
                    buildButton("3"),
                    buildButton("-"),
                  ]),

              new Row(
                  //row has children which is an array of widgets so we wrapped everything inside an array
                  //ab row me aajayenge children
                  children: [
                    buildButton("."),
                    //is function se button hi bna rhe hai...iski declaration humn
                    //upar_ MyhomeState ke niche di hai

                    buildButton("0"),
                    buildButton("00"),
                    buildButton("+"),
                  ]),

              new Row(
                  //row has children which is an array of widgets so we wrapped everything inside an array
                  //ab row me aajayenge children
                  children: [
                    buildButton("CLEAR"),
                    //is function se button hi bna rhe hai...iski declaration humn
                    //upar_ MyhomeState ke niche di hai

                    buildButton("="),
                  ]),
            ])
          ],
        )));
  }
}
