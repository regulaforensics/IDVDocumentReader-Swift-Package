# IDV DocumentReader Integration Guide

## Introduction

This guide provides step-by-step instructions on integrating the **IDV DocumentReader** into an iOS application. 

---

## Prerequisites

Before integrating the SDK, ensure the following:

- The application Minimum Deployment Target is **iOS 14** and above.
- Camera permission enabled
- Optional: The Near Field Communication Tag Reading capability is enabled in the application target.

---

## Installation

### Cocoapods

Add the base dependency into your Podfile:

```
target 'YourAppTarget' do
  use_frameworks!
  
pod 'IDVDocumentReader'
end
```

Include the DocumentReader Core dependency, e.g.:

```
pod 'DocumentReaderFullAuthRFID'
```

Then install it:

```
pod install
```

### Swift Package Manager (SPM)

#### Swift Package Collection

Swift Package Collection is a set of all Regula products in one place.

To add Regula Swift Package Collection to your project, run the following command in Terminal:

```
swift package-collection add https://pods-master.regulaforensics.com/SPM/PodsCollection-signed.json
```

or in Xcode:

1. Navigate to File > Add Package Dependencies.

2. In the prompt that appears, click plus.

3. Select Add Package Collection.

4. In the prompt that appears, enter the collection URL:

```
https://pods.regulaforensics.com/SPM/PodsCollection-signed.json
```

5. Click Load and then Add Collection.

6. Select the package you want to add.

7. Select the version you want to use. For new projects, we recommend using the newest version.

8. Select the project you want to add the package.

9. Click Add Package.

Once you're finished, Xcode will begin downloading and resolving dependencies.


#### Add Packages Separately

You can add each package individually instead of using the collection. To do so, follow these steps:

1. In Xcode, naviate to File > Add Package Dependencies.

2. In the prompt that appears, enter the API package URL:

```
https://github.com/regulaforensics/IDVDocumentReader-Swift-Package
```

3. Select the version you want to use. For new projects, we recommend using the newest version.

4. Select the project you want to add the package.

5. Click Add Package.

Once you're finished, Xcode will begin downloading and resolving dependencies.

## Additional setup:

- Add regula.license file to the app target. Setting is for **IDVDocumentReader** dependency
- Add db.dat file to the app target to use local database

## Info.plist file setup

1. Set the description for NSCameraUsageDescription setting.

Optional:
2. Set NFC settings:

```
<key>com.apple.developer.nfc.readersession.felica.systemcodes</key>
    <array>
        <string>12FC</string>
    </array>
    <key>com.apple.developer.nfc.readersession.iso7816.select-identifiers</key>
    <array>
        <string>A0000002471001</string>
        <string>E80704007F00070302</string>
        <string>A000000167455349474E</string>
        <string>A0000002480100</string>
        <string>A0000002480200</string>
        <string>A0000002480300</string>
        <string>A00000045645444C2D3031</string>
    </array>
```

---

## Conclusion

For further details, refer to the [official Regula IDVDocumentReader documentation](https://docs.regulaforensics.com/develop/idv/) or contact their support team.
