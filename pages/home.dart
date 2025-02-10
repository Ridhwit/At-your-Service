import 'package:at_your_service/pages/book_page.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  const Home({super.key});

  @override
  State<Home> createState() => _HomeState();
}

class _HomeState extends State<Home> {
  @override
  Widget build(BuildContext context){
    return Scaffold(
      body:Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
        Container(
          padding: const EdgeInsets.only(top: 50.0, left: 20.0),
          width: MediaQuery.of(context).size.width,
          decoration: const BoxDecoration(
            gradient: LinearGradient(colors: 
          [Color.fromARGB(255, 225, 232, 235),
          Color.fromARGB(255, 197, 227, 244),
          ], begin: Alignment.topRight, end: Alignment.bottomLeft)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Text(
                "Hello, Ridhwit",
                style: TextStyle(color: Colors.orange, 
                fontSize: 18.0, 
                fontWeight: FontWeight.bold),
              ),
            ],
          ),
          const Text(
                "What service do you need?",
                style: TextStyle(color: Colors.blue, 
                fontSize: 25.0, 
                fontWeight: FontWeight.bold),
              ),
              const SizedBox(
                height: 20.0,
              ),
              Container(
                padding: const EdgeInsets.only(left: 20.0),
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(color: Colors.white,borderRadius: BorderRadius.circular(10)),
                child: const TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hintText: "How can I help you?",
                    hintStyle: TextStyle(color: Colors.black45), suffixIcon: Icon(Icons.search, color: Colors.blueGrey)
                  ),
                ),
              ),
              const SizedBox(height: 20.0,),
              Row(children: [
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                      child: Image.asset("images/cleaning.png", height: 40, width: 40, fit: BoxFit.cover,)
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "Cleaning",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                      child: Image.asset("images/laundry.png", height: 40, width: 40, fit: BoxFit.cover,)
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "Laundry",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                      child: Image.asset("images/painting.png", height: 40, width: 40, fit: BoxFit.cover,)
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "Painting",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
                const SizedBox(width: 20.0,),
                Column(
                  children: [
                    Container(
                      padding: const EdgeInsets.all(10),
                      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(60)),
                      child: Image.asset("images/repairing.png", height: 40, width: 40, fit: BoxFit.cover,)
                    ),
                    const SizedBox(height: 5.0,),
                    const Text(
                      "Repairing",
                      style: TextStyle(
                        color: Colors.blue,
                        fontSize: 16.0,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                  ],
                ),
              ],
              ),
              const SizedBox(height: 20.0),
        ],
      ),
      ),
      const Padding(
        padding: EdgeInsets.only(left: 20.0, top: 20.0),
        child: Text(
            "Popular Services",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 22.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
      ),
      const SizedBox(height: 20.0,),
      Container(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 197, 227, 244), 
        borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: 
          Image.asset("images/girlc.png",height: 120, width: 90, fit: BoxFit.cover,),
          ),
          const SizedBox(width: 10.0,),
          Column(children: [
            const Row(children: [
              Icon(Icons.star, 
              color: Colors.orange,),
              SizedBox(width: 5.0,),
              Text(
            "4.5",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
            ],),
            const SizedBox(height: 5.0,),
            const Text(
            "Home Cleaning",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
            "by Safaiwala",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 94, 172, 202),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                                        "Rs 100/hour",
                                                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                          GestureDetector(
                            onTap: (){
                              Navigator.push(context, MaterialPageRoute(builder: (context)=>const BookPage()));
                            },
                            child: Container(
                            width: 100,
                            padding: const EdgeInsets.all(5),
                            decoration: BoxDecoration(
                              color: const Color.fromARGB(255, 11, 125, 170),
                              borderRadius: BorderRadius.circular(5),
                            ),
                            child: const Center(
                              child: Text(
                                          "Book Now",
                                                      style: TextStyle(
                              color: Colors.white,
                              fontSize: 16.0,
                              fontWeight: FontWeight.w500
                                                      ),
                                                    ),
                            ),
                                                    ),
                          )
                      ],
                      )

          ],
          )
        ],
        ),
        
      ),
      const SizedBox(height: 20.0,),
      Container(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 197, 227, 244), 
        borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: 
          Image.asset("images/girll.png",height: 120, width: 90, fit: BoxFit.cover,),
          ),
          const SizedBox(width: 10.0,),
          Column(children: [
            const Row(children: [
              Icon(Icons.star, 
              color: Colors.orange,),
              SizedBox(width: 5.0,),
              Text(
            "4.6",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
            ],),
            const SizedBox(height: 5.0,),
            const Text(
            "Laundry Wash",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
            "by QuickWash",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 94, 172, 202),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                                        "Rs 80/hour",
                                                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                          Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 11, 125, 170),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                                        "Book Now",
                                                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                          ),
                        )
                      ],
                      )

          ],
          )
        ],
        ),
        
      ),
      const SizedBox(height: 20.0,),
      Container(
        padding: const EdgeInsets.only(left: 20.0, top: 10.0, bottom: 10.0),
        margin: const EdgeInsets.only(left: 20.0, right: 20.0),
        width: MediaQuery.of(context).size.width,
        decoration: BoxDecoration(color: const Color.fromARGB(255, 197, 227, 244), 
        borderRadius: BorderRadius.circular(10)),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(10),
            child: 
          Image.asset("images/boyp.png",height: 120, width: 90, fit: BoxFit.cover,),
          ),
          const SizedBox(width: 10.0,),
          Column(children: [
            const Row(children: [
              Icon(Icons.star, 
              color: Colors.orange,),
              SizedBox(width: 5.0,),
              Text(
            "4.3",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
            ],),
            const SizedBox(height: 5.0,),
            const Text(
            "Painting",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 18.0,
                          fontWeight: FontWeight.bold
                        ),
                      ),
                      const Text(
            "by Color Splash",
                        style: TextStyle(
                          color: Colors.blue,
                          fontSize: 15.0,
                          fontWeight: FontWeight.w500
                        ),
                      ),
                      const SizedBox(height: 10.0,),
                      Row(
                        children: [
                        Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 94, 172, 202),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                                        "Rs 150/hour",
                                                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                          ),
                        ),
                        const SizedBox(width: 20.0,),
                          Container(
                          width: 100,
                          padding: const EdgeInsets.all(5),
                          decoration: BoxDecoration(
                            color: const Color.fromARGB(255, 11, 125, 170),
                            borderRadius: BorderRadius.circular(5),
                          ),
                          child: const Center(
                            child: Text(
                                        "Book Now",
                                                    style: TextStyle(
                            color: Colors.white,
                            fontSize: 16.0,
                            fontWeight: FontWeight.w500
                                                    ),
                                                  ),
                          ),
                        )
                      ],
                      )

          ],
          )
        ],
        ),
        
      ),
      
      ],
      ),
      ),
      );
  }
}