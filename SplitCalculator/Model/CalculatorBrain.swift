//
//  CalculatorBrain.swift
//  SplitCalculator
//
//  Created by Felipe Amaral on 4/29/21.
//

import UIKit

struct CalculatorBrain {
	var bill: Float = 0
	var tip : Int = 0
	var split: Int = 0
	var totalPerPerson: Float = 0

	mutating func calculate(bill: Float, tip: Int, split: Int) {
		self.bill = bill
		self.tip = tip
		self.split = split
		self.totalPerPerson = (bill + (bill / 100.0) * Float(tip)) / Float(split)
	}

	func getBill() -> Float {
		return bill
	}

	func getTip() -> Int {
		return tip
	}

	func getSplit() -> Int {
		return split
	}

	func getTotalPerPerson() -> Float {
		return totalPerPerson
	}
}
