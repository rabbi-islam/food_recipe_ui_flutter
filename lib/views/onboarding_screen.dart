import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:food_recipe/views/home_screen.dart';

class RecipeOnboardingScreen extends StatefulWidget{
  const RecipeOnboardingScreen({super.key});

  @override
  State<RecipeOnboardingScreen> createState() => _RecipeOnboardingScreenState();
}

class _RecipeOnboardingScreenState extends State<RecipeOnboardingScreen> {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.white,
      body: Column(
        children: [
          Container(
            height: size.height*0.625,
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [
                  Colors.grey.shade400,
                  Colors.grey.shade200,
                  Colors.white,
                ]
              ),
              image: const DecorationImage(
                  image: AssetImage('assets/images/background 1.png'),
                  fit: BoxFit.cover
              )
            ),
          ),
          SizedBox(height: 20),
          Container(
            height: size.height*0.325,
            width: size.width,
            color: Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20.0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                    const Text(
                        "Let's cook your own food and adjust your diet",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                            fontSize: 30, fontWeight: FontWeight.w500, color: Colors.black,height: 1.3
                        ),
                    ),
                  const Text(
                    "Don't be confused, complete your natural needs by choosing food here!",
                    textAlign: TextAlign.center,
                    style: TextStyle(
                        fontSize: 15, fontWeight: FontWeight.w500, color: Colors.black54,height: 1.8
                    ),
                  ),
                  GestureDetector(
                    onTap: (){
                      Navigator.pushReplacement(context, MaterialPageRoute(builder:(context)=> HomeScreen()));
                    },
                    child: Container(
                      height: 55,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        gradient: gradientColor
                      ),
                      child: Center(
                        child: Text(
                            "Get Started",
                            style: TextStyle(
                            fontSize: 18, fontWeight: FontWeight.w500, color: Colors.white
                        )
                        ),
                      ),
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),

    );
  }
}