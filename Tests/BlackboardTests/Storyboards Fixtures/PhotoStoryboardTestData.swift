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

let PhotoStoryboardTestData = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="BpT-OW-KyL">
    <device id="retina4_7" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <deployment identifier="iOS"/>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
        <capability name="Safe area layout guides" minToolsVersion="9.0"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Photos-->
        <scene sceneID="v82-x0-XJV">
            <objects>
                <collectionViewController storyboardIdentifier="PhotoCollectionViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="IQH-Wi-39e" customClass="PhotosCollectionViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <collectionView key="view" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" id="P6C-IO-6Y1">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <collectionViewFlowLayout key="collectionViewLayout" minimumLineSpacing="1" minimumInteritemSpacing="1" id="8c2-cX-qV9">
                            <size key="itemSize" width="100" height="100"/>
                            <size key="headerReferenceSize" width="0.0" height="0.0"/>
                            <size key="footerReferenceSize" width="0.0" height="0.0"/>
                            <inset key="sectionInset" minX="0.0" minY="0.0" maxX="0.0" maxY="0.0"/>
                        </collectionViewFlowLayout>
                        <cells>
                            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Photo" id="55G-1C-Klg" customClass="PhotoCollectionViewCell" customModule="ExampleApp" customModuleProvider="target">
                                <rect key="frame" x="0.0" y="0.0" width="100" height="100"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" insetsLayoutMarginsFromSafeArea="NO">
                                    <rect key="frame" x="0.0" y="0.0" width="100" height="100"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                    <subviews>
                                        <imageView userInteractionEnabled="NO" contentMode="scaleToFill" horizontalHuggingPriority="251" verticalHuggingPriority="251" translatesAutoresizingMaskIntoConstraints="NO" id="fUh-lk-WTp">
                                            <rect key="frame" x="0.0" y="0.0" width="100" height="100"/>
                                        </imageView>
                                    </subviews>
                                </view>
                                <constraints>
                                    <constraint firstItem="fUh-lk-WTp" firstAttribute="leading" secondItem="55G-1C-Klg" secondAttribute="leading" id="0Zs-G2-Gfo"/>
                                    <constraint firstItem="fUh-lk-WTp" firstAttribute="top" secondItem="55G-1C-Klg" secondAttribute="top" id="XQm-0p-hgM"/>
                                    <constraint firstAttribute="trailing" secondItem="fUh-lk-WTp" secondAttribute="trailing" id="hkd-kH-2Kl"/>
                                    <constraint firstAttribute="bottom" secondItem="fUh-lk-WTp" secondAttribute="bottom" id="ttD-rn-E8m"/>
                                </constraints>
                                <connections>
                                    <outlet property="imageView" destination="fUh-lk-WTp" id="NjI-tq-fxI"/>
                                </connections>
                            </collectionViewCell>
                        </cells>
                        <connections>
                            <outlet property="dataSource" destination="IQH-Wi-39e" id="6nt-3U-6zD"/>
                            <outlet property="delegate" destination="IQH-Wi-39e" id="wgO-Wh-js2"/>
                        </connections>
                    </collectionView>
                    <navigationItem key="navigationItem" title="Photos" id="MMJ-mF-uKo">
                        <barButtonItem key="leftBarButtonItem" systemItem="done" id="vrl-bW-ihL">
                            <connections>
                                <action selector="dismiss" destination="IQH-Wi-39e" id="vLb-V5-pzA"/>
                            </connections>
                        </barButtonItem>
                    </navigationItem>
                    <connections>
                        <segue destination="W37-RY-jR3" kind="show" identifier="Show Photo" id="A3N-Ti-cUc"/>
                    </connections>
                </collectionViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="RM6-JB-9ZD" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1000.8" y="-444.82758620689657"/>
        </scene>
        <!--Photos Navigation Controller-->
        <scene sceneID="4aB-gV-3bP">
            <objects>
                <navigationController storyboardIdentifier="PhotoNavigationController" automaticallyAdjustsScrollViewInsets="NO" useStoryboardIdentifierAsRestorationIdentifier="YES" id="BpT-OW-KyL" customClass="PhotosNavigationController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <toolbarItems/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" insetsLayoutMarginsFromSafeArea="NO" id="Drl-N2-L6g">
                        <rect key="frame" x="0.0" y="20" width="375" height="44"/>
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <nil name="viewControllers"/>
                    <connections>
                        <segue destination="IQH-Wi-39e" kind="relationship" relationship="rootViewController" id="OF4-pk-E1r"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="KWG-FK-U4v" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="61.600000000000001" y="-444.82758620689657"/>
        </scene>
        <!--Photo-->
        <scene sceneID="4GH-e0-qfS">
            <objects>
                <viewController id="W37-RY-jR3" customClass="PhotoViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="5Eu-gW-xl3">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <imageView userInteractionEnabled="NO" contentMode="scaleAspectFit" horizontalHuggingPriority="251" verticalHuggingPriority="251" translatesAutoresizingMaskIntoConstraints="NO" id="zc9-bK-mEw">
                                <rect key="frame" x="0.0" y="64" width="375" height="603"/>
                            </imageView>
                        </subviews>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <constraints>
                            <constraint firstItem="zc9-bK-mEw" firstAttribute="top" secondItem="6EI-fO-PId" secondAttribute="top" id="5Kr-3A-weH"/>
                            <constraint firstItem="6EI-fO-PId" firstAttribute="trailing" secondItem="zc9-bK-mEw" secondAttribute="trailing" id="6Ed-SM-Cvz"/>
                            <constraint firstItem="6EI-fO-PId" firstAttribute="bottom" secondItem="zc9-bK-mEw" secondAttribute="bottom" id="PGT-G9-etw"/>
                            <constraint firstItem="zc9-bK-mEw" firstAttribute="leading" secondItem="6EI-fO-PId" secondAttribute="leading" id="iM3-hB-nbU"/>
                        </constraints>
                        <viewLayoutGuide key="safeArea" id="6EI-fO-PId"/>
                    </view>
                    <navigationItem key="navigationItem" title="Photo" id="8iT-t3-vjE"/>
                    <connections>
                        <outlet property="imageView" destination="zc9-bK-mEw" id="MNt-kz-YbX"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="SeI-3R-Cov" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1838" y="-445"/>
        </scene>
    </scenes>
    <color key="tintColor" name="Absolute Zero"/>
</document>

""".data(using: .utf8)!
