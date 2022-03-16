import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:task1/layout/cubit/cubit.dart';
import 'package:task1/screens/home/transfer_money_screen.dart';
import 'package:task1/shared/components/components.dart';
import 'package:task1/shared/components/constants.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    int currentIndex = 0;
    List data = ["Money Transfer", "Bank Withdraw", "Insights Tracking"];
    List<T> map<T>(List list, Function handler) {
      List<T> result = [];
      for (var i = 0; i < list.length; i++) {
        result.add(handler(i, list[i]));
      }

      return result;
    }

    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(
          top: 40,
          left: 10,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Container(
              child: Row(
                children: [
                  Container(
                    padding: EdgeInsets.only(left: 5),
                    height: 60,
                    width: 60,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        image: DecorationImage(
                          image: AssetImage('assets/images/user.jpg'),
                        )),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  Text(
                    'Mahmoud Osama Abdelaziz',
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 16,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: 30,
            ),
            AppCubit.get(context).userData.length == 0
                ? Center(child: CircularProgressIndicator())
                : Container(
                    height: 200,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      padding: EdgeInsets.only(left: 10, right: 6),
                      itemBuilder: (context, index) {
                        var userData = AppCubit.get(context).userData;
                        return buildCard(userData[index]);
                      },
                      itemCount: AppCubit.get(context).userData.length,
                    ),
                  ),
            SizedBox(
              height: 30,
            ),
            Padding(
              padding: const EdgeInsets.only(
                left: 10,
                right: 10,
              ),
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      "Operation",
                      style: Theme.of(context)
                          .textTheme
                          .subtitle2!
                          .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
                    ),
                    Row(
                      children: map<Widget>(data, (index, selected) {
                        return Container(
                          margin: const EdgeInsets.only(right: 3),
                          height: 9,
                          width: 9,
                          alignment: Alignment.centerLeft,
                          decoration: BoxDecoration(
                            shape: BoxShape.circle,
                            color: currentIndex == index
                                ? Colors.deepPurple
                                : Colors.grey[400],
                          ),
                        );
                      }),
                    ),
                  ]),
            ),
            SizedBox(
              height: 10,
            ),
            Container(
              height: 123,
              child: ListView.builder(
                itemCount: 3,
                scrollDirection: Axis.horizontal,
                padding: EdgeInsets.only(left: 16),
                itemBuilder: (context, index) => GestureDetector(
                  onTap: () {
                    setState(() {
                      currentIndex = index;
                      navigateTo(context, TransferMoneyScreen());
                    });
                  },
                  child: OperationCard(
                    operation: data[index],
                    selectedIcon: operationIcon[index],
                    unselectedIcon: operationIcon[index],
                    isSelected: currentIndex == index,
                  ),
                ),
              ),
            ),
            SizedBox(
              height: 30,
            ),
            Text(
              "  Transactions  History",
              style: Theme.of(context)
                  .textTheme
                  .subtitle2!
                  .copyWith(fontSize: 18, fontWeight: FontWeight.w700),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildCard(Map model) => Container(
        margin: EdgeInsets.only(right: 10),
        height: 200,
        width: 345,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(28), color: Colors.deepPurple),
        child: Stack(
          children: [
            Positioned(
                left: 10,
                child: Container(
                  height: 90,
                  width: 70,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                )),
            Positioned(
                right: 10,
                bottom: 15,
                child: Container(
                  height: 65,
                  width: 140,
                  decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(50)),
                )),
            Positioned(
              left: 29,
              top: 38,
              child: Text(
                'CARD NUMBER',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 29,
              top: 55,
              child: Text(
                model['cardNumber'],
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Positioned(
              right: 21,
              top: 30,
              child: Image.asset(
                'assets/images/MasterCard.jpg',
                width: 45,
                height: 45,
              ),
            ),
            Positioned(
              left: 29,
              bottom: 80,
              child: Text(
                'CARD HOLDRENAME',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 210,
              bottom: 80,
              child: Text(
                'Expiry Date',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 280,
              bottom: 80,
              child: Text(
                '${model['cardExpiry']}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 29,
              bottom: 60,
              child: Text(
                '${model['userName']}',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 29,
              bottom: 40,
              child: Text(
                'TOTAL BALANCE',
                style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w700,
                    color: Colors.white),
              ),
            ),
            Positioned(
              left: 50,
              bottom: 15,
              child: Text(
                '${model['totalAmount']}\$',
                style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.w400,
                    color: Colors.white),
              ),
            ),
          ],
        ),
      );
}

class OperationCard extends StatefulWidget {
  final String operation;
  final String selectedIcon;
  final String unselectedIcon;
  final bool isSelected;

  OperationCard({
    required this.operation,
    required this.selectedIcon,
    required this.unselectedIcon,
    required this.isSelected,
  });

  @override
  _OperationCardState createState() => _OperationCardState();
}

class _OperationCardState extends State<OperationCard> {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(right: 10, top: 10),
      height: 117,
      width: 117,
      decoration: BoxDecoration(
        boxShadow: [
          BoxShadow(
            color: Colors.white,
            blurRadius: 10,
            spreadRadius: 5,
            offset: Offset(8, 8),
          ),
        ],
        borderRadius: BorderRadius.circular(15),
        color: widget.isSelected ? Colors.deepPurple : Colors.white,
      ),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          SvgPicture.asset(
            widget.isSelected ? widget.selectedIcon : widget.unselectedIcon,
            fit: BoxFit.fill,
            width: 40,
            color: widget.isSelected ? Colors.white : Colors.grey,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              widget.operation,
              textAlign: TextAlign.center,
              style: Theme.of(context).textTheme.subtitle2!.copyWith(
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                    color: widget.isSelected ? Colors.white : Colors.grey[400],
                  ),
            ),
          ),
        ],
      ),
    );
  }
}
