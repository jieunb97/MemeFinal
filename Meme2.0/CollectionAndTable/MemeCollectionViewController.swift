//
//  MemeCollectionViewController.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import UIKit

class MemeCollectionViewController: UICollectionViewController, UICollectionViewDelegateFlowLayout {
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
        
    @IBOutlet weak var flowLayout: UICollectionViewFlowLayout!
        
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.tabBarController?.tabBar.isHidden = false
        
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        collectionView.reloadData()
       
        
        let space: CGFloat = 3.0
        let dimensionX = (view.frame.size.width - (4 * space)) / 3.0
        let dimensionY = (view.frame.size.height - (5 * space)) / 4.0
       
        flowLayout.minimumInteritemSpacing = space
        flowLayout.minimumLineSpacing = space
        flowLayout.itemSize = CGSize(width: dimensionX, height: dimensionY)
        
        
    }
    
    override func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return memes.count
    }
    
    override func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
       let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "MemeViewCell", for: indexPath) as! MemeViewCell
       cell.imageMeme?.image = memes[(indexPath as NSIndexPath).row].memedImage
       return cell
    }
    
    override func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath:IndexPath) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        controller.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        self.navigationController!.pushViewController(controller, animated: true)
    }
    

    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
