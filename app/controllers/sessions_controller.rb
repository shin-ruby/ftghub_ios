class SessionsController < UIViewController 

  def viewDidLoad
    super 
    self.title = 'Login'
    self.view.backgroundColor = UIColor.whiteColor 

    @login_form = LoginFormView.build_login_form
    @login_form.login_button.addTarget(self, action:"login", forControlEvents:UIControlEventTouchUpInside)

    self.view.addSubview(@login_form)
  end

  def login
    unless @login_form.email.text.empty? && @login_form.password.text.empty?
      api_client.token(@login_form.email.text, @login_form.password.text) do |result|
        if result['authentication_token']
          @user = User.new("email" => @login_form.email.text, "authentication_token" => result['authentication_token'])
          save_token(@user.email, @user.authentication_token)
          display_message "Welcome", "Welcome#{@login_form.email.text}."
        else
          display_message "Error", "Invalid Credentials."
        end
      end
    else
      alert = UIAlertView.alloc.initWithTitle "Invalid information", message:"Invalid email/password combination",
      delegate: nil, cancelButtonTitle: "cancel", otherButtonTitles: nil

      alert.show

    end
  end

  def display_message(title, message)
    alert_box = UIAlertView.alloc.initWithTitle(title, message: message, delegate: nil, cancelButtonTitle: "Ok", otherButtonTitles:nil)
    alert_box.show
  end

  def api_client
    @api_client ||= ApiClient.new
  end

  # def user
  #   @user ||= User.new
  # end

  def save_token(email, authentication_token)
    App::Persistence['email'] = email
    App::Persistence['authentication_token'] = authentication_token
  end

  def load_email
    App::Persistence['email']
  end

  def load_token
    App::Persistence['authentication_token']
  end

  def reset
    App::Persistence['email'] = nil
    App::Persistence['authentication_token'] = nil
  end

end