//
//  AboutViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class AboutViewController: UIPageViewController {

    var information: [Info] {
        return [
            Info(title: "Yee Old Beer!",
                 subtitle: "The first professional brewers were women.",
                 imageName: "logo",
                 description: """
Beer is stored in darker bottles as exposure to light will spoil the brew. In South Africa, green bottles are associated with premium beers, while in fact, these beers are prone to get "light struck". Brown bottles are better for beer.
"""),
            Info(title: "Still Under Construction",
                 imageName: "barrel",
                 description: "Took a break to crack a cold one with the boys."),
            Info(title: "About this App",
                 subtitle: "Made by Justin Guedes",
                 imageName: "barrel_front",
                 description: "Please feel free to comment... on the beer. Not the App!",
                 actionTitle: "Share",
                 actionCallback: {
                    let alertController = UIAlertController(title: "Thanks for Sharing!",
                                                            message: "We appreciate that more beer will be shared among everyone!",
                                                            preferredStyle: .alert)
                    let okAction = UIAlertAction(title: "Cheers!",
                                                 style: .default,
                                                 handler: nil)
                    alertController.addAction(okAction)
                    self.navigationController?.present(alertController, animated: true, completion: nil)
            })
        ]
    }

    lazy var infoViewControllers: [UIViewController] = {
        return self.information.compactMap { getViewController(for: $0) }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        dataSource = self
        setViewControllers([infoViewControllers[0]], direction: .forward, animated: true, completion: nil)
        view.backgroundColor = UIColor(named: "background")
    }

    func getViewController(for info: Info) -> InfoViewController {
        let infoViewController = UIStoryboard.infoViewController
        infoViewController.configure(with: info)
        return infoViewController
    }

}

extension AboutViewController: UIPageViewControllerDataSource {

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = infoViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let previousIndex = viewControllerIndex - 1

        guard previousIndex >= 0 else {
            return nil
        }

        guard infoViewControllers.count > previousIndex else {
            return nil
        }

        return infoViewControllers[previousIndex]
    }

    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = infoViewControllers.firstIndex(of: viewController) else {
            return nil
        }

        let nextIndex = viewControllerIndex + 1
        let infoViewControllerssCount = infoViewControllers.count

        guard infoViewControllerssCount != nextIndex else {
            return nil
        }

        guard infoViewControllerssCount > nextIndex else {
            return nil
        }

        return infoViewControllers[nextIndex]
    }

    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return infoViewControllers.count
    }

    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let viewController = pageViewController.viewControllers?.first,
            let viewControllerIndex = infoViewControllers.firstIndex(of: viewController) else {
            return -1
        }

        return viewControllerIndex
    }

}
