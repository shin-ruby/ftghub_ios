class UsersController < UIViewController

  def init
    super 
    self.title = 'User'
    self
  end

  def viewDidLoad
    super 

    add_users

    # client = AFMotion::SessionClient.build("http://localhost:3000/api/v1/") do
    #   session_configuration :default
    #   header "Accept", "application/json"
    #   response_serializer :json
    # end

    # client.get("users/1.json") do |result|
    #   @json = result.object['email']
    # end

    # alert = UIAlertView.new 
    # alert.message = @json
    # alert.show

    view.backgroundColor = UIColor.whiteColor

    # @label = UILabel.alloc.init
    # @label.frame = [[150, 150], [250, 30]]
    # @label.text = @json
    # view.addSubview(@label)
  end

  def add_users
    User.recent do |users|
      @label = UILabel.alloc.init
      @label.frame = [[150, 150], [250, 30]]
      @label.text = users.email
      view.addSubview(@label)
    end
  end


  def presentError error_msg
    alert = UIAlertView.new 
    alert.message = error_msg 
    alert.show
  end

end