import UIKit
import LightweightCharts

class RealtimeEmulationViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: CandlestickSeries!
    private var data = [
        CandlestickData(time: .string("2018-10-19"), open: 54.62, high: 55.50, low: 54.52, close: 54.90),
        CandlestickData(time: .string("2018-10-22"), open: 55.08, high: 55.27, low: 54.61, close: 54.98),
        CandlestickData(time: .string("2018-10-23"), open: 56.09, high: 57.47, low: 56.09, close: 57.21),
        CandlestickData(time: .string("2018-10-24"), open: 57.00, high: 58.44, low: 56.41, close: 57.42),
        CandlestickData(time: .string("2018-10-25"), open: 57.46, high: 57.63, low: 56.17, close: 56.43),
        CandlestickData(time: .string("2018-10-26"), open: 56.26, high: 56.62, low: 55.19, close: 55.51),
        CandlestickData(time: .string("2018-10-29"), open: 55.81, high: 57.15, low: 55.72, close: 56.48),
        CandlestickData(time: .string("2018-10-30"), open: 56.92, high: 58.80, low: 56.92, close: 58.18),
        CandlestickData(time: .string("2018-10-31"), open: 58.32, high: 58.32, low: 56.76, close: 57.09),
        CandlestickData(time: .string("2018-11-01"), open: 56.98, high: 57.28, low: 55.55, close: 56.05),
        CandlestickData(time: .string("2018-11-02"), open: 56.34, high: 57.08, low: 55.92, close: 56.63),
        CandlestickData(time: .string("2018-11-05"), open: 56.51, high: 57.45, low: 56.51, close: 57.21),
        CandlestickData(time: .string("2018-11-06"), open: 57.02, high: 57.35, low: 56.65, close: 57.21),
        CandlestickData(time: .string("2018-11-07"), open: 57.55, high: 57.78, low: 57.03, close: 57.65),
        CandlestickData(time: .string("2018-11-08"), open: 57.70, high: 58.44, low: 57.66, close: 58.27),
        CandlestickData(time: .string("2018-11-09"), open: 58.32, high: 59.20, low: 57.94, close: 58.46),
        CandlestickData(time: .string("2018-11-12"), open: 58.84, high: 59.40, low: 58.54, close: 58.72),
        CandlestickData(time: .string("2018-11-13"), open: 59.09, high: 59.14, low: 58.32, close: 58.66),
        CandlestickData(time: .string("2018-11-14"), open: 59.13, high: 59.32, low: 58.41, close: 58.94),
        CandlestickData(time: .string("2018-11-15"), open: 58.85, high: 59.09, low: 58.45, close: 59.08),
        CandlestickData(time: .string("2018-11-16"), open: 59.06, high: 60.39, low: 58.91, close: 60.21),
        CandlestickData(time: .string("2018-11-19"), open: 60.25, high: 61.32, low: 60.18, close: 60.62),
        CandlestickData(time: .string("2018-11-20"), open: 61.03, high: 61.58, low: 59.17, close: 59.46),
        CandlestickData(time: .string("2018-11-21"), open: 59.26, high: 59.90, low: 58.88, close: 59.16),
        CandlestickData(time: .string("2018-11-23"), open: 58.86, high: 59.00, low: 58.29, close: 58.64),
        CandlestickData(time: .string("2018-11-26"), open: 58.64, high: 59.51, low: 58.31, close: 59.17),
        CandlestickData(time: .string("2018-11-27"), open: 59.21, high: 60.70, low: 59.18, close: 60.65),
        CandlestickData(time: .string("2018-11-28"), open: 60.70, high: 60.73, low: 59.64, close: 60.06),
        CandlestickData(time: .string("2018-11-29"), open: 59.42, high: 59.79, low: 59.26, close: 59.45),
        CandlestickData(time: .string("2018-11-30"), open: 59.57, high: 60.37, low: 59.48, close: 60.30),
        CandlestickData(time: .string("2018-12-03"), open: 59.50, high: 59.75, low: 57.69, close: 58.16),
        CandlestickData(time: .string("2018-12-04"), open: 58.10, high: 59.40, low: 57.96, close: 58.09),
        CandlestickData(time: .string("2018-12-06"), open: 58.18, high: 58.64, low: 57.16, close: 58.08),
        CandlestickData(time: .string("2018-12-07"), open: 57.91, high: 58.43, low: 57.34, close: 57.68),
        CandlestickData(time: .string("2018-12-10"), open: 57.80, high: 58.37, low: 56.87, close: 58.27),
        CandlestickData(time: .string("2018-12-11"), open: 58.77, high: 59.40, low: 58.63, close: 58.85),
        CandlestickData(time: .string("2018-12-12"), open: 57.79, high: 58.19, low: 57.23, close: 57.25),
        CandlestickData(time: .string("2018-12-13"), open: 57.00, high: 57.50, low: 56.81, close: 57.09),
        CandlestickData(time: .string("2018-12-14"), open: 56.95, high: 57.50, low: 56.75, close: 57.08),
        CandlestickData(time: .string("2018-12-17"), open: 57.06, high: 57.31, low: 55.53, close: 55.95),
        CandlestickData(time: .string("2018-12-18"), open: 55.94, high: 56.69, low: 55.31, close: 55.65),
        CandlestickData(time: .string("2018-12-19"), open: 55.72, high: 56.92, low: 55.50, close: 55.86),
        CandlestickData(time: .string("2018-12-20"), open: 55.92, high: 56.01, low: 54.26, close: 55.07),
        CandlestickData(time: .string("2018-12-21"), open: 54.84, high: 56.53, low: 54.24, close: 54.92),
        CandlestickData(time: .string("2018-12-24"), open: 54.68, high: 55.04, low: 52.94, close: 53.05),
        CandlestickData(time: .string("2018-12-26"), open: 53.23, high: 54.47, low: 52.40, close: 54.44),
        CandlestickData(time: .string("2018-12-27"), open: 54.31, high: 55.17, low: 53.35, close: 55.15),
        CandlestickData(time: .string("2018-12-28"), open: 55.37, high: 55.86, low: 54.90, close: 55.27),
        CandlestickData(time: .string("2018-12-31"), open: 55.53, high: 56.23, low: 55.07, close: 56.22),
        CandlestickData(time: .string("2019-01-02"), open: 56.16, high: 56.16, low: 55.28, close: 56.02),
        CandlestickData(time: .string("2019-01-03"), open: 56.30, high: 56.99, low: 56.06, close: 56.22),
        CandlestickData(time: .string("2019-01-04"), open: 56.49, high: 56.89, low: 55.95, close: 56.36),
        CandlestickData(time: .string("2019-01-07"), open: 56.76, high: 57.26, low: 56.55, close: 56.72),
        CandlestickData(time: .string("2019-01-08"), open: 57.27, high: 58.69, low: 57.05, close: 58.38),
        CandlestickData(time: .string("2019-01-09"), open: 57.68, high: 57.72, low: 56.85, close: 57.05),
        CandlestickData(time: .string("2019-01-10"), open: 57.29, high: 57.70, low: 56.87, close: 57.60),
        CandlestickData(time: .string("2019-01-11"), open: 57.84, high: 58.26, low: 57.42, close: 58.02),
        CandlestickData(time: .string("2019-01-14"), open: 57.83, high: 58.15, low: 57.67, close: 58.03),
        CandlestickData(time: .string("2019-01-15"), open: 57.74, high: 58.29, low: 57.58, close: 58.10),
        CandlestickData(time: .string("2019-01-16"), open: 57.93, high: 57.93, low: 57.00, close: 57.08),
        CandlestickData(time: .string("2019-01-17"), open: 57.16, high: 57.40, low: 56.21, close: 56.83),
        CandlestickData(time: .string("2019-01-18"), open: 56.92, high: 57.47, low: 56.84, close: 57.09),
        CandlestickData(time: .string("2019-01-22"), open: 57.23, high: 57.39, low: 56.40, close: 56.99),
        CandlestickData(time: .string("2019-01-23"), open: 56.98, high: 57.87, low: 56.93, close: 57.76),
        CandlestickData(time: .string("2019-01-24"), open: 57.61, high: 57.65, low: 56.50, close: 57.07),
        CandlestickData(time: .string("2019-01-25"), open: 57.18, high: 57.47, low: 56.23, close: 56.40),
        CandlestickData(time: .string("2019-01-28"), open: 56.12, high: 56.22, low: 54.80, close: 55.07),
        CandlestickData(time: .string("2019-01-29"), open: 53.62, high: 54.30, low: 52.97, close: 53.28),
        CandlestickData(time: .string("2019-01-30"), open: 53.10, high: 54.02, low: 52.28, close: 54.00),
        CandlestickData(time: .string("2019-01-31"), open: 54.05, high: 55.19, low: 53.53, close: 55.06),
        CandlestickData(time: .string("2019-02-01"), open: 55.21, high: 55.30, low: 54.47, close: 54.55),
        CandlestickData(time: .string("2019-02-04"), open: 54.60, high: 54.69, low: 53.67, close: 54.04),
        CandlestickData(time: .string("2019-02-05"), open: 54.10, high: 54.34, low: 53.61, close: 54.14),
        CandlestickData(time: .string("2019-02-06"), open: 54.11, high: 54.37, low: 53.68, close: 53.79),
        CandlestickData(time: .string("2019-02-07"), open: 53.61, high: 53.73, low: 53.02, close: 53.57),
        CandlestickData(time: .string("2019-02-08"), open: 53.36, high: 53.96, low: 53.30, close: 53.95),
        CandlestickData(time: .string("2019-02-11"), open: 54.13, high: 54.37, low: 53.86, close: 54.05),
        CandlestickData(time: .string("2019-02-12"), open: 54.45, high: 54.77, low: 54.19, close: 54.42),
        CandlestickData(time: .string("2019-02-13"), open: 54.35, high: 54.77, low: 54.28, close: 54.48),
        CandlestickData(time: .string("2019-02-14"), open: 54.38, high: 54.52, low: 53.95, close: 54.03),
        CandlestickData(time: .string("2019-02-15"), open: 54.48, high: 55.19, low: 54.32, close: 55.16),
        CandlestickData(time: .string("2019-02-19"), open: 55.06, high: 55.66, low: 54.82, close: 55.44),
        CandlestickData(time: .string("2019-02-20"), open: 55.37, high: 55.91, low: 55.24, close: 55.76),
        CandlestickData(time: .string("2019-02-21"), open: 55.55, high: 56.72, low: 55.46, close: 56.15),
        CandlestickData(time: .string("2019-02-22"), open: 56.43, high: 57.13, low: 56.40, close: 56.92),
        CandlestickData(time: .string("2019-02-25"), open: 57.00, high: 57.27, low: 56.55, close: 56.78),
        CandlestickData(time: .string("2019-02-26"), open: 56.82, high: 57.09, low: 56.46, close: 56.64),
        CandlestickData(time: .string("2019-02-27"), open: 56.55, high: 56.73, low: 56.35, close: 56.72),
        CandlestickData(time: .string("2019-02-28"), open: 56.74, high: 57.61, low: 56.72, close: 56.92),
        CandlestickData(time: .string("2019-03-01"), open: 57.02, high: 57.15, low: 56.35, close: 56.96),
        CandlestickData(time: .string("2019-03-04"), open: 57.15, high: 57.34, low: 55.66, close: 56.24),
        CandlestickData(time: .string("2019-03-05"), open: 56.09, high: 56.17, low: 55.51, close: 56.08),
        CandlestickData(time: .string("2019-03-06"), open: 56.19, high: 56.42, low: 55.45, close: 55.68),
        CandlestickData(time: .string("2019-03-07"), open: 55.76, high: 56.40, low: 55.72, close: 56.30),
        CandlestickData(time: .string("2019-03-08"), open: 56.36, high: 56.68, low: 56.00, close: 56.53),
        CandlestickData(time: .string("2019-03-11"), open: 56.76, high: 57.62, low: 56.75, close: 57.58),
        CandlestickData(time: .string("2019-03-12"), open: 57.63, high: 58.11, low: 57.36, close: 57.43),
        CandlestickData(time: .string("2019-03-13"), open: 57.37, high: 57.74, low: 57.34, close: 57.66),
        CandlestickData(time: .string("2019-03-14"), open: 57.71, high: 58.09, low: 57.51, close: 57.95),
        CandlestickData(time: .string("2019-03-15"), open: 58.04, high: 58.51, low: 57.93, close: 58.39),
        CandlestickData(time: .string("2019-03-18"), open: 58.27, high: 58.32, low: 57.56, close: 58.07),
        CandlestickData(time: .string("2019-03-19"), open: 58.10, high: 58.20, low: 57.31, close: 57.50),
        CandlestickData(time: .string("2019-03-20"), open: 57.51, high: 58.05, low: 57.11, close: 57.67),
        CandlestickData(time: .string("2019-03-21"), open: 57.58, high: 58.49, low: 57.57, close: 58.29),
        CandlestickData(time: .string("2019-03-22"), open: 58.16, high: 60.00, low: 58.13, close: 59.76),
        CandlestickData(time: .string("2019-03-25"), open: 59.63, high: 60.19, low: 59.53, close: 60.08),
        CandlestickData(time: .string("2019-03-26"), open: 60.30, high: 60.69, low: 60.17, close: 60.63),
        CandlestickData(time: .string("2019-03-27"), open: 60.56, high: 61.19, low: 60.48, close: 60.88),
        CandlestickData(time: .string("2019-03-28"), open: 60.88, high: 60.89, low: 58.44, close: 59.08),
        CandlestickData(time: .string("2019-03-29"), open: 59.20, high: 59.27, low: 58.32, close: 59.13),
        CandlestickData(time: .string("2019-04-01"), open: 59.39, high: 59.41, low: 58.79, close: 59.09),
        CandlestickData(time: .string("2019-04-02"), open: 59.22, high: 59.23, low: 58.34, close: 58.53),
        CandlestickData(time: .string("2019-04-03"), open: 58.78, high: 59.07, low: 58.41, close: 58.87),
        CandlestickData(time: .string("2019-04-04"), open: 58.84, high: 59.10, low: 58.77, close: 58.99),
        CandlestickData(time: .string("2019-04-05"), open: 59.02, high: 59.09, low: 58.82, close: 59.09),
        CandlestickData(time: .string("2019-04-08"), open: 59.02, high: 59.13, low: 58.72, close: 59.13),
        CandlestickData(time: .string("2019-04-09"), open: 58.37, high: 58.56, low: 58.04, close: 58.40),
        CandlestickData(time: .string("2019-04-10"), open: 58.40, high: 58.70, low: 58.36, close: 58.61),
        CandlestickData(time: .string("2019-04-11"), open: 58.65, high: 58.73, low: 58.20, close: 58.56),
        CandlestickData(time: .string("2019-04-12"), open: 58.75, high: 58.79, low: 58.52, close: 58.74),
        CandlestickData(time: .string("2019-04-15"), open: 58.91, high: 58.95, low: 58.59, close: 58.71),
        CandlestickData(time: .string("2019-04-16"), open: 58.79, high: 58.98, low: 58.66, close: 58.79),
        CandlestickData(time: .string("2019-04-17"), open: 58.40, high: 58.46, low: 57.64, close: 57.78),
        CandlestickData(time: .string("2019-04-18"), open: 57.51, high: 58.20, low: 57.28, close: 58.04),
        CandlestickData(time: .string("2019-04-22"), open: 58.14, high: 58.49, low: 57.89, close: 58.37),
        CandlestickData(time: .string("2019-04-23"), open: 57.62, high: 57.72, low: 56.30, close: 57.15),
        CandlestickData(time: .string("2019-04-24"), open: 57.34, high: 57.57, low: 56.73, close: 57.08),
        CandlestickData(time: .string("2019-04-25"), open: 56.82, high: 56.90, low: 55.75, close: 55.85),
        CandlestickData(time: .string("2019-04-26"), open: 56.06, high: 56.81, low: 55.83, close: 56.58),
        CandlestickData(time: .string("2019-04-29"), open: 56.75, high: 57.17, low: 56.71, close: 56.84),
        CandlestickData(time: .string("2019-04-30"), open: 56.99, high: 57.45, low: 56.76, close: 57.19),
        CandlestickData(time: .string("2019-05-01"), open: 57.23, high: 57.30, low: 56.52, close: 56.52),
        CandlestickData(time: .string("2019-05-02"), open: 56.81, high: 58.23, low: 56.68, close: 56.99),
        CandlestickData(time: .string("2019-05-03"), open: 57.15, high: 57.36, low: 56.87, close: 57.24),
        CandlestickData(time: .string("2019-05-06"), open: 56.83, high: 57.09, low: 56.74, close: 56.91),
        CandlestickData(time: .string("2019-05-07"), open: 56.69, high: 56.81, low: 56.33, close: 56.63),
        CandlestickData(time: .string("2019-05-08"), open: 56.66, high: 56.70, low: 56.25, close: 56.38),
        CandlestickData(time: .string("2019-05-09"), open: 56.12, high: 56.56, low: 55.93, close: 56.48),
        CandlestickData(time: .string("2019-05-10"), open: 56.49, high: 57.04, low: 56.26, close: 56.91),
        CandlestickData(time: .string("2019-05-13"), open: 56.72, high: 57.34, low: 56.66, close: 56.75),
        CandlestickData(time: .string("2019-05-14"), open: 56.76, high: 57.19, low: 56.50, close: 56.55),
        CandlestickData(time: .string("2019-05-15"), open: 56.51, high: 56.84, low: 56.17, close: 56.81),
        CandlestickData(time: .string("2019-05-16"), open: 57.00, high: 57.80, low: 56.82, close: 57.38),
        CandlestickData(time: .string("2019-05-17"), open: 57.06, high: 58.48, low: 57.01, close: 58.09),
        CandlestickData(time: .string("2019-05-20"), open: 59.15, high: 60.54, low: 58.00, close: 59.01),
        CandlestickData(time: .string("2019-05-21"), open: 59.10, high: 59.63, low: 58.76, close: 59.50),
        CandlestickData(time: .string("2019-05-22"), open: 59.09, high: 59.37, low: 58.96, close: 59.25),
        CandlestickData(time: .string("2019-05-23"), open: 59.00, high: 59.27, low: 58.54, close: 58.87),
        CandlestickData(time: .string("2019-05-24"), open: 59.07, high: 59.36, low: 58.67, close: 59.32),
        CandlestickData(time: .string("2019-05-28"), open: 59.21, high: 59.66, low: 59.02, close: 59.57)
    ]
    private lazy var lastClose = data.last!.close
    private lazy var lastIndex = data.endIndex - 1
    private lazy var targetIndex = lastIndex + 105 + Int((Double.random(in: 0...1) + 30).rounded())
    private lazy var targetPrice = randomPrice
    private lazy var currentIndex = lastIndex + 1
    private var ticksInCurrentBar = 0
    private var currentBusinessDay = BusinessDay(year: 2019, month: 5, day: 29)
    private lazy var currentBar = CandlestickData(time: .businessDay(currentBusinessDay), open: nil, high: nil, low: nil, close: nil)
    
    private var randomPrice: Double {
        10 + .random(in: 0...1) * 10000 / 100
    }
    
    private var timer: Timer?
    
    deinit {
        timer?.invalidate()
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupChart()
        setupSeries()
        startSimulation()
    }
    
    private func setupChart() {
        let options = ChartOptions(crosshair: CrosshairOptions(mode: .normal))
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
    
    private func setupSeries() {
        let series = chart.addCandlestickSeries(options: nil)
        self.series = series
    }

    private func startSimulation() {
        series.setData(data: data)
        
        timer?.invalidate()
        timer = .scheduledTimer(withTimeInterval: 0.2, repeats: true) { [weak self] timer in
            guard let self = self else { return }
            self.tick()
        }
        RunLoop.current.add(timer!, forMode: .common)
    }
    
    private func tick() {
        let lastClose = self.lastClose ?? 0
        let deltaY = targetPrice - lastClose
        let deltaX = targetIndex - lastIndex
        let andgle = deltaY / Double(deltaX)
        let basePrice = lastClose + Double(currentIndex - lastIndex) * andgle
        let noise = 0.1 - .random(in: 0...1) * 0.2 + 1
        let noisedPrice = basePrice * noise
        
        mergeTickToBar(noisedPrice)
        
        ticksInCurrentBar += 1
        if ticksInCurrentBar == 5 {
            // move to next bar
            currentIndex += 1
            currentBusinessDay = nextBusinessDay(currentBusinessDay)
            currentBar = CandlestickData(time: .businessDay(currentBusinessDay), open: nil, high: nil, low: nil, close: nil)
            ticksInCurrentBar = 0
            if currentIndex == 5000 {
                reset()
                return
            }
            if currentIndex == targetIndex {
                self.lastClose = noisedPrice
                lastIndex = currentIndex
                targetIndex = lastIndex + 5 + Int((Double.random(in: 0...1) + 30).rounded())
                targetPrice = randomPrice
            }
        }
    }
    
    private func mergeTickToBar(_ price: BarPrice) {
        if currentBar.open == nil {
            currentBar.open = price
            currentBar.high = price
            currentBar.low = price
            currentBar.close = price
        } else {
            currentBar.close = price
            currentBar.high = max(currentBar.high ?? price, price)
            currentBar.low = min(currentBar.low ?? price, price)
        }
        series.update(bar: currentBar)
    }
    
    private func reset() {
        series.setData(data: data)
        
        lastClose = data.last!.close
        lastIndex = data.endIndex - 1
        
        targetIndex = lastIndex + 5 + Int((Double.random(in: 0...1) + 30).rounded())
        targetPrice = randomPrice
        
        currentIndex = lastIndex + 1
        currentBusinessDay = BusinessDay(year: 2019, month: 5, day: 29)
        ticksInCurrentBar = 0
    }
    
    func nextBusinessDay(_ time: BusinessDay) -> BusinessDay {
        let timeZone = TimeZone(identifier: "UTC")!
        let dateComponents = DateComponents(
            calendar: .current,
            timeZone: timeZone,
            year: time.year,
            month: time.month - 1,
            day: time.day + 1
        )
        let date = Calendar.current.date(from: dateComponents)!
        let components = Calendar.current.dateComponents(in: timeZone, from: date)
        return BusinessDay(year: components.year!, month: components.month! + 1, day: components.day!)
    }
    
}

