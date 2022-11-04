import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/services/service_locator.dart';
import 'package:wd_client/core/theme/theme.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  HomePage({
    required this.navigationservice,
    required this.user,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationservice; // = locator.get<NavigationService>();
  final User user;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<User>.value(value: widget.user),
          ChangeNotifierProvider<UserStats>.value(value: widget.user.userStats),
          ChangeNotifierProvider<SkillStats>.value(value: widget.user.userStats.skillStats),
        ],
        child: Consumer<User>(builder: (_, user, __) {
          return Container(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                Expanded(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: <Widget>[
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  InkWell(
                                    onTap: () async {
                                      await widget.navigationservice.navigateTo(Routes.userprofile, arguments: <String, dynamic>{});
                                    },
                                    child: Container(
                                      height: 50,
                                      width: 50,
                                      decoration: BoxDecoration(
                                        borderRadius: BorderRadius.circular(30),
                                        color: Theme.of(context).appTheme.colors.blue,
                                      ),
                                      child: Column(
                                        mainAxisAlignment: MainAxisAlignment.center,
                                        children: const [
                                          Text(
                                            "Profile",
                                            textAlign: TextAlign.center,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Theme.of(context).appTheme.colors.blue,
                                    ),
                                    child: Text("Coins:${user.coins}"),
                                  ),
                                  Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(30),
                                      color: Theme.of(context).appTheme.colors.blue,
                                    ),
                                    child: Text("Gems:${user.gems}"),
                                  ),
                                  Row(
                                    children: [
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).appTheme.colors.blue,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Shop",
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                      Container(
                                        height: 50,
                                        width: 50,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(30),
                                          color: Theme.of(context).appTheme.colors.blue,
                                        ),
                                        child: Column(
                                          mainAxisAlignment: MainAxisAlignment.center,
                                          children: const [
                                            Text(
                                              "Settings",
                                              textAlign: TextAlign.center,
                                            ),
                                          ],
                                        ),
                                      ),
                                    ],
                                  )
                                ],
                              ),
                            ),
                          )
                        ],
                      ),
                      Expanded(
                        child: Row(
                          children: <Widget>[
                            Expanded(
                              child: Container(
                                color: Colors.amber,
                                margin: const EdgeInsets.all(30),
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context).appTheme.colors.blue,
                                  ),
                                  child: Column(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    children: [
                                      Text("MAP"),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                      Row(
                        children: <Widget>[
                          Expanded(
                            child: Container(
                              color: Colors.amber,
                              margin: const EdgeInsets.all(30),
                              child: Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await widget.navigationservice.navigateTo(Routes.battlescreen, arguments: <String, dynamic>{});
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).appTheme.colors.blue,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Battle",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await widget.navigationservice.navigateTo(Routes.battlescreen, arguments: <String, dynamic>{});
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).appTheme.colors.blue,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Quests",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await widget.navigationservice.navigateTo(Routes.battlescreen, arguments: <String, dynamic>{});
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).appTheme.colors.blue,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Missions",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                  Column(
                                    children: [
                                      InkWell(
                                        onTap: () async {
                                          await widget.navigationservice.navigateTo(Routes.battlescreen, arguments: <String, dynamic>{});
                                        },
                                        child: Container(
                                          padding: const EdgeInsets.all(20),
                                          decoration: BoxDecoration(
                                            shape: BoxShape.circle,
                                            color: Theme.of(context).appTheme.colors.blue,
                                          ),
                                          child: Column(
                                            mainAxisAlignment: MainAxisAlignment.center,
                                            children: const [
                                              Text(
                                                "Events",
                                                textAlign: TextAlign.center,
                                              ),
                                            ],
                                          ),
                                        ),
                                      ),
                                    ],
                                  ),
                                ],
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
              ],
            ),
          );
        }),
      ),
    );
  }
}
