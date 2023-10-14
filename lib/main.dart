import 'package:flutter/material.dart';
import 'package:vtb_hack/features/auth/ui/auth_page.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  /* 
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }
   */

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      routes: {
        /* 
          '/home_page': (context) => const StartPage(), // new 1.0 start page

          '/reg_page': (context) => const RegPage(), // registration

          '/reg_confirm_conditions_page': (context) => RegConfirmConditionsPage(arsg: args),

          '/auth_page': (context) => const AuthPage(), //1.0 authorization

          '/profile_page': (context) => ProfilePage(args: args),

          '/profile_edit_page': (context) => ProfileEditPage(args: args),

          '/buyer_workplace_page': (context) => const BuyerWorkplacePage(), //1.1

          '/buyer_orders_list_page': (context) => const BuyerOrdersListPage(), // 1.2

          '/suppliers_list_page': (context) => SuppliersProposalsListPage(args: args), //1.3

          '/description_of_supplier_proposal_page': (context) => DescriptionOfSupplierProposalPage(args: args), // 1.5

          '/supplier_contacts_page': (context) => SupplierContactsPage(args: args), // 1.6

          '/create_order_page': (context) => const CreateOrderPage(), //1.7

          '/success_order_page': (context) => const SuccessOrderPage(), //1.8

          '/selected_buyer_list_of_orders_page': (context) => const SelectedBuyerListOfOrdersPage(), // 2.1.1

          '/description_of_buyer_order_page': (context) => DescriptionOfBuyerOrderPage(args: args), //2.2

          '/selection_of_create_proposal_page': (context) => SelectionOfCreateProposalPage(args: args), //2.3

          '/create_compliance_proposal_page': (context) => CreateComplianceProposalPage(args: args), //2.4

          '/create_similar_proposal_page': (context) => CreateSimilarProposalPage(args: args), //2.5

          '/success_proposal_page': (context) => const SuccessProposalPage(), //2.6
          */
      },
      home: const AuthPage(),
    );
  }

  /* @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text(
              'You have pushed the button this many times:',
            ),
            Text(
              '$_counter',
              style: Theme.of(context).textTheme.headlineMedium,
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _incrementCounter,
        tooltip: 'Increment',
        child: const Icon(Icons.add),
      ),
    );
  } */
}
