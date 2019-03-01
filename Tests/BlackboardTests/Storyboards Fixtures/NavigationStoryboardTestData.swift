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

let NavigationStoryboardTestData = """
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
        <!--Menu View Controller-->
        <scene sceneID="EHC-zL-HMh">
            <objects>
                <viewController storyboardIdentifier="MenuViewController" id="ay4-NM-Ogo" customClass="MenuViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="SZy-4L-V77"/>
                        <viewControllerLayoutGuide type="bottom" id="BU0-xP-O6f"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="0lz-qV-q4q">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                    </view>
                    <navigationItem key="navigationItem" id="D8U-zS-7fy"/>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="QLO-hF-V1a" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="3054" y="60"/>
        </scene>
        <!--Welcome View Controller-->
        <scene sceneID="kn2-5C-siX">
            <objects>
                <viewController storyboardIdentifier="WelcomeViewController" id="asv-Ys-DVq" customClass="WelcomeViewController" sceneMemberID="viewController">
                    <layoutGuides>
                        <viewControllerLayoutGuide type="top" id="ZRf-qf-s4S"/>
                        <viewControllerLayoutGuide type="bottom" id="sM0-va-nwL"/>
                    </layoutGuides>
                    <view key="view" contentMode="scaleToFill" id="zJx-2Z-AYV">
                        <rect key="frame" x="0.0" y="0.0" width="375" height="667"/>
                        <autoresizingMask key="autoresizingMask" widthSizable="YES" heightSizable="YES"/>
                        <color key="backgroundColor" red="1" green="1" blue="1" alpha="1" colorSpace="custom" customColorSpace="sRGB"/>
                    </view>
                    <navigationItem key="navigationItem" id="xeG-eA-PeK"/>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                    <connections>
                        <segue destination="VfR-kH-ZWE" kind="show" identifier="ShowMenu" id="fqf-70-rqe"/>
                    </connections>
                </viewController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="c3R-ny-s3K" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="1422" y="61"/>
        </scene>
        <!--Navigation Controller-->
        <scene sceneID="e5W-gK-D8j">
            <objects>
                <navigationController storyboardIdentifier="MenuNavigationController" automaticallyAdjustsScrollViewInsets="NO" navigationBarHidden="YES" id="VfR-kH-ZWE" sceneMemberID="viewController">
                    <toolbarItems/>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" id="w6C-FY-Gwz">
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <nil name="viewControllers"/>
                    <connections>
                        <segue destination="ay4-NM-Ogo" kind="relationship" relationship="rootViewController" id="UjK-e4-kIf"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="Oq4-md-JnL" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="2231" y="60"/>
        </scene>
        <!--Navigation Controller-->
        <scene sceneID="JUO-Hr-FVI">
            <objects>
                <navigationController storyboardIdentifier="WelcomeNavigationController" automaticallyAdjustsScrollViewInsets="NO" navigationBarHidden="YES" id="usg-1a-MWg" sceneMemberID="viewController">
                    <toolbarItems/>
                    <nil key="simulatedStatusBarMetrics"/>
                    <nil key="simulatedTopBarMetrics"/>
                    <nil key="simulatedBottomBarMetrics"/>
                    <navigationBar key="navigationBar" contentMode="scaleToFill" id="k2d-aW-1tE">
                        <autoresizingMask key="autoresizingMask"/>
                    </navigationBar>
                    <nil name="viewControllers"/>
                    <connections>
                        <segue destination="asv-Ys-DVq" kind="relationship" relationship="rootViewController" id="aLQ-l0-CwS"/>
                    </connections>
                </navigationController>
                <placeholder placeholderIdentifier="IBFirstResponder" id="fhb-Dl-ccl" userLabel="First Responder" sceneMemberID="firstResponder"/>
            </objects>
            <point key="canvasLocation" x="626" y="60"/>
        </scene>
    </scenes>
</document>

""".data(using: .utf8)!
