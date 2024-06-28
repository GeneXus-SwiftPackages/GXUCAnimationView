// swift-tools-version: 5.9
import PackageDescription

let package = Package(
	name: "GXUCAnimationView",
	platforms: [.iOS("13.0"), .tvOS("13.0")],
	products: [
		.library(
			name: "GXUCAnimationView",
			targets: ["GXUCAnimationViewWrapper"])
	],
	dependencies: [
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "2.1.0-rc.25"),
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCAnimationView-2.1.0-rc.25.xcframework.zip",
			checksum: "4a55b259e61b1d482852684f8f480fa56073d40de9040be2ed7f2de34fa4d232"
		)
	]
)