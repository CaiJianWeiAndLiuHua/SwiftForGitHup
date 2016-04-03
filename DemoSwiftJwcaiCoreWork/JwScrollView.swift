//
//  JwScrollView.swift
//  DemoSwiftJwcaiCoreWork
//
//  Created by CaixiaoLiu on 16/2/10.
//  Copyright © 2016年 jw. All rights reserved.
//

import UIKit

class JwScrollView: UIView ,UICollectionViewDataSource,UICollectionViewDelegate,UICollectionViewDelegateFlowLayout{

    var dataSource:[String]?{


        didSet{
            if dataSource?.count > 0 {

              collectionRoloadImage.reloadData()

            }

        }

    }




    private func startAnmation(){
      endAnmation()


    }


    private func endAnmation(){




    }





 private   lazy   var collectionRoloadImage:UICollectionView = {


        let res = UICollectionViewFlowLayout()


        var collection = UICollectionView(frame: CGRectMake(0, 0, CGRectGetWidth(self.frame), CGRectGetHeight(self.frame)), collectionViewLayout: res)

           collection.delegate = self
           collection.dataSource = self
           collection.minimumZoomScale = 0
           collection.maximumZoomScale = 0

           collection.registerClass(PickImageViewCollectionCell.classForCoder(), forCellWithReuseIdentifier: PickImageViewCollectionCell.description())

           collection.pagingEnabled = true

         return collection



    }()



//    function cell  actionCell:fromCell
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int{

     return (self.dataSource?.count)! * 5000

    }

    // The cell that is returned must dequeueReusableCellWithReuseIdentifier:forIndexPath:from

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell{

        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(PickImageViewCollectionCell.description(), forIndexPath: indexPath) as! PickImageViewCollectionCell
         cell.imageSource  = self.dataSource![indexPath.row]

        return cell

    }








}
