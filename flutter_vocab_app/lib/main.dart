import 'dart:math';

import 'package:flutter/material.dart';

void main() {
  runApp(const VocabularyApp());
}

class VocabularyApp extends StatelessWidget {
  const VocabularyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '被动学单词',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.indigo),
        useMaterial3: true,
      ),
      home: const RandomWordHomePage(),
    );
  }
}

class RandomWordHomePage extends StatefulWidget {
  const RandomWordHomePage({super.key});

  @override
  State<RandomWordHomePage> createState() => _RandomWordHomePageState();
}

class _RandomWordHomePageState extends State<RandomWordHomePage> {
  static final _random = Random();
  static const _words = <String>[
    'serendipity',
    'ephemeral',
    'mellifluous',
    'luminous',
    'euphoria',
    'sonder',
    'lilt',
    'zenith',
    'ineffable',
    'petrichor',
    'halcyon',
    'eloquence',
    'resilience',
    'quintessence',
    'reverie',
    'luminescence',
    'whimsy',
    'ethereal',
    'sonorous',
  ];

  late String _currentWord;

  @override
  void initState() {
    super.initState();
    _currentWord = _pickRandomWord();
  }

  String _pickRandomWord() {
    return _words[_random.nextInt(_words.length)];
  }

  void _refreshWord() {
    setState(() {
      _currentWord = _pickRandomWord();
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('随时随地学单词'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(
                _currentWord,
                textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.displaySmall?.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(height: 32),
              ElevatedButton(
                onPressed: _refreshWord,
                child: const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 24, vertical: 12),
                  child: Text(
                    '换一个',
                    style: TextStyle(fontSize: 18),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
