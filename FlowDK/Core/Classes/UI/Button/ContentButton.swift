import SnapKit

open class ContentButton: Button {
  enum CornerType {
    case circle, rounded(CGFloat)
  }
  
  public var hasShadowView = true {
    didSet {
      shadowView.isHidden = !hasShadowView
    }
  }
  
  // MARK: - Configuration
  private let shadowImageViewOffset: CGFloat = 5
  var cornerType = CornerType.circle
  
  // MARK: - Views
  public lazy var shadowView = UIView()
  public let innerContentView = GhostView()
  
  private var shadowConstraint: Constraint?
  
  // MARK: - Init
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    contentView.addSubviews(shadowView, innerContentView)
    
    // Inner content
    innerContentView.backgroundColor = .white
    innerContentView.snp.makeConstraints { make in
      make.edges.equalTo(contentView)
    }
    
    // Shadow
    shadowView.isUserInteractionEnabled = false
    shadowView.backgroundColor = UIColor(0xCCCCCC)
    shadowView.snp.makeConstraints { make in
      shadowConstraint = make.top.equalTo(innerContentView).offset(shadowImageViewOffset).constraint
      make.height.equalTo(innerContentView)
      make.left.right.equalTo(innerContentView)
    }
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
  
  open override func layoutSubviews() {
    super.layoutSubviews()
    
    switch cornerType {
    case .circle:
      shadowView.layer.cornerRadius = contentView.bounds.height / 2
      innerContentView.layer.cornerRadius = contentView.bounds.height / 2
    case .rounded(let radius):
      shadowView.layer.cornerRadius = radius
      innerContentView.layer.cornerRadius = radius
    }
  }
  
  open override func update(_ animated: Bool = true) {
    super.update(animated)
    guard hasShadowView else { return }
    
    let offset: CGFloat = isCompressed ? 0 : self.shadowImageViewOffset
    UIView.animate(withDuration: animated ? 0.1 : 0) { [weak self] in
      guard let self = self else { return }
      self.shadowConstraint?.update(offset: offset)
      self.layoutIfNeeded()
    }
  }
}
