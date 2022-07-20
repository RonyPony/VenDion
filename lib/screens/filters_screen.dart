import 'dart:convert';

import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_picker/Picker.dart';
import 'package:vendion/models/brands.dart';

import '../widgets/customPicker.dart';

class FiltersScreen extends StatefulWidget {
  static String routeName = "/filtersScreen";

  @override
  State<FiltersScreen> createState() => _StateFilterScreen();
}

class _StateFilterScreen extends State<FiltersScreen> {
  int _conditions = 0;

  String PickerData = "ronel";

  List<String> _carBrandsName = [];
  late Future<List<Brands>> brands;
  int selectedbrandId = 0;
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    brands = getBrands();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Color(0xffff5b00),
        title: Text("Filtros de busqueda"),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _buildCarConditions(),
            _buildBrandModelSelectors(context),
          ],
        ),
      ),
    );
  }

  _buildCarConditions() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        GestureDetector(
          onTap: () {
            setCondition(0);
          },
          child: Container(
            width: 119,
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "All",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffff5b00),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: _conditions == 0
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  height: _conditions == 0 ? 3 : 0,
                  child: Material(
                    color: Color(0xffff5b00),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setCondition(1);
          },
          child: Container(
            width: 119,
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "New",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffff5b00),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: _conditions == 1
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  height: _conditions == 1 ? 3 : 0,
                  child: Material(
                    color: Color(0xffff5b00),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ),
        GestureDetector(
          onTap: () {
            setCondition(2);
          },
          child: Container(
            width: 119,
            height: 120,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  width: double.infinity,
                  child: Text(
                    "Used",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      color: Color(0xffff5b00),
                      fontSize: 20,
                      fontFamily: "Lato",
                      fontWeight: _conditions == 2
                          ? FontWeight.w900
                          : FontWeight.normal,
                    ),
                  ),
                ),
                SizedBox(height: 7),
                SizedBox(
                  width: double.infinity,
                  height: _conditions == 2 ? 3 : 0,
                  child: Material(
                    color: Color(0xffff5b00),
                    borderRadius: BorderRadius.circular(1),
                  ),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }

  void setCondition(int i) {
    setState(() {
      _conditions = i;
    });
  }

  _buildBrandModelSelectors(BuildContext ct) {
    return FutureBuilder<List<Brands>>(
      future: brands,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator();
        }
        if (snapshot.hasError) {
          return Text("Error");
        }
        if (snapshot.hasData &&
            snapshot.connectionState == ConnectionState.done) {
          snapshot.data!.forEach(
            (element) {
              _carBrandsName.add(element.name!);
            },
          );
          return CustomPicker(
            placeHolder: "Selecciona:",
            options: _carBrandsName,
            onChange: (int x) async {
              if (kDebugMode) {
                selectedbrandId = x;

                // print("Selected ${brands[x]}");
              }
            },
          );
        }
        return Text("Error");
      },
    );
    
  }

  Future<List<Brands>> getBrands() async {
    List<Brands> marcas = [];
    try {
      var response = await Dio().get(
          'https://private-anon-d54d1424fc-carsapi1.apiary-mock.com/manufacturers');
      print(response);
      var list = response.data;
      marcas = list
          .map<Brands>((brand) => Brands(
              name: brand["name"],
              avgHorsepower: brand["avg_horsepower"],
              avgPrice: brand["avg_price"],
              imgUrl: brand["img_url"],
              maxCarId: brand["max_car_id"],
              numModels: brand["num_models"]))
          .toList();
      print(marcas);
      return marcas;
    } catch (e) {
      print(e);
      return marcas;
    }
    // _carBrandsName
  }
}
