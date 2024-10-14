import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class ProductDetailPage extends StatelessWidget {
  final Map<String, dynamic> product;

  const ProductDetailPage({required this.product});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        title: Text(
          product['name'],
          style: GoogleFonts.dmSans(
            fontSize: 20,
            color: Colors.white,
            fontWeight: FontWeight.w500
          ),
        ),
        centerTitle: true,
        toolbarHeight: 80,
        backgroundColor: const Color.fromARGB(255, 3, 55, 56),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Center(
                child: Image.asset(
                  product['image'],
                  height: 300,
                  fit: BoxFit.cover,
                ),
              ),
              const SizedBox(height: 20),
              Text(
                product['name'],
                style: GoogleFonts.dmSans(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    '\₹${product['price']}',
                    style: GoogleFonts.roboto(
                      fontSize: 24,
                      color: Colors.black,
                      fontWeight: FontWeight.bold
                    ),
                  ),
        
                  const SizedBox(width: 30,),
                  Container(
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(8),
                  color: const Color.fromARGB(255, 222, 242, 233)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20,vertical: 10),
                  child: Text(
                    'Discount: ${product['discount']}',
                    style: GoogleFonts.dmSans(
                      fontSize: 14,
                      color: const Color.fromARGB(255, 2, 105, 107),
                    ),
                  ),
                ),
              ),
                ],
              ),
             
              const SizedBox(height: 20),
        
               Container(    
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 3, 55, 56),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 15,horizontal: 30),
                  child: Text(
                    "Add To Cart",
                    style: GoogleFonts.poppins(
                      fontSize: 18,
                      fontWeight: FontWeight.w600,
                      color: Colors.white
                    ),
                  ),
                )
              ),
              const SizedBox(height: 20,),
              Container(
                height: 100,
                width: 100,
                
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 241, 237, 237),
                  borderRadius: BorderRadius.circular(8)
                ),
                child: Image.asset(
                  "assets/quality.png",
                  color: Colors.black
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}