//
//  MyBeerViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 05/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class MyBeerViewController: UIViewController {

    @IBOutlet weak var favoriteBeerCollectionView: UICollectionView!

    var user: User? = UserCenter.current

    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        user = UserCenter.current
        favoriteBeerCollectionView.reloadData()
    }

    @IBAction func signOutButtonTapped(_ sender: Any) {
        tabBarController?.navigationController?.popToRootViewController(animated: true)
    }

    @IBAction func deleteProfileButtonTapped(_ sender: Any) {
        UserCenter.clearUser()
        signOutButtonTapped(sender)
    }
}

extension MyBeerViewController: UICollectionViewDataSource {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return user?.favoriteBeer.count ?? 0
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        guard let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "favorite", for: indexPath) as? FavoriteBeerCollectionViewCell else {
            fatalError("Could not dequeue \(FavoriteBeerCollectionViewCell.self)!")
        }

        let beerId = user?.favoriteBeer[indexPath.row]
        guard let beer = beerLibrary.beers.first(where: { $0.id == beerId }) else {
            fatalError("Could not match beer ID [\(beerId ?? "")] to beer.")
        }

        cell.configure(with: beer.name)
        return cell
    }

}

extension MyBeerViewController: UICollectionViewDelegate {

    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        let beerId = user?.favoriteBeer[indexPath.row]
        guard let beer = beerLibrary.beers.first(where: { $0.id == beerId }) else {
            fatalError("Could not match beer ID [\(beerId ?? "")] to beer.")
        }

        let company = beerLibrary.companies.first { $0.id == beer.companyId } ?? Company(id: "99", name: "Unknown")
        let beerViewController = UIStoryboard.beerViewController
        beerViewController.configure(with: beer, and: company)
        navigationController?.present(beerViewController, animated: true)
    }

}
