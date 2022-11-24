import 'package:flutter/material.dart' hide Action;
import 'package:counter_7/drawer.dart';
import 'package:counter_7/page/form.dart';

class BudgetDataPage extends StatefulWidget {
  const BudgetDataPage({super.key});

  @override
  State<BudgetDataPage> createState() => _BudgetDataPageState();
}

class _BudgetDataPageState extends State<BudgetDataPage> {
  List<String> judulBudget = Data.getJudul();
  List<String> nominalBudget = Data.getJumlah();
  List<String> jenisBudget = Data.getBudgeting();
  int indexBudget = Data.getLength();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Data Budget'),
      ),
      drawer: DrawerClass(),
      body: Form(
        child: SingleChildScrollView(
          child: Container(
            padding: const EdgeInsets.all(20.0),
            margin: const EdgeInsets.all(8),
            decoration: BoxDecoration(
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(5),
            ),
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Center(child: const Text('Data Budget')),
                  for (int i = 0; i < indexBudget; i++) ListView(
                    padding: const EdgeInsets.only(top: 20, bottom: 20),
                    shrinkWrap: true,
                    children: [
                      SizedBox(height: 20),
                      Text(
                        judulBudget[i],
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        nominalBudget[i],
                        textAlign: TextAlign.left,
                      ),
                      Text(
                        jenisBudget[i],
                        textAlign: TextAlign.right,
                      ),
                    ],
                  ),
                ]
            ),
          ),
        ),
      ),
    );
  }
}