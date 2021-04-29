//
//  ResultViewController.swift
//  SplitCalculator
//
//  Created by Felipe Amaral on 4/29/21.
//

import UIKit

class ResultViewController: UIViewController {

	var totalPerPerson: Float = 0
	var totalOfPersons: Int = 0
	var tip: Int = 0
	var captionText: String?

	@IBOutlet weak var captionLabel: UILabel!
	@IBOutlet weak var totalPerPersonLabel: UILabel!
	@IBOutlet weak var dismissButton: UIButton!

	@IBAction func dismissButtonPress(_ sender: UIButton) {
		dismiss(animated: true, completion: nil)
	}

	override func viewDidLoad() {
		super.viewDidLoad()
		dismissButton.layer.cornerRadius = 6
		print("Tip: \(tip)\nTotal Per Person: \(totalPerPerson)\nTotal Of Persons: \(totalOfPersons)")
		totalPerPersonLabel.text = String(format: "%.2f", totalPerPerson)
		captionLabel.text = "Split between \(totalOfPersons) people with a \(tip)% tip."
    }
}
