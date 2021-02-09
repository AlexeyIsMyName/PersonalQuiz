//
//  ResultsViewController.swift
//  PersonalQuiz
//
//  Created by Alexey Efimov on 08.02.2021.
//

import UIKit

class ResultsViewController: UIViewController {

    @IBOutlet var mainResultLabel: UILabel!
    @IBOutlet var definitionResultLabel: UILabel!
    @IBOutlet var tabBarNavItem: UINavigationItem!
    
    var answersChoosen: [Answer]!
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        tabBarNavItem.hidesBackButton = true
        showResult()
    }
    
    private func showResult() {
        guard let answer = calculateAnswer() else {
            mainResultLabel.text = "🐙"
            definitionResultLabel.text = "Произошла ошибка. Пожалуйста, повторите опрос"
            return
        }
        
        mainResultLabel.text = "Вы - \(answer.rawValue)"
        definitionResultLabel.text = answer.definition
    }
    
    private func calculateAnswer() -> AnimalType? {
        var resultAnswer: AnimalType?
        
        var dog = 0
        var cat = 0
        var rabbit = 0
        var turtle = 0
        
        for answer in answersChoosen {
            switch answer.type {
            case .dog: dog += 1
            case .cat: cat += 1
            case .rabbit: rabbit += 1
            case .turtle: turtle += 1
            }
        }
        
        switch max(dog, cat, rabbit, turtle) {
        case dog: resultAnswer = .dog
        case cat: resultAnswer = .cat
        case rabbit: resultAnswer = .rabbit
        case turtle: resultAnswer = .turtle
        default: break
        }
        
        return resultAnswer
    }
}
