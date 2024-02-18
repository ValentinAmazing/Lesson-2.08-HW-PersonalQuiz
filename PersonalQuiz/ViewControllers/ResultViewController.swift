//
//  ResultViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 12.02.2024.
//

import UIKit

final class ResultViewController: UIViewController {

    @IBOutlet weak var youAreLabel: UILabel!
    @IBOutlet weak var definitionLabel: UILabel!
    

    var answers: [Answer]! //массив с ответами
    
    override func viewDidLoad() {
        super.viewDidLoad()

        self.navigationItem.setHidesBackButton(true, animated: false) //прячем кнопку возврата
        
        let prediction = predict() //определяем по ответам кто он
        
        youAreLabel.text = "Вы - \(prediction.rawValue)"
        definitionLabel.text = prediction.definition
    }
    
    @IBAction func doneButtonAction(_ sender: UIBarButtonItem) {
        dismiss(animated: true)
    }
    
    private func predict() -> Animal {
        var animalCount = [Animal : Int]()
        
        animalCount[Animal.cat] = 0
        animalCount[Animal.dog] = 0
        animalCount[Animal.turtle] = 0
        animalCount[Animal.rabbit] = 0
        
        answers.forEach {
            switch $0.animal {
            case .cat:
                animalCount[.cat]? += 1
            case .dog:
                animalCount[.dog]? += 1
            case .turtle:
                animalCount[.turtle]? += 1
            case .rabbit:
                animalCount[.rabbit]? += 1
            }
        }
        
        let sortedAnimalCount = animalCount.sorted(by: { $0.value > $1.value } )

        return sortedAnimalCount[0].key
    }
    
    deinit {
        print("\(type(of: self)) has been deallocated")
    }
}
