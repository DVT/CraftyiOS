//
//  SearchBeerTableViewController.swift
//  Crafty
//
//  Created by Justin Guedes on 04/03/2020.
//  Copyright © 2020 DVT. All rights reserved.
//

import UIKit

class SearchBeerTableViewController: UITableViewController {

    let beers = beerLibrary.beers
    let companies = beerLibrary.companies

    override func viewDidLoad() {
        super.viewDidLoad()
        navigationItem.largeTitleDisplayMode = .always
    }

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return beers.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "beer", for: indexPath) as? BeerTableViewCell else {
            fatalError()
        }

        let beer = beers[indexPath.row]
        let company = companies.first { $0.id == beer.companyId } ?? Company(id: "99", name: "Unknown")
        cell.configure(with: beer, and: company)
        return cell
    }

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let beer = beers[indexPath.row]
        let company = companies.first { $0.id == beer.companyId } ?? Company(id: "99", name: "Unknown")
        let beerViewController = UIStoryboard.beerViewController
        beerViewController.configure(with: beer, and: company)
        navigationController?.present(beerViewController, animated: true)
    }

}
