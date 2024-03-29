# Project Wiro

## An App-based Platform to reduce the incidence of lonely deaths.

---

## Problem Statement

South Korea is confronting a significant problem of lonely death among seniors live alone,
which is expected to worsen due to issues like aging society.

Through Our in-depth research we found that elderly individuals
who live alone are dealing with several issues in their daily lives.

We took 3rd and 11th SDGs to deal with this society problem.

Overall process of our solution is as follows.

  1. Each user get two notifications each day. One is a Mission, another one is a Checklist.
  2. Users completes the missions or reply to the checklists they received.
  3. If there is no complete/reply sign, or our Deep Learning Algorithm decided that a user is in danger, it automatically sends SOS sign to their family, caregivers, thus preventing potential tragedies.

### Target SDGs

- Goal 3. Good Health and Well-Being
- Goal 11. Sustainable Cities and Communities

---

## High-Level Architecture Diagram

<img src="assets/README_Architecture.png"></img>

### How Each Components Work?

- **Cloud Function** decides Mission / CheckList based on our Algorithm for each user, and sends it to user via **Firebase Cloud Messaging**
- Personal Data or Mission / CheckList History, and all of necessary data of each user is saved to **Firebase Firestore**

[Flutter Application Repository (Currently Watching)](https://github.com/GDSC-CAU/Solution-Challenge-Team-2-Flutter-App)

[Back-End Repository](https://github.com/GDSC-CAU/Solution-Challenge-Team-2-Spring-BE)

[Python AI Repository](https://github.com/GDSC-CAU/Soluion-Challenge-Team-2-Python-AI)

---

## Get Started

### Download

You can get Debug APK from [Release Page](https://github.com/GDSC-CAU/Solution-Challenge-Team-2-Flutter-App/releases/tag/release1) of this Repository.

### Required for Self-Build

- Android SDK
- Android Studio
- Flutter SDK

### Steps for Self-Build

1. Clone this Project

```shell
git clone git@github.com:GDSC-CAU/Solution-Challenge-Team-2-Flutter-App.git
```

2. Open Project with Android Studio

3. Flutter Pub Get

```shell
flutter pub get
```

4. Build with Android Studio & Enjoy!

---

## Application Screenshots

|Mission / CheckList View|Mission / CheckList Result|
|:-:|:-:|
|![View](assets/README_App_MissionView.png)|![Complete](assets/README_App_MissionComplete.png)|

|App Main|Chat with Caregiver|
|:-:|:-:|
|![Main](assets/README_App_Main.png)|![Chat](assets/README_App_Chat.png)|

## Team Info

- Yongmin Yoo (유용민)
  - GDSC CAU 22-23 Core Member
  - Team Leader / Flutter Application / Firebase Firestore
  - [Github](https://github.com/yymin1022)

---

- Sangwoo Shin (신상우)
  - GDSC CAU 22-23 Member
  - Back-End / GCP Hosting / Firebase Firestore
  - [Github](https://github.com/sangwoonoel)

---

- Seunghoon Lee (이승훈)
  - GDSC CAU 22-23 Member
  - DeepLearning / GCP Cloud Functions / Firebase Cloud Messaging
  - [Github](https://github.com/sicmokil)
