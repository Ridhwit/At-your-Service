import 'package:flutter/material.dart';

class BookPage extends StatefulWidget {
  const BookPage({super.key});

  @override
  State<BookPage> createState() => _BookPageState();
}

class _BookPageState extends State<BookPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        margin: const EdgeInsets.only(top:40.0, left: 20.0, right: 20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          GestureDetector(
            onTap: (){
              Navigator.pop(context);
            },
            child: Container(
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: Colors.blue,
                borderRadius: BorderRadius.circular(10)
              ),
              child: const Icon(
                Icons.arrow_back_ios_new_outlined,
                color: Colors.white,
              ),
            ),
          ),
          Container(
            padding: const EdgeInsets.only(left: 10.0, top: 10.0 ),
            width: MediaQuery.of(context).size.width,
            decoration: BoxDecoration(
              gradient: const LinearGradient(colors: 
          [Color.fromARGB(255, 225, 232, 235),
          Color.fromARGB(255, 197, 227, 244),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft),
          borderRadius: BorderRadius.circular(10)
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
              Row(
                children: [
                  const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        "Home Cleaning",
                        style: TextStyle(color: Colors.blue, 
                        fontSize: 25.0, 
                        fontWeight: FontWeight.bold),
                      ),
                      Text(
            "by Safaiwala",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(width: 50.0,),
                  Container(
                    padding: const EdgeInsets.all(6),
                    decoration: BoxDecoration(color: Colors.orange,
                    borderRadius: BorderRadius.circular(10)),
                    child: const Text(
                        "Rs.100/hr",
                        style: TextStyle(color: Colors.blue, 
                        fontSize: 20.0, 
                        fontWeight: FontWeight.bold),
                      ),
                  )
                ], 
              ),
              const SizedBox(height: 10.0,),
            Row(
              children: [
                ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset("images/girlc.jpg", height: 180, width: 120,
                  fit: BoxFit.cover),
                ),
                
              ],
            ),
            const SizedBox(height: 20.0,),

            ],
            ),
          ),
          const Text(
                        "We take pride in delivering top-notch cleaning solutions tailored to your needs. Our professional team ensures spotless spaces with deep cleaning, sanitization, and maintenance services for homes, offices, and commercial establishments. Using eco-friendly products and advanced equipment, we guarantee hygiene, safety, and customer satisfaction. Whether it's daily cleaning, deep cleaning, or specialized sanitation, Safaiwala is committed to making your environment cleaner and healthier.",
                        style: TextStyle(color: Colors.blue, 
                        fontSize: 16.0, 
                        fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 20.0),
                      Row(children: [
                        Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.alarm, color: Colors.black, size: 40.0,)
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                        const Text(
                          "10:00 AM",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                          ),
                      ],
                      ),
                      const SizedBox(height: 20.0),
                      Row(children: [
                        Material(
                          elevation: 3.0,
                          borderRadius: BorderRadius.circular(10),
                          child: Container(
                            padding: const EdgeInsets.all(10),
                        decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(10)),
                        child: const Icon(Icons.calendar_month, color: Colors.black, size: 40.0,)
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                        const Text(
                          "05-02-2025",
                          style: TextStyle(
                            color: Colors.blueAccent,
                            fontSize: 25.0,
                            fontWeight: FontWeight.bold),
                          ),
                      ],
                      ),
                      const SizedBox(height: 40.0,),
                      Container(
                        height: 60,
                        decoration: BoxDecoration(color: Colors.blue, borderRadius: BorderRadius.circular(10)),
                        width: MediaQuery.of(context).size.width,
                        child: const Center(
                          child: Text(
                            "Book now",
                            style: TextStyle(
                              color: Colors.white,
                              fontSize: 25.0,
                              fontWeight: FontWeight.bold),
                            ),
                        ),
                        ),
        ],),
      )
    );
  }
}