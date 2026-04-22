import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';

final router = GoRouter(
  initialLocation: "/",
  redirect: (context, state) {
    log('Redirector called : ${state.uri.queryParameters}');
    return null;
  },

  onException: (context, state, router) {
    log('That was exception');
    router.go('/');
  },
  routes: [
    GoRoute(
      path: "/",
      name: "home",
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Center(
                child: Text(
                  'Home Screen',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/about');
                },
                child: Text('Go About'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/search');
                },
                child: Text('Go Search'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: "/about",
      name: "about",
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Center(
                child: Text(
                  'About Screen ${state.uri.queryParameters}',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/');
                },
                child: Text('Go Home'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/search');
                },
                child: Text('Go Search'),
              ),
            ],
          ),
        );
      },
    ),
    GoRoute(
      path: "/search",
      name: "search",
      builder: (context, state) {
        return Scaffold(
          backgroundColor: Colors.white,
          body: Column(
            mainAxisAlignment: .center,
            crossAxisAlignment: .center,
            children: [
              Center(
                child: Text(
                  'Search Screen',
                  style: TextStyle(fontSize: 20, color: Colors.black),
                ),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/about');
                },
                child: Text('Go About'),
              ),
              SizedBox(height: 20),
              GestureDetector(
                onTap: () {
                  context.go('/');
                },
                child: Text('Go Home'),
              ),
            ],
          ),
        );
      },
    ),
  ],
);
