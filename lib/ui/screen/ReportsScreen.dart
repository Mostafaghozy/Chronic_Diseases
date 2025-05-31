import 'package:chronic_diseases/core/utils/colors.dart';
import 'package:chronic_diseases/ui/Widgets/Auth&Onboarding/Button_widget.dart';
import 'package:chronic_diseases/ui/Widgets/my_bottom_nav_bar.dart';
import 'package:flutter/material.dart';

class ReportsScreen extends StatelessWidget {
  const ReportsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        centerTitle: true,
        title: const Text(
          'My Reports',
          style: TextStyle(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.bold,
            fontFamily: "Nunito",
          ),
        ),
      ),
      body: SafeArea(
        child: Column(
          children: [
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Text(
                      'Recent Reports',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        fontFamily: "Nunito",
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 12),
                    // Search Bar
                    Container(
                      height: 44,
                      decoration: BoxDecoration(
                        color: const Color(0xFFF6F6F6),
                        borderRadius: BorderRadius.circular(12),
                      ),
                      child: Row(
                        children: [
                          const SizedBox(width: 12),
                          Expanded(
                            child: TextField(
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: 'Diabetes|',
                                hintStyle: TextStyle(
                                  color: Colors.black,
                                  fontFamily: "Nunito",
                                ),
                              ),
                            ),
                          ),
                          IconButton(
                            icon: const Icon(Icons.search, color: Colors.grey),
                            onPressed: () {},
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Risk Card
                    Container(
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 238, 238),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05)),
                        ],
                      ),
                      child: Row(
                        children: [
                          // Circular Progress
                          SizedBox(
                            width: 60,
                            height: 60,
                            child: Stack(
                              children: [
                                SizedBox(
                                  width: 60,
                                  height: 60,
                                  child: CircularProgressIndicator(
                                    value: 0.786,
                                    strokeWidth: 6,
                                    backgroundColor: Colors.grey[200],
                                    valueColor:
                                        const AlwaysStoppedAnimation<Color>(
                                          Color(0xFFFF5722),
                                        ),
                                  ),
                                ),
                                const Center(
                                  child: Text(
                                    '78.6%',
                                    style: TextStyle(
                                      fontSize: 13,
                                      fontWeight: FontWeight.bold,
                                      color: Color(0xFFFF5722),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          const SizedBox(width: 16),
                          const Expanded(
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Severe Risk 50-100%',
                                  style: TextStyle(
                                    fontSize: 15,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                Text(
                                  'Seek Medical Help ASAP',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontWeight: FontWeight.w500,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 16),
                    // Report Details
                    Container(
                      height: 250,
                      width: 380,
                      padding: const EdgeInsets.all(16),
                      decoration: BoxDecoration(
                        color: const Color.fromARGB(255, 240, 238, 238),
                        borderRadius: BorderRadius.circular(24),
                        boxShadow: [
                          BoxShadow(color: Colors.black.withOpacity(0.05)),
                        ],
                      ),
                      child: const Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Report Title: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(
                                  text: 'Diabetes check',
                                  style: TextStyle(
                                    fontSize: 14,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Date & Time: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(
                                  text: 'Feb 20, 2025 | 10:15 AM',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Risk Level Indicator: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(
                                  text: 'Severe',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                          ),
                          SizedBox(height: 6),
                          Text.rich(
                            TextSpan(
                              children: [
                                TextSpan(
                                  text: 'Summary: ',
                                  style: TextStyle(
                                    fontWeight: FontWeight.bold,
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                                TextSpan(
                                  text:
                                      'Your symptoms indicate a potential risk of diabetes. Consider monitoring your sugar levels.',
                                  style: TextStyle(
                                    fontSize: 13,
                                    color: Colors.black,
                                    fontFamily: "Nunito",
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            // Bottom Buttons
            Padding(
              padding: const EdgeInsets.all(20),
              child: Row(
                children: [
                  Button(
                    text: "Download PDF",
                    height: 50,
                    width: size.width * 0.65,

                    fontSize: 16,
                    textColor: Colors.black,
                  ),
                  const SizedBox(width: 8),
                  Container(
                    height: 50,
                    width: 85,
                    decoration: BoxDecoration(
                      color: const Color(0xFFB5EF74),
                      borderRadius: BorderRadius.circular(24),
                    ),
                    child: IconButton(
                      icon: const Icon(Icons.open_in_new, color: Colors.black),
                      onPressed: () {},
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
