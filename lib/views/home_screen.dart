import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:food_recipe/models/category_recipe.dart';
import 'package:food_recipe/models/recipe_model.dart';
import 'package:food_recipe/utils/colors.dart';
import 'package:iconsax_flutter/iconsax_flutter.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int selectedItem = 0;
  int selectedBottomBarItem = 0;
  int selectedPage = 0;
  List<IconData> icons = [
    Iconsax.home_1,
    Icons.bar_chart_rounded,
    Iconsax.heart,
    Icons.person_outline_rounded,
  ];

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
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            popularMenuItemsChip(),
            SizedBox(height: 20),
            popularMenuItems(context),
            SizedBox(height: 20),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    "Categories",
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.w500),
                  ),
                  Text(
                    "See All",
                    style: TextStyle(
                      fontSize: 14,
                      fontWeight: FontWeight.w500,
                      color: Colors.green,
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(height: 20),
            categoryList(),
            SizedBox(height: 10),
            cheifSection()
          ],
        ),
      ),
      bottomSheet: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.black12,
              spreadRadius: 1
            )
          ]
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: List.generate(
              icons.length,
              (index)=> GestureDetector(
                onTap: (){
                  selectedBottomBarItem = index;
                  setState(() {

                  });
                },
                child: SizedBox(
                  width: 40,
                  height: 40,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Icon(
                        icons[index],
                        color: index==selectedBottomBarItem?Colors.green:Colors.grey,
                        size: 32,
                      ),
                      index == selectedBottomBarItem?
                          Container(
                            height: 3,
                            width: 34,
                            decoration: BoxDecoration(
                              color: Colors.green,
                              borderRadius: BorderRadius.circular(10)
                            ),
                          ):SizedBox()
                    ],
                  ),
                ),
              )
              )
          ),
        ),
      );
  }

  Padding cheifSection() {
    return Padding(
              padding: EdgeInsets.all(40),
            child: Row(
              children: [
                const CircleAvatar(
                  radius: 20,
                  backgroundImage: AssetImage('assets/images/businessman.png'),
                  backgroundColor: Colors.grey,
                ),
                SizedBox(width: 20,),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text("Cheif Mr. Donald Trump.",
                      style: TextStyle(
                        color: Colors.black,
                        fontSize: 14,
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text("Thai Food Expert",
                      style: TextStyle(
                          color: Colors.black45,
                          fontSize: 14,
                          fontWeight: FontWeight.bold
                      ),)
                  ],
                )
              ],
            ),
          );
  }

  SingleChildScrollView categoryList() {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(
                  recipeCategory.length,
                  (index)=>Padding(
                      padding: index == 0 ? EdgeInsets.only(left: 20, right: 20):EdgeInsets.only(right: 20),
                    child: Column(
                      children: [
                        CircleAvatar(
                          radius: 33,
                          backgroundColor: recipeCategory[index].color,
                          child: Image.asset(
                            recipeCategory[index].image,
                            height: 40, width: 40,
                          ),
                        ),
                        SizedBox(height: 5,),
                        Text(
                            recipeCategory[index].name,
                          style: TextStyle(
                            fontSize: 12,
                            color: Colors.black,
                            fontWeight: FontWeight.w500
                          ),
                        )
                      ],
                    ),
                  )
              )
            ),
          );
  }

  SingleChildScrollView popularMenuItems(BuildContext context) {
    return SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            child: Row(
              children: List.generate(recipeItems.length, (index) {
                final recipe = recipeItems[index];
                return Padding(
                  padding: index == 0
                      ? EdgeInsets.only(left: 20, right: 10)
                      : EdgeInsets.only(right: 10),
                  child: GestureDetector(
                    onTap: () {},
                    child: Container(
                      height: 260,
                      width: MediaQuery.of(context).size.width / 2.45,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        image: DecorationImage(
                          image: AssetImage(recipe.image),
                          fit: BoxFit.cover,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Container(
                            padding: EdgeInsets.all(5),
                            margin: EdgeInsets.all(3),
                            decoration: BoxDecoration(
                              shape: BoxShape.circle,
                              color: recipe.fav ? Colors.red : Colors.black45,
                            ),
                            child: Icon(
                              Iconsax.heart,
                              color: Colors.white,
                              size: 18,
                            ),
                          ),
                          Container(
                            padding: EdgeInsets.all(10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: Colors.black45,
                            ),
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Row(
                                  children: [
                                    Expanded(
                                      child: Text(
                                        recipe.name,
                                        maxLines: 1,
                                        style: const TextStyle(
                                          fontSize: 16,
                                          height: 0,
                                          color: Colors.white,
                                          fontWeight: FontWeight.w500,
                                        ),
                                      ),
                                    ),
                                    Row(
                                      children: [
                                        Icon(
                                          Icons.star,
                                          color: Colors.amberAccent,
                                          size: 18,
                                        ),
                                        Text(
                                          '${recipe.rate}',
                                          style: TextStyle(
                                            color: Colors.white,
                                            height: 0,
                                          ),
                                        ),
                                      ],
                                    ),
                                  ],
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '1 Bowl (${recipe.weight}g)',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    height: 0,
                                    fontSize: 13,
                                  ),
                                ),
                                SizedBox(height: 3),
                                Text(
                                  '${recipe.calorie} Kal | 20% AKL',
                                  style: TextStyle(
                                    color: Colors.white70,
                                    height: 0,
                                    fontSize: 13,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              }),
            ),
          );
  }

  SingleChildScrollView popularMenuItemsChip() {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: List.generate(
          menuItems.length,
          (index) => Padding(
            padding: EdgeInsets.only(left: 20),
            child: GestureDetector(
              onTap: () {
                setState(() {});
                selectedItem = index;
              },
              child: Container(
                padding: EdgeInsets.symmetric(horizontal: 15, vertical: 7),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(20),
                  gradient: LinearGradient(
                    colors: [
                      selectedItem == index ? Colors.green : Colors.white,
                      selectedItem == index ? Colors.greenAccent : Colors.white,
                    ],
                  ),
                ),
                child: Text(
                  menuItems[index],
                  style: TextStyle(
                    color: selectedItem == index ? Colors.white : Colors.black,
                    fontWeight: selectedItem == index
                        ? FontWeight.bold
                        : FontWeight.w500,
                  ),
                ),
              ),
            ),
          ),
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
          borderRadius: BorderRadius.circular(35),
        ),
        child: TextField(
          decoration: InputDecoration(
            border: InputBorder.none,
            hint: Text(
              "Search your dish..",
              style: TextStyle(color: Colors.black54),
            ),
            prefixIcon: Icon(Iconsax.search_normal),
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
                TextSpan(text: "Hello Rabbi\n", style: TextStyle(fontSize: 16)),
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
                backgroundImage: AssetImage('assets/images/businessman.png'),
                backgroundColor: Colors.grey,
              ),
              Positioned(
                right: 1,
                top: 1,
                child: Container(
                  height: 8,
                  width: 8,
                  decoration: BoxDecoration(
                    color: Colors.green,
                    shape: BoxShape.circle,
                    border: Border.all(color: Colors.white),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
