import UIKit

class TableViewController: UITableViewController {

    struct Row {
        let title: String
        let viewController: () -> UIViewController
    }
    
    private var rows: [Row] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setupInitialState()
        fillRows()
    }
    
    private func setupInitialState() {
        title = "Lightweight Charts"
        navigationController?.navigationBar.isTranslucent = false
        self.clearsSelectionOnViewWillAppear = true
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
    }
    
    private func fillRows() {
        rows = [
            Row(title: "Bar chart", viewController: { BarChartViewController() }),
            Row(title: "Candlestick chart", viewController: { CandlestickChartViewController() }),
            Row(title: "Custom font family", viewController: { CustomFontFamilyViewController() }),
            Row(title: "Custom price formatter", viewController: { CustomPriceFormatterViewController() }),
            Row(title: "Custom locale", viewController: { CustomLocaleViewController() }),
            Row(title: "Custom themes", viewController: { CustomThemesViewController() }),
            Row(title: "Custom watermark", viewController: { CustomWatermarkViewController() }),
            Row(title: "Legend", viewController: { LegendViewController() }),
            Row(title: "3-line legend", viewController: { ThreeLineLegendViewController() }),
            Row(title: "Fit content", viewController: { FitContentViewController() }),
            Row(title: "Floating tooltip", viewController: { FloatingTooltipViewController() }),
            Row(title: "Tracking tooltip", viewController: { TrackingTooltipViewController() }),
            Row(title: "Magnifier tooltip", viewController: { MagnifierTooltipViewController() }),
            Row(title: "Go to realtime button", viewController: { GoToRealtimeButtonViewController() }),
            Row(title: "Range switcher", viewController: { RangeSwitcherViewController() }),
            Row(title: "Intraday data", viewController: { IntradayDataViewController() }),
            Row(title: "Percentage price scale", viewController: { PercentagePriceScaleViewController() }),
            Row(title: "Inverted price scale", viewController: { InvertedPriceScaleViewController() }),
            Row(title: "Logarithmic price scale", viewController: { LogarithmicPriceScaleViewController() }),
            Row(title: "No time scale", viewController: { NoTimeScaleViewController() }),
            Row(title: "Price scale at left", viewController: { PriceScaleAtLeftViewController() }),
            Row(title: "No price scale", viewController: { NoPriceScaleViewController() }),
            Row(title: "Realtime emulation", viewController: { RealtimeEmulationViewController() }),
            Row(title: "Volume study", viewController: { VolumeStudyViewController() }),
            Row(title: "Markers", viewController: { MarkersViewController() }),
            Row(title: "Price line", viewController: { PriceLineViewController() }),
            Row(title: "Add and remove price line", viewController: { AddAndRemovePriceLineViewController() })
        ]
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int { 1 }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        rows.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "Cell", for: indexPath)
        let row = rows[indexPath.row]
        cell.textLabel?.text = row.title
        cell.detailTextLabel?.text = ""
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let row = rows[indexPath.row]
        let vc = row.viewController()
        vc.title = row.title
        self.navigationController?.pushViewController(vc, animated: true)
    }

}
