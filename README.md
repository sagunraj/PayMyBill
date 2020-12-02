# PayMyBill
An application that allows the user to pay bills of various services.

## Language
Swift 5

## Minimum Supported iOS Version
iOS 14.2

## Basic File Structure
```
├── PayMyBill
│   ├── AppDelegate.swift
│   ├── Assets.xcassets
│   ├── Base.lproj
│   │   ├── LaunchScreen.storyboard
│   │   └── Main.storyboard
│   ├── Custom Views
│   │   └── FormCollectionViewCell
│   ├── Extensions
│   │   ├── Error.swift
│   │   ├── String.swift
│   │   └── UIViewController.swift
│   ├── Info.plist
│   ├── Models
│   │   ├── Field.swift
│   │   ├── FieldType.swift
│   │   ├── FieldValue.swift
│   │   ├── ResultField.swift
│   │   ├── SubmissionData.swift
│   │   ├── TaskResponse.swift
│   │   └── UIType.swift
│   ├── SceneDelegate.swift
│   ├── Utilities
│   │   ├── NetworkManager.swift
│   │   └── Validator.swift
│   └── ViewControllers
│       ├── BaseViewController.swift
│       ├── FormViewController.swift
│       └── OptionSelectionViewController.swift
└── README.md
```

## Design Patterns Used
MVC and Singleton

## Remarks
The API used returns regular expressions for some textfields. However, those regular expressions didn't work properly in the application. So, as a fallback plan, in ```Validator.swift```, custom regular expressions have been used in case a regular expression sent from the backend appears to be invalid or problematic.