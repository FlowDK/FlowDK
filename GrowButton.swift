import SnapKit

public class GrowButton: GrowControl {
  public let label = UILabel()
  
  override init(frame: CGRect) {
    super.init(frame: frame)
    
    label.textColor = .black
    
    contentView.addSubview(label)
    label.snp.makeConstraints { make in
      make.left.right.equalTo(contentView).inset(50)
      make.top.bottom.equalTo(contentView).inset(20)
    }
  }
  
  required init?(coder aDecoder: NSCoder) {
    fatalError("init(coder:) has not been implemented")
  }
}
