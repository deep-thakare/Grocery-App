import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:grocery_app/product_details_page.dart';

class ProductPage extends StatefulWidget {
  const ProductPage({super.key});

  @override
  State<ProductPage> createState() => _ProductPageState();
}

class _ProductPageState extends State<ProductPage> {

  TextEditingController searchController = TextEditingController();


  final List<Map<String, dynamic>> products = [
    {
      'image':
          'assets/Maggi.webp',
      'name': 'Maggi',
      'price': '30',
      'discount': '10%',
    },
    {
      'image':
          'assets/NesCoffe.webp',
      'name': 'Nescafe Coffee',
      'price': '120',
      'discount': '15%',
    },
    {
      'image':
          'assets/FortuneAtta.webp',
      'name': 'Fortune Atta',
      'price': '150',
      'discount': '5%',
    },
    {
      'image':
          'assets/FortuneOil.webp',
      'name': 'Fortune Oil',
      'price': '200',
      'discount': '20%',
    },
    {
      'image': 'assets/BritanniaNutri.jpg',
      'name': 'Britannia Nutri',
      'price': '30',
      'discount': '5%',
    },
    {
      'image':
          'assets/Capsicum.webp',
      'name': 'Green Capsicum 1kg',
      'price': '80',
      'discount': '20%',
    },
    {
      'image':
          'assets/TataSalt.webp',
      'name': 'Tata Salt',
      'price': '40',
      'discount': '5%',
    },

    {
      'image':
          'assets/AmulMilk.jpg',
      'name': 'Amul Milk 1L',
      'price': '70',
      'discount': '10%',
    },
    {
      'image':
          'assets/AmulCream.webp',
      'name': 'Amul Cream',
      'price': '130',
      'discount': '5%',
    },



  ];


  List<Map<String, dynamic>> filteredProducts = [];

  // Method to filter products
  void filterProducts(String query) {
    setState(() {
      filteredProducts = products.where((product) {
        return product['name'].toLowerCase().contains(query.toLowerCase());
      }).toList();
    });
  }

  @override
  Widget build(BuildContext context) {
     filteredProducts = searchController.text.isEmpty ? products : filteredProducts;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        automaticallyImplyLeading: false,
        leading: GestureDetector(
            onTap: () {
              Navigator.pop(context);
            },
            child: const Icon(
              Icons.arrow_back_ios_new_rounded,
              color: Colors.white,
            )),
        bottom: PreferredSize(
          preferredSize: const Size(30, 30),
          child: Column(
            children: [
              Padding(
                padding: const EdgeInsets.all(12),
                child: Row(
                  children: [
                    Expanded(
                      child: Container(
                        height: 50,
                        width: 320,
                        decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(8)),
                        child: TextField(
                          controller: searchController,
                           onChanged: (value) {
                            filterProducts(value); // Call filter logic on text change
                          },
                          decoration: InputDecoration(
                              prefixIcon: const Icon(Icons.search),
                              hintText: "Search Products...",
                              hintStyle: GoogleFonts.dmSans(color: Colors.grey),
                              border: const OutlineInputBorder(
                                  borderSide: BorderSide.none)),
                        ),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Container(
                      height: 50,
                      width: 50,
                      decoration: BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.circular(8)),
                      child: const Icon(Icons.filter_alt),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
        toolbarHeight: 90,
        centerTitle: true,
        backgroundColor: const Color.fromARGB(255, 3, 55, 56),
        title: Text(
          "All Products",
          style: GoogleFonts.dmSans(
              fontSize: 20, color: Colors.white, fontWeight: FontWeight.w500),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: GridView.builder(
          gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: MediaQuery.of(context).size.width < 600
                ? 2
                : 4, // Responsive grid
            crossAxisSpacing: 8,
            mainAxisSpacing: 8,
            childAspectRatio: 3 / 4, // Adjust for mobile/tablet ratio
          ),
          itemCount: filteredProducts.length,
          itemBuilder: (context, index) {
            final product = filteredProducts[index];
            return GestureDetector(
              onTap: () {
                Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => ProductDetailPage(
          product: product, // Pass the product details
        ),
      ),
    );
              },
              child: Padding(
                padding: const EdgeInsets.all(12),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      child: Expanded(
                        child: Stack(children: [
                          Container(
                            decoration: BoxDecoration(
                                border: Border.all(
                                    color: const Color.fromARGB(
                                        109, 158, 158, 158)),
                                borderRadius: BorderRadius.circular(12)),
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(12),
                              child: Image.asset(
                                product['image'],
                                // height: ,
                                fit: BoxFit.cover,
                                width: double.infinity,
                              ),
                            ),
                          ),
                          Row(
                            children: [
                              const SizedBox(
                                width: 10,
                              ),
                              Container(
                                height: 35,
                                width: 30,
                                // color: Colors.red,
                                decoration: const BoxDecoration(
                                    color: Color.fromARGB(255, 2, 79, 80),
                                    borderRadius: BorderRadius.only(
                                        bottomLeft: Radius.circular(4),
                                        bottomRight: Radius.circular(4))),
                                child: Column(
                                  children: [
                                    Text(
                                      '${product['discount']}',
                                      style: GoogleFonts.dmSans(
                                          fontSize: 12, color: Colors.white),
                                    ),
                                    Text(
                                      "OFF",
                                      style: GoogleFonts.dmSans(
                                          color: Colors.white, fontSize: 10),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ]),
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            product['name'],
                            style: GoogleFonts.dmSans(
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                          Text(
                            "Indian Store",
                            style: GoogleFonts.dmSans(
                                fontWeight: FontWeight.bold,
                                color: Colors.grey),
                          ),
                          Row(
                            children: [
                              Text('\₹${product['price']}',
                                  style: GoogleFonts.roboto(
                                      color: Colors.green,
                                      fontSize: 18,
                                      fontWeight: FontWeight.w600)),
                              const Spacer(),
                              GestureDetector(
                                onTap: () {},
                                child: Container(
                                  decoration: BoxDecoration(
                                      border: Border.all(
                                        color: const Color.fromARGB(255, 2, 105, 107),
                                      ),
                                      borderRadius: BorderRadius.circular(4)),
                                  child: const Padding(
                                    padding: EdgeInsets.symmetric(
                                        vertical: 3, horizontal: 10),
                                    child: Text(
                                      "ADD",
                                    ),
                                  ),
                                ),
                              )
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
