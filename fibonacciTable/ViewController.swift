//
//  ViewController.swift
//  fibonacciTable
//
//  Created by Алексей Попроцкий on 12.09.2022.
//

import UIKit

class ViewController: UIViewController {


    
    let tableView: UITableView = {
        let tableView = UITableView()
        tableView.register(Cell.self, forCellReuseIdentifier: Cell.identifier)
        tableView.translatesAutoresizingMaskIntoConstraints = false
        
        return tableView
    }()
    
    var arrayFibonacci: [Float64] = []
    var arrayForLbl: [[Float64]] = []

    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        arrayFibonacci = FibonacciGenerator.fibonacciSequence(numSteps: FibonacciGenerator.numSteps,
                                                              sequenceForInitial: FibonacciGenerator.selectInitialNumbers)
        splitArrayFibonacciOneLblBetweenTwoLbl()
        
        tableView.delegate = self
        tableView.dataSource = self
        setupView()
        setupConstraints()
    }

    
    func splitArrayFibonacciOneLblBetweenTwoLbl() {
        var k = 0
        for i in 0...(arrayFibonacci.count - 1)/2 {
            arrayForLbl.append([arrayFibonacci[i+k], arrayFibonacci[i+k+1]])
            k += 1
        }
    }
    
    func getMoreFibonacci(indexPath: IndexPath) {
        
        if indexPath.row == (arrayForLbl.count-1)/2 {
            arrayFibonacci = FibonacciGenerator.fibonacciSequence(numSteps: FibonacciGenerator.numSteps,
                                                                  sequenceForInitial: FibonacciGenerator.selectInitialNumbers)
        }

        if indexPath.row == arrayForLbl.count-1 {
            splitArrayFibonacciOneLblBetweenTwoLbl()
            tableView.reloadData()
        }
    }
    
    
    
    func setupView() {
        view.backgroundColor = #colorLiteral(red: 0.9725490196, green: 0.9764705882, blue: 0.9843137255, alpha: 1)
        view.addSubview(tableView)
    }

    func setupConstraints() {
        tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
    }
}


extension ViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        arrayForLbl.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        getMoreFibonacci(indexPath: indexPath)
        let cell = tableView.dequeueReusableCell(withIdentifier: Cell.identifier, for: indexPath) as! Cell
        
        cell.setupColorCell(indexPath: indexPath)
        
        cell.lblOne.text = String(arrayForLbl[indexPath.row][0])
        cell.lblTwo.text = String(arrayForLbl[indexPath.row][1])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        45
    }
    
    func indexTwo(indexPath: IndexPath) -> Int {
        indexPath.row + 1
    }
}
