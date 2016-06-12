class UsersController < UIViewController

  def init
    super 
    self.title = 'User'
    self
  end

  def viewDidLoad
    super 
    if App::Persistence['authentication_token'].nil?
      show_login_page
    else
      add_users
      logout_button
      @logout_button.addTarget(self, action:"logout", forControlEvents:UIControlEventTouchUpInside)
    end
    
    view.backgroundColor = UIColor.whiteColor
  end

  def add_users
    User.recent do |users|
      @label = UILabel.alloc.init
      @label.frame = [[150, 150], [250, 30]]
      @label.text = users.profile.name
      view.addSubview(@label)
    end
  end

  def logout_button
    @logout_button = UIButton.buttonWithType(UIButtonTypeRoundedRect)
    @logout_button.frame = [[20, 250], [325, 40]]
    @logout_button.setTitle('logout', forState:UIControlStateNormal)
    view.addSubview @logout_button
  end

  def show_login_page
    @login_page = LoginView.build_login_page
    @login_page.login_link.addTarget(self,
                 action: "goto_login",
                 forControlEvents: UIControlEventTouchUpInside)

    @login_page.sign_up_link.addTarget(self, action: "goto_register", forControlEvents: UIControlEventTouchUpInside)
    view.backgroundColor = UIColor.whiteColor

    self.view.addSubview(@login_page)
  end

  def goto_login
    sessions_controller = SessionsController.alloc.init
    self.navigationController.pushViewController(sessions_controller, animated:true)
  end

  def goto_register
    registers_controller = RegistersController.alloc.init
    self.navigationController.pushViewController(registers_controller, animated:true)
  end

  def logout
    App::Persistence['email'] = nil
    App::Persistence['authentication_token'] = nil
  end

end