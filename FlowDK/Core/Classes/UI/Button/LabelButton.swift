import SnapKit

public class LabelButton: ContentButton {
  public let label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    innerContentView.addSubviews(label)
    
    label.textAlignment = .center
    label.textColor = UIColor(0xCCCCCC)
    label.font = UIFont.systemFont(ofSize: 16)
    label.snp.makeConstraints { make in
      make.top.bottom.equalTo(innerContentView).inset(10)
      make.left.right.equalTo(innerContentView).inset(15)
    }
  }
  
  public required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
