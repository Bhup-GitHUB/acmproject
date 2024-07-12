import 'package:acm/add_money.dart';
import 'package:acm/biling_page.dart';
import 'package:acm/histroy_page.dart';
import 'package:flutter/material.dart';
import 'package:google_nav_bar/google_nav_bar.dart';
import 'package:acm/bar%20graph/bar_data.dart';
import 'package:acm/bar%20graph/bar_graph.dart';
import 'package:provider/provider.dart';
import 'balance_manager.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  static List<Widget> _widgetOptions = <Widget>[
    HomePageContent(),
    BillingPage(),
    HistoryPage(transactions: [],),
    AddMoneyPage(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[900],
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Center(
          child: Text(
            "P R O J E C T",
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 24,
              color: Colors.white,
            ),
          ),
        ),
        actions: [
          Container(width: 48),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Expanded(
            flex: 1,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Container(
                width: double.infinity,
                padding: EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: Colors.black,
                  borderRadius: BorderRadius.circular(12),
                ),
                child: _widgetOptions.elementAt(_selectedIndex),
              ),
            ),
          ),
        ],
      ),
      bottomNavigationBar: Container(
        color: Colors.black,
        padding: EdgeInsets.symmetric(vertical: 16, horizontal: 16),
        child: GNav(
          backgroundColor: Colors.black,
          color: Colors.white,
          activeColor: Colors.white,
          tabBackgroundColor: Colors.grey.shade800,
          gap: 8,
          padding: EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          tabs: const [
            GButton(icon: Icons.home, text: 'Home'),
            GButton(icon: Icons.receipt, text: 'Billing'),
            GButton(icon: Icons.history, text: 'History'),
            GButton(icon: Icons.add_circle_outline, text: 'Add Money'),
            

          ],
          selectedIndex: _selectedIndex,
          onTabChange: (index) {
            setState(() {
              _selectedIndex = index;
            });
          },
        ),
      ),
    );
  }
}

class HomePageContent extends StatelessWidget {
  const HomePageContent({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BarData barData = BarData(
      sunAmount: 4,
      monAmount: 5,
      tueAmount: 6,
      wedAmount: 7,
      thuAmount: 3,
      friAmount: 4,
      satAmount: 6,
    );

    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Text(
          "BALANCE",
          style: TextStyle(
            fontSize: 28,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
        SizedBox(height: 8),
        Consumer<BalanceManager>(
          builder: (context, balanceManager, child) {
            return Text(
              "Rs ${balanceManager.mainBalance.toStringAsFixed(2)}",
              style: TextStyle(
                fontSize: 36,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            );
          },
        ),
        SizedBox(height: 24),
        Expanded(
          child: Center(
            child: MyBarGraph(barData: barData.barData),
          ),
        ),
      ],
    );
  }
}

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => BalanceManager(),
      child: MaterialApp(
        home: HomePage(),
        theme: ThemeData(
          primarySwatch: Colors.blue,
          visualDensity: VisualDensity.adaptivePlatformDensity,
        ),
      ),
    ),
  );
}


