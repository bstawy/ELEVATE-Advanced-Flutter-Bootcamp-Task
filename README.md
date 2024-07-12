# Route Tech Summit Task
![Frame](https://github.com/user-attachments/assets/baaa2d13-731f-4ade-9e78-ebf3143634a7)

&nbsp;

## 🚨 My Info

- 👨‍💻 All of my projects are available at **[My Repository](https://github.com/bstawy?tab=repositories)**.
- 👨‍💻 Check out **[My Portfolio](https://bastawyportofolio.framer.website/)** to see some of the projects I've worked on.
- 📫 How to reach me: ...

<div align="start">
<a href="https://www.linkedin.com/in/mohamed-bstawy/" target="_blank"><img src="https://img.shields.io/badge/linkedin-%230077B5.svg?style=for-the-badge&logo=linkedin&logoColor=white"/></a>
<a href="mailto:mohamed.bastawiie@gmail.com" target="_blank"><img src="https://img.shields.io/badge/Gmail-D14836?style=for-the-badge&logo=gmail&logoColor=white"/></a>
<a href="https://drive.google.com/drive/folders/1PPomKFcwpsOXbupbg-noNnilBY7IWIqL?usp=sharing" target="_blank"><img src="https://img.shields.io/badge/My%20resume-EC1C24.svg?style=for-the-badge&logo=Adobe%20Acrobat%20Reader&logoColor=white"/></a>
</div>

&nbsp;

## ✨ Features
- Shimmer loading effect
- Search functionality
- Debouncing to make efficient search requests
- Dependency injection
- Repository pattern
- Clean architecture
- MVVM architecture with Cubit

&nbsp;

## 📱 Screen
- **Product Screen:** Show Products.

| Screenshot | Screen Record |
| --------------- | ----------------|
| <img src="https://github.com/bstawy/Route-Tech-Summit-Flutter-Task/assets/99258115/83bfcb0d-1009-4556-8caa-9edf4e2e7ffa" width="300" /> | <img src="https://github.com/user-attachments/assets/c78a41ea-3df9-4b59-b834-ac80cba31ab4" width="300" />|

**Screen record video preview**
https://github.com/user-attachments/assets/b1916550-f688-4ff1-9e85-58e62c214942

&nbsp;

## 📁 Project Structure
```arduino
lib
├── core
│   ├── config
│   │   └── theme
│   │       ├── app_theme.dart
│   │       └── text_styles.dart
│   ├── di
│   │   ├── di.config.dart
│   │   └── di.dart
│   ├── networking
│   │   ├── api_constants.dart
│   │   └── dio_factory.dart
├── products
│   ├── data
│   │   ├── data_source
│   │   ├── models
│   │   └── repository_impl
│   ├── domain
│   │   ├── entities
│   │   ├── repository
│   │   └── use_cases
│   └── presentation
│       ├── manager
│       └── ui
└── main.dart
```

&nbsp;

## 🛠 Used Packages

```pubspec.yaml
dependencies:
  cached_network_image: ^3.3.1
  dartz: ^0.10.1
  dio: ^5.5.0+1
  equatable: ^2.0.5
  flutter_bloc: ^8.1.6
  flutter_offline: ^3.0.1
  flutter_screenutil: ^5.9.3
  flutter_svg: ^2.0.10+1
  gap: ^3.0.1
  get_it: ^7.7.0
  injectable: ^2.4.2
  pretty_dio_logger: ^1.3.1
  shimmer: ^3.0.0
```
