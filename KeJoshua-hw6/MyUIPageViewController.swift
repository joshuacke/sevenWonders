//
//  MyUIPageViewController.swift
//  KeJoshua-hw6
//
//  Created by Ke, Joshua C on 10/16/17.
//  Copyright © 2017 Ke, Joshua C. All rights reserved.
//

import UIKit

class MyUIPageViewController: UIPageViewController {
    
    let numPics: Int = 7
    var controllers: [UIViewController]? = []
    
    func instantiateControllers () {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        var vc: MyViewController
        var i = 1
        
        while i <= numPics {
            vc = storyboard.instantiateViewController(withIdentifier: "ImageController") as! MyViewController
            // TODO: can scroll but no image
            vc.image = UIImage(named: "wonders\(i).png")
            controllers?.append(vc)
            i += 1
        }
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(transitionStyle: .scroll, navigationOrientation: .horizontal, options: nil)
    }
    
    override func viewDidLoad() {
        dataSource = self
        super.viewDidLoad()
        self.title = "Wonders of the World"
        instantiateControllers()
        
        if let firstViewController = controllers?.first {
            setViewControllers([firstViewController],
                               direction: .forward,
                               animated: true,
                               completion: nil)
        }
        
        // Do any additional setup after loading the view.
        let page = UIPageControl.appearance()
        page.pageIndicatorTintColor = UIColor.white
        page.currentPageIndicatorTintColor = UIColor.green
        page.backgroundColor = UIColor.lightGray
        
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
/*
 // MARK: - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
 // Get the new view controller using segue.destinationViewController.
 // Pass the selected object to the new view controller.
 }
 */
// MARK: UIPageViewControllerDataSource

extension MyUIPageViewController: UIPageViewControllerDataSource {
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers?.index(of: viewController) else {
            return nil
        }
        
        var previousIndex = viewControllerIndex - 1
        
        if previousIndex < 0 {
            previousIndex = (controllers?.count)! - 1
        }
        
        return controllers?[previousIndex]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController,
                            viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let viewControllerIndex = controllers?.index(of: viewController) else {
            return nil
        }
        
        var nextIndex = viewControllerIndex + 1
        
        if controllers?.count == nextIndex {
            nextIndex = 0
        }
        
        return controllers?[nextIndex]
    }
    
    func presentationCount(for pageViewController: UIPageViewController) -> Int {
        return controllers!.count
    }
    
    func presentationIndex(for pageViewController: UIPageViewController) -> Int {
        guard let firstViewController = viewControllers?.first,
            let firstViewControllerIndex = controllers?.index(of: firstViewController) else {
                return 0
        }
        
        return firstViewControllerIndex
    }
}

