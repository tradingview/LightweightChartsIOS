import UIKit
import LightweightCharts

class MarkersViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: BarSeries!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        chart.loadDelegate = self
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
    
    private func generateData() -> ([BarData], [SeriesMarker])  {
        var time = DateComponents(calendar: .current, year: 2018, day: 0).date!
        var data: [BarData] = []
        for i in 0..<500 {
            time = Date(timeInterval: 60 * 60 * 24, since: time)
            let step = Double(i % 20) / 1000.0
            let base = Double(i) / 5.0
            let barData = BarData(
                time: .utc(timestamp: time.timeIntervalSince1970),
                open: base * (1 - step),
                high: base * (1 + 2 * step),
                low: base * (1 - 2 * step),
                close: base * (1 + step)
            )
            data.append(barData)
        }
        
        let markers = [
            SeriesMarker(time: data[data.count - 30].time, position: .belowBar, shape: .circle, color: ChartColor(.orange)),
            SeriesMarker(time: data[data.count - 30].time, position: .belowBar, shape: .circle, color: ChartColor(.yellow)),
            SeriesMarker(time: data[data.count - 30].time, position: .belowBar, shape: .circle, color:  ChartColor(.green)),
            SeriesMarker(time: data[data.count - 20].time, position: .aboveBar, shape: .circle, color:  ChartColor(.orange)),
            SeriesMarker(time: data[data.count - 20].time, position: .aboveBar, shape: .circle, color:  ChartColor(.yellow)),
            SeriesMarker(time: data[data.count - 20].time, position: .aboveBar, shape: .circle, color:  ChartColor(.green)),
            SeriesMarker(time: data[data.count - 15].time, position: .inBar, shape: .circle, color:  ChartColor(.orange)),
            SeriesMarker(time: data[data.count - 10].time, position: .inBar, shape: .circle, color:  ChartColor(.red))
        ]
        
        return (data,markers)
    }
    
}


// MARK: - MessageHandlerDelegate
extension MarkersViewController: LightweightChartsDelegate {
    
    func lightweightChartsDidLoad(_ lightweightCharts: LightweightCharts) {
        let (data, markers) = generateData()

        let series = chart.addBarSeries(options: nil)
        self.series = series
        series.setData(data: data)
        series.setMarkers(data: markers)
        
    }
    
    func lightweightCharts(_ lightweightCharts: LightweightCharts, didFailLoadWithError error: Error) {
        
    }
    
}
