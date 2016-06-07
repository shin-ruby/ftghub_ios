class RegistersController < UIViewController 

  def viewDidLoad
    super 
    self.title = 'sign up'
    self.view.backgroundColor = UIColor.whiteColor
    @register_form = RegisterFormView.build_register_form
    self.view.addSubview(@register_form)

  end

end