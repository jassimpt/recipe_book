import 'package:flutter/material.dart';
import 'package:recipe_book/colors/colors.dart';

class TotalCost extends StatelessWidget {
  const TotalCost({super.key});

  @override
  Widget build(BuildContext context) {
    List<Color> colors1 = [
      Color(0xFFe23e3e),
      Color(0xFFe86565),
      Color(0xFFee8b8b),
      Color(0xFFf3b2b2),
    ];

    List ingredients = ['Beef', 'Bread', 'Eggs', 'Onion'];
    List price = ['100rs', '50rs', '50rs', '30rs'];
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(15.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                IconButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  icon: Image.asset('assets/icons/Arrow-Left.png'),
                ),
                SizedBox(
                  height: 20,
                ),
                Text('Total cost',
                    style:
                        TextStyle(fontSize: 26, fontWeight: FontWeight.bold)),
                SizedBox(
                  height: 40,
                ),
                Image.asset('assets/images/chart.png'),
                SizedBox(
                  height: 30,
                ),
                ListView.builder(
                  itemCount: 4,
                  shrinkWrap: true,
                  itemBuilder: (context, index) {
                    return Column(
                      children: [
                        Container(
                          child: Row(
                            children: [
                              SizedBox(
                                width: 15,
                              ),
                              Container(
                                width: 50,
                                height: 50,
                                decoration: BoxDecoration(
                                    color: colors1[index],
                                    borderRadius:
                                        BorderRadius.all(Radius.circular(10))),
                              ),
                              SizedBox(
                                width: 20,
                              ),
                              Text(
                                ingredients[index],
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              SizedBox(
                                width: 190,
                              ),
                              Text(price[index],
                                  style: TextStyle(
                                      fontSize: 18,
                                      fontWeight: FontWeight.bold))
                            ],
                          ),
                          height: 70,
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                              color: boxgrey,
                              borderRadius:
                                  BorderRadius.all(Radius.circular(10))),
                        ),
                        SizedBox(
                          height: 15,
                        )
                      ],
                    );
                  },
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
