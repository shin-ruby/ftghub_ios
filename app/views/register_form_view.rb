class RegisterFormView < UIView

  def self.build_register_form
    register_form_view = RegisterFormView.alloc.initWithFrame(CGRectMake(10, 10, 500, 500))
    register_form_view.build_email
    register_form_view.build_username
    register_form_view.build_password
    register_form_view.build_password_confirmation
    register_form_view.build_register_button
  end

  def build_email
    @email = UITextField.alloc.initWithFrame([[20, 150], [325, 40]])
    @email.placeholder = 'email'
    @email.setBorderStyle(UITextBorderStyleRoundedRect)
    addSubview @email
  end

  def build_username
    @username = UITextField.alloc.initWithFrame([[20, 200], [325, 40]])
    @username.placeholder = 'username'
    @username.setBorderStyle(UITextBorderStyleRoundedRect)
    addSubview @username
  end

  def build_password
    @password = UITextField.alloc.initWithFrame([[20, 250], [325, 40]])
    @password.placeholder = 'passowrd'
    @password.secureTextEntry = true 
    @password.setBorderStyle(UITextBorderStyleRoundedRect)
    addSubview @password
  end

  def build_password_confirmation
    @password_confirmation = UITextField.alloc.initWithFrame([[20, 300], [325, 40]])
    @password_confirmation.placeholder = 'password confirmation'
    @password_confirmation.secureTextEntry = true
    @password_confirmation.setBorderStyle(UITextBorderStyleRoundedRect)
    addSubview @password_confirmation
  end

  def build_register_button
    @register_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @register_button.frame = [[20, 350], [325, 40]]
    @register_button.setTitle('Sign up', forState:UIControlStateNormal)
    addSubview @register_button
  end

end