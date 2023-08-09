import UIKit
import LightweightCharts

class PriceLineViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: BaselineSeries!
    private var priceLine: PriceLine!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        setupPriceLine()
        
        let options = PriceLineOptions(
            price: 20,
            lineWidth: .two,
            lineStyle: .dotted
        )
        priceLine.applyOptions(options: options)
    }
    
    private func setupUI() {
        let options = ChartOptions()
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        self.chart = chart
    }
    
    private func setupData() {
        let series = chart.addBaselineSeries(options: BaselineSeriesOptions(
            topFillColor1: "#fff",
            topFillColor2: "#0f0"
        ))
        let data = generateData()
        series.setData(data: data)
        self.series = series
    }
    
    private func setupPriceLine() {
        let options = PriceLineOptions(
            price: 10,
            color: "#f00",
            lineWidth: .one,
            lineStyle: .solid
        )
        let priceLine = series.createPriceLine(options: options)
        self.priceLine = priceLine
    }
    
    private func generateData() -> [BaselineData] {
        var time = DateComponents(calendar: .current, year: 2018, day: 0).date!
        var result: [BaselineData] = []
        for i in 0..<60 {
            time = Date(timeInterval: 60 * 60 * 24, since: time)
            let lineData = BaselineData(time: .utc(timestamp: time.timeIntervalSince1970), value: Double(i))
            result.append(lineData)
        }
        return result
    }
    
}
