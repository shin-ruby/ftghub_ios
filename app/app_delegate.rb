class AppDelegate
  def application(application, didFinishLaunchingWithOptions:launchOptions)

    AFMotion::SessionClient.build_shared("http://localhost:3000/") do
      session_configuration :default
      header "Accept", "application/json"
      response_serializer :json
    end

    @homeController = HomesController.alloc.initWithStyle(UITableViewStylePlain)

    @window = UIWindow.alloc.initWithFrame(UIScreen.mainScreen.bounds)
    @window.rootViewController = createTabBar
    @window.makeKeyAndVisible

    true
  end

  def createTabBar
    tab_bar_controller = UITabBarController.alloc.init 
    tab_bar_controller.viewControllers = [
      UINavigationController.alloc.initWithRootViewController(@homeController),
      DiscoversController.alloc.init,
      FightpostsController.alloc.init,
      UINavigationController.alloc.initWithRootViewController(NoticesController.alloc.init),
      UINavigationController.alloc.initWithRootViewController(UsersController.alloc.init)
    ]  
    tab_bar_controller
  end
end
