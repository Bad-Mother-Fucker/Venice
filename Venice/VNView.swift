//
//  VNView.swift
//  Venice
//
//  Created by Michele De Sena on 29/03/2019.
//  Copyright © 2019 Michele De Sena. All rights reserved.
//

import UIKit

open class VNView: UIView, VNScreenObserverDelegate {

    private var screenRecordingDetector = VNScreenObserver.shared

    override public init(frame: CGRect) {
        super.init(frame: frame)
        screenRecordingDetector.addObserver(self)
        screenRecordingDetector.startDetector()
    }

    required public init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
         screenRecordingDetector.addObserver(self)
        screenRecordingDetector.startDetector()
    }


    open func startRecordingAction() {
        isHidden = true
    }

    open func stopRecordingAction() {
        isHidden = false
    }

    open func startMirroringAction() {
        isHidden = true
    }

    open func stopMirroringAction() {
        isHidden = false
    }


    func userDidFInishMirroringScreen() {
        stopMirroringAction()
    }

    func userDidStartMirroringScreen() {
        startMirroringAction()
    }

    
    @available (iOS 11.0,*)
    func userDidStartRecordingScreen() {
        startRecordingAction()
    }

    @available (iOS 11.0,*)
    func userDidFinishRecordingScreen() {
        stopRecordingAction()
    }


}


