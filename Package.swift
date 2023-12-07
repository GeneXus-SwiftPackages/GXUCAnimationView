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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-rc.1"),
		.package(url: "https://github.com/airbnb/lottie-spm.git", .upToNextMinor(from: "4.3.0"))
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCAnimationView-1.4.0-rc.1.xcframework.zip",
			checksum: "625fc835adf2a18460ba1ef7668f1f5e85acbb9d9387b7d83fb40941f5160b55"
		)
	]
)