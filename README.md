# Kad Kahwin [![N|Solid](https://blog.expertsoftwareteam.com/wp-content/uploads/2019/01/flutter12.png)](https://flutter.dev/)

[Flutter] Web Kad Kahwin RSVP Project for both sides (Lelaki & Perempuan) by leveraging the free tier of Firebase as the Kad Kahwin usually is not will flood by users and a huge of bandwidth.

- Hosting: [Firebase Hosting]
- Database: [Cloud Firestore]

## Running

```sh
flutter run --dart
```

## Build and compile

```sh
flutter build web --dart
```

## Deployment

1. Add site name in `firebase.json` with the correct target host

```
{
  "hosting": {
    "site": "kad-kahwin-iffshaff", <-- HERE [kad-kahwin-saui]
    "public": "build/web",
    "ignore": ["firebase.json", "**/.*", "**/node_modules/**"],
    "rewrites": [
      {
        "source": "**",
        "destination": "/index.html"
      }
    ]
  }
}
```

2. Deploy the compiled web based on your targeted host in `firebase.json`

```sh
firebase deploy --only hosting:[YOUR TARGET HOST]
```

[firebase hosting]: https://firebase.google.com/docs/hosting
[cloud firestore]: https://firebase.google.com/docs/firestore
