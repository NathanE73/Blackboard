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

let CollectionStoryboardTestData = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" colorMatched="YES">
    <device id="retina4_7" orientation="portrait">
        <adaptation id="fullscreen"/>
    </device>
    <dependencies>
        <plugIn identifier="com.apple.InterfaceBuilder.IBCocoaTouchPlugin" version="14460.20"/>
        <capability name="documents saved in the Xcode 8 format" minToolsVersion="8.0"/>
    </dependencies>
    <scenes>
        <!--Collection View Controller-->
        <scene sceneID="39C-mK-OjC">
            <objects>
                <collectionViewController id="1Bc-dh-hC7" customClass="CollectionViewController" sceneMemberID="viewController">
                    <collectionView key="view" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" dataMode="prototypes" id="Mjz-JA-owd">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <collectionViewFlowLayout key="collectionViewLayout" minimumLineSpacing="10" minimumInteritemSpacing="10" id="1CJ-XS-i39">
                            <size key="itemSize" width="60" height="60"/>
                            <size key="headerReferenceSize" width="0.0" height="0.0"/>
                            <size key="footerReferenceSize" width="0.0" height="0.0"/>
                            <inset key="sectionInset" minX="0.0" minY="0.0" maxX="0.0" maxY="0.0"/>
                        </collectionViewFlowLayout>
                        <cells>
                            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Red" id="cHC-Sw-7zu" customClass="RedCollectionViewCell">
                                <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                    <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                </view>
                                <color key="backgroundColor" red="0.94117647058823528" green="0.25098039215686274" blue="0.25098039215686274" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                            </collectionViewCell>
                            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Green" id="4Kc-Ty-PqG" customClass="GreenCollectionViewCell">
                                <rect key="frame" x="79" y="0.0" width="60" height="60"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                    <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                </view>
                                <color key="backgroundColor" red="0.25098039215686274" green="0.94117647058823528" blue="0.25098039215686274" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                            </collectionViewCell>
                            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Blue" id="u2X-te-Jrh" customClass="BlueCollectionViewCell">
                                <rect key="frame" x="157.5" y="0.0" width="60" height="60"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                    <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                </view>
                                <color key="backgroundColor" red="0.25098039215686274" green="0.25098039215686274" blue="0.94117647058823528" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                            </collectionViewCell>
                        </cells>
                        <connections>
                            <outlet property="dataSource" destination="1Bc-dh-hC7" id="yuz-7e-cIR"/>
                            <outlet property="delegate" destination="1Bc-dh-hC7" id="UoQ-Wq-S5T"/>
                        </connections>
                    </collectionView>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                </collectionViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="CmU-xQ-nd1" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="255" y="486"/>
        </scene>
        <!--View Controller-->
        <scene sceneID="AE9-hz-x1y">
            <objects>
                <viewController id="NOn-MJ-fAW" customClass="ViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="hcT-7u-tmn"/>
                        <viewControllerLayoutGuide type="bottom" id="xWf-Qq-8Uz"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="Io8-Au-hUR">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <subviews>
                            <collectionView clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" dataMode="prototypes" translatesAutoresizingMaskIntoConstraints="NO" id="E1p-Tf-5bx">
                                <rect key="frame" x="0.0" y="20" width="375" height="647"/>
                                <collectionViewFlowLayout key="collectionViewLayout" minimumLineSpacing="10" minimumInteritemSpacing="10" id="z0k-uz-XoL">
                                    <size key="itemSize" width="60" height="60"/>
                                    <size key="headerReferenceSize" width="0.0" height="0.0"/>
                                    <size key="footerReferenceSize" width="0.0" height="0.0"/>
                                    <inset key="sectionInset" minX="0.0" minY="0.0" maxX="0.0" maxY="0.0"/>
                                </collectionViewFlowLayout>
                                <cells>
                                    <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="red cell" id="gUC-1q-7YR" customClass="RedCollectionViewCell">
                                        <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                        <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                        <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                            <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                        </view>
                                        <color key="backgroundColor" red="0.94117647059999998" green="0.25098039220000001" blue="0.25098039220000001" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                    </collectionViewCell>
                                    <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="green cell" id="hhf-XD-eat" customClass="GreenCollectionViewCell">
                                        <rect key="frame" x="79" y="0.0" width="60" height="60"/>
                                        <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                        <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                            <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                        </view>
                                        <color key="backgroundColor" red="0.25098039220000001" green="0.94117647059999998" blue="0.25098039220000001" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                    </collectionViewCell>
                                    <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="blue cell" id="o41-oJ-GoD" customClass="BlueCollectionViewCell">
                                        <rect key="frame" x="157.5" y="0.0" width="60" height="60"/>
                                        <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                        <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center">
                                            <rect key="frame" x="0.0" y="0.0" width="60" height="60"/>
                                            <autoresizingMask key="autoresizingMask"/>
                                        </view>
                                        <color key="backgroundColor" red="0.25098039220000001" green="0.25098039220000001" blue="0.94117647059999998" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                                    </collectionViewCell>
                                </cells>
                            </collectionView>
                        </subviews>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                        <constraints>
                            <constraint firstItem="E1p-Tf-5bx" firstAttribute="top" secondItem="hcT-7u-tmn" secondAttribute="bottom" id="G1d-XI-fCc"/>
                            <constraint firstItem="E1p-Tf-5bx" firstAttribute="leading" secondItem="Io8-Au-hUR" secondAttribute="leading" id="Pzt-aB-0oy"/>
                            <constraint firstItem="xWf-Qq-8Uz" firstAttribute="top" secondItem="E1p-Tf-5bx" secondAttribute="bottom" id="a9y-KV-iC8"/>
                            <constraint firstAttribute="trailing" secondItem="E1p-Tf-5bx" secondAttribute="trailing" id="ikv-58-I6T"/>
                        </constraints>
                    </view>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="kK0-vQ-CL5" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="986" y="487"/>
        </scene>
    </scenes>
</document>

""".data(using: .utf8)!
