#!/bin/bash

# Download Flutter SDK
git clone https://github.com/flutter/flutter.git
export PATH="$PATH:`pwd`/flutter/bin"

# Enable Flutter web
flutter config --enable-web

# Get packages
flutter pub get

# Build for web with CanvasKit renderer
flutter build web --release --web-renderer=canvaskit
