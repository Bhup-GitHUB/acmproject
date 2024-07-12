import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'balance_manager.dart';

class AddMoneyPage extends StatefulWidget {
  @override
  _AddMoneyPageState createState() => _AddMoneyPageState();
}

class _AddMoneyPageState extends State<AddMoneyPage> {
  TextEditingController _controller = TextEditingController();

  void _addCustomAmount() {
    try {
      double customAmount = double.parse(_controller.text);
      Provider.of<BalanceManager>(context, listen: false).addAmount(customAmount);
      _controller.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('₹$customAmount added to balance.'),
          duration: Duration(seconds: 2),
        ),
      );
    } catch (e) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Invalid amount entered'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Add Money'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 32.0),
              child: Row(
                children: [
                  Expanded(
                    child: TextField(
                      controller: _controller,
                      keyboardType: TextInputType.number,
                      decoration: InputDecoration(
                        hintText: 'Enter amount',
                      ),
                    ),
                  ),
                  SizedBox(width: 10.0),
                  ElevatedButton(
                    onPressed: _addCustomAmount,
                    child: Text('Add Custom'),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  void dispose() {
    _controller.dispose();
    super.dispose();
  }
}
