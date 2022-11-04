import 'dart:math';

import 'package:flutter/material.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/theme/theme.dart';
import 'package:provider/provider.dart';
import 'package:wd_client/features/common/user_character/character.dart';
import '../../core/data/datasources/routes/routes.dart';

class UserProfile extends StatefulWidget {
  UserProfile({
    required this.navigationservice,
    required this.user,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationservice;
  final User user;

  @override
  State<UserProfile> createState() => _UserProfileState();
}

class _UserProfileState extends State<UserProfile> {
  @override
  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    double height = MediaQuery.of(context).size.height;
    return Scaffold(
        body: MultiProvider(
            providers: [
          ChangeNotifierProvider<User>.value(value: widget.user),
          ChangeNotifierProvider<UserStats>.value(value: widget.user.userStats),
          ChangeNotifierProvider<SkillStats>.value(value: widget.user.userStats.skillStats),
        ],
            child: Consumer3<User, UserStats, SkillStats>(builder: (_, user, userStats, skillStats, __) {
              return Container(
                child: Row(
                  children: [
                    Expanded(
                      child: SingleChildScrollView(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    width: min(height, width) / 2,
                                    height: min(height, width) / 2,
                                    color: Colors.amber,
                                    margin: const EdgeInsets.all(30),
                                    child: Container(
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context).appTheme.colors.blue,
                                      ),
                                      child: Row(
                                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                        children: [
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.start,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text(userStats.currentArmor),
                                                ),
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text(userStats.race),
                                                ),
                                              ],
                                            ),
                                          ),
                                          Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: [
                                              Character(),
                                            ],
                                          ),
                                          Expanded(
                                            child: Column(
                                              crossAxisAlignment: CrossAxisAlignment.end,
                                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text("${skillStats.strength}"),
                                                ),
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text("${skillStats.edurance}"),
                                                ),
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text("${skillStats.intelligence}"),
                                                ),
                                                Container(
                                                  width: 100,
                                                  color: Colors.green,
                                                  child: Text("${skillStats.luck}"),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            Row(
                              children: <Widget>[
                                Expanded(
                                  child: Container(
                                    color: Colors.amber,
                                    margin: const EdgeInsets.all(30),
                                    child: Container(
                                      height: 30,
                                      width: 30,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context).appTheme.colors.blue,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: [
                                          Text("Acheivements"),
                                        ],
                                      ),
                                    ),
                                  ),
                                )
                              ],
                            ),
                            // OutlinedButton(
                            //   onPressed: () async {
                            //     await widget.navigationservice.navigateTo(Routes.userprofile, arguments: <String, dynamic>{});
                            //   },
                            //   child: Text(
                            //     "Hello",
                            //     style: Theme.of(context).appTheme.fontStyle.hero,
                            //   ),
                            // )
                          ],
                        ),
                      ),
                    ),
                  ],
                ),
              );
            })));
  }
}
