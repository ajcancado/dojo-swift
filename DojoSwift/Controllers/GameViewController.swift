//
//  ViewController.swift
//  DojoSwift
//
//  Created by Arthur Junqueira Cançado on 10/05/17.
//  Copyright © 2017 CI&T. All rights reserved.
//

import UIKit
import Alamofire
import Kingfisher
import ObjectMapper

class GameViewController: GenericViewController {

    @IBOutlet weak var tableView: UITableView!
    
    var games: [Game] = []
    
    var refreshControl: UIRefreshControl!
    
    let gameDAO = GameDAO()
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        setupTableView()
        
        setupPullToRefresh()
        
        showHUD()
        
        getGames()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.title = Constants.Messages.title
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        
        self.title = Constants.Messages.empty
    }
    
    func setupTableView() {
        
        tableView.tableFooterView = UIView(frame: .zero)
        
    }
    
    func setTableViewDelegateAndDataSource(){
        
        tableView.dataSource = self
        tableView.delegate = self
    }
    
    func setupPullToRefresh(){
        
        refreshControl = UIRefreshControl()
        refreshControl.attributedTitle = NSAttributedString(string: "Pull to refresh")
        refreshControl.addTarget(self, action: #selector(getGames), for: .valueChanged)
        
        tableView.addSubview(refreshControl)
    }
    
    func removeAllHuds(){
        
        hideHUD()
        
        if refreshControl.isRefreshing {
            
            refreshControl.endRefreshing()
        }
        
    }
    
    func getGames(){
        
        if NetworkManager.isInternetAvailable() {
        
            getGamesOnline()
        }
        else{
            getGamesOffline()
        }
    }
    
    func getGamesOffline(){
        
        removeAllHuds()
        
        games = gameDAO.getAll()
        
        setTableViewDelegateAndDataSource()
        
        tableView.reloadData()
        
    }
    
    func getGamesOnline(){
        
        var params: [String: Any] = [:]
        
        params["offset"] = 0
        params["limit"] = 50
        
        Alamofire.request(GameRouter.GetGamesTop(params))
            .responseJSON { response in
                
                self.removeAllHuds()
                
                switch response.result {
                    
                case .success(let json):
                    
//                    print(json)
                    
                    let gamesResponse = Mapper<GameResponse>().map(JSON: json as! [String: Any])
                    
                    self.games = gamesResponse!.games
                    
                    self.setTableViewDelegateAndDataSource()
                    
                    self.tableView.reloadData()
                    
                    self.gameDAO.deleteGames()

                    self.gameDAO.saveGames(games: self.games)
                    
                case .failure(let error):
                    
                    print("Cold not get games: \(error.localizedDescription)")
                    
                    self.removeAllHuds()
                }
        }
    }

}

extension GameViewController : UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        if games.count == 0 {
            tableView.separatorStyle = .none
            tableView.backgroundView?.isHidden = false
        } else {
            tableView.separatorStyle = .singleLine
            tableView.backgroundView?.isHidden = true
        }
        
        return games.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let row = indexPath.row
        
        let cell = tableView.dequeueReusableCell(withIdentifier: Constants.CellIds.defaultCellId, for: indexPath)
        
        let gameImage = cell.viewWithTag(1) as! UIImageView
        let gameName = cell.viewWithTag(2) as! UILabel
        
        let boxUrl = games[row].getBoxWith(width: gameImage.frame.width, andHeight: gameImage.frame.height)
        
        gameImage.kf.setImage(with: URL(string: boxUrl),
                                   placeholder: nil,
                                   options: [.transition(.fade(1))],
                                   progressBlock: nil,
                                   completionHandler: nil)
        
        gameName.text = games[row].name.capitalized
        
        return cell
    }
}

extension GameViewController : UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        performSegue(withIdentifier: Constants.SegueIds.segueToGameDetail, sender: self)
        
        tableView.deselectRow(at: indexPath, animated: true)
    }
}
