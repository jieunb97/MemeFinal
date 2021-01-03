//
//  MemeTableViewController.swift
//  Meme2.0
//
//  Created by Jieun Bae on 1/1/21.
//

import UIKit

class MemeTableViewController: UITableViewController {
    
    var memes: [Meme]! {
        return (UIApplication.shared.delegate as! AppDelegate).memes
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(true)
        tableView.reloadData()
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = self.storyboard!.instantiateViewController(withIdentifier: "MemeDetailViewController") as! MemeDetailViewController
        controller.memedImage = memes[(indexPath as NSIndexPath).row].memedImage
        self.navigationController!.pushViewController(controller, animated: true)
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return memes.count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
      
        let cell = tableView.dequeueReusableCell(withIdentifier: "MemeViewCell")!
        cell.imageView!.image = memes[(indexPath as NSIndexPath).row].memedImage
        cell.textLabel!.text = memes[(indexPath as NSIndexPath).row].topText + "..." + memes[(indexPath as NSIndexPath).row].bottomText
        
        return cell
    }
    

    @IBAction func addMemeAction(_ sender: Any) {
        let createMemeViewController = storyboard?.instantiateViewController(withIdentifier: "MemeViewController") as! MemeViewController
        present(createMemeViewController, animated: true, completion: nil)
    }
    
}
