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
		.package(url: "https://github.com/GeneXus-SwiftPackages/GXCoreUI.git", exact: "1.5.0-rc.26"),
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
			url: "https://pkgs.genexus.dev/iOS/preview/GXUCAnimationView-1.5.0-rc.26.xcframework.zip",
			checksum: "0bdd03aa671a271a768cb7e806d357993f02c90618d9608dbe2180dea569c460"
		)
	]
)