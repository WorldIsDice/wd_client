import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/theme/theme.dart';

class BattleScreen extends StatefulWidget {
  BattleScreen({
    required this.navigationservice,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationservice; // = locator.get<NavigationService>();

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  Widget getBattleUI({required bool isThisUser}) {
    return Expanded(
      child: Container(
        color: Colors.amber,
        child: Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(30),
            color: Theme.of(context).appTheme.colors.blue,
          ),
          child: Column(
            children: [
              Row(
                children: [
                  Expanded(
                    child: Container(
                      margin: isThisUser ? EdgeInsets.only(right: 30) : EdgeInsets.only(left: 30),
                      padding: isThisUser ? EdgeInsets.only(left: 10) : EdgeInsets.only(right: 10),
                      height: 20,
                      color: Colors.red,
                      child: Text(
                        "200/200",
                        style: Theme.of(context).appTheme.fontStyle.label.copyWith(color: Theme.of(context).appTheme.colors.white, fontSize: 16),
                      ),
                    ),
                  )
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    padding: isThisUser ? EdgeInsets.only(right: 50) : EdgeInsets.only(left: 50),
                    child: Text("-30"),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: [
                  Expanded(
                    child: Container(
                      padding: isThisUser ? EdgeInsets.only(right: 50) : EdgeInsets.only(left: 50),
                      child: Column(
                        children: [
                          Container(
                            color: Colors.black,
                            height: 270,
                          ),
                        ],
                      ),
                    ),
                  ),
                ],
              ),
              Row(
                mainAxisAlignment: isThisUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                children: [
                  Container(
                    padding: isThisUser ? EdgeInsets.only(top: 30, left: 10, right: 50) : EdgeInsets.only(top: 30, left: 50, right: 10),
                    child: Column(
                      children: [
                        Text(
                          "ATK : 10",
                        ),
                        Text(
                          "DEF : 2",
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
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
                                child: Text("Coins:9000"),
                              ),
                              Container(
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(30),
                                  color: Theme.of(context).appTheme.colors.blue,
                                ),
                                child: Text("Gems:100"),
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
                      children: <Widget>[getBattleUI(isThisUser: true), getBattleUI(isThisUser: false)],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
