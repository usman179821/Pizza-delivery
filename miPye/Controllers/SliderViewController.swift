//
//  SliderViewController.swift
//  RideShare
//
//  Created by Muhammad Usman on 13/07/1441 AH.
//  Copyright © 1441 Macbook. All rights reserved.
//

import UIKit

class SliderViewController: UIViewController,UISearchBarDelegate {
    
    //MARK:- Outlets
    @IBOutlet weak var signinBtn: UIButton!
    @IBOutlet weak var sliderCollectionView: UICollectionView!
    @IBOutlet weak var signUpBtn: UIButton!
    @IBOutlet weak var pageControl: UIPageControl!
    @IBOutlet weak var nimaziBtn: UIButton!
    @IBOutlet weak var searchBuraqBtn: UIButton!
    
    //MARK: properties
    var scrollingTimer: Timer? // To keep track of the Auto Scrolling Timer
    lazy var dummyCount = 10 //To make the slider looks like infnite
    lazy var sliderCollectionViewDataSource: Array = [UIImage]()
    var temp:CGPoint!
    lazy var selectedPage = 0 //For keeping track of the selected page in slider
    lazy var fbLoginSuccess = false
    let defaults = UserDefaults.standard
    
    //MARK:- View Lifecycle
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(true)
        startTimer()
    }
    
    //MARK:- View Life Cycle.
    override func viewDidLoad() {
        super.viewDidLoad()
        setupview()
        selectLanguage()
        //nimaziBtn.titleLabel?.adjustsFontForContentSizeCategory = true
    }
    
    
    //MARK:- selectLanguage
    func selectLanguage() {
        
        if let stringOne = defaults.string(forKey: "language") {
            if stringOne == "german"{
               // self.navigationItem.title = "Anmeldung"
                
                signUpBtn.setTitle(NSLocalizedString("SignUp", comment: ""), for: .normal)
                 signinBtn.setTitle(NSLocalizedString("SignIn", comment: ""), for: .normal)
                 nimaziBtn.setTitle(NSLocalizedString("NimazilookingforridetoyourMasjid", comment: ""), for: .normal)
                 searchBuraqBtn.setTitle(NSLocalizedString("SearchBuraq(RidetoYourMasjid)", comment: ""), for: .normal)
              
            }
        }
        else {
            defaults.set("english", forKey: "language")
        }
    }
    
    func setupview() {
        if UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiom.pad {
            sliderCollectionViewDataSource = [UIImage (named: "pizzaL1")!,UIImage(named: "pizzaL2")!,UIImage(named: "pizzaL3")!]
        }else {
            sliderCollectionViewDataSource = [UIImage (named: "pizza1")!, UIImage (named: "pizza2")!, UIImage (named: "pizza3")!]
        }
        
        //MARK: CollectionView Delegate
        sliderCollectionView.delegate = self
        sliderCollectionView.dataSource = self
        sliderCollectionView.reloadData()
    }
    override func viewDidDisappear(_ animated: Bool) {
        super.viewDidDisappear(true)
        stopTimer()
    }
    
    //MARK:- Actions
    @IBAction func loginBtnTapped(_ sender: Any) {
        let vc = storyboard?.instantiateViewController(identifier: "LoginVC") as? LoginVC
        self.navigationController?.pushViewController(vc!, animated: true)
        
        print("Sign in")
    }
    
    @IBAction func signUpBtnTapped(_ sender: Any) {
        
        let vc = storyboard?.instantiateViewController(identifier: "signupVC") as! signupVC
        self.navigationController?.pushViewController(vc, animated: true)
        print("signUP")
        
    }
    
  
}

//MARK:- Collection view Functions
extension SliderViewController: UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout{
    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return sliderCollectionViewDataSource.count * dummyCount
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "sliderCell", for: indexPath) as! HomeSliderCollectionViewCell
        let imageIndex = indexPath.item % sliderCollectionViewDataSource.count
        var image = UIImage()
        image = sliderCollectionViewDataSource[imageIndex]
        cell.sliderImage.image = image
        return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        return self.sliderCollectionView.bounds.size
    }
    
    func scrollViewDidEndDragging(_ scrollView: UIScrollView, willDecelerate decelerate: Bool) {
        if (scrollView == self.sliderCollectionView) {
            stopTimer()
        }
    }
    
    func startTimer() {
        
        if sliderCollectionViewDataSource.count > 1 && scrollingTimer == nil {
            let timeInterval = 6.0;
            scrollingTimer = Timer.scheduledTimer(timeInterval: timeInterval, target: self, selector: #selector(self.rotate), userInfo: nil, repeats: true)
            scrollingTimer!.fireDate = Date().addingTimeInterval(timeInterval)
        }
    }
    
    func stopTimer() {
        scrollingTimer?.invalidate()
        scrollingTimer = nil
    }
    
    @objc func rotate() {
        let offset = CGPoint(x:self.sliderCollectionView.contentOffset.x + cellWidth, y: self.sliderCollectionView.contentOffset.y)
        var animated = true
        if (offset.equalTo(CGPoint.zero) || offset.equalTo(CGPoint(x: totalContentWidth, y: offset.y))){
            animated = false
        }
        self.sliderCollectionView.setContentOffset(offset, animated: animated)
    }
    
    func scrollViewDidEndScrollingAnimation(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView) {
            self.centerIfNeeded(animationTypeAuto: true, offSetBegin: CGPoint.zero)
        }
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        if(scrollView == self.sliderCollectionView){
            if(scrollView.panGestureRecognizer.state == .began){
                stopTimer()
            }else if( scrollView.panGestureRecognizer.state == .possible){
                startTimer()
            }
        }
    }
    
    func updatePageControl(){
        var updatedPage = selectedPage + 1
        let totalItems = sliderCollectionViewDataSource.count
        updatedPage = updatedPage % totalItems
       // print("updatedPage: \(updatedPage)")
        selectedPage  = updatedPage
        self.pageControl.currentPage = updatedPage
    }
    
    func centerIfNeeded(animationTypeAuto:Bool, offSetBegin:CGPoint) {
        let currentOffset = self.sliderCollectionView.contentOffset
        let contentWidth = self.totalContentWidth
        let width = contentWidth / CGFloat(dummyCount)
        if currentOffset.x < 0{
            //left scrolling
            self.sliderCollectionView.contentOffset = CGPoint(x: width - currentOffset.x, y: currentOffset.y)
        } else if (currentOffset.x + cellWidth) >= contentWidth {
            //right scrolling
            let  point = CGPoint.zero
            var tempCGPoint = point
            tempCGPoint.x = tempCGPoint.x + cellWidth
//            print("center if need set offset to \( tempCGPoint)")
            self.sliderCollectionView.contentOffset = point
        }
    }
    
    func scrollViewWillBeginDragging(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView)
        {
           // print("\(scrollView.contentOffset)")
            self.temp = scrollView.contentOffset
            self.stopTimer()
        }
    }
    
    func collectionView(_ collectionView: UICollectionView, didEndDisplaying cell: UICollectionViewCell, forItemAt indexPath: IndexPath) {
        if(collectionView == self.sliderCollectionView){
            var page:Int =  Int(collectionView.contentOffset.x / collectionView.frame.size.width)
            page = page % sliderCollectionViewDataSource.count
            pageControl.currentPage = Int (page)
        }
    }
    
    func scrollViewDidEndDecelerating(_ scrollView: UIScrollView) {
        if (scrollView == self.sliderCollectionView) {
            self.centerIfNeeded(animationTypeAuto: false, offSetBegin: temp)
            self.startTimer()
        }
    }
    
    override func willRotate(to toInterfaceOrientation: UIInterfaceOrientation, duration: TimeInterval) {
        DispatchQueue.main.async() {
            self.stopTimer()
            self.sliderCollectionView.reloadData()
            self.sliderCollectionView.setContentOffset( CGPoint.zero, animated: true)
            self.startTimer()
        }
    }
    
    var totalContentWidth: CGFloat {
        return CGFloat(sliderCollectionViewDataSource.count * dummyCount) * cellWidth
    }
    
    var cellWidth: CGFloat {
        return self.sliderCollectionView.frame.width
    }
    
}





   

