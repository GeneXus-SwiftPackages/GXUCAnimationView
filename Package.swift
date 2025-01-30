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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "3.0.0-beta.15"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCAnimationView-3.0.0-beta.15.xcframework.zip",
			checksum: "6b977f9a9beb8b01689101aa7f6b6e581eb4f628f983c9d56402491bb7247d73"
		)
	]
)