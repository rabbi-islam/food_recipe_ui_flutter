import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/models/recipe_model.dart';
import 'package:food_recipe/utils/colors.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  int selectedItem = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: recipeAppBackground,
      body: SafeArea(
        child: Column(
          children: [
            headersPart(),
            SizedBox(height: 30),
            searchSection(),
            SizedBox(height: 40),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                      "Popular Menus",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(fontSize: 14, fontWeight: FontWeight.w500, color: Colors.green),
                  )
                ],
              ),
            ),
            SizedBox(height: 20),

            popularMenuItems()
          ],
        ),
      ),
    );
  }

  SingleChildScrollView popularMenuItems() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  menuItems.length,
                  (index)=> Padding(
                    padding: EdgeInsets.only(left: 20),
                    child: GestureDetector(
                      onTap: (){
                        setState(() {
                        });
                        selectedItem=index;
                      },
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 15,vertical: 7),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(20),
                          gradient: LinearGradient(
                            colors: [
                              selectedItem==index?Colors.green:Colors.white,
                              selectedItem==index?Colors.greenAccent:Colors.white,
                            ]
                          )
                        ),
                        child: Text(
                            menuItems[index],
                          style: TextStyle(
                              color: selectedItem==index?Colors.white:Colors.black,
                            fontWeight: selectedItem==index?FontWeight.bold:FontWeight.w500
                          ),
                        ),
                      ),
                    ),
                  )
              ),
            ),
          );
  }

  Padding searchSection() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Container(
              decoration: BoxDecoration(
                color: searchBarColor,
                borderRadius: BorderRadius.circular(35)
              ),
              child: TextField(
                  decoration: InputDecoration(
                    border: InputBorder.none,
                    hint: Text("Search",style: TextStyle(color: Colors.black54),),
                    prefixIcon: Icon(Icons.search_rounded,color: Colors.black54,),
                    contentPadding: EdgeInsets.symmetric(vertical: 15),
                  ),
              ),
            ),
          );
  }

  Padding headersPart() {
    return Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                const Text.rich(
                  TextSpan(
                    children: [
                      TextSpan(
                        text: "Hello Rabbi\n",
                        style: TextStyle(fontSize: 16),
                      ),
                      TextSpan(
                        text: "What do you want to eat today?,",
                        style: TextStyle(fontSize: 13, color: Colors.black45),
                      ),
                    ],
                  ),
                ),
                Stack(
                  children: [
                    // Container(
                    //   padding: const EdgeInsets.all(1.2), // Border width
                    //   decoration: const BoxDecoration(
                    //     color: Colors.black38, // Border color
                    //     shape: BoxShape.circle,
                    //   ),
                    const CircleAvatar(
                      radius: 20,
                      backgroundImage: AssetImage('assets/images/businessman.png',),
                      backgroundColor: Colors.grey,
                    ),
                    Positioned(
                      right: 1,top: 1,
                        child: Container(
                          height: 8,
                          width: 8,
                          decoration: BoxDecoration(
                            color: Colors.green,
                            shape: BoxShape.circle,
                            border: Border.all(color: Colors.white)
                          ),
                        )
                    ),
                  ],
                ),
              ],
            ),
          );
  }
}
