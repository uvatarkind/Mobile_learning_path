import 'package:flutter/material.dart';

class DetailScreen extends StatefulWidget {
  const DetailScreen({Key? key}) : super(key: key);

  @override
  State<DetailScreen> createState() => _DetailScreenState();
}

class _DetailScreenState extends State<DetailScreen> {
  List<int> selectedAddOns = [];
  
  
  final List<Map<String, dynamic>> ingredients = [
    {
      'name': 'Extra Cheese',
      'image': 'assets/cheese.png',  
      'price': 1.50,
    },
    {
      'name': 'Sause',
      'image': 'assets/tomato.png',   
      'price': 2.00,
    },
    {
      'name': 'Drink',
      'image': 'assets/pepsi.png',   
      'price': 1.25,
    },
  ];

  void toggleAddOn(int id) {
    setState(() {
      if (selectedAddOns.contains(id)) {
        selectedAddOns.remove(id);
      } else {
        selectedAddOns.add(id);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFF3B45AD),
      body: Column(
        children: [
          Expanded(
            flex: 5,
            child: Center(
              child: Image.asset(
                'assets/burger.png', 
                width: 300,
                height: 300,
                fit: BoxFit.contain,
              ),
            ),
          ),
          Expanded(
            flex: 6,
            child: Container(
              width: double.infinity,
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30),
                  topRight: Radius.circular(30),
                ),
              ),
              padding: const EdgeInsets.all(24),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Container(
                        padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 6),
                        decoration: BoxDecoration(
                          color: const Color(0xFF3B45AD),
                          borderRadius: BorderRadius.circular(20),
                        ),
                        child: const Text(
                          '4.8',
                          style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.bold,
                          ),
                        ),
                      ),
                      const Text(
                        '\$20',
                        style: TextStyle(
                          color: Color(0xFFF4B400),
                          fontSize: 22,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 12),
                  const Text(
                    'Beef Burger',
                    style: TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  const Text(
                    'Big juicy buger with Cheese,Lettuce,Onions, Tomato and special sauce!',
                    style: TextStyle(
                      fontSize: 14,
                      color: Colors.grey,
                    ),
                  ),
                  const SizedBox(height: 20),
                  const Text(
                    'Add Ons:',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 110,
                    child: ListView.builder(
                      scrollDirection: Axis.horizontal,
                      itemCount: ingredients.length,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.only(right: 12),
                          child: GestureDetector(
                            onTap: () => toggleAddOn(index),
                            child: Column(
                              children: [
                                Stack(
                                  children: [
                                    Container(
                                      width: 80,
                                      height: 80,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(12),
                                      ),
                                      child: ClipRRect(
                                        borderRadius: BorderRadius.circular(12),
                                        child: Image.asset(
                                          ingredients[index]['image'],
                                          fit: BoxFit.cover,
                                        ),
                                      ),
                                    ),
                                    Positioned(
                                      bottom: 4,
                                      right: 4,
                                      child: Container(
                                        padding: const EdgeInsets.all(2),
                                        decoration: BoxDecoration(
                                          color: selectedAddOns.contains(index)
                                              ? const Color(0xFF096724)
                                              : Colors.grey.shade300,
                                          shape: BoxShape.circle,
                                        ),
                                        child: Icon(
                                          selectedAddOns.contains(index) ? Icons.check : Icons.add,
                                          size: 16,
                                          color: selectedAddOns.contains(index)
                                              ? Colors.white
                                              : Colors.grey.shade700,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                const SizedBox(height: 4),
                                Text(
                                  '+\$${ingredients[index]['price'].toStringAsFixed(2)}',
                                  style: TextStyle(
                                    fontSize: 12,
                                    fontWeight: selectedAddOns.contains(index) 
                                        ? FontWeight.bold 
                                        : FontWeight.normal,
                                    color: selectedAddOns.contains(index)
                                        ? const Color(0xFF3B45AD)
                                        : Colors.grey.shade700,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        );
                      },
                    ),
                  ),
                  const Spacer(),
                  SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      onPressed: () {},
                      style: ElevatedButton.styleFrom(
                        backgroundColor: const Color(0xFF3B45AD),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(8),
                        ),
                      ),
                      child: const Text(
                        'Add to Cart',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

