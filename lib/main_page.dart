import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'rental_car.dart';
import 'detail_page.dart';

class MainPage extends StatelessWidget {
  const MainPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Rental Mobil'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(10),
          itemCount: rentalCar.length,
          itemBuilder: (context, index) {
            final RentalCar car = rentalCar[index];
            return Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Card(
                  child: ListTile(
                    onTap: (){
                      Navigator.push(
                          context,
                          MaterialPageRoute(
                              builder: (context) => HalamanDetail(car: car)
                          )
                      );
                    },
                    title: Text(car.brand + ' ' + car.model),
                    leading: Image.network(
                      car.images[0],
                      fit: BoxFit.cover,
                      width: 200,
                      height: 100,
                    ),
                  ),
                ),
              ],
            );
          }
      ),
    );
  }
}