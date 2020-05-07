import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: "Calculator by Supanut Laddayam 5935512049",
      home: Scaffold(
        appBar: AppBar(
          title: Text("Calculator by Supanut Laddayam 5935512049",
          style: TextStyle(fontSize: 17),),
          backgroundColor: Color.fromRGBO(28,41,75 , 1),
        ),
        body: Calculator(),
      ),
    );
  }
}

class Calculator extends StatefulWidget {
  CalculatorState createState() => CalculatorState();
}

class CalculatorState extends State<Calculator> {

  String mainText = " ";

  String supportText = "";
  String operator = "";
  int num1 = 0;
  int num2 = 0;

  getbuttonValue(String btnValue) {
    if (btnValue == "C") {
      print("ya");
       supportText = "";
      operator = " ";
      num1 = 0;
      num2 = 0;

    }
    else if (btnValue == "+" || btnValue == "-" || btnValue == "x" || btnValue == "/" ) {
      num1 = int.parse(mainText);
      operator = btnValue;
      print(num1);
      print(operator);
      supportText = "";
    }

    else if(btnValue == "=") {
      num2 = int.parse(mainText);

      print(">>>" + num1.toString());
      print(">>>" + num2.toString());


      if(operator == "+") {
        supportText = (num1 + num2).toString();
      }

      if(operator == "-") {
        supportText = (num1 - num2).toString();
      }

      if(operator == "x") {
        supportText = (num1 * num2).toString();
      }

      if(operator == "/"){
          if (num2 == 0) {
            supportText = "Error";
          }
          else {
            supportText = (num1 / num2).toString();
          }
      }

      num1 = 0;
      num2 = 0;
      operator = "";

    }
    else {
      print("case else");
      supportText = supportText + btnValue;
    }

    setState(() {
    mainText = supportText;
    });
  }

  Widget buttonCell(String number) {
    return Container(
      child: MaterialButton(
        padding: EdgeInsets.all(30),
        highlightColor: Colors.red,
        splashColor: Colors.green,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(50),
          side: BorderSide(color: Color.fromRGBO(1, 144, 160, 1), width: 3),

        ),
        child: Text(number,
          style: TextStyle(
              fontSize: 20,
              color: Color.fromRGBO(228,169,29 ,1),
          ),
        ),
        color: Colors.white,

        textColor: Colors.black,
        onPressed: ()=>{
          getbuttonValue(number)
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color:Color.fromRGBO(1, 144, 160, 1),
      child: Column(
        children: <Widget>[
          Expanded(
            child: Container(
              alignment: Alignment.centerRight,
             child: Text(mainText, style: TextStyle(fontSize: 50,color: Color.fromRGBO(228,169,29 ,1),),),
          )    ),

          Column(
            mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              Padding(
                padding: EdgeInsets.all(10),
                child: Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[

                    buttonCell("9"),
                    buttonCell("8"),
                    buttonCell("7"),
                    buttonCell("+"),
                  ],
                ),
              ),

              Padding(
                  padding: EdgeInsets.all(10),
                  child: Row(
                    mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      buttonCell("6"),
                      buttonCell("5"),
                      buttonCell("4"),
                      buttonCell("-"),
                    ],
                  ),
              ),

              Padding(
                padding: EdgeInsets.all(10),
                child:  Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonCell("3"),
                    buttonCell("2"),
                    buttonCell("1"),
                    buttonCell("x"),
                  ],
                ),

              ),

              Padding(
                padding: EdgeInsets.all(10),
                child:  Row(
                  mainAxisAlignment:  MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    buttonCell("C"),
                    buttonCell("0"),
                    buttonCell("="),
                    buttonCell("/"),
                  ],
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
