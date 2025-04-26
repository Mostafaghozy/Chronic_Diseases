import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Done extends StatelessWidget {
  const Done({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 0,
        leading: IconButton(
          icon:
              const Icon(Icons.arrow_back_ios_new_rounded, color: Colors.black),
          onPressed: () {
            if (Navigator.canPop(context)) {
              Navigator.pop(context);
            }
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SvgPicture.asset("assets/icons/Done_ring_round_fill.svg"),
              SizedBox(
                height: 30,
              ),

              Text(
                'SIGN UP SUCCESSFUL!',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  fontFamily: 'Nunito-SemiBold.ttf',
                  color: Colors.black,
                ),
              ),
              SizedBox(height: 5), // مسافة بين العناصر

              // الرسالة التأكيدية
              Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text(
                  'Thank you for signing up! \nYour account has been successfully created',
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontSize: 16,
                    fontFamily: 'Nunito-SemiBold.ttf',
                    color: Colors.grey[400],
                  ),
                ),
              ),
              SizedBox(height: 30), // مسافة بين العناصر

              // زر "Enter to Mediva"
              ElevatedButton(
                onPressed: () {
                  // إضافة الوظيفة المطلوبة هنا
                  print('Enter to Mediva clicked');
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: Color(0xFFB5EF74), // لون الخلفية
                  padding: EdgeInsets.symmetric(horizontal: 50, vertical: 15),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(30), // زوايا دائرية
                  ),
                ),
                child: Text(
                  'Enter to Mediva',
                  style: TextStyle(
                    fontSize: 16,
                    color: Colors.black,
                    fontWeight: FontWeight.w600,
                    fontFamily: 'Nunito',
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
