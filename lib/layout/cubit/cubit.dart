import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task1/layout/cubit/states.dart';
import 'package:task1/models/transaction_details.dart';
import 'package:task1/models/user_data_model.dart';


class AppCubit extends Cubit<AppStates> {

  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  Database ?database;

  void createDatabase() async {
    database = await openDatabase(
        'bankSystem.db',
        version: 1,
        onCreate: (database, version) {
          print('create database');
          database.execute(
              "CREATE TABLE userData(id INTEGER PRIMARY KEY, userName TEXT,cardNumber VARCHAR,cardExpiry TEXT,totalAmount DOUBLE)");
          print('table created');
          database.execute(
              "CREATE TABLE transactionsData(id INTEGER PRIMARY KEY,transactionId INTEGER,userName TEXT,senderName TEXT,transactionAmount DOUBLE)");
        }, onOpen: (database) {
      print('database opened');
    });
  }

  insertUserData() async {
    await database!.transaction((txn) {
      return txn.rawInsert(
        'INSERT INTO userData(userName, cardNumber, cardExpiry, totalAmount) VALUES("Mahmoud", "20000", "25/10", "200.0")',)
          .then((value) {
        print('$value inserted successfully');
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  insertTransactionData() async {
    await database!.transaction((txn) {
      return txn.rawInsert(
        'INSERT INTO transactionsData(transactionId, userName, senderName, transactionAmount) VALUES(1, "mahmoud", "osama", "200.0")',)
          .then((value) {
        print('$value inserted successfully');
        print(value);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

}