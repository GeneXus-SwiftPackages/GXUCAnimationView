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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.4.0-rc.5"),
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCAnimationView-1.4.0-rc.5.xcframework.zip",
			checksum: "6bcc1e163c0e928988272d1447b1ea9b8793bc69c2488fff541fe623af8c4d60"
		)
	]
)