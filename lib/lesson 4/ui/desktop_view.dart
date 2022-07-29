import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';
import '../ui/phone_view.dart';

class DesktopView extends StatefulWidget {
  final List peoples;

  DesktopView({required this.peoples});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {

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
      body: Row(
        children: [
          Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: Column(
                  children: [
                    Container(
                      child: Text('Адаптивное приложение'),
                    ),
                  ],
                ),
              )),
          Expanded(
              flex: 8,
              child: GridView.builder(
                  gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                      maxCrossAxisExtent: 200,
                      childAspectRatio: 3 / 2,
                      crossAxisSpacing: 20,
                      mainAxisSpacing: 20),
                  padding: EdgeInsets.all(8),
                  itemCount: widget.peoples.length,
                  itemBuilder: (BuildContext context, int index) {
                    return GestureDetector(
                        // onTap: () {
                        //   // showPopover(
                        //   //   context: context,
                        //   //   transitionDuration: const Duration(milliseconds: 150),
                        //   //   bodyBuilder: (context) => ListPopover(),
                        //   //   onPop: () => print('Popover was popped!'),
                        //   //   direction: PopoverDirection.bottom,
                        //   //   width: 200,
                        //   //   height: 400,
                        //   //   arrowHeight: 15,
                        //   //   arrowWidth: 30,
                        //   // );
                        //
                        // },
                        onTap: () => show(context),
                        child: Container(
                          alignment: Alignment.center,
                          decoration: BoxDecoration(
                              color: Color(widget.peoples[index]['color']),
                              borderRadius: BorderRadius.circular(15)),
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              kIsWeb
                                  ? const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('asset/eevee.png'),
                                    )
                                  : const CircleAvatar(
                                      backgroundImage:
                                          AssetImage('asset/eevee.png')),
                              Text('${widget.peoples[index]['name']}'),
                              Text('${widget.peoples[index]['email']}'),
                            ],
                          ),
                        ));
                  })),
        ],
      ),
    );
  }
}

class ListPopover extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        width: 300,
        height: 200,
        color: Colors.white54,
        alignment: Alignment.center,
        child: Padding(
          padding: EdgeInsets.all(15.0),
          child: Column(children: const [
            ListTile(
              title: Text(
                'Посмотреть профиль',
                style: TextStyle(fontSize: 20),
              ),
              leading: Icon(Icons.mobile_friendly),
            ),
            ListTile(
              title: Text('Друзья', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.person),
            ),
            ListTile(
              title: Text('Репорт', style: TextStyle(fontSize: 20)),
              leading: Icon(Icons.report),
            ),
          ]),
        ));
  }
}
