import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:youtube_clone_bloc/application/youtube/youtube_bloc.dart';
import 'package:youtube_clone_bloc/presentations/youtube/listing_page.dart';

import 'locator.dart';


void main() {
  setupLocator();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'YouTube Clone Bloc',
      theme: ThemeData(
        primarySwatch: Colors.red,
      ),
      home: BlocProvider(
        create: (context) => locator<YouTubeBloc>()..add(const YouTubeEvent.fetch()),
        child: const ListingPage(),
      ),
    );
  }
}

