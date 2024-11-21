import 'package:animation_daily_task/view/hero_anim_page2.dart';
import 'package:flutter/material.dart';

class HeroAnimationPractice extends StatefulWidget {
  const HeroAnimationPractice({super.key});

  @override
  State<HeroAnimationPractice> createState() => _HeroAnimationPracticeState();
}

class _HeroAnimationPracticeState extends State<HeroAnimationPractice> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(Icons.account_circle_sharp),
        title: const Text('Products'),
      ),
      body: ListView.builder(
        itemCount: products.length,
        itemBuilder: (context, index) {
          return Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              children: [
                GestureDetector(
                  onTap: () {
                    setState(() {
                      selectedIndex = index;
                    });
                    Navigator.of(context).push(
                      MaterialPageRoute(
                        builder: (context) => const HeroAnimPage2(),
                      ),
                    );
                  },
                  child: Hero(
                    tag: index,
                    child: Image.network(
                      products[index]['img'],
                      height: 100,
                      width: 100,
                    ),
                  ),
                ),
                const SizedBox(
                  width: 15,
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      products[index]['name'],
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    Text(
                      'Price: ${products[index]['price']}',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
              ],
            ),
          );
        },
      ),
    );
  }
}

int selectedIndex = 0;

List<Map<String, dynamic>> products = [
  {
    'img':
        'https://www.titan.co.in/dw/image/v2/BKDD_PRD/on/demandware.static/-/Sites-titan-master-catalog/default/dw34d84041/images/Titan/Catalog/1698KM02_1.jpg?sw=800&sh=800',
    'name': 'Titan Watch',
    'price': '\$2000',
  },
  {
    'name': 'Mac Laptop',
    'img':
        'https://saudewala.in/cdn/shop/collections/Laptop.jpg?v=1682921339&width=1296',
    'price': '\$850',
  },
  {
    'name': 'I Phone 14',
    'img':
        'https://m.media-amazon.com/images/I/61bK6PMOC3L._AC_UF1000,1000_QL80_.jpg',
    'price': '\$900',
  },
  {
    'name': 'MT 15',
    'img':
        'https://i.pinimg.com/474x/cf/02/ae/cf02ae566039462b832b9f11f71ca172.jpg',
    'price': '\$1500',
  },
  {
    'name': 'Television',
    'img':
        'https://static.digit.in/product/62fbd1bbab2478964564641957db61ce84794b94.jpeg',
    'price': '\$600',
  },
  {
    'name': 'Omni Van',
    'img':
        'https://www.carfitexperts.com/car-models/wp-content/uploads/2019/01/van-omni-1.jpg',
    'price': '\$2000',
  },
];
