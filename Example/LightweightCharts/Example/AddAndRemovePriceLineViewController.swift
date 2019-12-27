import UIKit
import LightweightCharts

class AddAndRemovePriceLineViewController: UIViewController {
    
    private var chart: LightweightCharts!
    private var series: LineSeries!
    private var priceLineOne: PriceLine?
    private var priceLineTwo: PriceLine?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
    }
    
    private func setupUI() {
        let addButton = UIButton(type: .system)
        addButton.setTitle("Add", for: .normal)
        addButton.addTarget(self, action: #selector(addButtonTap), for: .touchUpInside)
        
        let removeButton = UIButton(type: .system)
        removeButton.setTitle("Remove", for: .normal)
        removeButton.addTarget(self, action: #selector(removeButtonTap), for: .touchUpInside)
        
        let options = ChartOptions()
        let chart = LightweightCharts(options: options)
        
        view.addSubview(chart)
        view.addSubview(addButton)
        view.addSubview(removeButton)
        
        chart.translatesAutoresizingMaskIntoConstraints = false
        addButton.translatesAutoresizingMaskIntoConstraints = false
        removeButton.translatesAutoresizingMaskIntoConstraints = false
        
        let padding: CGFloat = 16
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                addButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                addButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
                removeButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                removeButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding),
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                addButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                addButton.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                removeButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                removeButton.topAnchor.constraint(equalTo: view.topAnchor, constant: padding),
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        NSLayoutConstraint.activate([
            chart.topAnchor.constraint(equalTo: addButton.bottomAnchor, constant: padding)
        ])
        self.chart = chart
    }
    
    private func setupData() {
        let series = chart.addLineSeries(options: nil)
        let data = generateData()
        series.setData(data: data)
        self.series = series
    }
    
    private func setupPriceLines() {
        guard priceLineOne == nil, priceLineTwo == nil else { return }
        priceLineOne = series.createPriceLine(options: PriceLineOptions(price: 10))
        priceLineTwo = series.createPriceLine(options: PriceLineOptions(price: 20))
    }
    
    private func removePriceLines() {
        priceLineOne.map { series.removePriceLine(line: $0) }
        priceLineTwo.map { series.removePriceLine(line: $0) }
        priceLineOne = nil
        priceLineTwo = nil
    }
    
    private func generateData() -> [LineData] {
        var time = DateComponents(calendar: .current, year: 2018, day: 0).date!
        var result: [LineData] = []
        for i in 0..<60 {
            time = Date(timeInterval: 60 * 60 * 24, since: time)
            let lineData = LineData(time: .utc(timestamp: time.timeIntervalSince1970), value: Double(i))
            result.append(lineData)
        }
        return result
    }
    
    @objc private func addButtonTap(_ sender: UIButton) {
        setupPriceLines()
    }
    
    @objc private func removeButtonTap(_ sender: UIButton) {
        removePriceLines()
    }
    
}
