import 'package:flutter/material.dart';
import 'package:newyorktimes/resource/provider.dart';
import 'package:newyorktimes/ui/dashboard.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const NewYorkTimesApp());
}

class NewYorkTimesApp extends StatelessWidget {
  const NewYorkTimesApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ProviderClass()),
      ],
      child: const MaterialApp(
        home: HomeScreen(),
      ),
    );
  }
}
