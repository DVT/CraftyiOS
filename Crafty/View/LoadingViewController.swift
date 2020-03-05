//
//  LoadingViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit
import QuartzCore

class LoadingViewController: UIViewController, CAAnimationDelegate {

    @IBOutlet weak var topLabel: UILabel!
    @IBOutlet weak var logoImageView: UIImageView!
    @IBOutlet weak var bottomLabel: UILabel!

    var destinationViewController: UIViewController?

    func setDestination(_ viewController: UIViewController, afterDelay delay: Double) {
        DispatchQueue.main.asyncAfter(deadline: DispatchTime.now() + delay) {
            self.destinationViewController = viewController
        }
    }

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        let randomIndex = Int(arc4random_uniform(UInt32(facts.count)))
        let randomFact = facts[randomIndex]
        topLabel.alpha = 0
        topLabel.text = randomFact.top
        bottomLabel.alpha = 0
        bottomLabel.text = randomFact.bottom
    }

    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        if destinationViewController != nil {
            navigateToDestination()
            return
        }

        animateView()
    }

    func animateView() {
        animateLogo()
        animateLabels()
    }

    func animateLogo() {
        let rotation = CASpringAnimation(keyPath: "transform.rotation")
        rotation.delegate = self
        rotation.fromValue = NSNumber(floatLiteral: 0)
        rotation.toValue = NSNumber(floatLiteral: Double.pi * 2)
        rotation.initialVelocity = 0.1
        rotation.damping = 5
        rotation.duration = 3
        rotation.isRemovedOnCompletion = true
        logoImageView.layer.add(rotation, forKey: "rotation")
    }

    func animateLabels() {
        UIView.animate(withDuration: 3) {
            self.topLabel.alpha = 1
            self.bottomLabel.alpha = 1
        }
    }

    func animationDidStop(_ anim: CAAnimation, finished flag: Bool) {
        navigateToDestination()
    }

    func navigateToDestination() {
        guard let destinationViewController = destinationViewController else {
            animateLogo()
            return
        }

        navigationController?.pushViewController(destinationViewController, animated: true)
    }

}
