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
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" colorMatched="YES" initialViewController="BYZ-38-t0r">
    <device id="retina4_7" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
        <capability name="Named colors" minToolsVersion="9.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Main View Controller-->
        <scene sceneID="tne-QT-ifu">
            <objects>
                <viewController storyboardIdentifier="WelcomeViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="BYZ-38-t0r" customClass="MainViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="y3c-jy-aDJ"/>
                        <viewControllerLayoutGuide type="bottom" id="wfy-db-euE"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="8bC-Xf-vdC">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Blackboard Example App" textAlignment="center" lineBreakMode="wordWrap" numberOfLines="0" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="bC8-RJ-s3j">
                                <rect key="frame" x="27" y="315.5" width="321.5" height="36"/>
                                <fontDescription key="fontDescription" style="UICTFontTextStyleTitle0"/>
                                <color key="textColor" name="maroon color"/>
                                <nil key="highlightedColor"/>
                            </label>
                            <stackView opaque="NO" contentMode="scaleToFill" axis="vertical" spacing="24" translatesAutoresizingMaskIntoConstraints="NO" id="Y1B-b6-KVw">
                                <rect key="frame" x="72" y="375.5" width="231" height="244"/>
                                <subviews>
                                    <stackView opaque="NO" contentMode="scaleToFill" axis="vertical" spacing="4" translatesAutoresizingMaskIntoConstraints="NO" id="8Pg-Nq-h7g">
                                        <rect key="frame" x="0.0" y="0.0" width="231" height="72"/>
                                        <subviews>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="uq9-AN-QjK">
                                                <rect key="frame" x="0.0" y="0.0" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="View Accounts"/>
                                                <connections>
                                                    <action selector="presentAccounts" destination="BYZ-38-t0r" eventType="touchUpInside" id="IHx-cG-sgC"/>
                                                </connections>
                                            </button>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="X3x-lp-ZO3">
                                                <rect key="frame" x="0.0" y="38" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="Open a New Account"/>
                                                <connections>
                                                    <action selector="presentOpenAccount" destination="BYZ-38-t0r" eventType="touchUpInside" id="fpU-L5-HlL"/>
                                                </connections>
                                            </button>
                                        </subviews>
                                    </stackView>
                                    <stackView opaque="NO" contentMode="scaleToFill" axis="vertical" spacing="4" translatesAutoresizingMaskIntoConstraints="NO" id="6fY-BT-Igk">
                                        <rect key="frame" x="0.0" y="96" width="231" height="148"/>
                                        <subviews>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="VB8-nx-WjJ">
                                                <rect key="frame" x="0.0" y="0.0" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="View Photos"/>
                                                <connections>
                                                    <action selector="presentPhotos" destination="BYZ-38-t0r" eventType="touchUpInside" id="b3T-vm-VDa"/>
                                                </connections>
                                            </button>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="K8F-J7-NPp">
                                                <rect key="frame" x="0.0" y="38" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="View First Photo (Automatic)"/>
                                                <connections>
                                                    <segue destination="1kY-Hm-NXq" kind="presentation" identifier="Present Photo" id="zgI-a4-jc8"/>
                                                </connections>
                                            </button>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="PrX-4C-p6m">
                                                <rect key="frame" x="0.0" y="76" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="View First Photo (Manually)"/>
                                                <connections>
                                                    <action selector="presentFirstPhoto" destination="BYZ-38-t0r" eventType="touchUpInside" id="VOb-5O-Ghr"/>
                                                </connections>
                                            </button>
                                            <button opaque="NO" contentMode="scaleToFill" contentHorizontalAlignment="center" contentVerticalAlignment="center" buttonType="roundedRect" lineBreakMode="middleTruncation" translatesAutoresizingMaskIntoConstraints="NO" id="j93-LJ-o86">
                                                <rect key="frame" x="0.0" y="114" width="231" height="34"/>
                                                <fontDescription key="fontDescription" type="system" pointSize="18"/>
                                                <state key="normal" title="View Last Photo (Manually)"/>
                                                <connections>
                                                    <action selector="presentLastPhoto" destination="BYZ-38-t0r" eventType="touchUpInside" id="4iZ-Ah-pkk"/>
                                                </connections>
                                            </button>
                                        </subviews>
                                    </stackView>
                                </subviews>
                            </stackView>
                            <containerView opaque="NO" contentMode="scaleToFill" translatesAutoresizingMaskIntoConstraints="NO" id="3Nk-27-P1i">
                                <rect key="frame" x="0.0" y="627" width="375" height="40"/>
                                <constraints>
                                    <constraint firstAttribute="height" constant="40" id="VlV-yK-WZT"/>
                                </constraints>
                                <connections>
                                    <segue destination="BLW-P3-UbY" kind="embed" identifier="Footer" id="GgI-tp-rTh"/>
                                </connections>
                            </containerView>
                        </subviews>
                        <color key="backgroundColor" name="Bisque"/>
                        <constraints>
                            <constraint firstItem="3Nk-27-P1i" firstAttribute="leading" secondItem="8bC-Xf-vdC" secondAttribute="leading" id="3aM-Ng-thK"/>
                            <constraint firstAttribute="trailing" secondItem="3Nk-27-P1i" secondAttribute="trailing" id="Eg4-uR-iPz"/>
                            <constraint firstItem="bC8-RJ-s3j" firstAttribute="top" secondItem="y3c-jy-aDJ" secondAttribute="bottom" constant="64" id="Euo-e5-8ta"/>
                            <constraint firstItem="bC8-RJ-s3j" firstAttribute="centerX" secondItem="8bC-Xf-vdC" secondAttribute="centerX" id="HgA-T0-lRD"/>
                            <constraint firstItem="Y1B-b6-KVw" firstAttribute="centerX" secondItem="8bC-Xf-vdC" secondAttribute="centerX" id="lOC-px-Qt4"/>
                            <constraint firstItem="wfy-db-euE" firstAttribute="top" secondItem="3Nk-27-P1i" secondAttribute="bottom" id="s5h-L2-6FB"/>
                            <constraint firstAttribute="trailing" relation="greaterThanOrEqual" secondItem="bC8-RJ-s3j" secondAttribute="trailing" id="upr-Y3-e6e"/>
                            <constraint firstItem="Y1B-b6-KVw" firstAttribute="top" secondItem="bC8-RJ-s3j" secondAttribute="bottom" constant="24" id="wK9-RK-yzs"/>
                            <constraint firstItem="bC8-RJ-s3j" firstAttribute="leading" relation="greaterThanOrEqual" secondItem="8bC-Xf-vdC" secondAttribute="leading" id="xwv-lq-SDt"/>
                            <constraint firstItem="bC8-RJ-s3j" firstAttribute="centerY" secondItem="8bC-Xf-vdC" secondAttribute="centerY" id="zIx-Uw-lDD"/>
                        </constraints>
                        <variation key="default">
                            <mask key="constraints">
                                <exclude reference="Euo-e5-8ta"/>
                            </mask>
                        </variation>
                    </view>
                    <connections>
                        <outlet property="applicationNameCenterYLayoutConstraint" destination="zIx-Uw-lDD" id="rAO-ma-ioB"/>
                        <outlet property="applicationNameTopLayoutConstraint" destination="Euo-e5-8ta" id="Auc-Bu-Ita"/>
                        <outlet property="menuContainerView" destination="Y1B-b6-KVw" id="qTG-RP-L8t"/>
                        <segue destination="0b4-zA-tUG" kind="presentation" identifier="Present Accounts" id="i6U-aL-T8B"/>
                        <segue destination="WWh-nI-tlr" kind="presentation" identifier="Present Photos" id="gTT-xl-uum"/>
                        <segue destination="rri-Bp-hEX" kind="presentation" identifier="Present Open Account" id="G95-Lm-4cr"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="dkx-z0-nzr" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1053.5999999999999" y="497.90104947526243"/>
        </scene>
        <!--Account-->
        <scene sceneID="Pbp-r1-DPi">
            <objects>
                <viewControllerPlaceholder storyboardName="Account" id="0b4-zA-tUG" sceneMemberID="viewController"/>
                <placeholder placeholderIdentifier="IBFirstResponder" id="YT1-kq-3Ja" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1953" y="437"/>
        </scene>
        <!--Photo-->
        <scene sceneID="p8x-Cc-dZL">
            <objects>
                <viewControllerPlaceholder storyboardName="Photo" id="WWh-nI-tlr" sceneMemberID="viewController"/>
                <placeholder placeholderIdentifier="IBFirstResponder" id="J9m-VJ-Zsf" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1941" y="561"/>
        </scene>
        <!--PhotoNavigationController-->
        <scene sceneID="8Yl-U4-QsB">
            <objects>
                <viewControllerPlaceholder storyboardName="Photo" referencedIdentifier="PhotoNavigationController" id="1kY-Hm-NXq" sceneMemberID="viewController">
                    <navigationItem key="navigationItem" id="eYi-Fx-4fL"/>
                </viewControllerPlaceholder>
                <placeholder placeholderIdentifier="IBFirstResponder" id="clf-eH-opN" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="2042" y="690"/>
        </scene>
        <!--OpenAccountNavigationController-->
        <scene sceneID="O85-Og-dNq">
            <objects>
                <viewControllerPlaceholder storyboardName="Account" referencedIdentifier="OpenAccountNavigationController" id="rri-Bp-hEX" sceneMemberID="viewController"/>
                <placeholder placeholderIdentifier="IBFirstResponder" id="edV-xW-R6F" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="2078" y="497"/>
        </scene>
        <!--Footer View Controller-->
        <scene sceneID="PfG-5p-IQW">
            <objects>
                <viewController storyboardIdentifier="FooterViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="BLW-P3-UbY" customClass="FooterViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="KJx-RP-9ec"/>
                        <viewControllerLayoutGuide type="bottom" id="ATq-CI-B23"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="fw7-uK-vEY">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="40"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Footer Text" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="o8v-js-8oh">
                                <rect key="frame" x="142.5" y="7.5" width="90.5" height="25"/>
                                <fontDescription key="fontDescription" name="ChalkboardSE-Bold" family="Chalkboard SE" pointSize="17"/>
                                <nil key="textColor"/>
                                <nil key="highlightedColor"/>
                            </label>
                        </subviews>
                        <constraints>
                            <constraint firstItem="o8v-js-8oh" firstAttribute="centerX" secondItem="fw7-uK-vEY" secondAttribute="centerX" id="EaP-j3-hFO"/>
                            <constraint firstItem="o8v-js-8oh" firstAttribute="centerY" secondItem="fw7-uK-vEY" secondAttribute="centerY" id="OZO-gj-q2G"/>
                        </constraints>
                    </view>
                    <connections>
                        <outlet property="footerLabel" destination="o8v-js-8oh" id="mNb-Hm-jF3"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="8BK-vt-t6n" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1054" y="998"/>
        </scene>
    </scenes>
    <resources>
        <namedColor name="Bisque">
            <color red="1" green="0.89399999380111694" blue="0.76899999380111694" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
        </namedColor>
        <namedColor name="maroon color">
            <color red="0.50199997425079346" green="0.0" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
        </namedColor>
    </resources>
    <color key="tintColor" name="Absolute Zero"/>
</document>

""".data(using: .utf8)!
