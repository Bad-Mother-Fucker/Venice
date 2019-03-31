//
//  ScreenRecordingDetector.swift
//  CheckList2
//
//  Created by Michele De Sena on 16/03/2019.
//  Copyright © 2019 Michele De Sena. All rights reserved.
//

import Foundation
import UIKit


public class VNScreenObserver {
  


    static public let shared = VNScreenObserver()
    private init(){}


    private var observers: [VNScreenObserverDelegate] = []

    private var isRecording: Bool {
        for screen in UIScreen.screens {
            if #available(iOS 11.0, *) {
                if screen.isCaptured {
                    return true
                } else {
                    return false
                }

            }
        }
        return false
    }

    private var isMirroring: Bool {
        for screen in UIScreen.screens {
            if screen.isCaptured {
                return true
            } else {
                return false
            }
        }
        return false
    }


    public func addObserver(_ observer: VNScreenObserverDelegate) {
        observers.append(observer)
    }

    public func removeObserver(_ observer: VNScreenObserverDelegate) {
        if let index = observers.lastIndex(where: { return $0.isEqual(observer) }) {
              observers.remove(at: index)
        }   
    }

    private var lastRecordingState: Bool = false {
        didSet {
            if lastRecordingState {
                observers.forEach { $0.userDidStartRecordingScreen?() }
            } else {
                observers.forEach { $0.userDidFinishRecordingScreen?() }
            }
        }
    }

    private var lastMirroringState: Bool = false {
        didSet {
            if lastMirroringState {
                observers.forEach { $0.userDidStartMirroringScreen?() }
            } else {
                observers.forEach { $0.userDidFInishMirroringScreen?() }
            }
        }
    }


    public func startDetector() {
        guard checkRecordingTimer == nil else { return }
        checkRecordingTimer = Timer.scheduledTimer(withTimeInterval: 0.5, repeats: true) { (timer) in
            self.checkCurrentRecordingStatus()
        }
    }

    public func stopDetector() {
        checkRecordingTimer.invalidate()
        checkRecordingTimer = nil
    }


    private var checkRecordingTimer: Timer!

    private func checkCurrentRecordingStatus() {

        if lastRecordingState != isRecording {
            lastRecordingState = isRecording
        }

        if lastMirroringState != isMirroring {
            lastMirroringState = isMirroring
        }
    }

}
