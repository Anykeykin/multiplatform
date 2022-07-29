
import 'package:flutter/material.dart';

class PhoneView extends StatefulWidget{
  final List peoples;

  PhoneView({required this.peoples});
  @override
  State<PhoneView> createState() => _PhoneViewState();
}

class _PhoneViewState extends State<PhoneView> {

  void show(BuildContext ctx) {
    showModalBottomSheet(
        elevation: 10,
        backgroundColor: Colors.blueGrey,
        context: ctx,
        builder: (ctx) => Container(
          width: 300,
          height: 200,
          color: Colors.white54,
          alignment: Alignment.center,
          child: Padding(
            padding: EdgeInsets.all(15.0),
            child: Column(
                children: const [
                  ListTile(
                    title: Text('Посмотреть профиль',style: TextStyle(
                      fontSize: 20
                    ),
                    ),
                    leading: Icon(Icons.mobile_friendly),
                  ),
                  ListTile(
                    title:Text('Друзья',style: TextStyle(
                        fontSize: 20
                    )),
                    leading: Icon(Icons.person),
                  ),
                  ListTile(
                    title:Text('Репорт',style: TextStyle(
                        fontSize: 20
                    )),
                    leading: Icon(Icons.report),
                  ),
                ]
            ),
          )
        ));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Мобильное приложение'),
      ),
      body: ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: widget.peoples.length,
          itemBuilder: (BuildContext context, int index) {
            return Padding(
              padding: EdgeInsets.all(8.0),
              child: Container(
                color: Color(widget.peoples[index]['color']),
                child: ListTile(
                  onTap: () => show(context),
                  leading: const CircleAvatar(
                    backgroundImage: AssetImage('asset/eevee.png'),
                  ),
                  title: Text('${widget.peoples[index]['name']}'),
                  subtitle: Text('${widget.peoples[index]['email']}'),
                ),
              ),
            );
          }),
    );
  }
}