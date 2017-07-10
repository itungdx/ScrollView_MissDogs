//
//  ViewScroll.swift
//  Test_ScrollViewDogs
//
//  Created by Tung on 7/10/17.
//  Copyright © 2017 Tung. All rights reserved.
//

import UIKit

class ViewScroll: UIViewController, UIScrollViewDelegate {
    @IBOutlet weak var scrollView: UIScrollView!
    
    var first = false
    var pageImages : [String] = []
    var photo : [UIImageView] = []
    var scrollViews : [String] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pageImages = ["dog_1","dog_2","dog_3"]
        scrollViews = ["dog_1","dog_2","dog_3","dog_4"]
        
        // Do any additional setup after loading the view.
    }
    override func viewDidLayoutSubviews() {
        if !first
        {
            first = true
            let pagesScrollViewSize = scrollView.frame.size
            scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(scrollViews.count), height: pagesScrollViewSize.height * CGFloat(pageImages.count))
            for i in 0..<scrollViews.count
            {
                let pagesSrollView = UIScrollView()
                pagesSrollView.frame = CGRect(x: CGFloat(i) * scrollView.frame.size.width, y: 0, width: scrollView.frame.size.width, height: scrollView.frame.height)
                self.scrollView.addSubview(pagesSrollView)
                swipeHorizontal(i: i)
            }
        }
        
    }
    func swipeHorizontal(i : Int)
    {
//        let pagesScrollViewSize = scrollView.frame.size
//        scrollView.contentSize = CGSize(width: pagesScrollViewSize.width * CGFloat(pageImages.count), height: pagesScrollViewSize.height * CGFloat(pageImages.count))
        for j in 0..<pageImages.count
        {
            let imgView = UIImageView(image: UIImage(named: pageImages[j]+".jpg"))
            imgView.frame = CGRect(x: 0, y: CGFloat(j) * scrollView.frame.size.height, width: scrollView.frame.size.width, height: scrollView.frame.size.height)
            imgView.contentMode = .scaleAspectFit
            self.scrollView.addSubview(imgView)
            print("i: \(i)")
            print("j: \(j)")
            print("")
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
