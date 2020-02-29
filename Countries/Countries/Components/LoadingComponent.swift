//
//  LoadingComponent.swift
//  SLTColombia
//
//  Created by Juan David Lopera Lopez on 11/14/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit
@IBDesignable
class LoadingComponent: UIView {
    private var circle: CAShapeLayer!
    private var animations: CAAnimationGroup!
    private var shouldStart = false
    private var isAnimating = false

    private struct Angle {
        var start: CGFloat
        var end: CGFloat
    }
    private var angles: [Angle] = [
        Angle(start: CGFloat.pi * -3, end: CGFloat.pi * -11)
    ]
    //private

    // MARK: - VIEW
    override init(frame: CGRect) {
        super.init(frame: frame)
        isHidden = true
        backgroundColor = UIColor.clear
        DispatchQueue.main.async { self.inicializa() }
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        isHidden = true
        backgroundColor = UIColor.clear
        DispatchQueue.main.async { self.inicializa() }
    }

    fileprivate func inicializa() {
        guard circle == nil else { return }

        circle = CAShapeLayer()
        circle.frame = bounds
        circle.shouldRasterize = true
        circle.contentsScale = UIScreen.main.scale
        circle.rasterizationScale = UIScreen.main.scale
        circle.backgroundColor = nil
        circle.fillColor = nil//UIColor.red.cgColor
        circle.strokeColor = UIColor.white.cgColor
        circle.lineWidth = 3
        circle.lineCap = CAShapeLayerLineCap.round
        //layer.backgroundColor = UIColor.orange.cgColor

        // circle path
        let path = UIBezierPath()
        path.addArc(
            withCenter: CGPoint(x: frame.size.width / 2, y: frame.size.height / 2), radius: frame.size.width / 2,
            startAngle: -3 * CGFloat.pi / 4, endAngle: -11 * CGFloat.pi / 4, clockwise: false)
        circle.path = path.cgPath
        circle.strokeEnd = 0

        layer.addSublayer(circle)
        setupAnimation()
    }

    // MARK: - ANIMATION
    fileprivate func setupAnimation() {
        guard circle != nil, animations == nil else {
            inicializa()
            return
        }

        let duration: CFTimeInterval = 1.15

        // grow animation
        let growAni = CAKeyframeAnimation(keyPath: "strokeEnd")
        growAni.keyTimes = [0, 0.2, 0.5]
        growAni.values = [0, 0.6, 0.99]

        // erase animation
        let eraseAni = CAKeyframeAnimation(keyPath: "strokeStart")
        eraseAni.keyTimes = [0.51, 0.8, 1]
        eraseAni.values = [0, 0.5, 1]

        // alpha
        let alphaAni = CAKeyframeAnimation(keyPath: "opacity")
        alphaAni.keyTimes = [0.6, 0.85, 1]
        alphaAni.values = [0.9, 0.6, 0.15]

        // animation
        animations = CAAnimationGroup()
        animations.animations = [growAni, eraseAni, alphaAni]
        animations.timingFunction = CAMediaTimingFunction(name: CAMediaTimingFunctionName.linear)
        animations.duration = duration
        animations.repeatCount = HUGE
        animations.isRemovedOnCompletion = false

        if shouldStart {
            shouldStart = false
            startAnimating()
        }
    }

    open func startAnimating() {
        guard circle != nil, animations != nil else {
            shouldStart = true
            setupAnimation()
            return
        }
        guard !isAnimating else { return }

        isHidden = false
        isAnimating = true
        layer.speed = 1
        circle.add(animations, forKey: "animation")
    }

    open func stopAnimating() {
        guard circle != nil, animations != nil else { return }

        isHidden = true
        isAnimating = false
        layer.speed = 0

        circle.removeAnimation(forKey: "animation")
        circle.removeAllAnimations()
        circle.removeFromSuperlayer()
        circle = nil; animations = nil
    }
}
