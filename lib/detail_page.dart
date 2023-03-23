import 'package:flutter/material.dart';
import 'rental_car.dart';

class HalamanDetail extends StatefulWidget {
  final RentalCar car;
  const HalamanDetail({Key? key, required this.car}) : super(key: key);

  @override
  State<HalamanDetail> createState() => _HalamanDetailState();
}

class _HalamanDetailState extends State<HalamanDetail> {
  bool isTrue = true;
  bool isAvailable = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.car.brand + ' ' + widget.car.model),
      ),
      body: SingleChildScrollView(
        child: Container(
          child: Column(
            children: [
              Container(
                padding: EdgeInsets.all(4),
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height/3,
                child: ListView.builder(
                  scrollDirection: Axis.horizontal,
                  itemBuilder: (context, index) => Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 4),
                    child: Image.network(widget.car.images[index]),
                  ),
                  itemCount: 3,
                ),
              ),
              Container(
                child: Text(
                  widget.car.brand + ' ' + widget.car.model,
                  style: TextStyle(fontSize: 20),
                ),
                padding: EdgeInsets.all(4),
              ),
              Container(
                child: Text('Brand :      ' + widget.car.brand,),
                padding: EdgeInsets.all(4),
              ),
              Container(
                child: Text('Model :      ' + widget.car.model),
                padding: EdgeInsets.all(4),
              ),
              Container(
                child: Text('Tahun :      ' + widget.car.year.toString()),
                padding: EdgeInsets.all(4),
              ),
              Container(
                child: Text('Biaya Sewa : ' + widget.car.rentalPricePerDay),
                padding: EdgeInsets.all(4),
              ),
              SizedBox(
                width: 200,
                height: 100,
                child: Column(
                    children: [
                      Text('Status : '),
                      _cek(),
                    ]
                ),
              ),
              Text(widget.car.description),
            ],
          ),
        ),
      ),
    );
  }

  Widget _cek(){
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: (isTrue) ? Colors.green : Colors.red,
        ),
        onPressed: (){
          String teks = '';
          bool isAvailable = widget.car.available;
          if(isAvailable){
            setState(() {
              teks = 'Berhasil Dibeli!';
              Text('Tersedia');
            });
          } else {
            setState(() {
              teks = 'Gagal Dibeli!';
              Text('Tidak Tersedia');
            });
          }

          SnackBar snackBar = SnackBar(
            content: Text(teks),
          );

          ScaffoldMessenger.of(context).showSnackBar(snackBar);
        },
        child: Text('Beli'),
      ),
    );
  }
}