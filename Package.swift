// swift-tools-version: 5.10

import PackageDescription
import AppleProductTypes

let package = Package(
    name: "Phono",
    platforms: [
        .iOS(.v17)
    ],
    products: [
        .iOSApplication(
            name: "Phono",
            targets: ["AppModule"],
            bundleIdentifier: "Academy.Speeches",
            teamIdentifier: "ZFH4AF7HSL",
            displayVersion: "1.0",
            bundleVersion: "1",
            appIcon: .asset("AppIcon"),
            accentColor: .presetColor(.blue),
            supportedDeviceFamilies: [
                .phone,
                .pad
            ],
            supportedInterfaceOrientations: [
                .portrait,
                .portraitUpsideDown(.when(deviceFamilies: [.pad]))
            ],
            capabilities: [
                .microphone(
                    purposeString: "To analyze the audio."
                ),
                .speechRecognition(
                    purposeString: "To analyze the recordings."
                )
            ],
            appCategory: .education
        )
    ],
    targets: [
        .executableTarget(
            name: "AppModule",
            path: ".",
            resources: [
                .process("Resources"),
                .copy("ML/PhonoV2.mlmodelc")
            ]
        )
    ]
)
