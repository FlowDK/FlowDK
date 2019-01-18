import UIKit
import SnapKit

class Card: NSObject {
  var viewController: UIViewController!
  
  convenience init(viewController: UIViewController) {
    self.init()
    self.viewController = viewController
  }
  
  override init() {
    super.init()
  }
}

class CardsView: UIView {
  let backgroundViewContainer = UIView()
  
  var backgroundView: UIView? {
    didSet {
      backgroundView?.snp.removeConstraints()
      backgroundView?.removeFromSuperview()
      
      guard let backgroundView = backgroundView else { return }
      backgroundViewContainer.addSubview(backgroundView)
      backgroundView.snp.makeConstraints { make in
        make.edges.equalTo(backgroundViewContainer)
      }
    }
  }
  
  private var cards = Stack<Card>()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
  
    backgroundColor = .clear
    
    addSubviews(backgroundViewContainer)
    
    backgroundViewContainer.alpha = 0
    backgroundViewContainer.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func present(on view: UIView, cards: [Card], animated: Bool = true) {
    guard cards.count > 0 else { return }
    
    view.addSubviews(self)
    snp.makeConstraints { make in
      make.edges.equalTo(view)
    }
    
    showBackground(animated: animated) {
      self.showCards(cards: cards, animated: animated)
    }
  }
  
  func showCards(cards: [Card], animated: Bool, completion: (()->())? = nil) {
    for card in cards {
      showCard(card: card, animated: animated)
      
    }
  }
  
  func showCard(card: Card, animated: Bool, completion: (()->())? = nil) {
    self.cards.push(card)
  }
  
  func showBackground(animated: Bool, completion: (()->())? = nil) {
    UIView.animate(withDuration: 0.2, animations: {
      self.backgroundViewContainer.alpha = 1
    }) { _ in
      
    }
  }
}
