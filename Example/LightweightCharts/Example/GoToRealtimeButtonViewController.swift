import UIKit
import LightweightCharts

class GoToRealtimeButtonViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private var timeScale: TimeScaleApi!
    private let button = UIButton()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        timeScale = chart.timeScale()
        timeScale.scrollToPosition(position: -20, animated: false)
        setupSubscription()
    }
    
    private func setupUI() {
        let options = ChartOptions(
            rightPriceScale: VisiblePriceScaleOptions(scaleMargins: PriceScaleMargins(top: 0.2, bottom: 0.1)),
            timeScale: TimeScaleOptions(rightOffset: 2)
        )
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

        button.setTitle("⏩", for: .normal)
        button.tintColor = .darkText
        button.titleLabel?.font = .systemFont(ofSize: 32)
        button.addTarget(self, action: #selector(buttonTap), for: .touchUpInside)
        view.addSubview(button)
        button.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -64),
                button.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor, constant: -32)
            ])
        } else {
            NSLayoutConstraint.activate([
                button.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -64),
                button.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -32)
            ])
        }
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(245, 124, 0, 0.4)",
            bottomColor: "rgba(245, 124, 0, 0.4)",
            lineColor: "rgba(245, 124, 0, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            AreaData(time: .string("2016-07-18"), value: 26.10),
            AreaData(time: .string("2016-07-25"), value: 26.19),
            AreaData(time: .string("2016-08-01"), value: 26.24),
            AreaData(time: .string("2016-08-08"), value: 26.22),
            AreaData(time: .string("2016-08-15"), value: 25.98),
            AreaData(time: .string("2016-08-22"), value: 25.85),
            AreaData(time: .string("2016-08-29"), value: 25.98),
            AreaData(time: .string("2016-09-05"), value: 25.71),
            AreaData(time: .string("2016-09-12"), value: 25.84),
            AreaData(time: .string("2016-09-19"), value: 25.89),
            AreaData(time: .string("2016-09-26"), value: 25.65),
            AreaData(time: .string("2016-10-03"), value: 25.69),
            AreaData(time: .string("2016-10-10"), value: 25.67),
            AreaData(time: .string("2016-10-17"), value: 26.11),
            AreaData(time: .string("2016-10-24"), value: 25.80),
            AreaData(time: .string("2016-10-31"), value: 25.70),
            AreaData(time: .string("2016-11-07"), value: 25.40),
            AreaData(time: .string("2016-11-14"), value: 25.32),
            AreaData(time: .string("2016-11-21"), value: 25.48),
            AreaData(time: .string("2016-11-28"), value: 25.08),
            AreaData(time: .string("2016-12-05"), value: 25.06),
            AreaData(time: .string("2016-12-12"), value: 25.11),
            AreaData(time: .string("2016-12-19"), value: 25.34),
            AreaData(time: .string("2016-12-26"), value: 25.20),
            AreaData(time: .string("2017-01-02"), value: 25.33),
            AreaData(time: .string("2017-01-09"), value: 25.56),
            AreaData(time: .string("2017-01-16"), value: 25.32),
            AreaData(time: .string("2017-01-23"), value: 25.71),
            AreaData(time: .string("2017-01-30"), value: 25.85),
            AreaData(time: .string("2017-02-06"), value: 25.77),
            AreaData(time: .string("2017-02-13"), value: 25.94),
            AreaData(time: .string("2017-02-20"), value: 25.67),
            AreaData(time: .string("2017-02-27"), value: 25.60),
            AreaData(time: .string("2017-03-06"), value: 25.54),
            AreaData(time: .string("2017-03-13"), value: 25.84),
            AreaData(time: .string("2017-03-20"), value: 25.96),
            AreaData(time: .string("2017-03-27"), value: 25.90),
            AreaData(time: .string("2017-04-03"), value: 25.97),
            AreaData(time: .string("2017-04-10"), value: 26.00),
            AreaData(time: .string("2017-04-17"), value: 26.13),
            AreaData(time: .string("2017-04-24"), value: 26.02),
            AreaData(time: .string("2017-05-01"), value: 26.30),
            AreaData(time: .string("2017-05-08"), value: 26.27),
            AreaData(time: .string("2017-05-15"), value: 26.24),
            AreaData(time: .string("2017-05-22"), value: 26.02),
            AreaData(time: .string("2017-05-29"), value: 26.20),
            AreaData(time: .string("2017-06-05"), value: 26.12),
            AreaData(time: .string("2017-06-12"), value: 26.20),
            AreaData(time: .string("2017-06-19"), value: 26.46),
            AreaData(time: .string("2017-06-26"), value: 26.39),
            AreaData(time: .string("2017-07-03"), value: 26.52),
            AreaData(time: .string("2017-07-10"), value: 26.57),
            AreaData(time: .string("2017-07-17"), value: 26.65),
            AreaData(time: .string("2017-07-24"), value: 26.45),
            AreaData(time: .string("2017-07-31"), value: 26.37),
            AreaData(time: .string("2017-08-07"), value: 26.13),
            AreaData(time: .string("2017-08-14"), value: 26.21),
            AreaData(time: .string("2017-08-21"), value: 26.31),
            AreaData(time: .string("2017-08-28"), value: 26.33),
            AreaData(time: .string("2017-09-04"), value: 26.38),
            AreaData(time: .string("2017-09-11"), value: 26.38),
            AreaData(time: .string("2017-09-18"), value: 26.50),
            AreaData(time: .string("2017-09-25"), value: 26.39),
            AreaData(time: .string("2017-10-02"), value: 25.95),
            AreaData(time: .string("2017-10-09"), value: 26.15),
            AreaData(time: .string("2017-10-16"), value: 26.43),
            AreaData(time: .string("2017-10-23"), value: 26.22),
            AreaData(time: .string("2017-10-30"), value: 26.14),
            AreaData(time: .string("2017-11-06"), value: 26.08),
            AreaData(time: .string("2017-11-13"), value: 26.27),
            AreaData(time: .string("2017-11-20"), value: 26.30),
            AreaData(time: .string("2017-11-27"), value: 25.92),
            AreaData(time: .string("2017-12-04"), value: 26.10),
            AreaData(time: .string("2017-12-11"), value: 25.88),
            AreaData(time: .string("2017-12-18"), value: 25.82),
            AreaData(time: .string("2017-12-25"), value: 25.82),
            AreaData(time: .string("2018-01-01"), value: 25.81),
            AreaData(time: .string("2018-01-08"), value: 25.95),
            AreaData(time: .string("2018-01-15"), value: 26.03),
            AreaData(time: .string("2018-01-22"), value: 26.04),
            AreaData(time: .string("2018-01-29"), value: 25.96),
            AreaData(time: .string("2018-02-05"), value: 25.99),
            AreaData(time: .string("2018-02-12"), value: 26.00),
            AreaData(time: .string("2018-02-19"), value: 26.06),
            AreaData(time: .string("2018-02-26"), value: 25.77),
            AreaData(time: .string("2018-03-05"), value: 25.81),
            AreaData(time: .string("2018-03-12"), value: 25.88),
            AreaData(time: .string("2018-03-19"), value: 25.72),
            AreaData(time: .string("2018-03-26"), value: 25.75),
            AreaData(time: .string("2018-04-02"), value: 25.70),
            AreaData(time: .string("2018-04-09"), value: 25.73),
            AreaData(time: .string("2018-04-16"), value: 25.74),
            AreaData(time: .string("2018-04-23"), value: 25.69),
            AreaData(time: .string("2018-04-30"), value: 25.76),
            AreaData(time: .string("2018-05-07"), value: 25.89),
            AreaData(time: .string("2018-05-14"), value: 25.89),
            AreaData(time: .string("2018-05-21"), value: 26.00),
            AreaData(time: .string("2018-05-28"), value: 25.79),
            AreaData(time: .string("2018-06-04"), value: 26.11),
            AreaData(time: .string("2018-06-11"), value: 26.43),
            AreaData(time: .string("2018-06-18"), value: 26.30),
            AreaData(time: .string("2018-06-25"), value: 26.58),
            AreaData(time: .string("2018-07-02"), value: 26.33),
            AreaData(time: .string("2018-07-09"), value: 26.33),
            AreaData(time: .string("2018-07-16"), value: 26.32),
            AreaData(time: .string("2018-07-23"), value: 26.20),
            AreaData(time: .string("2018-07-30"), value: 26.03),
            AreaData(time: .string("2018-08-06"), value: 26.15),
            AreaData(time: .string("2018-08-13"), value: 26.17),
            AreaData(time: .string("2018-08-20"), value: 26.28),
            AreaData(time: .string("2018-08-27"), value: 25.86),
            AreaData(time: .string("2018-09-03"), value: 25.69),
            AreaData(time: .string("2018-09-10"), value: 25.69),
            AreaData(time: .string("2018-09-17"), value: 25.64),
            AreaData(time: .string("2018-09-24"), value: 25.67),
            AreaData(time: .string("2018-10-01"), value: 25.55),
            AreaData(time: .string("2018-10-08"), value: 25.59),
            AreaData(time: .string("2018-10-15"), value: 26.19),
            AreaData(time: .string("2018-10-22"), value: 25.81),
            AreaData(time: .string("2018-10-29"), value: 25.74),
            AreaData(time: .string("2018-11-05"), value: 25.75),
            AreaData(time: .string("2018-11-12"), value: 25.75),
            AreaData(time: .string("2018-11-19"), value: 25.72),
            AreaData(time: .string("2018-11-26"), value: 25.41),
            AreaData(time: .string("2018-12-03"), value: 25.39),
            AreaData(time: .string("2018-12-10"), value: 25.52),
            AreaData(time: .string("2018-12-17"), value: 25.66),
            AreaData(time: .string("2018-12-24"), value: 25.68),
            AreaData(time: .string("2018-12-31"), value: 25.71),
            AreaData(time: .string("2019-01-07"), value: 25.92),
            AreaData(time: .string("2019-01-14"), value: 25.60),
            AreaData(time: .string("2019-01-21"), value: 25.80),
            AreaData(time: .string("2019-01-28"), value: 25.60),
            AreaData(time: .string("2019-02-04"), value: 25.72),
            AreaData(time: .string("2019-02-11"), value: 25.89),
            AreaData(time: .string("2019-02-18"), value: 26.00),
            AreaData(time: .string("2019-02-25"), value: 25.86),
            AreaData(time: .string("2019-03-04"), value: 25.94),
            AreaData(time: .string("2019-03-11"), value: 26.11),
            AreaData(time: .string("2019-03-18"), value: 25.88),
            AreaData(time: .string("2019-03-25"), value: 25.77),
            AreaData(time: .string("2019-04-01"), value: 26.16),
            AreaData(time: .string("2019-04-08"), value: 26.04),
            AreaData(time: .string("2019-04-15"), value: 26.00),
            AreaData(time: .string("2019-04-22"), value: 25.88),
            AreaData(time: .string("2019-04-29"), value: 26.02),
            AreaData(time: .string("2019-05-06"), value: 26.08),
            AreaData(time: .string("2019-05-13"), value: 26.09),
            AreaData(time: .string("2019-05-20"), value: 26.16),
            AreaData(time: .string("2019-05-27"), value: 26.23)
        ]
        series.setData(data: data)
        self.series = series
    }
    
    @objc private func buttonTap(_ sender: UIButton) {
        timeScale.scrollToRealTime()
    }
    
    private func setupSubscription() {
        timeScale.delegate = self
        timeScale.subscribeVisibleTimeRangeChange()
    }
    
}

// MARK: - TimeScaleDelegate
extension GoToRealtimeButtonViewController: TimeScaleDelegate {
    
    func didReceiveTimeScaleSizeChangeWithParameters(onTimeScale timeScale: TimeScaleApi, parameters: Rectangle?) {
        
    }
    
    func didVisibleTimeRangeChange(onTimeScale timeScale: TimeScaleApi, parameters: TimeRange?) {
        timeScale.scrollPosition { [weak self] position in
            let isHidden = (position ?? 0) >= 0
            if !isHidden {
                self?.button.isHidden = false
            }
            UIView.animate(withDuration: 0.33, animations: {
                self?.button.alpha = isHidden ? 0 : 1
            }, completion: { _ in
                self?.button.isHidden = isHidden
            })
        }
    }
    
    func didVisibleLogicalRangeChange(onTimeScale timeScale: TimeScaleApi, parameters: LogicalRange?) {
        
    }
    
}
