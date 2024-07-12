import 'dart:io';
import 'package:acm/histroy_page.dart';
import 'package:flutter/material.dart';
import 'package:path_provider/path_provider.dart';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:flutter_pdfview/flutter_pdfview.dart';


class Item {
  final String name;
  final int quantity;
  final double price;
  final String features;

  Item({
    required this.name,
    required this.quantity,
    required this.price,
    required this.features,
  });
}

class BillingPage extends StatefulWidget {
  @override
  _BillingPageState createState() => _BillingPageState();
}

class _BillingPageState extends State<BillingPage> {
  TextEditingController _productNameController = TextEditingController();
  TextEditingController _priceController = TextEditingController();
  TextEditingController _quantityController = TextEditingController();

  List<Map<String, dynamic>> _billItems = [];

  void _addProductToBill() {
    String productName = _productNameController.text.trim();
    String price = _priceController.text.trim();
    String quantity = _quantityController.text.trim();

    if (productName.isNotEmpty && price.isNotEmpty && quantity.isNotEmpty) {
      double totalAmount = double.parse(price) * int.parse(quantity);
      _billItems.add({
        'productName': productName,
        'price': double.parse(price),
        'quantity': int.parse(quantity),
        'totalAmount': totalAmount,
      });

      _productNameController.clear();
      _priceController.clear();
      _quantityController.clear();

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('$productName added to the bill.'),
          duration: Duration(seconds: 2),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Please fill in all fields.'),
          duration: Duration(seconds: 2),
        ),
      );
    }
  }

  Future<String> _generateBillPDF() async {
    final pdf = pw.Document();

    pdf.addPage(
      pw.MultiPage(
        build: (context) => [
          pw.Table.fromTextArray(
            border: pw.TableBorder.all(),
            headerStyle: pw.TextStyle(fontWeight: pw.FontWeight.bold),
            headerDecoration: pw.BoxDecoration(color: PdfColors.grey300),
            data: <List<String>>[
              <String>['Product Name', 'Price (₹)', 'Quantity', 'Total Amount (₹)'],
              ..._billItems.map((item) => [
                item['productName'],
                item['price'].toString(),
                item['quantity'].toString(),
                item['totalAmount'].toString(),
              ]),
            ],
          ),
        ],
      ),
    );

    final String dir = (await getApplicationDocumentsDirectory()).path;
    final String path = '$dir/bill.pdf';
    final File file = File(path);
    await file.writeAsBytes(await pdf.save());

    return path;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Billing Page'),
      ),
      body: Padding(
        padding: EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            TextFormField(
              controller: _productNameController,
              decoration: InputDecoration(
                labelText: 'Product Name',
                border: OutlineInputBorder(),
              ),
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _priceController,
              decoration: InputDecoration(
                labelText: 'Price (₹)',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 16.0),
            TextFormField(
              controller: _quantityController,
              decoration: InputDecoration(
                labelText: 'Quantity',
                border: OutlineInputBorder(),
              ),
              keyboardType: TextInputType.number,
            ),
            SizedBox(height: 24.0),
            ElevatedButton(
              onPressed: _addProductToBill,
              child: Text('Add Product'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () async {
                String pdfPath = await _generateBillPDF();
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => PDFViewerPage(path: pdfPath)),
                );
              },
              child: Text('Generate Bill PDF'),
            ),
            SizedBox(height: 16.0),
            ElevatedButton(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => HistoryPage(transactions: [],)),
                );
              },
              child: Text('Transaction History'),
            ),
          ],
        ),
      ),
    );
  }
}

class PDFViewerPage extends StatelessWidget {
  final String path;

  const PDFViewerPage({Key? key, required this.path}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('View Bill PDF'),
      ),
      body: Center(
        child: PDFView(
          filePath: path,
        ),
      ),
    );
  }
}

void main() {
  runApp(MaterialApp(
    home: BillingPage(),
    theme: ThemeData(
      primarySwatch: Colors.blue,
      visualDensity: VisualDensity.adaptivePlatformDensity,
    ),
  ));
}
