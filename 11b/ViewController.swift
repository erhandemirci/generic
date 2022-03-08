//
//  ViewController.swift
//  11b
//
//  Created by erhan demirci on 15.02.2022.
//

import UIKit

class MyView:UIView
{
    override init(frame: CGRect) {
        super.init(frame: .zero)
    }
    required init?(coder: NSCoder) {
        super.init(coder: coder)
    }
    
}

class ViewController: UIViewController {
    
    func kullaniciAdiOlustur(isim:String,soyisim:String,rakam:String)
    {
        print(isim+soyisim+rakam)
    }
    func genFnc<T:MyView>(_ view:MyView) -> T?
    {
        return view as! T
    }
    func getGenericType<Q:MyView>(from view: UIView) -> Q? {

        for aView in view.subviews {

            if let res = aView as? Q {

                return res
            }
            else {

                return getGenericType(from: aView)
            }

        }

        return nil
    }
    func getGenericType<T:UIView>(from view: UIView,type:T.Type) -> T? {

        for aView in view.subviews {

            if let res = aView as? T {

                return res
            }
            else {

                return getGenericType(from: aView,type:T.self)
            }

        }

        return nil
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after
        let viw = MyView()
        let viw2 = MyView()
        self.view.addSubview(viw)
        self.view.addSubview(viw2)
        
        let res = getGenericType(from: self.view,type:MyView.self)  // res of type MyView

        let res2 = getGenericType(from: self.view) // res of type MyView
        print(res)
        let res3 = genFnc(viw)
        print(res3)

      
        
        



    }


}

