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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "4.0.0-beta.49"),
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
			url: "https://pkgs.genexus.dev/iOS/beta/GXUCAnimationView-4.0.0-beta.49.xcframework.zip",
			checksum: "38cb74da8511f9cc637c2beba84d43b04060693bdccce09626465dcda3cd909a"
		)
	]
)