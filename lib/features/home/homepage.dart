import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/services/service_locator.dart';
import 'package:wd_client/core/theme/theme.dart';

class HomePage extends StatefulWidget {
  HomePage({
    required this.navigationservice,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationservice; // = locator.get<NavigationService>();

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
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
                    mainAxisSize: MainAxisSize.max,
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
                                Text("Bottom Navigation"),
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
          ],
        ),
      ),
    );
  }
}
