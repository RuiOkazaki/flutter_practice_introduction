import 'package:flutter/material.dart';
import 'package:flutter_practice_introduction/components/header.dart';

class AnimationWidget extends StatefulWidget {
  const AnimationWidget({super.key});

  @override
  State<AnimationWidget> createState() => _AnimationWidgetState();
}

class _AnimationWidgetState extends State<AnimationWidget> {
  bool _isAnimation = false;
  _click() {
    setState(() {
      _isAnimation = !_isAnimation;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: genHeader('animation widget'),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            AnimatedOpacity(
                opacity: _isAnimation ? 0.1 : 1,
                duration: const Duration(seconds: 3),
                child: Text(
                  '消える文字',
                  style: Theme.of(context).textTheme.headline4,
                )),
            AnimatedSize(
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: _isAnimation ? 50 : 200,
                height: _isAnimation ? 50 : 200,
                child: Container(color: Colors.purple),
              ),
            ),
            AnimatedAlign(
              alignment:
                  _isAnimation ? Alignment.topLeft : Alignment.bottomRight,
              duration: const Duration(seconds: 3),
              child: SizedBox(
                width: 50,
                height: 50,
                child: Container(color: Colors.green),
              ),
            ),
            AnimatedContainer(
                duration: const Duration(seconds: 3),
                width: _isAnimation ? 100 : 50,
                height: _isAnimation ? 50 : 100,
                padding: _isAnimation
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(30),
                margin: _isAnimation
                    ? const EdgeInsets.all(0)
                    : const EdgeInsets.all(30),
                transform:
                    _isAnimation ? Matrix4.skewX(0.0) : Matrix4.skewX(0.3),
                color: _isAnimation ? Colors.blue : Colors.grey),
            AnimatedSwitcher(
                duration: const Duration(seconds: 3),
                child: _isAnimation
                    ? const Text("なにもない")
                    : const Icon(Icons.favorite, color: Colors.pink))
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _click,
        child: const Icon(Icons.add),
      ),
    );
  }
}
