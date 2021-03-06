# Flutter Steps Tracker

A simple steps tracker using [pedometer](https://pub.dev/packages/pedometer).

1. Cloud Firestone Database.
2. Daily steps counter.
3. Heath points exchange.
4.  Login with Firebase and anonymous account with name.
5. Redeems exchange with health points.
6. Dark theme support.
7. Listen to HP && redeems exchange and show snack bar.
8. There is 2 type of exchange with threshold, big and normal, they are defined by constants in the code.
9. History for HP and Redeems exchanges.
10. Users Ranking ð¥, not included in gifs ð¢.
11. Support arabic and english languge.



| ![gif1](gif1.gif) | ![gif2](gif2.gif) |
| -------------------- | --------------------- |
### Project structure:

```
lib
ââ app.dart
ââ bootstrap.dart
ââ common
â  ââ app_manger
â  ââ const.dart
â  ââ extension.dart
â  ââ permission_strategy.dart
â  ââ provider
â  ââ storage.dart
ââ features
â  ââ pedometer
â  â  ââ application
â  â  ââ data
â  â  ââ domain
â  ââ root
â  â  ââ manager
â  â  ââ pages
â  â  â  ââ gifts_page
â  â  â  ââ history_page
â  â  â  ââ pages.dart
â  â  â  ââ pedometer_page
â  â  â  ââ rank_page
â  â  ââ root_screen.dart
â  â  ââ widgets
â  ââ user
â     ââ application
â     ââ data
â     ââ domain
â     ââ presentation
ââ firebase_options.dart
ââ generated
â  ââ intl
â  ââ l10n.dart
â  ââ resources
ââ l10n
â  ââ intl_ar.arb
â  ââ intl_en.arb
ââ main.dart
ââ router
â  ââ router.dart
â  ââ routes.dart
ââ service_locator
â  ââ features
â  ââ service_locator.dart
ââ splash.dart
```

### Melos Scripts:

```yaml
name: flutter_steps_tracker

packages:
  - '*'
  - packages/**

scripts:
  format: melos exec -- "flutter format ."

  fix_hints: melos exec -- "dart fix âapply ."

  analyze:
    run: melos exec -- flutter analyze .
    description: Run `dart analyze` in all packages.

  easy_local:
    run: |
      melos exec --depends-on="easy_localization"  -- $easy &&
      melos exec --depends-on="easy_localization"  -- $easy -f keys -o locale_keys.g.dart
    env:
      easy: flutter pub run easy_localization:generate -S translations

  build_runner:
    run: |
      melos exec --depends-on="build_runner" --  $runner
    env:
      runner: flutter pub run build_runner build --delete-conflicting-outputs

  upgrade:
    run: melos exec flutter pub upgrade

  spider:
    run: |
      melos exec spider build
```
