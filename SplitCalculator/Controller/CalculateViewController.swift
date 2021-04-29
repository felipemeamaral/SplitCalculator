//
//  ViewController.swift
//  SplitCalculator
//
//  Created by Felipe Amaral on 4/29/21.
//

import UIKit

class CalculateViewController: UIViewController {

	var tip: Int = 0
	var bill: Float = 0
	var split: Int = 0

	var calculator = CalculatorBrain()

	@IBOutlet weak var billTextField: UITextField!
	@IBOutlet weak var stepperLabel: UILabel!
	@IBOutlet weak var splitStepper: UIStepper!
	@IBOutlet weak var zeroPercentView: UIView!
	@IBOutlet weak var tenPercentView: UIView!
	@IBOutlet weak var twentyPercentView: UIView!
	@IBOutlet weak var zeroPercentLabel: UILabel!
	@IBOutlet weak var tenPercentLabel: UILabel!
	@IBOutlet weak var twentyPercentLabel: UILabel!
	@IBOutlet weak var calculateButton: UIButton!

	@IBAction func calculateButtonPressed(_ sender: UIButton) {
		bill = NSString(string: billTextField.text ?? "0").floatValue
		calculator.calculate(bill: bill, tip: tip, split: Int(splitStepper.value))
		bill = calculator.getBill()
	}

	@IBAction func PercentButtonPressed(_ sender: UIButton) {
		switch sender.titleLabel?.text {
		case "0":
			tip = 0
			zeroPercentView.backgroundColor = .systemGreen
			zeroPercentView.layer.cornerRadius = 6
			tenPercentView.backgroundColor = .clear
			twentyPercentView.backgroundColor = .clear
			zeroPercentLabel.textColor = .white
			tenPercentLabel.textColor = .systemGreen
			twentyPercentLabel.textColor = .systemGreen
		case "10":
			tip = 10
			zeroPercentView.backgroundColor = .clear
			tenPercentView.backgroundColor = .systemGreen
			tenPercentView.layer.cornerRadius = 6
			twentyPercentView.backgroundColor = .clear
			zeroPercentLabel.textColor = .systemGreen
			tenPercentLabel.textColor = .white
			twentyPercentLabel.textColor = .systemGreen
		case "20":
			tip = 20
			zeroPercentView.backgroundColor = .clear
			tenPercentView.backgroundColor = .clear
			twentyPercentView.backgroundColor = .systemGreen
			twentyPercentView.layer.cornerRadius = 6
			zeroPercentLabel.textColor = .systemGreen
			tenPercentLabel.textColor = .systemGreen
			twentyPercentLabel.textColor = .white
		default:
			tip = 0
			zeroPercentView.backgroundColor = .systemGreen
			zeroPercentLabel.textColor = .white
		}
	}

	@IBAction func splitStepperValueChanged(_ sender: UIStepper) {
		stepperLabel.text = String(Int(splitStepper.value))
		split = Int(splitStepper.value)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		self.stepperLabel.text = String(Int(splitStepper.value))
		calculateButton.layer.cornerRadius = 6
	}

	override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
		if segue.identifier == "showTotalSegue" {
			let resultVC = segue.destination as! ResultViewController
			resultVC.tip = calculator.getTip()
			resultVC.totalPerPerson = calculator.getTotalPerPerson()
			resultVC.totalOfPersons = calculator.getSplit()
		}
	}

}

