//
// Copyright (c) 2019 Nathan E. Walczak
//
// MIT License
//
// Permission is hereby granted, free of charge, to any person obtaining a copy
// of this software and associated documentation files (the "Software"), to deal
// in the Software without restriction, including without limitation the rights
// to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
// copies of the Software, and to permit persons to whom the Software is
// furnished to do so, subject to the following conditions:
//
// The above copyright notice and this permission notice shall be included in
// all copies or substantial portions of the Software.
//
// THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
// IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
// FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
// AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
// LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
// OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
// THE SOFTWARE.
//

import Foundation

let MainStoryboardTestData = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="13168.3" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" colorMatched="YES" initialViewController="BYZ-38-t0r">
    <device id="retina4_7" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="13147.4"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Welcome View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController storyboardIdentifier="WelcomeViewController" id="BYZ-38-t0r" customClass="WelcomeViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="y3c-jy-aDJ"/>
                        <viewControllerLayoutGuide type="bottom" id="wfy-db-euE"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Example App" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="Qx3-Y9-k9S">
                                <rect key="frame" x="113.5" y="100" width="148" height="31.5"/>
                                <fontDescription key="fontDescription" style="UICTFontTextStyleTitle1"/>
                                <color key="textColor" red="0.0" green="0.0" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="2ME-TL-fDs">
                                <rect key="frame" x="156.5" y="191.5" width="62" height="36"/>
                                <fontDescription key="fontDescription" style="UICTFontTextStyleTitle2"/>
                                <state key="normal" title="Names"/>
                                <connections>
                                    <action selector="presentNames" destination="BYZ-38-t0r" eventType="touchUpInside" id="XdZ-4p-12M"/>
                                </connections>
                            </button>
                        </subviews>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <constraints>
                            <constraint firstItem="2ME-TL-fDs" firstAttribute="centerX" secondItem="8bC-Xf-vdC" secondAttribute="centerX" id="NsL-Yf-RwG"/>
                            <constraint firstItem="Qx3-Y9-k9S" firstAttribute="top" secondItem="y3c-jy-aDJ" secondAttribute="bottom" constant="80" id="OfZ-tF-VN3"/>
                            <constraint firstItem="Qx3-Y9-k9S" firstAttribute="centerX" secondItem="8bC-Xf-vdC" secondAttribute="centerX" id="UIF-1h-RBn"/>
                            <constraint firstItem="2ME-TL-fDs" firstAttribute="top" secondItem="Qx3-Y9-k9S" secondAttribute="bottom" constant="60" id="dMI-gD-Yq7"/>
                        </constraints>
                    </view>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="447" y="467"/>
        </scene>
    </scenes>
</document>
""".data(using: .utf8)!
