import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/shared/components/components.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var nameCardController = TextEditingController();
    var cardNumberController = TextEditingController();
    var cardExpiryController = TextEditingController();
    var cardAmountController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.deepPurple,
        title: Padding(
          padding: const EdgeInsets.only(left: 115),
          child: Text(
            'Add Account Details',
            style: TextStyle(
              fontSize: 18,
            ),
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: 10,
          vertical: 20,
        ),
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                height: 250,
                width: double.infinity,
                child: SvgPicture.asset('assets/images/card.svg'),
              ),
              SizedBox(
                height: 20,
              ),
              defaultTextForm(
                labelText: 'Card Name',
                hintText: 'Enter card name',
                controller: cardNumberController,
              ),
              SizedBox(
                height: 20,
              ),
              defaultTextForm(
                labelText: 'Card Number',
                hintText: 'Enter card number',
                controller: cardExpiryController,
              ),
              SizedBox(
                height: 20,
              ),
              defaultTextForm(
                labelText: 'Card Expiry',
                hintText: 'Enter card expiry date',
                controller: cardAmountController,
              ),
              SizedBox(
                height: 20,
              ),
              defaultTextForm(
                labelText: 'Amount',
                hintText: 'Enter current amount',
                controller: nameCardController,
              ),
            ],
          ),
        ),
      ),
    );
  }
}
