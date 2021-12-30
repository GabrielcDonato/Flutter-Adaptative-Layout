import 'package:flutter/material.dart';
import 'package:flutter_adaptive/break_points.dart';
import 'package:flutter_adaptive/resposive_widget.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Responsive',
      theme: ThemeData.dark(),
      home: const HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  List<Widget> _generateCards() {
    //formas de gerar a lista
    //no caso estou dizendo que vai ser uma lista de widgets
    // List<Widget> cards = [];
    // var cards = <Widget>[];
    return List<Widget>.generate(
      101,
      (index) => Card(
        color: Colors.primaries[index % Colors.primaries.length],
        child: SizedBox(
          height: 200,
          width: 200,
          child: Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const FlutterLogo(
                  size: 80,
                ),
                Text(
                  'Card $index',
                  style: const TextStyle(
                    fontSize: 24,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Responsive'),
        centerTitle: true,
      ),
      body: ResponsiveWidget(
        mobile: ListView(
          children: _generateCards(),
        ),
        tablet: GridView.count(
          crossAxisCount: 4,
          children: _generateCards(),
        ),
        desktop: GridView.count(
          crossAxisCount: 6,
          children: _generateCards(),
        ),
      ),
      // LayoutBuilder(builder: (context, dimensoes) {
      //   if (dimensoes.maxWidth < BreakPoints.mobile) {
      //     return ListView(
      //       children: _generateCards(),
      //     );
      //   }
      //   if (dimensoes.maxWidth > BreakPoints.mobile && dimensoes.maxWidth <= BreakPoints.tablet) {
      //     return GridView.count(
      //       crossAxisCount: 4,
      //       children: _generateCards(),
      //     );
      //   }
      //   if (dimensoes.maxWidth > BreakPoints.tablet && dimensoes.maxWidth <= BreakPoints.desktop) {
      //     return GridView.count(
      //       crossAxisCount: 6,
      //       children: _generateCards(),
      //     );
      //   }
      //   return Center(
      //     child: SizedBox(
      //       width: BreakPoints.desktop,
      //       child: GridView.count(
      //         crossAxisCount: 6,
      //         children: _generateCards(),
      //       ),
      //     ),
      //   );
      //   //retornando um Sizedbox/container  por causa do nullsafety: The body might complete normally, causing 'null' to be returned, but the return type is a potentially non-nullable type.
      //   // Try adding either a return or a throw statement at the end.
      // }),
    );
  }
}
