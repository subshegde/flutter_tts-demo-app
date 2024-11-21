import 'package:flutter/material.dart';
import 'package:flutter_tts/flutter_tts.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});
  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {

  final FlutterTts flutterTts = FlutterTts();

  Future<void> speak(String text) async {
    await flutterTts.setLanguage("en-US");
    await flutterTts.setPitch(1); // 0.5 to 1.5
    await flutterTts.speak(text);
  }

  final List<Map<String, String>> items = [
    {'name': 'Apple', 'image': 'assets/images/a.png'},
    {'name': 'Ball', 'image': 'assets/images/b.png'},
    {'name': 'Cat', 'image': 'assets/images/c.png'},
    {'name': 'Dog', 'image': 'assets/images/d.png'},
    {'name': 'Elephant', 'image': 'assets/images/e.png'},
    {'name': 'Fish', 'image': 'assets/images/f.png'},
    {'name': 'Guitar', 'image': 'assets/images/g.png'},
    {'name': 'House', 'image': 'assets/images/h.png'},
    {'name': 'Ice Cream', 'image': 'assets/images/i.png'},
    {'name': 'Joker', 'image': 'assets/images/j.png'},
    {'name': 'Kite', 'image': 'assets/images/k.png'},
    {'name': 'Lion', 'image': 'assets/images/l.png'},
    {'name': 'Monkey', 'image': 'assets/images/m.png'},
    {'name': 'Nose', 'image': 'assets/images/n.png'},
    {'name': 'Octopus', 'image': 'assets/images/o.png'},
    {'name': 'Panda', 'image': 'assets/images/p.png'},
    {'name': 'Queen', 'image': 'assets/images/q.png'},
    {'name': 'Rabbit', 'image': 'assets/images/r.png'},
    {'name': 'Sun', 'image': 'assets/images/s.png'},
    {'name': 'Tiger', 'image': 'assets/images/t.png'},
    {'name': 'Umbrella', 'image': 'assets/images/u.png'},
    {'name': 'Van', 'image': 'assets/images/v.png'},
    {'name': 'Watermelon', 'image': 'assets/images/w.png'},
    {'name': 'Xylophone', 'image': 'assets/images/x.png'},
    {'name': 'Yak', 'image': 'assets/images/y.png'},
    {'name': 'Zebra', 'image': 'assets/images/z.png'},
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(120),
        child: AppBar(
          backgroundColor: Colors.blueAccent,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              bottomLeft: Radius.circular(40),
              bottomRight: Radius.circular(40),
            ),
          ),
          title: Text(
            widget.title,
            style: TextStyle(
              fontSize: 24,
              fontWeight: FontWeight.bold,
              letterSpacing: 1.5,
            ),
          ),
          centerTitle: true,
          flexibleSpace: Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                colors: [Colors.blue, Colors.purple],
                begin: Alignment.topLeft,
                end: Alignment.bottomRight,
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                crossAxisSpacing: 12,
                mainAxisSpacing: 12,
              ),
              itemCount: items.length,
              itemBuilder: (context, index) {
                final item = items[index];
                return GestureDetector(
                  onTap: (){
                    speak(item['name']!);
                  },
                  child: Card(
                    elevation: 8,
                    shadowColor: Colors.black.withOpacity(0.2),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(16),
                    ),
                    child: Container(
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.black.withOpacity(0.2),
                            spreadRadius: 1,
                            blurRadius: 8,
                          ),
                        ],
                        gradient: LinearGradient(
                          colors: [Colors.white, Colors.lightBlue.shade100],
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                        ),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          ClipRRect(
                            borderRadius: BorderRadius.circular(10),
                            child: Image.asset(
                              item['image']!,
                              width: 100,
                              height: 100,
                              fit: BoxFit.cover,
                            ),
                          ),
                          const SizedBox(height: 12),
                          Text(
                            item['name']!,
                            style: const TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                              color: Colors.black,
                              letterSpacing: 1.2,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Text(
                'Developed by @SSHegde.Visuals',
                style: TextStyle(
                  fontSize: 14,
                  color: const Color.fromARGB(255, 167, 167, 167).withOpacity(0.2),
                  fontStyle: FontStyle.italic,
                  letterSpacing: 1.2,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}