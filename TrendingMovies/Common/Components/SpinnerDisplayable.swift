//
//  SpinnerDisplayable.swift
//  TrendingMovies
//
//  Created by El houssaine El GAMOUZ on 27/8/2024.
//

import UIKit

protocol SpinnerDisplayable: AnyObject {
    func ShowSpinner()
    func HideSpinner()
}

extension SpinnerDisplayable where Self: UIViewController {
    func ShowSpinner() {
        guard doesNotExistAnotherSpinner else { return }
        configureSpinner()
    }

    private func configureSpinner() {
        let containerView = UIView()
        containerView.tag =  ViewValues.tagIdentifierSpinner
        parentView.addSubview(containerView)
        containerView.fillSuperView()
        containerView.backgroundColor = .black.withAlphaComponent(ViewValues.opacityContainerSpinner)
        addSpinnerIndicatorToContainer(containerView: containerView)
    }

    private func addSpinnerIndicatorToContainer(containerView: UIView){
        let spinner = UIActivityIndicatorView(style: .large)
        spinner.startAnimating()
        containerView.addSubview(spinner)
        spinner.CenterXY()
    }

    func HideSpinner() {
        if let foundView = parentView.viewWithTag(ViewValues.tagIdentifierSpinner) {
            foundView.removeFromSuperview()
        }
    }

    private var doesNotExistAnotherSpinner: Bool {
        parentView.viewWithTag(ViewValues.tagIdentifierSpinner) == nil
    }

    private var parentView: UIView {
        navigationController?.view ?? view
    }
}
