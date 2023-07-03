//
//  ViewController.swift
//  increment
//
//  Created by Vivek Sehrawat on 27/06/23.
//

import UIKit
import Combine

class ViewController: UIViewController {
    
    @IBOutlet weak var label: UILabel!
    let counter = Counter()
    
//    let publisher = PassthroughSubject<Int, Never>()
    var subscriptions = Set<AnyCancellable>()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        bind()    }
    
    func bind() {
        counter.$value
                .map { $0 }
                .assign(to: \.text, on: label)
                .store(in: &subscriptions)

    }
    
    @IBAction func decrement(_ sender: Any) {
        counter.decrement()
    }
    
    @IBAction func increment(_ sender: Any) {
        counter.increment()
    }
}

class Counter {
    
    @Published private(set) var value: String = "0"
    private var current = 0
    func increment(){
        current += 1
        value = "\(current)"
    }
    
    func decrement(){
        current -= 1
        value = "\(current)"
    }
}
