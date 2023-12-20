import 'package:flutter/material.dart';

import 'models/select_option_model.dart';

class SelectOption extends StatefulWidget {
  const SelectOption({Key? key}) : super(key: key);

  @override
  State<SelectOption> createState() => _SelectOptionState();
}

class _SelectOptionState extends State<SelectOption> {
  @override
  Widget build(BuildContext context) {
    return  GridView.builder(
      gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
        maxCrossAxisExtent: 220,
        childAspectRatio: 3 / 2,
        crossAxisSpacing: 10,
        mainAxisSpacing: 20,
      ),
      itemCount: selectOptions.length,
      itemBuilder: (BuildContext context, index) {
        return GestureDetector(
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => selectOptions[index].route,
              ),
            );
          },
          child: Container(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        selectOptions[index].text,
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),

                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(32),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withOpacity(0.2),
                          spreadRadius: -10,
                          blurRadius: 14,
                          offset: Offset(6, 25),
                        ),
                      ],
                    ),
                    child: Image.asset(
                      selectOptions[index].image,
                      height: 50,
                      width: 50,
                    ),
                  ),
                ],
              ),
            ),
            decoration: BoxDecoration(
                border: Border.all(),
                borderRadius: BorderRadius.circular(10),
                color: Colors.red[400]
            ),
          ),
        );
      },
    );
  }
}
