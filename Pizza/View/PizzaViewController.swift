//
//  PizzaViewController.swift
//  Pizza
//
//  Created by Alexandro Rodrigues on 18/06/21.
//

import UIKit

class PizzaViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    @IBOutlet weak var tableView: UITableView!
    
    let controller = PizzaController()

    override func viewDidLoad() {
        super.viewDidLoad()

        setupTableView()
        requestPizza()
        tableView.tableFooterView = UIView()
    }
    
    func setupTableView() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func requestPizza() {
        controller.requestPizzaList { [weak self] success in
            if success {
                self?.tableView.reloadData()
            }
        }
    }
    
    func goToPizzaDetail(indexPath: IndexPath) {
        if let vc = storyboard?.instantiateViewController(identifier: controller.pizzaDetailViewController) as? PizzaDetailViewController {
            vc.pizzaElement = controller.cellForRowAt(indexPath: indexPath)
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}

extension PizzaViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return controller.numberOfRowsInSection()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PizzaTableViewCell
        
        cell?.setupCell(pizzaElement: controller.cellForRowAt(indexPath: indexPath))
        
        return cell ?? UITableViewCell()
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        goToPizzaDetail(indexPath: indexPath)
    }

}
