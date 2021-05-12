//
//  HomeTabBarViewController.swift
//  Kakao-Clone-New
//
//  Created by Subeen Park on 2021/05/12.
//

import UIKit
import Then

class HomeTabBarViewController: UITabBarController {

    
    let first = FriendListsViewController()
    let second = ChatRoomsViewController()
    let third = SearchViewController()
    let fourth = ShoppingViewController()
    let fifth = OthersViewController()
    
    


    override func viewDidLoad() {
        super.viewDidLoad()
        self.tabBar.barTintColor = .white
        setTabs()

        // Do any additional setup after loading the view.
    }
    
    
    func setTabs() {
        
        first.tabBarItem = UITabBarItem(title: nil,
                                        image: UIImage(named: "friendTabIcon")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "friendTabIconSelected")?.withRenderingMode(.alwaysOriginal))
        second.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(named: "messageTabIcon")?.withRenderingMode(.alwaysOriginal),
                                         selectedImage: UIImage(named: "messageTabIconSelected")?.withRenderingMode(.alwaysOriginal))
        third.tabBarItem = UITabBarItem(title: nil,
                                        image: UIImage(named: "searchTabIcon")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "searchTabIconSelected")?.withRenderingMode(.alwaysOriginal))
        fourth.tabBarItem = UITabBarItem(title: nil,
                                         image: UIImage(named: "shopTabIcon")?.withRenderingMode(.alwaysOriginal),
                                         selectedImage: UIImage(named: "shopTabIconSelected")?.withRenderingMode(.alwaysOriginal))
        fifth.tabBarItem = UITabBarItem(title: nil,
                                        image: UIImage(named: "detailTabIcon")?.withRenderingMode(.alwaysOriginal),
                                        selectedImage: UIImage(named: "detailTabIconSelected")?.withRenderingMode(.alwaysOriginal))
                                        
        
        
        self.viewControllers = [first, second, third, fourth, fifth]
        
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
