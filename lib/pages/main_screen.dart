import 'package:flutter/material.dart';

class MainScreen extends StatelessWidget {
  const MainScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          //backgroundColor: Colors.deepOrangeAccent,
          title: Text('Список дел',
            //style: TextStyle(color: Colors.white),
          ),
          centerTitle: true,
          actions: [
            IconButton(
              icon: Icon(Icons.person),
              onPressed: () {
                Navigator.pushNamed(context, '/auth');
                },
            ),
          ],
        ),
        body: Column(
          children: [
            Text('Main Screen', style: TextStyle(color: Colors.white),),
            ElevatedButton(
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/home');
                },
                child: Text('перейти далее', style: TextStyle(color: Colors.white),),
                style: ElevatedButton.styleFrom(
                    elevation: 2,
                    shadowColor: Colors.white,
                    backgroundColor: Colors.blue,
                ),
            ),
            ElevatedButton(
              onPressed: () {
                Navigator.pushReplacementNamed(context, '/products-list');
              },
              child: Text('Список товаров', style: TextStyle(color: Colors.white),),
              style: ElevatedButton.styleFrom(
                elevation: 2,
                shadowColor: Colors.white,
                backgroundColor: Colors.orange,
              ),
            )
          ],
        ),
    );
  }
}


