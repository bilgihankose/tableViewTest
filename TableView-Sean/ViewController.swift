//
//  ViewController.swift
//  TableView-Sean
//
//  Created by Bilgihan Köse on 19.05.2020.
//  Copyright © 2020 Bilgihan Kose. All rights reserved.
//

import UIKit


class ViewController: UIViewController {
    
    var tableView = UITableView()
    var videos: [Video] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        videos = fetchData()
        configureTableView()
        
    }
    
    func configureTableView(){
        view.addSubview(tableView)
        
        //Set Delagates
        setTableViewDelagates()
        
        //Set Row Height
        tableView.rowHeight = 100 //UITableView.automaticDimension
        
        //Register Cells
        tableView.register(VideoCell.self, forCellReuseIdentifier: "VideoCell")
        
        //Set Constraints
        tableView.translatesAutoresizingMaskIntoConstraints = false
        tableView.topAnchor.constraint(equalTo: view.topAnchor, constant: 50).isActive = true
        tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor).isActive = true
        tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor).isActive = true
        
    }
    
    func setTableViewDelagates(){
        tableView.delegate = self
        tableView.dataSource = self
    }
}


// UITableViewDataSource, UITableViewDelegate'leri VC'ye sahiplendir

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return videos.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VideoCell") as!  VideoCell
        let video = videos[indexPath.row]
        cell.set(video: video)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
   regSegue()
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return "Youtube"
    }
    
    func regSegue(){
        let detailVC = DetailVC()
        
        present(detailVC, animated: true, completion: nil)
    }
}

//Dummy datayi buradan ceksin.

extension ViewController {
    
    func fetchData() -> [Video] {
        let video1 = Video(image: #imageLiteral(resourceName: "videoImage-1.png"), title: "BENCE BEN ÇOK İYİ BİR SPİKER DEĞİLİM!")
        let video2 = Video(image: #imageLiteral(resourceName: "videoImage-2.png"), title: "KÜFREDEREK PARA KAZANACAĞIMI TAHMİN ETMEZDİM")
        let video3 = Video(image: #imageLiteral(resourceName: "videoImage-3.png"), title: "YAĞMUR'LA ARAMIZDAKİ YAŞ FARKI HİÇ MEVZUMUZ OLMADI!")
        let video4 = Video(image: #imageLiteral(resourceName: "videoImage-4.png"), title: "HİÇBİR ZAMAN SİYASETÇİ OLMAK İSTEMEM!")
        let video5 = Video(image: #imageLiteral(resourceName: "videoImage-5.png"), title: "KAMERALARDAN NEFRET EDİYORUM!")
        let video6 = Video(image: #imageLiteral(resourceName: "videoImage-6.png"), title: "ARMAĞAN ÇAĞLAYAN İLYAS YALÇINTAŞ'IN HAYATINI NASIL DEĞİŞTİRDİ?")
        let video7 = Video(image: #imageLiteral(resourceName: "videoImage-7.png"), title: "İNSANLAR SOĞUK VE MESAFELİ OLDUĞUMU DÜŞÜNÜR.")
        let video8 = Video(image: #imageLiteral(resourceName: "videoImage-8.png"), title: "SİYASET HAYATIMIN YÜZDE YÜZÜ!")
        let video9 = Video(image: #imageLiteral(resourceName: "videoImage-9.png"), title: "BABAMIN BANA BAKIŞINI UNUTAMIYORUM!")
        let video10 = Video(image: #imageLiteral(resourceName: "videoImage-10.png"), title: "KIZ KARDEŞİM ARTIK TELEVİZYONA ÇIKMA DİYOR!")
        let video11 = Video(image: #imageLiteral(resourceName: "videoImage-11.png"), title: "DENİZ AKKAYA NEDEN EVLENMEK İSTEMİYOR?")
        let video12 = Video(image: #imageLiteral(resourceName: "videoImage-12.png"), title: "YTA SÖZERİ İLK KEZ ANLATTI! Ünlü Olma Sürecinde Ne zorluklar Yaşadı?")
        return [video1, video2, video3, video4, video5, video6, video7, video8, video9, video10, video11, video12]
    }
    
}

//Video struct'unda neler var tanimlamasi

struct Video {
    var image: UIImage
    var title: String
}
