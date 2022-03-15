import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:task1/layout/cubit/cubit.dart';
import 'package:task1/layout/cubit/states.dart';
import 'package:task1/screens/home/home_screen.dart';
import 'package:task1/shared/components/components.dart';

class AddAccountScreen extends StatelessWidget {
  const AddAccountScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var _formKey = GlobalKey<FormState>();
    var nameCardController = TextEditingController();
    var cardNumberController = TextEditingController();
    var cardExpiryController = TextEditingController();
    var cardAmountController = TextEditingController();
    return BlocConsumer<AppCubit, AppStates>(
      listener: (context, state) {},
      builder: (context, state) {
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
              vertical: 10,
            ),
            child: SingleChildScrollView(
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Container(
                      padding: EdgeInsets.all(10),
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
                      controller: nameCardController,
                      keyboardType: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your card name';
                        }
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextForm(
                      labelText: 'Card Number',
                      hintText: 'Enter card number',
                      controller: cardNumberController,
                      keyboardType: TextInputType.number,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your card number';
                        }else if(value.length < 16){
                          return 'please check card number';
                        }
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextForm(
                      labelText: 'Card Expiry',
                      hintText: 'Enter card expiry date',
                      controller: cardExpiryController,
                      keyboardType: TextInputType.text,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your expiry date';
                        }
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    SizedBox(
                      height: 20,
                    ),
                    defaultTextForm(
                      labelText: 'Amount',
                      hintText: 'Enter current amount',
                      controller: cardAmountController,
                      keyboardType: TextInputType.number,
                      validate: (String? value) {
                        if (value!.isEmpty) {
                          return 'please enter your amount';
                        }
                      },
                      onSubmit: (value) {
                        if (_formKey.currentState!.validate()) {
                          _formKey.currentState!.save();
                        }
                      },
                    ),
                    SizedBox(
                      height: 40,
                    ),
                    Container(
                      height: 50,
                      width: 200,
                      child: defaultFloatButton(
                        text: 'Submit',
                        function: () {
                          if (_formKey.currentState!.validate()) {
                            // AppCubit.get(context).insertUserData(
                            //   userName: nameCardController.text,
                            //   cardNumber: cardNumberController.text,
                            //   cardExpiry: cardExpiryController.text,
                            //   amount: cardAmountController.text,
                            // );
                            AppCubit.get(context).insertToDatabase(
                              userName: nameCardController.text,
                              cardNumber: cardNumberController.text,
                              cardExpiry: cardExpiryController.text,
                              totalAmount: cardAmountController.text,
                            );
                            navigateAndFinish(context,HomeScreen());
                          }
                        },
                        context: context,
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
