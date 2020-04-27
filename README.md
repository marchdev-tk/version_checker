# version_checker

![Build](https://github.com/marchdev-tk/version_checker/workflows/build/badge.svg)
[![Pub](https://img.shields.io/pub/v/version_checker.svg)](https://pub.dartlang.org/packages/version_checker)
![GitHub](https://img.shields.io/github/license/marchdev-tk/version_checker)
![GitHub stars](https://img.shields.io/github/stars/marchdev-tk/version_checker?style=social)

Version Checker Popup is used to prompt user for website reloading with clearing cached data to apply a new version of the site.

## Getting Started

To start using this popup `VersionChecker.initialize` method should be called only once, for instance within constructor of <Your>App class within main.dart file.

Via `VersionChecker.initialize` method could be set delay for checking version:
 
 * `timerDelay` - periodical delay.
 * `instantDelay` - if `instantCheck` is set to `true`, then after this delay version will be checked instantly.

Also, for localization purposes this method has following arguments:

 * `newVersionAvailableText` - title of popup.
 * `applyText` - complete action button title.

If `debugOutput` argument is set to `true`, then extra info will be printed into console.

### Before building and deploying web site you should execute following script:

**Linux:**
```bash
#!/bin/bash

VERSION=$(sed -n -e 's/^version: \([0-9]*\.[0-9]*\.[0-9]*\)\(+[0-9]*\)*/\1/p' pubspec.yaml)

echo "App Version: ${VERSION}"
echo "Updating app version..."

sed -i "s/var appVersion = \"[0-9]*\.[0-9]*\.[0-9]*\";/var appVersion = \"${VERSION}\";/g" web/index.html
sed -i "s/src=\"main.dart.js\"/src=\"main.dart.js?v=${VERSION}\"/g" web/index.html
sed -i "s/\"app_version\": \"[0-9]*\.[0-9]*\.[0-9]*\"/\"app_version\": \"${VERSION}\"/g" assets/env.json

echo "App version updated"
```

**macOS:**
```bash
#!/bin/bash

VERSION=$(sed -n -e 's/^version: \([0-9]*\.[0-9]*\.[0-9]*\)\(+[0-9]*\)*/\1/p' pubspec.yaml)

echo "App Version: ${VERSION}"
echo "Updating app version..."

sed -i '' "s/var appVersion = \"[0-9]*\.[0-9]*\.[0-9]*\";/var appVersion = \"${VERSION}\";/g" web/index.html
sed -i '' "s/src=\"main.dart.js\"/src=\"main.dart.js?v=${VERSION}\"/g" web/index.html
sed -i '' "s/\"app_version\": \"[0-9]*\.[0-9]*\.[0-9]*\"/\"app_version\": \"${VERSION}\"/g" assets/env.json

echo "App version updated"
```

## Examples

Add examples here

## Feature requests and Bug reports

Feel free to post a feature requests or report a bug [here](https://github.com/marchdev-tk/version_checker/issues).
