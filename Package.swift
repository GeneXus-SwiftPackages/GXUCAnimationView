// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCAnimationView",
	platforms: [.iOS("15.0"), .tvOS("18.0")],
	products: [
		.library(
			name: "GXUCAnimationView",
			targets: ["GXUCAnimationViewWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.2.0-beta.19"),
		.package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.4.3"))
	],
	targets: [
		.target(name: "GXUCAnimationViewWrapper",
				dependencies: [
					"GXUCAnimationView",
					.product(name: "GXCoreUI", package: "GXCoreUI", condition: .when(platforms: [.iOS, .tvOS])),
					.product(name: "Lottie", package: "lottie-spm", condition: .when(platforms: [.iOS, .tvOS]))
				],
				path: "Sources"),
		.binaryTarget(
			name: "GXUCAnimationView",
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCAnimationView-3.2.0-beta.19.xcframework.zip",
			checksum: "31571b2cd240d74b50d2e488a49300e02e4f4988fc3dfec5db11e40b7e746d39"
		)
	]
)