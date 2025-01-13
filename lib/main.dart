import 'package:flutter/material.dart';
import 'package:utip1/widgets/bill_amount_field.dart';
import 'package:utip1/widgets/tip_row.dart';
import 'package:utip1/widgets/tip_slider.dart';
import 'package:utip1/widgets/total_per_person.dart';

import 'widgets/person_counter.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    //print(context.widget);
    return MaterialApp(
      title: 'UTip',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const UTip(),
    );
  }
}

class UTip extends StatefulWidget {
  const UTip({super.key});

  @override
  State<UTip> createState() => _UTipState();
}

class _UTipState extends State<UTip> {

  int _personCount = 1;
  double _tipPercentage = 0.0;
  double _billTotal = 0.0;
  double totalTp = 0.0;

  double totalPerPerson(){
    return ((_billTotal * _tipPercentage) + (_billTotal)) / (_personCount);
  }

  double totalTip(){
    return (_billTotal * _tipPercentage);
  }

  //Methods
  void increment(){
    setState(() {
      _personCount = _personCount + 1;
    });
  }
  void decrement(){
    setState(() {
      if(_personCount > 1){
      _personCount--;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    //print(context.widget);
    var theme = Theme.of(context); //refracting local variable to use in short form
    double total = totalPerPerson();
    double totalTp = totalTip();

    //refracting style 
    final style = theme.textTheme.titleMedium!.copyWith( 
      color: theme.colorScheme.onPrimary,
      fontWeight: FontWeight.bold,
    );
    return Scaffold(
      appBar: AppBar(
        title: const Text('UTip'),
        //leading: const Text('Hello!'),
        ),
        body:  Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TotalPerPerson(theme: theme, style: style, total: total),
            //Form
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Container(
                padding: const EdgeInsets.all(20),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(5),
                  border: Border.all(
                    color: theme.colorScheme.primary,
                    width: 2
                  ),
                ),
                child: Column(
                  children: [
                  BillAmountField(
                    billAmount: _billTotal.toString(), //invoking String method to convert _billTotal to String.
                  onChanged: (value) {
                    setState(() {
                      _billTotal = double.parse(value); //converting String to double.
                    });
                    //print('Amount: $value');
                  },
                    ),
                  PersonCounter(theme: theme, personCount: _personCount, onDecrement: decrement, onIncrement: increment,),
                  // Tip Section
                  TipRow(theme: theme, totalTp: totalTp),
                  // Tip percentage text
                  Text('${(_tipPercentage*100).round()}%',
                  style: theme.textTheme.titleMedium,),
                  TipSlider(tipPercentage: _tipPercentage, onChanged: (double value) { 
                    setState(() {
                      _tipPercentage = value;
                    });
                   },)
                ],
                ),
              ),
            )
          ],
        ),
    );
  }
}





