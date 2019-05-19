import UIKit

open class Button: UIControl {
  public var compressedScale: CGFloat = 0.9
  public var compressOnSelected = true
  public var animationDuration = 0.1
  
  public let contentView = GhostView()
  public var isCompressed: Bool {
    return isHighlighted || (isSelected && compressOnSelected)
  }
  
  // MARK: - Overrides
  open override var isHighlighted: Bool {
    didSet { update() }
  }
  
  open override var isSelected: Bool {
    didSet { update() }
  }
  
  
  // MARK: - Init
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    addTarget(self, action: #selector(touchUpInside), for: .touchUpInside)
    
    addSubview(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.equalTo(self)
    }
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  // MARK: - Lifecycle
  open func update(_ animated: Bool = true) {
    let scale: CGFloat = isCompressed ? compressedScale : 1.0
    
    UIView.animate(withDuration: animated ? animationDuration : 0) { [weak self] in
      guard let self = self else { return }
      self.contentView.transform = CGAffineTransform(scaleX: scale, y: scale)
    }
  }
  
  @objc
  private func touchUpInside() {
    Utilities.vibrate()
//    GameSoundManager.shared.play("button.wav")
  }
}
