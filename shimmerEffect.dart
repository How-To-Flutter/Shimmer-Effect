// ignore_for_file: file_names, prefer_const_constructors_in_immutables, prefer_const_constructors, unnecessary_string_interpolations, sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'listcall.dart';

class ShimmerEffect extends StatefulWidget {
  ShimmerEffect({Key? key}) : super(key: key);

  @override
  State<ShimmerEffect> createState() => _ShimmerEffectState();
}

class _ShimmerEffectState extends State<ShimmerEffect> {
  List<Listcall> cars = [
    Listcall('Nissan GT-R',
        'https://images.unsplash.com/photo-1624274099376-25d180b1dc43?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8NHx8Z3RyfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    Listcall('Toyota Supra',
        'https://images.unsplash.com/photo-1618205062886-3976f4bb8219?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MXx8c3VwcmF8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
    Listcall('Audi RS5',
        'https://images.unsplash.com/photo-1616422285623-13ff0162193c?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8N3x8YXVkaSUyMHJzNXxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    Listcall('BMW M3 Competition',
        'https://images.unsplash.com/photo-1608494873992-1ed1dd210fef?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8Ym13JTIwbTMlMjBjb21wZXRpdGlvbnxlbnwwfHwwfHw%3D&auto=format&fit=crop&w=500&q=60'),
    Listcall('Volkswagen Golf R',
        'https://images.unsplash.com/photo-1629538745516-503801987892?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTJ8fGdvbGYlMjByfGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60'),
    Listcall('Volkswagen Arteon R',
        'https://images.unsplash.com/photo-1655285286385-a389b2b3550a?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8MTF8fHZvbGtzd2FnZW4lMjBhcnRlb258ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
    Listcall('Mercedes C63 AMG',
        'https://images.unsplash.com/photo-1658396504541-5590f9a07353?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWVyY2VkZXMlMjBjNjMlMjBhbWd8ZW58MHx8MHx8&auto=format&fit=crop&w=500&q=60'),
  ];

  bool isLoading = true;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(seconds: 5), () {
      setState(() {
        isLoading = false;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: isLoading
          ? getShimmerLoading()
          : ListView.builder(
              itemCount: cars.length,
              itemBuilder: (context, index) => ListTile(
                    contentPadding:
                        EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                    title: Container(
                      width: 250,
                      height: 250,
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(16),
                          boxShadow: [
                            BoxShadow(
                                blurRadius: 8, color: Colors.grey.shade500)
                          ]),
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(16),
                        child: Image.network(
                          '${cars[index].image}',
                          fit: BoxFit.cover,
                        ),
                      ),
                    ),
                  )),
    );
  }

  Shimmer getShimmerLoading() {
    return Shimmer.fromColors(
        child: ListView.builder(
            itemCount: cars.length,
            itemBuilder: (context, index) => ListTile(
                  contentPadding:
                      EdgeInsets.symmetric(vertical: 15, horizontal: 15),
                  title: Container(
                    width: 250,
                    height: 250,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(blurRadius: 8, color: Colors.grey.shade500)
                        ]),
                  ),
                )),
        baseColor: Colors.grey[300]!,
        highlightColor: Colors.grey[100]!);
  }
}
