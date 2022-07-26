// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:search_job_ui/util/job_card.dart';
import 'package:search_job_ui/util/recent_job_card.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.grey[300],
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: 75,
          ),
          MenuWidget(),
          SizedBox(
            height: 25,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Discover a New Path',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          SearchWidget(),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'For you',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          SizedBox(
            height: 25,
          ),
          JobCardWidget(),
          SizedBox(
            height: 50,
          ),
          Padding(
            padding: const EdgeInsets.only(left: 25.0),
            child: Text(
              'Recently Added',
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 26,
              ),
            ),
          ),
          RecentJobCardWidget(),
        ],
      ),
    );
  }
}

class MenuWidget extends StatelessWidget {
  const MenuWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 25.0),
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.white),
          borderRadius: BorderRadius.circular(12),
          color: Colors.grey[200],
        ),
        height: 65,
        child: Image.asset(
          'images/menu.png',
          color: Colors.grey[800],
        ),
      ),
    );
  }
}

class SearchWidget extends StatelessWidget {
  const SearchWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0),
      child: Row(
        children: [
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                color: Colors.grey[200],
                border: Border.all(color: Colors.white),
                borderRadius: BorderRadius.circular(12),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10.0),
                    child: Container(
                      height: 30,
                      child: Image.asset(
                        'images/search.png',
                        color: Colors.grey[600],
                      ),
                    ),
                  ),
                  Expanded(
                    child: TextField(
                      decoration: InputDecoration(
                        border: InputBorder.none,
                        hintText: 'Search for a job...',
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Container(
            height: 50,
            padding: EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.grey[800],
              borderRadius: BorderRadius.circular(12),
            ),
            child: Image.asset(
              'images/pref.png',
              color: Colors.white,
            ),
          ),
        ],
      ),
    );
  }
}

class JobCardWidget extends StatelessWidget {
  JobCardWidget({Key? key}) : super(key: key);

  final List<List> jobsForYou = [
    ['Uber', 'UI Designer', 'images/uber.png', 45],
    ['Google', 'Product Dev', 'images/google.png', 80],
    ['Apple', 'Software Dev', 'images/apple.png', 75],
  ];
  @override
  Widget build(BuildContext context) {
    return Container(
      height: 160,
      child: ListView.builder(
        itemCount: jobsForYou.length,
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) {
          return JobCard(
            compantName: jobsForYou[index][0],
            jobTitle: jobsForYou[index][1],
            logoImagePath: jobsForYou[index][2],
            hourlyRate: jobsForYou[index][3],
          );
        },
      ),
    );
  }
}

class RecentJobCardWidget extends StatelessWidget {
  RecentJobCardWidget({Key? key}) : super(key: key);

  final List<List> recentJobs = [
    ['Nike', 'Web Designer', 'images/nike.png', 20],
    ['Google', 'Product Dev', 'images/google.png', 80],
    ['Apple', 'Software Dev', 'images/apple.png', 75],
  ];

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 25.0),
        child: ListView.builder(
          itemCount: recentJobs.length,
          itemBuilder: (context, index) {
            return RecentJobCard(
              compantName: recentJobs[index][0],
              jobTitle: recentJobs[index][1],
              logoImagePath: recentJobs[index][2],
              hourlyRate: recentJobs[index][3],
            );
          },
        ),
      ),
    );
  }
}
