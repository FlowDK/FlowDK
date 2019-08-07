import SnapKit

public class InputContainerView: UIView {
  public let contentView = UIView()
  public override init(frame: CGRect) {
    super.init(frame: frame)
    
    backgroundColor = .white
    layer.cornerRadius = 7
    layer.masksToBounds = true
    
    addSubviews(contentView)
    contentView.snp.makeConstraints { make in
      make.edges.equalToSuperview().inset(20)
    }
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
