import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:popover/popover.dart';

class DesktopView extends StatefulWidget {
  final List peoples;

  DesktopView({required this.peoples});

  @override
  State<DesktopView> createState() => _DesktopViewState();
}

class _DesktopViewState extends State<DesktopView> {
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
                    onTap: (){
                      showPopover(
                        context: context,
                        transitionDuration: const Duration(milliseconds: 150),
                        bodyBuilder: (context) => ListItems(),
                        onPop: () => print('Popover was popped!'),
                        direction: PopoverDirection.bottom,
                        width: 200,
                        height: 400,
                        arrowHeight: 15,
                        arrowWidth: 30,
                      );
                      print('hello');
                    },
                    child: Container(
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                          color: Color(widget.peoples[index]['color']),
                          borderRadius: BorderRadius.circular(15)),
                      child:Column(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            kIsWeb
                                ? const CircleAvatar(
                                    backgroundImage: AssetImage('asset/eevee.png'),
                                  )
                                : const CircleAvatar(
                                    backgroundImage: AssetImage('asset/eevee.png')),
                            Text('${widget.peoples[index]['name']}'),
                            Text('${widget.peoples[index]['email']}'),
                          ],
                        ),
                      ));
                })
          ),
        ],
      ),
    );
  }
}

class ListItems extends StatelessWidget {
  const ListItems({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scrollbar(
      child: Padding(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: ListView(
          padding: const EdgeInsets.all(8),
          children: [
            InkWell(
              onTap: () {
                Navigator.of(context)
                  ..pop()
                  ..push(
                    MaterialPageRoute<SecondRoute>(
                      builder: (context) => SecondRoute(),
                    ),
                  );
              },
              child: Container(
                height: 50,
                color: Colors.amber[100],
                child: const Center(child: Text('Entry A')),
              ),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[200],
              child: const Center(child: Text('Entry B')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[300],
              child: const Center(child: Text('Entry C')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[400],
              child: const Center(child: Text('Entry D')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[500],
              child: const Center(child: Text('Entry E')),
            ),
            const Divider(),
            Container(
              height: 50,
              color: Colors.amber[600],
              child: const Center(child: Text('Entry F')),
            ),
          ],
        ),
      ),
    );
  }
}

class SecondRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Second Route'),
        automaticallyImplyLeading: false,
      ),
      body: Center(
        child: ElevatedButton(
          onPressed: () => Navigator.pop(context),
          child: const Text('Go back!'),
        ),
      ),
    );
  }
}