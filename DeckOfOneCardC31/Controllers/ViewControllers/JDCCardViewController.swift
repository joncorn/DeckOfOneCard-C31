//
//  JDCCardViewController.swift
//  DeckOfOneCardC31
//
//  Created by Jon Corn on 1/28/20.
//  Copyright © 2020 Jon Corn. All rights reserved.
//

import UIKit

class JDCCardViewController: UIViewController {
    
    // MARK: - Outlets
    @IBOutlet weak var suitLabel: UILabel!
    @IBOutlet weak var cardImageView: UIImageView!
    @IBOutlet weak var cardDrawButton: UIButton!
    
    // MARK: - View Lifecycle
    override func viewDidLoad() {
        super.viewDidLoad()
        fetchCards()
    }
    
    // MARK: - Actions
    @IBAction func cardDrawButtonTapped(_ sender: Any) {
        fetchCards()
    }
    
    // MARK: - Methods
    
    func fetchCards() {
        JDCCardController.drawNewCard(1) { (cards) in
            if let cards = cards {
                JDCCardController.fetchCardImage(cards[0]) { (cardImage) in
                    DispatchQueue.main.async {
                        if let cardImage = cardImage {
                            self.updateViews(card: cards[0], image: cardImage)
                        }
                    }
                }
            }
        }
    }
    
    func updateViews(card: JDCCard, image: UIImage) {
        self.cardImageView.image = image
        self.suitLabel.text = card.suit
    }
}
