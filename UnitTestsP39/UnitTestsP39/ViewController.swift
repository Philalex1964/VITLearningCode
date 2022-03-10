//
//  ViewController.swift
//  UnitTestsP39
//
//  Created by Aleksandar Filipov on 3/7/22.
//

import UIKit

class ViewController: UITableViewController {
    var playData = PlayData()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Searching for swift"
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .search, target: self, action: #selector(searchTapped))
    }
    
    // MARK: - Table view data source
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return playData.filteredWords.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        
        let word = playData.filteredWords[indexPath.row]
        cell.textLabel!.text = word
        cell.detailTextLabel?.text = "\(playData.wordCounts.count(for: word))"
        
        return cell
    }
    
    @objc func searchTapped() {
        let ac = UIAlertController(title: "Filter...", message: nil, preferredStyle: .alert)
        ac.addTextField()
        
        ac.addAction(UIAlertAction(title: "Filter", style: .default) { [unowned self] _ in
            let userInput = ac.textFields?[0].text ?? "0"
            
            self.playData.applyUserFilter(userInput)
            title = "Searching for \(userInput)"
            self.tableView.reloadData()
        })
        
        ac.addAction(UIAlertAction(title: "Cancel", style: .default))
        
        present(ac, animated: true)
    }
}
