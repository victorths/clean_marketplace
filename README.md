## Use flutter with nullsafty feature enabled, preferably flutter 2.2.2

This project was built using the Clean Architecture design and follows the SOLID design principles.

To manage the application state, dependecy injection and named routes it uses the GetX pattern.

To comunicate with the graphQL api it uses the Dio package.

To generate test mock files it uses the build_runner package along with the Mockito package to the mock itself.

# How to run:

Get flutter packages by runing:

`flutter pub get`

There's no build runner nedeed to run the project itself, just on the tests, if you want to run the project first you can do so by running:

`flutter run`

This project works on every plataform that flutter supports (Android, IOS, WEB, Linux, Windows and MAC), you can choise any of these to run.

# How to Test

Generate required files to test by running:

`flutter pub run build_runner build --delete-conflicting-outputs`

After the command finished, run the tests.

## Obs: I could test every layer of the Clean Arch, but it would take some time so i did just the use cases test
