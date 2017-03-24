//
//  OQSegundaViewController.swift
//  App_GCD_OPERATIONQUEU
//
//  Created by cice on 24/3/17.
//
//

import UIKit

class OQSegundaViewController: UIViewController {
    
    //MARK: Variables locales
    var myOperationsQueue : OperationQueue?
    
    let urlString1 = "https://static.pexels.com/photos/28221/pexels-photo-28221.jpg"
    let urlString2 = "https://images7.alphacoders.com/671/671281.jpg"
    let urlString3 = "http://cdn.wallpapersafari.com/87/42/HGFIwD.jpg"
    let urlString4 = "http://cdn.wallpapersafari.com/87/42/ct0S8Z.jpg"
    
    
    //MARK: - Outlet
    
    @IBOutlet weak var myImageView1: UIImageView!
    @IBOutlet weak var myImageView2: UIImageView!
    @IBOutlet weak var myImageView3: UIImageView!
    @IBOutlet weak var myImageView4: UIImageView!
    
    
    //MARK: ACTION
    
    @IBAction func cancelAllOperations(_ sender: Any) {
        myOperationsQueue?.cancelAllOperations()
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        downloadImages()
    }
    
    
    
    //MARK: - UTILS
    
    func downloadImages(){
    
        //Bloque de operaciones
        let operation1 = BlockOperation{
            
            do{
                let urlImageData = try Data(contentsOf: URL(string: self.urlString1)!)
                OperationQueue.main.addOperation {
                    self.myImageView1.image = UIImage(data: urlImageData)
                }
            }catch{
                print("Error en la descarga de la imagen")
            }
            
        }
        
        //Bloque de operaciones2
        let operation2 = BlockOperation{
            
            do{
                let urlImageData = try Data(contentsOf: URL(string: self.urlString2)!)
                OperationQueue.main.addOperation {
                    self.myImageView2.image = UIImage(data: urlImageData)
                }
            }catch{
                print("Error en la descarga de la imagen")
            }
            
        }
        
        //Bloque de operaciones3
        let operation3 = BlockOperation{
            
            do{
                let urlImageData = try Data(contentsOf: URL(string: self.urlString3)!)
                OperationQueue.main.addOperation {
                    self.myImageView3.image = UIImage(data: urlImageData)
                }
            }catch{
                print("Error en la descarga de la imagen")
            }
            
        }
        
        //Bloque de operaciones4
        let operation4 = BlockOperation{
            
            do{
                let urlImageData = try Data(contentsOf: URL(string: self.urlString4)!)
                OperationQueue.main.addOperation {
                    self.myImageView4.image = UIImage(data: urlImageData)
                }
            }catch{
                print("Error en la descarga de la imagen")
            }
            
        }
        
        //dependencias de operaciones
        operation1.addDependency(operation2)
        operation2.addDependency(operation3)
        operation3.addDependency(operation4)
        
        myOperationsQueue = OperationQueue()
        myOperationsQueue?.addOperation(operation1)
        myOperationsQueue?.addOperation(operation2)
        myOperationsQueue?.addOperation(operation3)
        myOperationsQueue?.addOperation(operation4)
        
    
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    

}
