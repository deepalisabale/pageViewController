//
//  ViewController.swift
//  pageViewController
//
//  Created by Deepali on 12/06/24.
//
//

import UIKit

class ViewController: UIViewController, UIPageViewControllerDataSource, UIPageViewControllerDelegate {
    
    var myControllers = [UIViewController]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Create an array
        
        let pages : [String] =  [
       
            """
        Raigad Fort :
        Raigad is a hill fort situated at about 25 Km from Mahad in the Raigad district. Chhatrapati Shivaji renovated this fort and made it his capital in 1674 AD. The rope-way facility is available at Raigad Fort, to reach at the fort from ground in few minutes
  """,
        
            """
            Murud-Janjira Fort :
            Murud-Janjira Fort is situated at Arabian Sea coast near the port town of Murud. Janjira is considered one of the strongest marine forts in India. The fort is approached by sailboats from Rajapuri jetty. The main gate of the fort faces Rajapuri on the shore. It has a small postern gate towards the open sea for escape. There are many cannons of native and European make on the bastions of the fort. Now in ruins, the fort in its heyday was a full-fledged living fort with all the necessary facilities, e.g., palaces, quarters for officers, mosque, two small natural fresh water lakes, etc. The palace of the Nawabs of Janjira at Murud is still in good shape.

            A special attraction of this fort are 3 gigantic cannons named Kalalbangdi, Chavri and Landa Kasam. These cannons were said to be feared for their shooting range. Another gate to the west is sea-facing, called Darya Darwaz
            """,
        
            """
        Kolaba Fort:
        Kolaba Fort was one of the chief naval stations of Maratha empire.  Kolaba Fort has two main entrances, one on the sea side and the other towards Alibag. An interesting feature of this fort is that it has freshwater wells in its premises even though it is a seaside fort. In 1713, under a treaty with Peshwa Balaji Vishwanath, Kolaba along with several other forts was given over to Kanhoji Angre. He used it as his main base from which to launch raids on British ships
  """
    
        ]
        for text in pages {
            let vc = TextViewController(with: text)
            myControllers.append(vc)
        }
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.presentPageVc()
        }
    }
    
    func presentPageVc() {
        guard let first = myControllers.first else {
            return
        }
        
        let vc = UIPageViewController(transitionStyle: .pageCurl,
                                       navigationOrientation: .horizontal,
                                       options: nil)
        vc.delegate = self
        vc.dataSource = self
        
        vc.setViewControllers([first],
                              direction: .forward,
                              animated: true,
                              completion: nil)
        
        present(vc, animated: true)
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerBefore viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController), index > 0 else {
            return nil
        }
        let before = index - 1
        return myControllers[before]
    }
    
    func pageViewController(_ pageViewController: UIPageViewController, viewControllerAfter viewController: UIViewController) -> UIViewController? {
        guard let index = myControllers.firstIndex(of: viewController), index < (myControllers.count - 1) else {
            return nil
        }
        let after = index + 1
        return myControllers[after]
    }
}
