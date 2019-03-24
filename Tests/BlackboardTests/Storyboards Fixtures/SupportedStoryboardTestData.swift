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

let SupportedStoryboardTestData = """
<?xml version="1.0" encoding="UTF-8"?>
<document type="com.apple.InterfaceBuilder3.CocoaTouch.Storyboard.XIB" version="3.0" toolsVersion="14460.31" targetRuntime="iOS.CocoaTouch" propertyAccessControl="none" useAutolayout="YES" useTraitCollections="YES" useSafeAreas="YES" colorMatched="YES" initialViewController="c7B-w5-QBM">
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
        <!--Item-->
        <scene sceneID="7rK-LF-43p">
            <objects>
                <tableViewController storyboardIdentifier="EmptyTableViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="Ixr-Bv-bcc" customClass="EmptyTableViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <tableView key="view" clipsSubviews="YES" contentMode="scaleToFill" alwaysBounceVertical="YES" dataMode="prototypes" style="plain" separatorStyle="default" rowHeight="-1" estimatedRowHeight="-1" sectionHeaderHeight="28" sectionFooterHeight="28" id="Rbn-Rr-2BM">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <prototypes>
                            <tableViewCell clipsSubviews="YES" contentMode="scaleToFill" preservesSuperviewLayoutMargins="YES" selectionStyle="default" indentationWidth="10" reuseIdentifier="Cell" id="kr8-cC-8UF">
                                <rect key="frame" x="0.0" y="28" width="375" height="44"/>
                                <autoresizingMask key="autoresizingMask"/>
                                <tableViewCellContentView key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" preservesSuperviewLayoutMargins="YES" insetsLayoutMarginsFromSafeArea="NO" tableViewCell="kr8-cC-8UF" id="HPT-fM-iWc">
                                    <rect key="frame" x="0.0" y="0.0" width="375" height="43.5"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                </tableViewCellContentView>
                            </tableViewCell>
                        </prototypes>
                        <connections>
                            <outlet property="dataSource" destination="Ixr-Bv-bcc" id="pFb-xT-qZX"/>
                            <outlet property="delegate" destination="Ixr-Bv-bcc" id="e5F-95-uwH"/>
                        </connections>
                    </tableView>
                    <tabBarItem key="tabBarItem" title="Item" id="04q-Qa-7Kg"/>
                </tableViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="CDz-UX-0WD" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-215" y="1600"/>
        </scene>
        <!--Empty Tab Bar Controller-->
        <scene sceneID="sp3-Bw-h1Q">
            <objects>
                <tabBarController storyboardIdentifier="EmptyTabBarController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="c7B-w5-QBM" customClass="EmptyTabBarController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <tabBar key="tabBar" contentMode="scaleToFill" insetsLayoutMarginsFromSafeArea="NO" id="Lpk-4V-X31">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="49"/>
                        <autoresizingMask key="autoresizingMask"/>
                        <color key="backgroundColor" white="0.0" alpha="0.0" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                    </tabBar>
                    <connections>
                        <segue destination="iLS-3K-BVg" kind="relationship" relationship="viewControllers" id="hQ6-Yy-O1X"/>
                        <segue destination="6l3-v0-rzR" kind="relationship" relationship="viewControllers" id="h4l-lD-7av"/>
                        <segue destination="Ixr-Bv-bcc" kind="relationship" relationship="viewControllers" id="V8v-gX-OL6"/>
                        <segue destination="bAc-bO-Dys" kind="relationship" relationship="viewControllers" id="DVQ-dl-0ar"/>
                    </connections>
                </tabBarController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="kvF-G8-n4u" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-2303" y="1185"/>
        </scene>
        <!--Item-->
        <scene sceneID="fPz-NG-d7M">
            <objects>
                <pageViewController storyboardIdentifier="EmptyPageViewController" autoresizesArchivedViewToFullSize="NO" useStoryboardIdentifierAsRestorationIdentifier="YES" transitionStyle="pageCurl" navigationOrientation="horizontal" spineLocation="min" id="bAc-bO-Dys" customClass="EmptyPageViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <tabBarItem key="tabBarItem" title="Item" id="3Si-Jd-vgm"/>
                </pageViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="JB1-hs-ipX" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-1178" y="1972"/>
        </scene>
        <!--Item-->
        <scene sceneID="F52-xh-su9">
            <objects>
                <collectionViewController storyboardIdentifier="EmptyCollectionViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="6l3-v0-rzR" customClass="EmptyCollectionViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <collectionView key="view" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="scaleToFill" dataMode="prototypes" id="w9C-cU-nm4">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <collectionViewFlowLayout key="collectionViewLayout" minimumLineSpacing="10" minimumInteritemSpacing="10" id="6eL-kg-fLG">
                            <size key="itemSize" width="50" height="50"/>
                            <size key="headerReferenceSize" width="0.0" height="0.0"/>
                            <size key="footerReferenceSize" width="0.0" height="0.0"/>
                            <inset key="sectionInset" minX="0.0" minY="0.0" maxX="0.0" maxY="0.0"/>
                        </collectionViewFlowLayout>
                        <cells>
                            <collectionViewCell opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" reuseIdentifier="Cell" id="gpg-4E-IOR">
                                <rect key="frame" x="0.0" y="0.0" width="50" height="50"/>
                                <autoresizingMask key="autoresizingMask" flexibleMaxX="YES" flexibleMaxY="YES"/>
                                <view key="contentView" opaque="NO" clipsSubviews="YES" multipleTouchEnabled="YES" contentMode="center" insetsLayoutMarginsFromSafeArea="NO">
                                    <rect key="frame" x="0.0" y="0.0" width="50" height="50"/>
                                    <autoresizingMask key="autoresizingMask"/>
                                </view>
                            </collectionViewCell>
                        </cells>
                        <connections>
                            <outlet property="dataSource" destination="6l3-v0-rzR" id="SOb-c4-SCN"/>
                            <outlet property="delegate" destination="6l3-v0-rzR" id="uWe-tz-7wx"/>
                        </connections>
                    </collectionView>
                    <tabBarItem key="tabBarItem" title="Item" id="XNS-a9-dN8"/>
                </collectionViewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="hZ9-cD-KKl" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-1178" y="966"/>
        </scene>
        <!--Item-->
        <scene sceneID="QRL-aB-iN0">
            <objects>
                <navigationController storyboardIdentifier="EmptyNavigationController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="iLS-3K-BVg" customClass="EmptyNavigationController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <tabBarItem key="tabBarItem" title="Item" id="7Ob-Oi-olw"/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" insetsLayoutMarginsFromSafeArea="NO" id="B0Z-im-Hwr">
                        <rect key="frame" x="0.0" y="20" width="375" height="44"/>
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <connections>
                        <segue destination="8ij-ji-OAz" kind="relationship" relationship="rootViewController" id="ezy-Oh-t2b"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="9jf-Ez-NrR" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-1178" y="209"/>
        </scene>
        <!--Empty View Controller-->
        <scene sceneID="WuZ-3b-crf">
            <objects>
                <viewController storyboardIdentifier="EmptyViewController" useStoryboardIdentifierAsRestorationIdentifier="YES" id="8ij-ji-OAz" customClass="EmptyViewController" customModule="ExampleApp" customModuleProvider="target" sceneMemberID="viewController">
                    <view key="view" contentMode="scaleToFill" id="TWU-td-mYx">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" white="1" alpha="1" colorSpace="custom" customColorSpace="genericGamma22GrayColorSpace"/>
                        <viewLayoutGuide key="safeArea" id="C8d-hT-kAF"/>
                    </view>
                    <navigationItem key="navigationItem" id="VEf-fC-Xtg"/>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="IAZ-gG-FId" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="-215" y="208"/>
        </scene>
    </scenes>
</document>

""".data(using: .utf8)!
