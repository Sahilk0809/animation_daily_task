import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    var height = MediaQuery.sizeOf(context).height;
    var width = MediaQuery.sizeOf(context).width;
    return Scaffold(
      appBar: AppBar(
        title: const Text('Puzzle'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Center(
              child: Wrap(
                children: List.generate(
                  name.length,
                  (index) {
                    if (restart == targetImage.length) {
                      for (int i = 0; i < targetImage.length; i++) {
                        targetImage[index] = false;
                      }
                    }
                    return DragTarget(
                      onAcceptWithDetails: (details) {
                        setState(() {
                          if (details.data == imagesTarget[index]) {
                            targetImage[index] = true;
                            restart += 1;
                          }
                        });
                      },
                      builder: (context, candidateData, rejectedData) {
                        return Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.symmetric(
                              horizontal: 5, vertical: 10),
                          height: height * 0.1,
                          width: width * 0.25,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: (targetImage[index])
                              ? Image.network(imagesTarget[index])
                              : Text(name[index]),
                        );
                      },
                    );
                  },
                ),
              ),
            ),
            Wrap(
              children: List.generate(
                images.length,
                (index) {
                  return Draggable(
                    data: images[index],
                    feedback: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      height: height * 0.1,
                      width: width * 0.25,
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                    child: Container(
                      margin: const EdgeInsets.symmetric(
                        horizontal: 5,
                        vertical: 10,
                      ),
                      height: height * 0.1,
                      width: width * 0.25,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: Image.network(
                        images[index],
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}

Future<void> gameRestart(BuildContext context) async {
  await Future.delayed(
    const Duration(seconds: 1),
    () {
      showDialog(
        context: context,
        builder: (context) => AlertDialog(
          title: const Text('Won'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.of(context).pop();
              },
              child: const Text(
                'OK',
                style: TextStyle(
                  color: Colors.black,
                ),
              ),
            ),
          ],
        ),
      );
    },
  );
}

List<String> name = [
  'Tiger',
  'Lion',
  'Apple',
  'Shin chan',
  'Dart Logo',
  'Honey',
  'Mango',
  'Flutter',
  'Bicycle',
];

int restart = 0;

List<String> imagesTarget = [
  'https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg',
  'https://cdn.britannica.com/29/150929-050-547070A1/lion-Kenya-Masai-Mara-National-Reserve.jpg',
  'https://hbkonline.in/pub/media/catalog/product/a/p/apple_fruit_powder3.jpg',
  'https://i.pinimg.com/736x/5d/6b/0b/5d6b0b3c98a493f2e90c9888c1dce9c7.jpg',
  'https://ih1.redbubble.net/image.1153489054.7327/fposter,small,wall_texture,product,750x1000.u4.jpg',
  'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Honey440-bb52330.jpg?quality=90&resize=440,400',
  'https://5.imimg.com/data5/SELLER/Default/2024/4/409093587/VC/OE/YX/163989684/yellow-mango.jpeg',
  'https://global.discourse-cdn.com/auth0/original/3X/e/c/ec121d8cfbeb56e6cb593e3eb98876890c73b37e.png',
  'https://img.tatacliq.com/images/i6/437Wx649H/MP000000007341831_437Wx649H_20200730015207.jpeg',
];

List<String> target = [
  'Flutter',
  'Bicycle',
  'Mango',
  'Apple',
  'Lion',
  'Shin chan',
  'Tiger',
  'Dart Logo',
  'Honey',
];

List<bool> targetImage = [
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
  false,
];

List<String> images = [
  'https://global.discourse-cdn.com/auth0/original/3X/e/c/ec121d8cfbeb56e6cb593e3eb98876890c73b37e.png',
  'https://img.tatacliq.com/images/i6/437Wx649H/MP000000007341831_437Wx649H_20200730015207.jpeg',
  'https://5.imimg.com/data5/SELLER/Default/2024/4/409093587/VC/OE/YX/163989684/yellow-mango.jpeg',
  'https://hbkonline.in/pub/media/catalog/product/a/p/apple_fruit_powder3.jpg',
  'https://cdn.britannica.com/29/150929-050-547070A1/lion-Kenya-Masai-Mara-National-Reserve.jpg',
  'https://i.pinimg.com/736x/5d/6b/0b/5d6b0b3c98a493f2e90c9888c1dce9c7.jpg',
  'https://files.worldwildlife.org/wwfcmsprod/images/Tiger_resting_Bandhavgarh_National_Park_India/hero_small/6aofsvaglm_Medium_WW226365.jpg',
  'https://ih1.redbubble.net/image.1153489054.7327/fposter,small,wall_texture,product,750x1000.u4.jpg',
  'https://images.immediate.co.uk/production/volatile/sites/30/2024/03/Honey440-bb52330.jpg?quality=90&resize=440,400',
];
