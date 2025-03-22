# Commands to Run the Portfolio Web App

## Development Mode

1. Run the app in Chrome browser:
```
flutter run -d chrome
```

2. Run the app on a connected mobile device:
```
flutter run
```

## Build for Production

Build a web version for deployment:
```
flutter build web
```

## Testing Across Different Devices

After running in Chrome, you can use Chrome DevTools to test responsiveness:

1. Right-click on the page and select "Inspect"
2. Click the "Toggle device toolbar" button (or press Ctrl+Shift+M)
3. Select different device presets from the dropdown at the top

## Common Issues and Solutions

### If you encounter Flutter console errors:

1. Make sure dependencies are up to date:
```
flutter pub get
```

2. Clean the project and rebuild:
```
flutter clean
flutter pub get
flutter run -d chrome
```

3. If you encounter the "Field '_children' has not been initialized" error:
   - This has been fixed in the latest update to education_section.dart
   - The fix changed how we handle the Obx() reactive widget to properly initialize children

### If web build fails:

Try running with web renderer explicitly set:
```
flutter run -d chrome --web-renderer html
```

Or for better performance but potentially more compatibility issues:
```
flutter run -d chrome --web-renderer canvaskit
```