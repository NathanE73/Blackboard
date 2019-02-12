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

let TableStoryboardTestData = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="13168.3" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" colorMatched="YES">
    <device id="retina4_7" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="13147.4"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Names-->
        <scene sceneID="tfa-iu-apW">
            <objects>
                <viewController storyboardIdentifier="NamesViewController" id="Ath-di-zDx" customClass="NamesViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="tp7-ut-rZt"/>
                        <viewControllerLayoutGuide type="bottom" id="gSg-Fz-UjX"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="mtk-kq-dTv">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <tableView clipsSubviews="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" separatorStyle="default" rowHeight="44" sectionHeaderHeight="28" sectionFooterHeight="28" translatesAutoresizingMaskIntoConstraints="NO" id="SZ4-CT-geh">
                                <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                                <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <prototypes>
                                    <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" selectionStyle="blue" hidesAccessoryWhenEditing="NO" indentationLevel="1" indentationWidth="0.0" reuseIdentifier="Name" id="jib-Wo-IjF" customClass="NameTableViewCell" customModule="ExampleApp" customModuleProvider="target">
                                        <rect key="frame" x="0.0" y="28" width="375" height="44"/>
                                        <autoresizingMask key="autoresizingMask"/>
                                        <tableViewCellContentView key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" tableViewCell="jib-Wo-IjF" id="9Sg-8z-hh0">
                                            <rect key="frame" x="0.0" y="0.0" width="375" height="43.5"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                            <subviews>
                                                <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Name" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="KsQ-0A-UCU">
                                                    <rect key="frame" x="165" y="11" width="45" height="21"/>
                                                    <fontDescription key="fontDescription" type="system" pointSize="17"/>
                                                    <color key="textColor" red="0.0" green="0.0" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                                    <nil key="highlightedColor"/>
                                                </label>
                                            </subviews>
                                            <constraints>
                                                <constraint firstItem="KsQ-0A-UCU" firstAttribute="centerY" secondItem="9Sg-8z-hh0" secondAttribute="centerY" id="HlG-ve-5tT"/>
                                                <constraint firstItem="KsQ-0A-UCU" firstAttribute="centerX" secondItem="9Sg-8z-hh0" secondAttribute="centerX" id="uBW-nB-Nzr"/>
                                            </constraints>
                                        </tableViewCellContentView>
                                        <connections>
                                            <outlet property="nameLabel" destination="KsQ-0A-UCU" id="fUG-BY-nkm"/>
                                        </connections>
                                    </tableViewCell>
                                </prototypes>
                                <connections>
                                    <outlet property="dataSource" destination="Ath-di-zDx" id="GwV-lj-fU6"/>
                                    <outlet property="delegate" destination="Ath-di-zDx" id="h1A-ws-WCJ"/>
                                </connections>
                            </tableView>
                        </subviews>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <constraints>
                            <constraint firstItem="SZ4-CT-geh" firstAttribute="leading" secondItem="mtk-kq-dTv" secondAttribute="leading" id="EYN-fx-84Q"/>
                            <constraint firstAttribute="trailing" secondItem="SZ4-CT-geh" secondAttribute="trailing" id="MNW-oO-WUW"/>
                            <constraint firstItem="SZ4-CT-geh" firstAttribute="top" secondItem="mtk-kq-dTv" secondAttribute="top" id="YSB-Ru-y4l"/>
                            <constraint firstItem="gSg-Fz-UjX" firstAttribute="top" secondItem="SZ4-CT-geh" secondAttribute="bottom" id="iPg-en-3fw"/>
                        </constraints>
                    </view>
                    <navigationItem key="navigationItem" title="Names" id="49e-4p-UeF">
                        <barButtonItem key="leftBarButtonItem" title="Dismiss" id="Q9n-nk-JBX">
                            <connections>
                                <action selector="dismiss" destination="Ath-di-zDx" id="upt-xr-rCh"/>
                            </connections>
                        </barButtonItem>
                    </navigationItem>
                    <connections>
                        <outlet property="tableView" destination="SZ4-CT-geh" id="NGX-5X-rxm"/>
                        <segue destination="fSb-Hr-8TV" kind="show" identifier="ShowName" id="1hz-oI-POK"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="h4P-nv-psB" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1311" y="534"/>
        </scene>
        <!--Name-->
        <scene sceneID="SxS-hM-2H4">
            <objects>
                <viewController storyboardIdentifier="NameViewController" id="fSb-Hr-8TV" customClass="NameViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="ECV-cC-IjB"/>
                        <viewControllerLayoutGuide type="bottom" id="upH-uS-qJA"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="6Da-Dg-8ff">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <label opaque="NO" userInteractionEnabled="NO" contentMode="left" horizontalHuggingPriority="251" verticalHuggingPriority="251" text="Name" textAlignment="natural" lineBreakMode="tailTruncation" baselineAdjustment="alignBaselines" adjustsFontSizeToFit="NO" translatesAutoresizingMaskIntoConstraints="NO" id="wV6-kN-qlT">
                                <rect key="frame" x="161.5" y="88" width="52" height="24"/>
                                <fontDescription key="fontDescription" style="UICTFontTextStyleTitle2"/>
                                <color key="textColor" red="0.0" green="0.0" blue="0.0" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                <nil key="highlightedColor"/>
                            </label>
                        </subviews>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <constraints>
                            <constraint firstItem="wV6-kN-qlT" firstAttribute="top" secondItem="ECV-cC-IjB" secondAttribute="bottom" constant="24" id="HqI-ak-Jyd"/>
                            <constraint firstItem="wV6-kN-qlT" firstAttribute="centerX" secondItem="6Da-Dg-8ff" secondAttribute="centerX" id="PQL-EF-eEO"/>
                        </constraints>
                    </view>
                    <navigationItem key="navigationItem" title="Name" id="9gh-DG-zHy"/>
                    <connections>
                        <outlet property="nameLabel" destination="wV6-kN-qlT" id="Gqg-p3-A5Z"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="hbZ-es-f9n" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="2054" y="534"/>
        </scene>
        <!--Navigation Controller-->
        <scene sceneID="VEB-09-E28">
            <objects>
                <navigationController storyboardIdentifier="NamesNavigationController" automaticallyAdjustsScrollViewInsets="NO" id="ixi-Kb-3wt" sceneMemberID="viewController">
                    <toolbarItems/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" id="Euv-gg-inV">
                        <rect key="frame" x="0.0" y="0.0" width="320" height="44"/>
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <nil name="viewControllers"/>
                    <connections>
                        <segue destination="Ath-di-zDx" kind="relationship" relationship="rootViewController" id="p8E-Fg-fS6"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="o7U-K2-Mfe" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="499" y="534"/>
        </scene>
    </scenes>
</document>
""".data(using: .utf8)!
