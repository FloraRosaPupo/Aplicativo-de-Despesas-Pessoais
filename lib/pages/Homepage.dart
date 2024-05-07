import 'package:despesaspessoais/models/transaction.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final _transaction = [
    Transaction(id: 't1', title: 'title', value: 310.8, date: DateTime.now()),
    Transaction(id: 't2', title: 'title', value: 310.8, date: DateTime.now()),
    Transaction(id: 't3', title: 'title', value: 310.8, date: DateTime.now()),
    Transaction(id: 't3', title: 'title', value: 310.8, date: DateTime.now()),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text(
            "Despesas Pessoais",
            style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          backgroundColor: Colors.black,
        ),
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Container(
              child: Card(
                color: Colors.blue,
                child: Text("Grafico"),
                elevation: 5,
              ),
            ),
            Column(
              //map
              children: _transaction.map((tr) {
                return Card(
                    child: Row(
                  children: [
                    Container(
                      margin: EdgeInsets.symmetric(
                        horizontal: 15,
                        vertical: 10,
                      ),
                      decoration: BoxDecoration(
                          border: Border.all(color: Colors.purple, width: 2)),
                      padding: EdgeInsets.all(10),
                      child: Text(
                        'R\$' + tr.value.toString(), //ou 'R\$ + ${tr.value}'
                        style: TextStyle(
                            color: Colors.purple,
                            fontSize: 20,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          tr.title,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        Text(
                          DateFormat('d MMM y').format(tr.date),
                          style: TextStyle(color: Colors.grey),
                        )
                      ],
                    )
                  ],
                ));
              }).toList(),
            ),
            Card(
                elevation: 5,
                child: Padding(
                  padding: EdgeInsets.all(10),
                  child: Column(children: [
                    TextField(
                      decoration: InputDecoration(labelText: 'Titulo'),
                    ),
                    TextField(
                        decoration: InputDecoration(labelText: 'Valor (R\$)')),
                    ElevatedButton(
                        onPressed: () {}, 
                        child: Text(
                          'Nova transação',
                          style: TextStyle(color: Colors.purple),
                        )),
                  ]),
                )),
          ],
        ));
  }
}
