//
//  ViewController.swift
//  TableViewAnimation
//
//  Created by Karthi on 27/06/17.
//  Copyright © 2017 Tringapps. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDelegate,UITableViewDataSource {
    enum cellType: String {
       case LeadCell = "LeadCell"
       case OrdinaryCell = "OrdinaryCell"
        }
    let kWidthImageFull = UIScreen.main.bounds.width
    let cellArray = ["LeadCell","OrdinaryCell","OrdinaryCell","OrdinaryCell","OrdinaryCell","OrdinaryCell","OrdinaryCell","OrdinaryCell","OrdinaryCell"];
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view, typically from a nib.
    }

    @IBOutlet var animatedImageView: UIImageView!
    @IBOutlet var AnimatedImageViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet var AnimatedImageViewWidthConstraint: NSLayoutConstraint!
    @IBOutlet var AnimatedImageViewTopConstraint: NSLayoutConstraint!
    @IBOutlet var AnimatedImageViewLeadingConstraint: NSLayoutConstraint!
    @IBOutlet var WatchAndReadHeight: NSLayoutConstraint!

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
   public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int
   {
       return 9
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell
    {
        if(cellArray[indexPath.row] == "LeadCell")
        {
            let cell = tableView.dequeueReusableCell(withIdentifier: "LeadCell") as! LeadCellTableViewCell
            //cell.leadImageView?.image = #imageLiteral(resourceName: "page2")
            return cell
        }
            
        else
        {
    
            let cell = tableView.dequeueReusableCell(withIdentifier: "Cell")
            cell?.textLabel?.text = String(indexPath.row)
            return cell!

        }
    }
        public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
       {
        if(indexPath.row == 0)
        {
        return 180
        }
        else
        {
            return 100
        }
        
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView.contentOffset.y >= 0)
        {
             if((scrollView.contentOffset.y < 180.0) && (180.0-scrollView.contentOffset.y > 60.0))
             {
                self.animatedImageView.isHidden = false
                self.AnimatedImageViewTopConstraint.constant = 0
                self.AnimatedImageViewLeadingConstraint.constant = 0
                self.AnimatedImageViewHeightConstraint.constant = 180.0-scrollView.contentOffset.y
                self.WatchAndReadHeight.constant = 180.0-scrollView.contentOffset.y
                if(scrollView.contentOffset.y<kWidthImageFull)
                {
                self.AnimatedImageViewWidthConstraint.constant = kWidthImageFull * (self.AnimatedImageViewHeightConstraint.constant/180.0)
                }
                else
                {
                self.AnimatedImageViewWidthConstraint.constant = kWidthImageFull
                }
             }
              else
                {
//                    self.AnimatedImageViewTopConstraint.constant = 0
//                    self.AnimatedImageViewLeadingConstraint.constant = 0
//                    self.AnimatedImageViewHeightConstraint.constant = 45
//                    self.AnimatedImageViewWidthConstraint.constant = 80
                    self.WatchAndReadHeight.constant = 60
                    self.animatedImageView.isHidden = true
                }
            }
        else
        {
            self.AnimatedImageViewTopConstraint.constant = 0
            self.AnimatedImageViewLeadingConstraint.constant = 0
            self.AnimatedImageViewHeightConstraint.constant = 180.0
            self.WatchAndReadHeight.constant = 180.0
            self.AnimatedImageViewWidthConstraint.constant = kWidthImageFull
            self.animatedImageView.isHidden = false
        
        }
    }
    


}

