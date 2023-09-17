// swift-tools-version: 5.7
import PackageDescription

let package = Package(
	name: "GXUCAnimationView",
	platforms: [.iOS("12.0"), .tvOS("12.0")],
	products: [
		.library(
			name: "GXUCAnimationView",
			targets: ["GXUCAnimationViewWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.2.0-beta.28"),
		.package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMajor(from: "4.2.0"))
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCAnimationView-1.2.0-beta.28.xcframework.zip",
			checksum: "04795d70c5e3750e6f359e8f31d2d541a1355598db01a952ad548d2379500984"
		)
	]
)