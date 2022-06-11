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
10. Users Ranking 🔥, not included in gifs 😢.
11. Support arabic and english languge.



| ![gif1](gif1.gif) | ![gif2](gif2.gif) |
| -------------------- | --------------------- |
### Project structure:

```
lib
├─ app.dart
├─ bootstrap.dart
├─ common
│  ├─ app_manger
│  ├─ const.dart
│  ├─ extension.dart
│  ├─ permission_strategy.dart
│  ├─ provider
│  └─ storage.dart
├─ features
│  ├─ pedometer
│  │  ├─ application
│  │  ├─ data
│  │  └─ domain
│  ├─ root
│  │  ├─ manager
│  │  ├─ pages
│  │  │  ├─ gifts_page
│  │  │  ├─ history_page
│  │  │  ├─ pages.dart
│  │  │  ├─ pedometer_page
│  │  │  └─ rank_page
│  │  ├─ root_screen.dart
│  │  └─ widgets
│  └─ user
│     ├─ application
│     ├─ data
│     ├─ domain
│     └─ presentation
├─ firebase_options.dart
├─ generated
│  ├─ intl
│  ├─ l10n.dart
│  └─ resources
├─ l10n
│  ├─ intl_ar.arb
│  └─ intl_en.arb
├─ main.dart
├─ router
│  ├─ router.dart
│  └─ routes.dart
├─ service_locator
│  ├─ features
│  └─ service_locator.dart
└─ splash.dart
```

### Melos Scripts:

```yaml
name: flutter_steps_tracker

packages:
  - '*'
  - packages/**

scripts:
  format: melos exec -- "flutter format ."

  fix_hints: melos exec -- "dart fix —apply ."

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
