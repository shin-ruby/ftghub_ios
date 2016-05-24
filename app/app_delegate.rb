class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    AFMotion::SessionClient.build_shared("http://localhost:3000/api/v1/") do
      session_configuration :default
      header "Accept", "application/json"
      response_serializer :json
    end

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = createTabBar
    @window.makeKeyAndVisible

    true
  end

  def createTabBar
    tab_bar_controller = UITabBarController.alloc.init 
    tab_bar_controller.viewControllers = [
      HomesController.alloc.init,
      DiscoversController.alloc.init,
      FightpostsController.alloc.init,
      NoticesController.alloc.init,
      UINavigationController.alloc.initWithRootViewController(UsersController.alloc.init)
    ]  
    tab_bar_controller
  end
end
