//
//  GroupsVC.swift
//  FriendlyChat
//
//  Created by Kaiserdem on 25.08.2019.
//  Copyright © 2019 Kaiserdem. All rights reserved.
//

import UIKit

class GroupsVC: UIViewController {
  
  @IBOutlet weak var groupsTableView: UITableView!
  
  var groupsArray = [Group]()
  
  override func viewDidLoad() {
    super.viewDidLoad()
    groupsTableView.delegate = self
    groupsTableView.dataSource = self
    groupsTableView.reloadData()
  }
  
  override func viewDidAppear(_ animated: Bool) {
    super.viewDidAppear(animated)
    
    DataService.instance.REF_GROUPS.observe(.value) { (snapshot) in
      
      
      DataService.instance.getAllGroups { (returnedGroupsArray) in
        self.groupsArray = returnedGroupsArray
        self.groupsTableView.reloadData()
      }
    }
  }
  
}
extension GroupsVC: UITableViewDelegate, UITableViewDataSource {
  
  func numberOfSections(in tableView: UITableView) -> Int {
    return 1
  }
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return groupsArray.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    guard let cell = groupsTableView.dequeueReusableCell(withIdentifier: "groupCell", for: indexPath) as? GroupCell else { return UITableViewCell() }
    let group = groupsArray[indexPath.row]
    cell.configureCell(title: group.groupTitle, description: group.groupDesc, memberCount: group.memberCount)
    return cell
  }
  func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    guard let groupFeedVC = storyboard?.instantiateViewController(withIdentifier: "groupFeedVC") as? GroupFeedVC else { return }
    
    groupFeedVC.initGroupData(forGroup: groupsArray[indexPath.row])
      present(groupFeedVC, animated: true, completion: nil)
  }
  
}
