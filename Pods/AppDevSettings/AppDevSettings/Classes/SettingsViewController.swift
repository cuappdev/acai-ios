//
//  SettingsViewController.swift
//  AppDevSettings
//
//  Created by Drew Dunne on 4/11/19.
//

import SnapKit
import UIKit

public class SettingsViewController: UITableViewController {

    private var config: SettingsConfig!

    private enum CellIdentifiers {
        public static let booleanCell = "booleanCell"
        public static let buttonCell = "buttonCell"
        public static let inputCell = "inputCell"
    }

    public init(config: SettingsConfig) {

        super.init(style: .grouped)

        self.config = config

        let headerImageBuffer: CGFloat = 20

        if let image = config.headerImage, let h = config.headerHeight {

            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: h + 2*headerImageBuffer))

            let imageView = UIImageView(image: image)
            imageView.contentMode = .scaleAspectFit
            headerView.addSubview(imageView)

            imageView.snp.makeConstraints { make in
                make.leading.trailing.equalToSuperview()
                make.top.bottom.equalToSuperview().inset(headerImageBuffer)
            }

            tableView.tableHeaderView = headerView

        } else if let view = config.headerView, let h = config.headerHeight {

            let headerView = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.width, height: h))
            headerView.addSubview(view)

            view.snp.makeConstraints { make in
                make.edges.equalToSuperview()
            }

            tableView.tableHeaderView = headerView

        }

        self.tableView.register(BooleanTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.booleanCell)
        self.tableView.register(ButtonTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.buttonCell)
        self.tableView.register(InputTableViewCell.self, forCellReuseIdentifier: CellIdentifiers.inputCell)

    }

    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    override public func viewDidLoad() {
        super.viewDidLoad()

        title = "Settings"

        navigationItem.leftBarButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(didPressDone))
    }

    override public func numberOfSections(in tableView: UITableView) -> Int {
        return config.sectionsOfItems.count
    }

    override public func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return config.sectionsOfItems[section].count
    }

    override public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {

        let item = config.sectionsOfItems[indexPath.section][indexPath.row]

        switch item {
        case .bool(let title, let key, let compl):
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.booleanCell) as! BooleanTableViewCell
            cell.title = title
            cell.key = key
            cell.completion = compl
            return cell

        case .string(let title, let key, let completion):
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.inputCell) as! InputTableViewCell
            cell.title = title
            cell.key = key
            cell.completion = completion
            return cell
            
        case .button(let title, let style, _):
            let cell = tableView.dequeueReusableCell(withIdentifier: CellIdentifiers.buttonCell) as! ButtonTableViewCell
            cell.title = title
            cell.style = style
            return cell
        default:
            return UITableViewCell()
        }

    }

    override public func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        tableView.deselectRow(at: indexPath, animated: true)

        let item = config.sectionsOfItems[indexPath.section][indexPath.row]

        switch item {
        case .button(_, _, let action):
            action?(self)
        default:
            return
        }

    }

    override public func tableView(_ tableView: UITableView, shouldHighlightRowAt indexPath: IndexPath) -> Bool {
        let item = config.sectionsOfItems[indexPath.section][indexPath.row]
        switch item {
        case .button(_, _, _):
            return true
        default:
            return false
        }
    }

    @objc func didPressDone() {
        dismiss(animated: true, completion: nil)
    }
    
}
