//
//  HowtoTableViewController.swift
//  Ehomaki
//
//  Created by yakazu on 2018/01/14.
//  Copyright © 2018年 yakazu. All rights reserved.
//

import UIKit

class HowtoTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // 閉じるボタン
        let closeButton:UIBarButtonItem = UIBarButtonItem(title: "閉じる", style: .plain, target: self, action: #selector(HowtoTableViewController.clickCloseButton))
        self.navigationItem.setLeftBarButton(closeButton, animated: true)
        
        self.title = "恵方巻きについて"
        
        tableView.estimatedRowHeight = 250
        tableView.rowHeight = UITableViewAutomaticDimension
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    @objc func clickCloseButton() {
        self.navigationController?.dismiss(animated: true, completion: nil)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return 2
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "HowtoTableViewCell", for: indexPath) as! HowtoTableViewCell
        
        switch indexPath.row {
        case 0:
            cell.titleLabel.text = "■ 恵方巻きとは"
            cell.detailLabel.text = "恵方巻、恵方巻き（えほうまき）とは、節分に恵方を向いて無言で食すると縁起が良いとされている。\n太巻寿司のこと。およびそれを食べる風習のこと。商都大阪発祥の風習といわれているがその起源の定説はいまだ存在せず、また昭和時代の広告や鮨店からの1969年の伝聞記録でも巻き寿司の記載はあれど太巻きや海苔巻の記載はなく、大阪ことばの巻（まき）は小田巻蒸しや玉子巻の略であることから 広告当時どのタイプの巻き寿司を指したのか明確ではない。\n「恵方巻」という名称は、1989年セブン-イレブン広島市中区舟入店野田靜眞氏が大阪には節分に太巻き寿司を食べる風習があると聴いて仕掛けたことにより1998年全国へ広がり、2000年代以降に急速に広まった。それ以前に「恵方巻」と呼ばれていたという文献類は見つかっていない。その他には「幸運巻寿司」、「恵方寿司」、「招福巻」などとも呼ぶ。"
            break
        case 1:
            cell.titleLabel.text = "■ 起源・発祥"
            cell.detailLabel.text = "恵方巻の起源・発祥は諸説存在し、信憑性も定かではない。説としては以下のようなものがある。\n・江戸時代の終わり頃、大阪の商人たちの商売繁盛と厄払いの意味合いで、立春の前日の節分に「幸運巻寿司」の習慣が始まったとする説。\n・江戸時代末期から明治時代初期、大阪の商人（「船場の商人」とする資料も存在する）による商売繁盛の祈願事として始まったという説。起因として「厄落とし・縁起担ぎ」「船場にある階段の中段で女性が太巻きを丸かじりして願い事をした」、「船場の旦那衆のあそび」が挙げられている。\n・豊臣秀吉の家臣・堀尾吉晴が偶々節分の前日に海苔巻きのような物を食べて出陣し、戦いに大勝利を収めたという故事を元にしているという説。ただし、板海苔の誕生は江戸時代であることから、この説の根拠の乏しさが指摘されている。\n・1800年代のある年の節分の日に、大阪近郊の申村（現在の此花区伝法付近と比定）に住む老若男女が集まり、巻寿司を食す時に、切り分ける手間を省くために一本丸かぶりをしたというのを発祥とする説。\n\n(Wikipedia)"
            break
        default: break
        }

        return cell
    }
}
