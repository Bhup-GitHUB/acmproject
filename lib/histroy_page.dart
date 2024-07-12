import 'package:flutter/material.dart';

// Define the Transaction class to hold transaction details
class Transaction {
  final String transactionId;
  final String customerName;
  final double amountSpent;

  Transaction({
    required this.transactionId,
    required this.customerName,
    required this.amountSpent,
  });
}

class HistoryPage extends StatelessWidget {
  final List<Transaction> transactions; // List to hold transactions

  // Constructor to receive transactions
  HistoryPage({required this.transactions});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Transaction History'),
      ),
      body: ListView.builder(
        itemCount: transactions.length,
        itemBuilder: (BuildContext context, int index) {
          Transaction transaction = transactions[index];

          return Card(
            margin: EdgeInsets.all(8.0),
            elevation: 4.0,
            child: ListTile(
              title: Text('${transaction.customerName} bought stuff of ₹${transaction.amountSpent.toStringAsFixed(2)}'),
              subtitle: Text('Transaction ID: ${transaction.transactionId}'),
            ),
          );
        },
      ),
    );
  }
}

void main() {
  // Example usage: Creating sample transactions
  List<Transaction> sampleTransactions = [
    Transaction(transactionId: '1', customerName: 'John Doe', amountSpent: 250.0),
    Transaction(transactionId: '2', customerName: 'Jane Smith', amountSpent: 150.0),
    Transaction(transactionId: '3', customerName: 'Mike Johnson', amountSpent: 300.0),
    Transaction(transactionId: '4', customerName: 'Emily Brown', amountSpent: 200.0),
    Transaction(transactionId: '5', customerName: 'Chris Lee', amountSpent: 180.0),
  ];

  runApp(MaterialApp(
    home: HistoryPage(transactions: sampleTransactions), // Pass the transactions to HistoryPage
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
