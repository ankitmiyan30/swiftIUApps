//
//  AddNewMeetingViewController.swift
//  BookMyMeeting
//
//  Created by Anthony Ankit on 23/09/20.
//

import UIKit
import Firebase
import SwiftyJSON
import FirebaseDatabase
import TTGSnackbar
import MessageUI
class AddNewMeetingViewController: BookMeetingBaseViewController, MFMailComposeViewControllerDelegate {
    
    public static let allMemberListCellIdentifier = "selectedMemberListCellIdentifier"
    public static let selecterMemberListCellIdentifier = "MeetingMemberTableViewCell"
    
    @IBOutlet weak var selfEmailTV: UILabel!
    @IBOutlet weak var meetingTitleView: UITextField!
    @IBOutlet weak var locationTextLabel: UILabel!
    @IBOutlet weak var searchBarTableView: UITableView!
    @IBOutlet weak var startDateTimeLabel: UILabel!
    @IBOutlet weak var searchMemberSearchBar: UISearchBar!
    @IBOutlet weak var endDateTimeLabel: UILabel!
    @IBOutlet weak var selectedMemberTableView: UITableView!
    
    var dateLabelTag:Int = 0
    var selectedMemberList = [String]()
    var sortedMemberNameList = [String]()
    var searching = false
    var datePickerIsHidden = true
    
    var allMemberNameList = [String]()
    //    var locationsList = [String]()
    let locationsList:[String] = ["Raja Ji G-Floor", "Corbet G-Floor", "Nanital G-Floor", "Masoori G-Floor", "Sunshine 1st-Floor", "Rainbow 1st-Floor", "Sky 1st-Floor"]
    
    lazy var popUpWindow: DateTimePickerView = {
        let view = DateTimePickerView()
        view.translatesAutoresizingMaskIntoConstraints = false
        view.layer.cornerRadius = 5
        view.layer.borderWidth = 2
        view.layer.borderColor = kBaseNavigationBarTintColor.cgColor
        view.layer.shadowRadius = 4
        view.layer.shadowColor = UIColor.gray.cgColor
        view.layer.shadowOpacity = 0.5
        view.delegate = self
        view.timePickerWidth = self.view.frame.width - 74
        return view
    }()
    
    let visualEffectView: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .light)
        let view = UIVisualEffectView(effect: blurEffect)
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()
    
    let transparentView = UIView()
    let locationsTableView = UITableView()
    var selectedLocationLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Add Meeting"
        searchBarSetup()
        addBackButton()
        datePickerSetup()
        tableViewAndCellSetup()
        addShadow()
        if let localData = self.getMyDefaultsData() {
            self.parse(jsonData: localData)
        }
        addingTapGesturesRecToComponent()
        searchBarTableView.isHidden = true
        searchBarTableView.layer.cornerRadius = 4
        selectedMemberTableView.layer.cornerRadius = 4
        selectedMemberTableView.layer.shadowRadius = 5
    }
    
    func addShadow(){
        selfEmailTV.addShadow()
        meetingTitleView.addShadow()
        locationTextLabel.addShadow()
        startDateTimeLabel.addShadow()
        searchMemberSearchBar.addShadow()
        endDateTimeLabel.addShadow()
    }
    
    func tableViewAndCellSetup(){
        searchBarTableView.tag = 1001
        selectedMemberTableView.tag = 1002
        locationsTableView.tag = 1003
        locationsTableView.delegate = self
        locationsTableView.dataSource = self
        locationsTableView.separatorColor = UIColor.clear
        locationsTableView.alwaysBounceVertical = false
        locationsTableView.alwaysBounceVertical = false
        locationsTableView.showsVerticalScrollIndicator = false
        locationsTableView.register(LocationsTableViewCell.self, forCellReuseIdentifier: "LocationsTableViewCell")
        selectedMemberTableView.register(UINib(nibName: AddNewMeetingViewController.selecterMemberListCellIdentifier, bundle: nil), forCellReuseIdentifier: AddNewMeetingViewController.selecterMemberListCellIdentifier)
    }
    
    func addingTapGesturesRecToComponent(){
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(setStartDateClicked))
        startDateTimeLabel.isUserInteractionEnabled = true
        startDateTimeLabel.addGestureRecognizer(tapGesture)
        
        let tapGesture1 = UITapGestureRecognizer(target: self, action: #selector(setEndDateClicked))
        endDateTimeLabel.isUserInteractionEnabled = true
        endDateTimeLabel.addGestureRecognizer(tapGesture1)
        
        let locationLabelTapGesture = UITapGestureRecognizer(target: self, action: #selector(openLocationSelectorPopup))
        locationTextLabel.isUserInteractionEnabled = true
        locationTextLabel.addGestureRecognizer(locationLabelTapGesture)
    }
    
    func datePickerSetup(){
        view.addSubview(visualEffectView)
        visualEffectView.leftAnchor.constraint(equalTo: view.leftAnchor).isActive = true
        visualEffectView.bottomAnchor.constraint(equalTo: view.bottomAnchor).isActive = true
        visualEffectView.rightAnchor.constraint(equalTo: view.rightAnchor).isActive = true
        visualEffectView.topAnchor.constraint(equalTo: view.topAnchor).isActive = true
        visualEffectView.alpha = 0
    }
    
    
    @IBAction func saveMyEvent(_ sender: Any) {
        if (validateUserInput()){
            self.sendEmailToGuests()
        }
    }
    
    func sendEmailToGuests(){
        if MFMailComposeViewController.canSendMail() {
            let mail = MFMailComposeViewController()
            mail.mailComposeDelegate = self
            mail.setToRecipients(selectedMemberList)
            mail.setMessageBody(meetingTitleView.text!, isHTML: true)
            mail.setSubject(meetingTitleView.text!)
            mail.setPreferredSendingEmailAddress(selfEmailTV.text!)
            present(mail, animated: true)
        } else {
            print("show failure alert")
        }
    }
    
    func saveMeetingFB(){
        if JSONSerialization.isValidJSONObject(getObjectData()) {
            if FireDBHelper.firebaseDBHelper.saveEvent(object: getObjectData()) {
                showAlertMessage(message: "Meeting added.")
                self.navigationController?.popViewController(animated: true)
            } else {
                showAlertMessage(message: "Meeting not added.")
            }
        } else {
            showAlertMessage(message: "Invalid Data")
        }
    }
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        if result.rawValue == 0 {
            // delete and back to root view controller
            controller.dismiss(animated: true)
            self.navigationController?.popViewController(animated: true)
        } else if result.rawValue == 1 {
            controller.dismiss(animated: true)
        } else {
            self.saveMeetingFB()
            controller.dismiss(animated: true)
        }
    }
  
    
    func getObjectData()-> [String: Any] {
        return [
            "meeting_title": meetingTitleView.text!,
            "host_email": selfEmailTV.text!,
            "startTime": startDateTimeLabel.text!,
            "endTime": endDateTimeLabel.text!,
            "location": locationTextLabel.text!,
            "guests": selectedMemberList,
            "meetingResponse" : 2
        ]
    }
    
    func validateUserInput() -> Bool{
        if (meetingTitleView.text!.count < 4){
            showAlertMessage(message: "Enter valid meeting title.")
            return false
        }
        if (selfEmailTV.text!.count == 0) {
            showAlertMessage(message: "Enter valid email address.")
            return false
        }
        if (locationTextLabel.text == "Select Room") {
            showAlertMessage(message: "Select Location.")
            return false
        }
        if (startDateTimeLabel.text == "Start Time"){
            showAlertMessage(message: "Choose Start Time.")
            return false
        }
        if (endDateTimeLabel.text == "End Time"){
            showAlertMessage(message: "Choose End Time.")
            return false
        }
        if(selectedMemberList.count == 0){
            showAlertMessage(message: "Select Guests")
            return false
        }
        return true
    }
    
    func showAlertMessage(message:String) {
        let snackbar = TTGSnackbar(message: message, duration: .short)
        snackbar.show()
    }
    
    
    @objc func openLocationSelectorPopup() {
        selectedLocationLabel = locationTextLabel
        addTransparentView(frames: selectedLocationLabel.frame)
    }
    
    @objc func setStartDateClicked(){
        dateLabelTag = 1
        setupDatePopupView()
    }
    
    @objc func setEndDateClicked(){
        dateLabelTag = 2
        setupDatePopupView()
    }
    
    func addTransparentView(frames: CGRect) {
        let window = UIApplication.shared.windows.first { $0.isKeyWindow }
        transparentView.frame = window?.frame ?? self.view.frame
        self.view.addSubview(transparentView)
        
        locationsTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        self.view.addSubview(locationsTableView)
        locationsTableView.layer.cornerRadius = 5
        
        transparentView.backgroundColor = UIColor.black.withAlphaComponent(0.9)
        locationsTableView.reloadData()
        let tapgesture = UITapGestureRecognizer(target: self, action: #selector(removeTransparentView))
        transparentView.addGestureRecognizer(tapgesture)
        transparentView.alpha = 0
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0.5
            self.locationsTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height + 5, width: frames.width, height: self.view.frame.height / 2)
        }, completion: nil)
    }
    
    @objc func removeTransparentView() {
        let frames = selectedLocationLabel.frame
        UIView.animate(withDuration: 0.4, delay: 0.0, usingSpringWithDamping: 1.0, initialSpringVelocity: 1.0, options: .curveEaseInOut, animations: {
            self.transparentView.alpha = 0
            self.locationsTableView.frame = CGRect(x: frames.origin.x, y: frames.origin.y + frames.height, width: frames.width, height: 0)
        }, completion: nil)
    }
    
    func setupDatePopupView(){
        view.addSubview(popUpWindow)
        if #available(iOS 14, *) {
            popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
            popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            popUpWindow.heightAnchor.constraint(equalToConstant: view.frame.width - 190).isActive = true
            popUpWindow.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        } else {
            popUpWindow.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -40).isActive = true
            popUpWindow.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
            popUpWindow.heightAnchor.constraint(equalToConstant: view.frame.width - 10).isActive = true
            popUpWindow.widthAnchor.constraint(equalToConstant: view.frame.width - 64).isActive = true
        }
        popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        popUpWindow.alpha = 0
        UIView.animate(withDuration: 0.5) {
            self.visualEffectView.alpha = 1
            self.popUpWindow.alpha = 1
            self.popUpWindow.transform = CGAffineTransform.identity
        }
    }
    
    func searchBarSetup(){
        searchMemberSearchBar.delegate = self
        searchMemberSearchBar.placeholder = "Email / Name"
        searchMemberSearchBar.showsCancelButton = true
        searchMemberSearchBar.layer.borderWidth = 1
        searchMemberSearchBar.tintColor = kBaseNavigationBarTintColor
        searchMemberSearchBar.layer.borderColor = UIColor.white.cgColor
    }
    
    func dateConverter(date:Date)-> String{
        let dateFormatter = DateFormatter()
        dateFormatter.locale = Locale(identifier: "en_US_POSIX") // set locale to reliable US_POSIX
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ssZ"
        let newDate = dateFormatter.date(from:"\(date)")!
        dateFormatter.dateFormat = "dd-MM-yyyy HH:mm a"
        let datenew = dateFormatter.string(from: newDate)
        return datenew
    }
    
}

extension AddNewMeetingViewController: DatePickerViewDelegate {
    
    func handleDismissal() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
            print("Cancel Pop Up View")
        }
    }
    
    func handleSetDate() {
        UIView.animate(withDuration: 0.5, animations: {
            self.visualEffectView.alpha = 0
            self.popUpWindow.alpha = 0
            self.popUpWindow.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
        }) { (_) in
            self.popUpWindow.removeFromSuperview()
            if (self.dateLabelTag == 1 ) {
                self.startDateTimeLabel.text = self.dateConverter(date: self.popUpWindow.timePicker.date)
            } else {
                self.endDateTimeLabel.text = self.dateConverter(date: self.popUpWindow.timePicker.date)
            }
        }
    }
}

extension AddNewMeetingViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if(tableView.tag == 1002){
            return selectedMemberList.count
        } else if (tableView.tag == 1001) {
            if searching {
                return sortedMemberNameList.count
            } else {
                return allMemberNameList.count
            }
        } else {
            return locationsList.count
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(tableView.tag == 1001){
            let cell = searchBarTableView.dequeueReusableCell(withIdentifier: "selectedMemberListCellIdentifier", for: indexPath)
            if(searching){
                cell.textLabel?.text = sortedMemberNameList[indexPath.row]
            } else {
                cell.textLabel?.text = allMemberNameList[indexPath.row]
            }
            cell.textLabel?.font = UIFont(name: "AmericanTypewriter-Bold", size: 11)
            return cell
        } else if (tableView.tag == 1002) {
            let cell = selectedMemberTableView.dequeueReusableCell(withIdentifier: AddNewMeetingViewController.selecterMemberListCellIdentifier, for: indexPath) as! MeetingMemberTableViewCell
            cell.memberName.text = selectedMemberList[indexPath.row]
            return cell
        } else {
            let cell = locationsTableView.dequeueReusableCell(withIdentifier: "LocationsTableViewCell", for: indexPath)
            cell.textLabel?.text = locationsList[indexPath.row]
            return cell
        }
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if(tableView.tag == 1001){
            searchBarTableView.isHidden = true
            selectedMemberList.append(sortedMemberNameList[indexPath.row])
            selectedMemberList = Array(Set(selectedMemberList))
            selectedMemberTableView.reloadData()
        }
        searchMemberSearchBar.text = ""
        self.searchMemberSearchBar.endEditing(true)
        if(tableView.tag == 1003){
            locationTextLabel.text = locationsList[indexPath.row]
            removeTransparentView()
        }
    }
}

extension AddNewMeetingViewController: UISearchBarDelegate {
    
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        sortedMemberNameList = allMemberNameList.filter({$0.lowercased().prefix(searchText.count) == searchText.lowercased()})
        searchBarTableView.isHidden = false
        searching = true
        searchBarTableView.reloadData()
    }
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        searchMemberSearchBar.text = ""
        searching = false
        searchBarTableView.isHidden = true
        searchBarTableView.reloadData()
        self.searchMemberSearchBar.endEditing(true)
    }
    
    func searchBarSearchButtonClicked(_ searchBar: UISearchBar){
        searchMemberSearchBar.text = ""
        searchBarTableView.isHidden = true
        self.searchMemberSearchBar.endEditing(true)
    }
}

extension AddNewMeetingViewController {
    func getMyDefaultsData() ->  Data?{
        do {
            if let bundlePath = Bundle.main.path(forResource: "csvjson",ofType: "json"), let jsonData = try String(contentsOfFile: bundlePath).data(using: .utf8) {
                return jsonData
            }
        } catch {
            print(error)
        }
        return nil
    }
    
    private func parse(jsonData: Data) {
        let decoder = JSONDecoder()
        do {
            let decodedData = try decoder.decode(MainEmployee.self,from: jsonData)
            let localListOfEmployeData = decodedData.employeelist
            allMemberNameList = localListOfEmployeData.map({ $0.eMail1Value })
            //            setupRemoteConfigDefaults(defaultData: localListOfEmployeData)
            //            fetchCloudValues()
        } catch {
            print("decode error")
        }
    }
    
    func setupRemoteConfigDefaults(defaultData: [Employee]){
        let remoteConfig = RemoteConfig.remoteConfig()
        let settings = RemoteConfigSettings()
        settings.minimumFetchInterval = 0
        remoteConfig.configSettings = settings
        var remoteConfigDefaults = [String: NSObject]()
        let testArr: [Employee] = defaultData
        remoteConfigDefaults["employeelist"] = testArr as NSObject
        remoteConfig.setDefaults(remoteConfigDefaults)
        
        remoteConfig.fetch() { (status, error) -> Void in
            if status == .success {
                
                
                print("Config fetched!")
                remoteConfig.activate() { [self] (changed, error) in
                    print(changed)
                }
            } else {
                print("Config not fetched")
                print("Error: \(error?.localizedDescription ?? "No error available.")")
            }
            let text = remoteConfig["employeelist"]
            //            let data = Data(text.utf8)
            //            print(data)
            //            self.parse(jsonData: text)
            //            self.remoteParse(str: "text!")
        }
    }
    
    func fetchCloudValues() {
        // 1
        // WARNING: Don't actually do this in production!
        let fetchDuration: TimeInterval = 0
        RemoteConfig.remoteConfig().fetch(withExpirationDuration: fetchDuration) { status, error in
            
            if let error = error {
                print("Uh-oh. Got an error fetching remote values \(error)")
                return
            }
            
            // 2
            RemoteConfig.remoteConfig().activateFetched()
            let text = RemoteConfig.remoteConfig()["employeelist"]
            print("Retrieved values from the cloud!")
        }
    }
    
    
    func remoteParse(str: String){
        if let json = try? JSONSerialization.data(withJSONObject: str, options: []) {
            if let content = String(data: json, encoding: .utf8) {
                print(content)
            }
        }
        
    }
    
    func displayWelcome() {
        // [START get_config_value]
        //            let welcomeMessage = remoteConfig["employeelist"].stringValue
        //            // [END get_config_value]
        //            print(welcomeMessage)
        
    }
    
    //    func fecthDataFromRemote(){
    //        RemoteConfig.remoteConfig().fetch(withExpirationDuration: 0) { (status, error) in
    //            guard error == nil else {
    //                print("fasdfas")
    //                return
    //            }
    //            print("Success Received data from clund")
    //            RemoteConfig.remoteConfig().activate { (value, error) in
    //                print(value)
    //            }
    //            let value = RemoteConfig.remoteConfig().configValue(forKey: "employeelist").stringValue
    //            print(value)
    //        }
    //    }
    
}
