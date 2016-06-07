class NoticesController < UIViewController 

  def init
    super 
    self.title = 'Notice'
    self
  end

  def viewDidLoad
    if App::Persistence['authentication_token'].nil?
      show_login_page
    else
      alert = UIAlertView.new
      alert.message = "Hello World!"
      alert.show
    end
    
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

end