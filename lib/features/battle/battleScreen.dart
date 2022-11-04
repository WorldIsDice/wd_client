import 'package:flutter/material.dart';
import 'package:wd_client/core/data/datasources/repositories/user_repository.dart';
import 'package:wd_client/core/data/datasources/routes/routes.dart';
import 'package:wd_client/core/data/models/monster.dart';
import 'package:wd_client/core/data/models/user.dart';
import 'package:wd_client/core/data/models/userstats.dart';
import 'package:wd_client/core/services/navigation_service.dart';
import 'package:wd_client/core/theme/theme.dart';
import 'package:wd_client/features/battle/controller/battlescreen_controller.dart';
import 'package:provider/provider.dart';
import 'package:wd_client/features/battle/provider/battlescreen.p.dart';
import 'package:wd_client/features/common/user_character/character.dart';

class BattleScreen extends StatefulWidget {
  BattleScreen({
    required this.user,
    required this.navigationService,
    required this.userRepository,
    Key? key,
  }) : super(key: key);

  final NavigationService navigationService; // = locator.get<NavigationService>();
  final User user;
  final UserRepository userRepository;

  @override
  State<BattleScreen> createState() => _BattleScreenState();
}

class _BattleScreenState extends State<BattleScreen> {
  late BattleScreenController controller;

  @override
  void initState() {
    controller = BattleScreenController(
      user: widget.user,
      navigationService: widget.navigationService,
      userRepository: widget.userRepository,
    );
    widget.userRepository.getUser();
    super.initState();
  }

  Widget getDisplayBar(int currentValue, int totalValue, Color color, EdgeInsets margin) {
    return Container(
        margin: margin,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          border: Border.all(color: Colors.black),
          color: Colors.white,
        ),
        child: Stack(
          alignment: Alignment.centerLeft,
          children: [
            Row(
              children: [
                Expanded(
                  flex: currentValue,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                      color: color,
                    ),
                    height: 20,
                  ),
                ),
                Expanded(
                  flex: totalValue - currentValue,
                  child: Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(20),
                    ),
                  ),
                )
              ],
            ),
            Container(
              padding: const EdgeInsets.only(left: 10),
              child: Text(
                "$currentValue/$totalValue",
                style: Theme.of(context).appTheme.fontStyle.label.copyWith(
                      color: Theme.of(context).appTheme.colors.headerBlack,
                      fontSize: 16,
                    ),
              ),
            ),
          ],
        ));
  }

  Widget getBattleUI({required bool isThisUser, required BattleProvider battleProvider}) {
    return ChangeNotifierProvider<SkillStats>.value(
        value: (isThisUser) ? controller.provider.battleUserStats.skillStats : controller.provider.monster.stats,
        child: Consumer<SkillStats>(builder: (_, skillStats, __) {
          int hptotal = (isThisUser) ? battleProvider.userTotalHp : battleProvider.monsterTotalHp;
          int currenthp = (isThisUser) ? battleProvider.userCurrentHp : battleProvider.monsterCurrentHp;
          int mptotal = (isThisUser) ? battleProvider.userTotalMp : battleProvider.monsterTotalMp;
          int currentmp = (isThisUser) ? battleProvider.userCurrentMp : battleProvider.monsterCurrentMp;
          int? damage = isThisUser ? battleProvider.userDamage : battleProvider.monsterDamage;
          EdgeInsets barMargin = EdgeInsets.only(right: isThisUser ? 30 : 10, left: isThisUser ? 10 : 30);

          return Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Theme.of(context).appTheme.colors.blue,
              ),
              child: Column(
                children: [
                  getDisplayBar(currenthp, hptotal, Colors.red, barMargin),
                  getDisplayBar(currentmp, mptotal, Colors.blueAccent, barMargin),
                  if (isThisUser) getDisplayBar(battleProvider.battleUserStats.skillStats.exp, 100, Colors.green, barMargin),
                  if (!isThisUser) Container(height: 22),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Container(
                        padding: isThisUser ? EdgeInsets.only(right: 50) : EdgeInsets.only(left: 50),
                        child: Text(
                          "${damage ?? ""}",
                          style: Theme.of(context).appTheme.fontStyle.hero.copyWith(
                              color: (damage != null && damage > 0)
                                  ? Theme.of(context).appTheme.colors.primaryRed
                                  : Theme.of(context).appTheme.colors.green),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: isThisUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      Container(
                          margin: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                          child: (isThisUser)
                              ? ChangeNotifierProvider<UserStats>.value(
                                  value: controller.provider.battleUserStats,
                                  child: Consumer<UserStats>(builder: (_, userStats, __) {
                                    return Text("Lvl.${userStats.level}");
                                  }),
                                )
                              : ChangeNotifierProvider<Monster>.value(
                                  value: controller.provider.monster,
                                  child: Consumer<Monster>(builder: (_, monster, __) {
                                    return Text("Lvl.${monster.level}");
                                  }),
                                )

                          //  : controller.provider.monster.level,
                          ),
                    ],
                  ),
                  Row(
                    children: [
                      Container(
                        color: Colors.black,
                        height: 130,
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: isThisUser ? MainAxisAlignment.start : MainAxisAlignment.end,
                    children: [
                      Container(
                        padding: isThisUser ? EdgeInsets.only(top: 30, left: 10, right: 50) : EdgeInsets.only(top: 30, left: 50, right: 10),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Text(
                              "ATK : ${skillStats.strength}",
                            ),
                            Text(
                              "INTELLIGENCE : ${skillStats.intelligence}",
                            ),
                            Text(
                              "LUCK : ${skillStats.luck}",
                            ),
                            Text(
                              "EDURANCE : ${skillStats.edurance}",
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          );
        }));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: MultiProvider(
        providers: [
          ChangeNotifierProvider<BattleProvider>.value(value: controller.provider),
        ],
        child: Container(
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
                                    await widget.navigationService.navigateTo(Routes.userprofile, arguments: <String, dynamic>{});
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
                                  child: Text("Coins:${widget.user.coins}"),
                                ),
                                Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(30),
                                    color: Theme.of(context).appTheme.colors.blue,
                                  ),
                                  child: Text("Gems:${widget.user.gems}"),
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
                      child: Consumer<BattleProvider>(builder: (_, battleProvider, __) {
                        return Column(
                          children: [
                            Stack(
                              children: [
                                Row(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: <Widget>[
                                    getBattleUI(isThisUser: true, battleProvider: battleProvider),
                                    getBattleUI(isThisUser: false, battleProvider: battleProvider),
                                  ],
                                ),
                                Positioned(
                                  top: 150,
                                  left: 0,
                                  child: Character(),
                                ),
                                Positioned(
                                  top: 150,
                                  right: 0,
                                  child: Container(
                                    color: Colors.amber,
                                    child: Character(),
                                  ),
                                ),
                              ],
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                if (battleProvider.monsterDamage == null && battleProvider.userDamage == null)
                                  Container(
                                    width: MediaQuery.of(context).size.width / 2,
                                    child: Column(
                                      children: [
                                        if (battleProvider.battleEnded)
                                          OutlinedButton(onPressed: () => controller.searchMonsters(), child: Text("Continue Fighting")),
                                        if (!battleProvider.battleEnded)
                                          OutlinedButton(onPressed: () => controller.attackMonster(), child: Text("Attack")),
                                        OutlinedButton(onPressed: () => controller.endBattle(), child: Text("Exit")),
                                      ],
                                    ),
                                  ),
                              ],
                            ),
                          ],
                        );
                      }),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
