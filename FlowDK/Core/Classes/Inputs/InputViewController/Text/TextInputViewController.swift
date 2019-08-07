import SnapKit

public class TextInputViewController: InputViewController<String> {
  lazy var textField: UITextField = {
    let textField = UITextField()
    textField.textColor = .black
    textField.layer.borderWidth = 0.5
    textField.layer.borderColor = UIColor.black.withAlphaComponent(0.2).cgColor
  
    return textField
  }()
  
  public override func viewDidLoad() {
    super.viewDidLoad()

    view.addSubviews(textField)
    textField.snp.makeConstraints { make in
      make.top.left.right.bottom.equalTo(view)
      make.height.equalTo(100)
    }
  }
  
  override func update() {
    super.update()
  
//    textField.placeholder = self.input?.placeholder
  }
}
