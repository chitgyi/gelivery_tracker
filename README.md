# Gelivery Tracker Application

Gelivery Tracker Application for Assessment

## Getting Started

## Configuration

### Generate App Flavor

```bash
flutter pub run flutter_flavorizr
```

> Note: you don't need to run frequently. Only need to run once you changed `flavor.yaml` file

### Run via CLI

```bash
cd gelivery_tracker
flutter pub get
flutter run --flavor {your-flavor-name} -t lib/main_{your-flavor-name}.dart
```

### Run via VSCode's Build & Run

- Click Build & Run Tab Icons in VSCode
- Choose Mode as you want

### API Usage

- open `rest_api.http` file in root dir
- click `Request` button of each api endpoints

> Note: You need to install `REST Client` extension in your vscode
