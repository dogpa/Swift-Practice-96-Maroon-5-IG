//
//  ViewController.swift
//  Swift Practice # 96 Maroon 5 IG
//
//  Created by Dogpa's MBAir M1 on 2021/10/17.
//

import UIKit

class ViewController: UIViewController {

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        //getMaroon5IGData ()
        getMaroon5FromAssets ()
    }

    

    //透過網路抓JSON IG會容易失敗暫時不用
    func getMaroon5IGData () {
        let urlIGAPI = "https://www.instagram.com/maroon5/?__a=1"

        if let urlString = urlIGAPI.addingPercentEncoding(withAllowedCharacters: .urlQueryAllowed) {
            
            if let igJSONUrl = URL(string: urlString){
                
                URLSession.shared.dataTask(with: igJSONUrl) { data, response, error in
                    
                    if let date = data {
                        
                        let decoder = JSONDecoder()
                        
                        decoder.dateDecodingStrategy = .iso8601
                        
                        do {
                            let igSearchResponse = try decoder.decode(igJSONAPI.self , from: date)
                          
                            print(igSearchResponse)
                            print("成功")
                        }catch{
                            
                            print(error)
                            print("失敗")
                        }
                    }
                }.resume()
            }
        }
    }


    //透過
    func getMaroon5FromAssets () {
        if let sunData = NSDataAsset(name: "maroon5")?.data {
                  let decoder = JSONDecoder()
                  do {
                      let maroon5SearchResponse = try decoder.decode(igJSONAPI.self, from: sunData)
                      print(maroon5SearchResponse)
                      print("Assest成功")
                  } catch  {
                      print(error)
                      print("Assest錯誤")
                  }
              }
    }
  


}

