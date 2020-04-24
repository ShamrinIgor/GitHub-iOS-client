import UIKit
import Foundation

class TableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource
{
    
    var myTableView: UITableView = UITableView()
    var repositories: Repositories?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        myTableView.delegate = self
        myTableView.dataSource = self
        
        myTableView.register(UINib(nibName: "TalbeViewCell", bundle: nil), forCellReuseIdentifier: "TableViewCell")
        
        myTableView.frame = view.frame
        view.addSubview(myTableView)
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return (repositories?.arrayOfRepositories.count)!
    }

    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = myTableView.dequeueReusableCell(withIdentifier: String(describing: "TableViewCell")) as! TableViewCell
        
        cell.setCell(with: repositories!.arrayOfRepositories[indexPath.row], index: indexPath.row)
        return cell
    }

    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 90
    }

    func tableView(_ tableView: UITableView, estimatedHeightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let urlString = repositories!.arrayOfRepositories[indexPath.row].repositoryURL!
        
        DispatchQueue.main.async {
            let nextVC = WebViewController()
            nextVC.modalPresentationStyle = .overFullScreen
            nextVC.urlSting = urlString
            self.navigationController?.pushViewController(nextVC, animated: true)
        }
        
        tableView.deselectRow(at: indexPath, animated: true)
    }

}
