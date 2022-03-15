import 'package:bloc/bloc.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:sqflite/sqflite.dart';
import 'package:task1/layout/cubit/states.dart';

class AppCubit extends Cubit<AppStates> {
  AppCubit() : super(AppInitialState());

  static AppCubit get(context) => BlocProvider.of(context);
  Database? database;

  List<Map> userData = [];

  void createDatabase() {
    openDatabase('bankSystem.db', version: 1, onCreate: (database, version) {
      print('create database');
      database.execute(
          'CREATE TABLE userData(id INTEGER PRIMARY KEY, userName  TEXT, cardNumber VARCHAR, cardExpiry TEXT, totalAmount TEXT)');
      print('table created');
    }, onOpen: (database) {
      getUserData(database);
      print('database opened');
    }).then((value) {
      database = value;
      print(userData);
      emit(AppCreateDatabasesState());
    });
  }

  insertToDatabase({
    required String userName,
    required var cardNumber,
    required String cardExpiry,
    required String totalAmount,
  }) async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO userData(userName, cardNumber, cardExpiry, totalAmount) VALUES("$userName", "$cardNumber", "$cardExpiry", "$totalAmount")',
      )
          .then((value) {
        print('$value inserted successfully');
        emit(AppInsertAccountDetailsSuccessState());
        getUserData(database!);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }

  void getUserData(Database database) {
    userData = [];
    database.rawQuery('SELECT * FROM userData').then((value) {
      value.forEach((element) {
        userData.add(element);
      });
      print(userData);
      emit(AppGetDatabasesState());
    });
  }

  insertTransactionData() async {
    await database!.transaction((txn) {
      return txn
          .rawInsert(
        'INSERT INTO transactionsData(transactionId, userName, senderName, transactionAmount) VALUES(1, "mahmoud", "osama", "200.0")',
      )
          .then((value) {
        print('$value inserted successfully');
        print(value);
      }).catchError((error) {
        print('Error When Inserting New Record ${error.toString()}');
      });
    });
  }
}
