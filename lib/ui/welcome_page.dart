import 'package:flutter/material.dart';
import 'package:weather_app/ui/models/city.dart';
import 'package:weather_app/ui/models/constants.dart';

class welcome extends StatefulWidget {
  const welcome({Key? key}) : super(key: key);

  @override
  State<welcome> createState() => _welcomeState();
}

class _welcomeState extends State<welcome> {
  @override
  Widget build(BuildContext context) {
    List<City> cities =
        City.citiesList.where((city) => city.isDefault == false).toList();
    List<City> selectedCities = City.getSelectedCities();
    Constants myConstant = Constants();
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: myConstant.secondaryColor,
          title: Text(selectedCities.length.toString() + ' Selected')),
      body: ListView.builder(
          itemCount: cities.length,
          itemBuilder: (BuildContext context, int index) {
            return Container(
              margin: const EdgeInsets.only(left: 10, top: 20, right: 10),
              padding: const EdgeInsets.symmetric(horizontal: 20),
              height: size.height * .08,
              width: size.width,
              decoration: BoxDecoration(
                border: cities[index].isSelected == true
                    ? Border.all(
                        color: myConstant.secondaryColor.withOpacity(.6),
                        width: 2,
                      )
                    : Border.all(color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(10),
                ),
                boxShadow: [
                  BoxShadow(
                    color: myConstant.primaryColor.withOpacity(.2),
                    spreadRadius: 5,
                    blurRadius: 7,
                    offset: const Offset(0, 3),
                  ),
                ],
              ),
              child: Row(
                children: [
                  GestureDetector(
                    onTap: () {
                      setState(() {
                        cities[index].isSelected = !cities[index].isSelected;
                      });
                    },
                    child: Image.asset(
                      cities[index].isSelected == true
                          ? 'assets/checked.png'
                          : 'assets/unchecked.png',
                      width: 30,
                    ),
                  ),
                  const SizedBox(
                    width: 10,
                  ),
                  Text(
                    cities[index].city,
                    style: TextStyle(
                      fontSize: 16,
                      color: cities[index].isSelected == true
                          ? myConstant.primaryColor
                          : Colors.black54,
                    ),
                  )
                ],
              ),
            );
          }),
      floatingActionButton: FloatingActionButton(
        backgroundColor: myConstant.secondaryColor,
        child: const Icon(Icons.pin_drop),
        onPressed: () {
          print(selectedCities.length);
        },
      ),
    );
  }
}
