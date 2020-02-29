//
//  LoadingView.swift
//  SLTColombia
//
//  Created by Juan David Lopera Lopez on 11/14/19.
//  Copyright © 2019 Juan David Lopera Lopez. All rights reserved.
//

import UIKit

class LoadingView: UIView {

    //MARK:- Properties
    private var backgroundView: UIView?
    private var loadingComponent: LoadingComponent?
    private var loadingText: UILabel?

    init(inView: UIView) {
        super.init(frame: inView.frame)
        inView.addSubview(self)
        createLoadingView()
    }

    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }

    func removeLoadingView() {
        self.removeFromSuperview()
    }

    private func createLoadingView() {
        self.backgroundColor = .clear
        backgroundView = UIView(frame: self.frame)
        backgroundView?.backgroundColor = .gray
        backgroundView?.alpha = 0.5
        addSubview(backgroundView ?? UIView(frame: .zero))
        let loadingComponentFrame = CGRect(x: self.center.x - 20, y: self.center.y - 2, width: 40.0, height: 40.0)
        loadingComponent = LoadingComponent(frame: loadingComponentFrame)
        addSubview(loadingComponent ?? UIView(frame: .zero))
        let loadingTextFrame = CGRect(x: 20, y: self.center.y + 40, width: frame.width - 40, height: 30.0)
        loadingText = UILabel(frame: loadingTextFrame)
        loadingText?.text = "Loading"
        loadingText?.font = UIFont.boldSystemFont(ofSize: 15)
        loadingText?.textColor = .black
        loadingText?.textAlignment = .center
        addSubview(loadingText ?? UIView(frame: .zero))
    }

    func isLoading(_ bool: Bool) {
        guard let backgroundView = backgroundView, let loadingComponent = loadingComponent, let loadingText = loadingText else {
            print("=======  Error in Loading  ========")
            return
        }
        self.isHidden = bool ? false : true
        self.alpha = bool ? 1.0 : 0.0
        backgroundView.alpha = bool ? 0.5 : 0.0
        backgroundView.isHidden = bool ? false : true
        loadingComponent.alpha = bool ? 0.5 : 0.0
        loadingComponent.isHidden = bool ? false : true
        loadingText.alpha = bool ? 0.5 : 0.0
        loadingText.isHidden = bool ? false : true
        switch bool {
        case true:
            loadingComponent.startAnimating()
        case false:
            loadingComponent.stopAnimating()
        }
    }
}
