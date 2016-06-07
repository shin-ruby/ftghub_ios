class LoginView < UIView
  attr_accessor :login_link, :sign_up_link

  def self.build_login_page
    login_view = LoginView.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    login_view.build_login_link
    login_view.build_sign_up_text
    login_view.build_sign_up_link
    login_view
  end

  def build_login_link
    @login_link = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @login_link.frame = [[20, 400], [325, 40]]
    @login_link.setTitle("login", forState: UIControlStateNormal)

    addSubview @login_link
  end


  def build_sign_up_text
    label = UILabel.alloc.init 
    label.frame = [[20, 440], [325, 40]]
    label.backgroundColor = UIColor.clearColor
    label.textColor = UIColor.grayColor
    label.font = label.font.fontWithSize(12)
    label.text = "还没注册！请点击"
    addSubview label
  end

  def build_sign_up_link
    @sign_up_link = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @sign_up_link.frame = [[100, 440], [325, 40]]
    @sign_up_link.titleLabel.font = UIFont.systemFontOfSize(12)
    @sign_up_link.setTitle('/注册/', forState:UIControlStateNormal)
    addSubview @sign_up_link
  end

end