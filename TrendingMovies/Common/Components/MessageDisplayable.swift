//
//  MessageDisplayable.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

import UIKit

protocol MessageDisplayable {}

extension MessageDisplayable where Self: UIViewController {
    func presentAlert(Message: String,title: String) {
        let alertController = UIAlertController(title: title,
                                                message: Message,
                                                preferredStyle: .alert)
        let okAction = UIAlertAction(title: AppLocalized.okButton, style: .default)
        alertController.addAction(okAction)
        self.present(alertController, animated: true)
    }
}
