import SnapKit

public class GrowControl: UIControl {
  public let contentView = UIView()
  
  override public var isHighlighted: Bool {
    didSet {
      if isHighlighted != oldValue {
        updateHighlighted()
      }
    }
  }
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    addSubview(contentView)

    contentView.isUserInteractionEnabled = false
    self.isUserInteractionEnabled = true

    contentView.snp.makeConstraints { make in
      make.edges.equalTo(self).inset(50)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  func updateHighlighted() {
    UIView.animate(withDuration: 0.1) { [weak self] in
      guard let self = self else { return }
      
      if self.isHighlighted {
        self.contentView.transform = CGAffineTransform(scaleX: 1.25, y: 1.25)
      } else {
        self.contentView.transform = CGAffineTransform.identity
      }
    }
  }
}
