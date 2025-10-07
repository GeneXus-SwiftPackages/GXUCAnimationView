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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.0-beta.47"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCAnimationView-4.0.0-beta.47.xcframework.zip",
			checksum: "c2314e93990d5e1642040571fb57dbdb7f109a15db3589af18743e7dd09a0f7c"
		)
	]
)