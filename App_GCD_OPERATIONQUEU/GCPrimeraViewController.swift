//
//  GCPrimeraViewController.swift
//  App_GCD_OPERATIONQUEU
//
//  Created by cice on 24/3/17.
//
//

import UIKit

class GCPrimeraViewController: UIViewController {
    
    //MARK: Variables locales
    
    let sUrlImage = "https://static.pexels.com/photos/2324/skyline-buildings-new-york-skyscrapers.jpg"
    let sUrlWeb = "https://es.wikipedia.org/wiki/Wikipedia:Portada"
    
    
    //MARK: - IBOUTLET
    
    @IBOutlet weak var myImageCustom: UIImageView!
    @IBOutlet weak var myWebCustom: UIWebView!
    
    
    //MARK: - ACTION
    
    @IBAction func showDataFromGCDACTION(_ sender: Any) {
        //1 forma no recomendada
        //downloadDataSync()
        //2
        //downloadDataASync()
        //3
        downloadDataASyncCallback()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    //MARK: - UTILS
    
    /*
    func downloadDataSync(){
        
        do{
            let urlData = try Data(contentsOf: URL(string: sUrlImage)!)
            myImageCustom.image = UIImage(data: urlData)
            
            let urlWebData = URLRequest(url: URL(string: sUrlWeb)!)
            myWebCustom.loadRequest(urlWebData)
            
        }catch let error{
            print("Error en la descarga de los datos: \(error.localizedDescription)")
        }
     }
     */
     /*
        func downloadDataASync(){
            
            //Cola 2 plano
            DispatchQueue.global(qos: .default).async {
                do{
                    let urlData = try Data(contentsOf: URL(string: self.sUrlImage)!)
                    let urlWebData = URLRequest(url: URL(string: self.sUrlWeb)!)
                    DispatchQueue.main.async {
                        self.myImageCustom.image = UIImage(data: urlData)
                        self.myWebCustom.loadRequest(urlWebData)
                    }
                    
                }catch let error{
                    print("Error en la descarga de los datos: \(error.localizedDescription)")
                }
            }
            
        }
      */
    
    func downloadDataASyncCallback(){
        
        /*
        downloadInformationFromWeb(callBackImage: { (imageData) in
            self.myImageCustom.image = imageData
        }) { (requestData) in
            self.myWebCustom.loadRequest(requestData)
        }*/
 
        
        
        downloadInformationFromWeb(callBackImage: printImage) { (requestData) in
            self.myWebCustom.loadRequest(requestData)
        }
        
        downloadInformationFromWeb(callBackImage: printImage, callBackWeb: printWeb)
        
    }
    
    func printImage(imageData : UIImage){
        self.myImageCustom.image = imageData
    }
    
    func printWeb(webData: URLRequest){
        self.myWebCustom.loadRequest(webData)
    }
    
    
    
    typealias downloadImageFunction = (_ imageData : UIImage) -> ()
    typealias downloadWebFunction = (_ webData: URLRequest) -> ()
    
    func downloadInformationFromWeb(callBackImage: @escaping downloadImageFunction, callBackWeb : @escaping downloadWebFunction){
        
        
        //Cola 2 plano
        DispatchQueue.global(qos: .default).async {
            do{
                let urlImageData = UIImage(data: try Data(contentsOf: URL(string: self.sUrlImage)!))
                let urlWebData = URLRequest(url: URL(string: self.sUrlWeb)!)
                DispatchQueue.main.async {
                    callBackImage(urlImageData!)
                    callBackWeb(urlWebData)
                }
                
            }catch let error{
                print("Error en la descarga de los datos: \(error.localizedDescription)")
            }
        }
        
        
    }
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    
    

}
