class NoticesController < UIViewController 

  def init
    super 
    self.title = 'Notice'
    self
  end

  def viewDidLoad
    @login_page = LoginView.build_login_page
    @login_page.login_link.addTarget(self,
                 action: "goto_login",
                 forControlEvents: UIControlEventTouchUpInside)
    view.backgroundColor = UIColor.whiteColor

    self.view.addSubview(@login_page)
  end

  def goto_login
    sessions_controller = SessionsController.alloc.init
    self.navigationController.pushViewController(sessions_controller, animated:true)
  end

end