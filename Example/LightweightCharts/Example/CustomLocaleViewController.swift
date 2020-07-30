import UIKit
import LightweightCharts

class CustomLocaleViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: LineSeries!
    private let locales = ["es-ES", "en-US", "ja-JP"]
    
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
        let segmentedControl = UISegmentedControl(items: locales)
        segmentedControl.addTarget(self, action: #selector(valueChanged), for: .valueChanged)
        view.addSubview(segmentedControl)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.safeAreaLayoutGuide.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor)
            ])
        } else {
            NSLayoutConstraint.activate([
                segmentedControl.centerXAnchor.constraint(equalTo: view.centerXAnchor),
                segmentedControl.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
        
        let options = ChartOptions(
            localization: LocalizationOptions(locale: locales[0])
        )
        let chart = LightweightCharts(options: options)
        view.addSubview(chart)
        chart.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        } else {
            NSLayoutConstraint.activate([
                chart.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                chart.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                chart.topAnchor.constraint(equalTo: view.topAnchor),
                chart.bottomAnchor.constraint(equalTo: segmentedControl.topAnchor, constant: -16)
            ])
        }
        self.chart = chart
        
        segmentedControl.selectedSegmentIndex = 0
    }
    
    private func setupData() {
        let series = chart.addLineSeries(options: nil)
        let data = [
            LineData(time: .string("2018-10-19"), value: 52.89),
            LineData(time: .string("2018-10-22"), value: 51.65),
            LineData(time: .string("2018-10-23"), value: 51.56),
            LineData(time: .string("2018-10-24"), value: 50.19),
            LineData(time: .string("2018-10-25"), value: 51.86),
            LineData(time: .string("2018-10-26"), value: 51.25),
            LineData(time: .string("2018-10-29"), value: 52.23),
            LineData(time: .string("2018-10-30"), value: 52.69),
            LineData(time: .string("2018-10-31"), value: 53.23),
            LineData(time: .string("2018-11-01"), value: 53.56),
            LineData(time: .string("2018-11-02"), value: 53.61),
            LineData(time: .string("2018-11-05"), value: 53.66),
            LineData(time: .string("2018-11-06"), value: 53.55),
            LineData(time: .string("2018-11-07"), value: 53.58),
            LineData(time: .string("2018-11-08"), value: 53.16),
            LineData(time: .string("2018-11-09"), value: 53.04),
            LineData(time: .string("2018-11-12"), value: 52.35),
            LineData(time: .string("2018-11-13"), value: 52.74),
            LineData(time: .string("2018-11-14"), value: 52.15),
            LineData(time: .string("2018-11-15"), value: 52.82),
            LineData(time: .string("2018-11-16"), value: 52.94),
            LineData(time: .string("2018-11-19"), value: 53.32),
            LineData(time: .string("2018-11-20"), value: 52.54),
            LineData(time: .string("2018-11-21"), value: 52.43),
            LineData(time: .string("2018-11-23"), value: 51.83),
            LineData(time: .string("2018-11-26"), value: 52.88),
            LineData(time: .string("2018-11-27"), value: 53.19),
            LineData(time: .string("2018-11-28"), value: 54.35),
            LineData(time: .string("2018-11-29"), value: 54.04),
            LineData(time: .string("2018-11-30"), value: 54.28),
            LineData(time: .string("2018-12-03"), value: 54.24),
            LineData(time: .string("2018-12-04"), value: 51.78),
            LineData(time: .string("2018-12-06"), value: 51.09),
            LineData(time: .string("2018-12-07"), value: 50.26),
            LineData(time: .string("2018-12-10"), value: 48.80),
            LineData(time: .string("2018-12-11"), value: 47.76),
            LineData(time: .string("2018-12-12"), value: 47.74),
            LineData(time: .string("2018-12-13"), value: 47.03),
            LineData(time: .string("2018-12-14"), value: 46.54),
            LineData(time: .string("2018-12-17"), value: 46.61),
            LineData(time: .string("2018-12-18"), value: 46.52),
            LineData(time: .string("2018-12-19"), value: 45.67),
            LineData(time: .string("2018-12-20"), value: 46.04),
            LineData(time: .string("2018-12-21"), value: 45.12),
            LineData(time: .string("2018-12-24"), value: 43.60),
            LineData(time: .string("2018-12-26"), value: 45.59),
            LineData(time: .string("2018-12-27"), value: 45.53),
            LineData(time: .string("2018-12-28"), value: 45.78),
            LineData(time: .string("2018-12-31"), value: 46.08),
            LineData(time: .string("2019-01-02"), value: 46.94),
            LineData(time: .string("2019-01-03"), value: 46.57),
            LineData(time: .string("2019-01-04"), value: 47.95),
            LineData(time: .string("2019-01-07"), value: 47.64),
            LineData(time: .string("2019-01-08"), value: 47.54),
            LineData(time: .string("2019-01-09"), value: 47.80),
            LineData(time: .string("2019-01-10"), value: 47.75),
            LineData(time: .string("2019-01-11"), value: 47.87),
            LineData(time: .string("2019-01-14"), value: 48.42),
            LineData(time: .string("2019-01-15"), value: 47.67),
            LineData(time: .string("2019-01-16"), value: 48.94),
            LineData(time: .string("2019-01-17"), value: 49.23),
            LineData(time: .string("2019-01-18"), value: 50.01),
            LineData(time: .string("2019-01-22"), value: 49.86),
            LineData(time: .string("2019-01-23"), value: 50.12),
            LineData(time: .string("2019-01-24"), value: 49.98),
            LineData(time: .string("2019-01-25"), value: 50.13),
            LineData(time: .string("2019-01-28"), value: 49.82),
            LineData(time: .string("2019-01-29"), value: 49.85),
            LineData(time: .string("2019-01-30"), value: 50.09),
            LineData(time: .string("2019-01-31"), value: 48.91),
            LineData(time: .string("2019-02-01"), value: 48.91),
            LineData(time: .string("2019-02-04"), value: 49.06),
            LineData(time: .string("2019-02-05"), value: 49.27),
            LineData(time: .string("2019-02-06"), value: 49.22),
            LineData(time: .string("2019-02-07"), value: 48.08),
            LineData(time: .string("2019-02-08"), value: 47.65),
            LineData(time: .string("2019-02-11"), value: 47.65),
            LineData(time: .string("2019-02-12"), value: 49.05),
            LineData(time: .string("2019-02-13"), value: 49.02),
            LineData(time: .string("2019-02-14"), value: 48.52),
            LineData(time: .string("2019-02-15"), value: 49.22),
            LineData(time: .string("2019-02-19"), value: 49.38),
            LineData(time: .string("2019-02-20"), value: 49.81),
            LineData(time: .string("2019-02-21"), value: 49.56),
            LineData(time: .string("2019-02-22"), value: 49.02),
            LineData(time: .string("2019-02-25"), value: 49.66),
            LineData(time: .string("2019-02-26"), value: 49.59),
            LineData(time: .string("2019-02-27"), value: 49.90),
            LineData(time: .string("2019-02-28"), value: 49.89),
            LineData(time: .string("2019-03-01"), value: 50.03),
            LineData(time: .string("2019-03-04"), value: 50.11),
            LineData(time: .string("2019-03-05"), value: 49.89),
            LineData(time: .string("2019-03-06"), value: 49.82),
            LineData(time: .string("2019-03-07"), value: 49.68),
            LineData(time: .string("2019-03-08"), value: 49.80),
            LineData(time: .string("2019-03-11"), value: 49.76),
            LineData(time: .string("2019-03-12"), value: 49.65),
            LineData(time: .string("2019-03-13"), value: 49.92),
            LineData(time: .string("2019-03-14"), value: 50.35),
            LineData(time: .string("2019-03-15"), value: 50.66),
            LineData(time: .string("2019-03-18"), value: 51.73),
            LineData(time: .string("2019-03-19"), value: 51.41),
            LineData(time: .string("2019-03-20"), value: 50.40),
            LineData(time: .string("2019-03-21"), value: 49.86),
            LineData(time: .string("2019-03-22"), value: 48.31),
            LineData(time: .string("2019-03-25"), value: 48.08),
            LineData(time: .string("2019-03-26"), value: 49.01),
            LineData(time: .string("2019-03-27"), value: 48.77),
            LineData(time: .string("2019-03-28"), value: 49.09),
            LineData(time: .string("2019-03-29"), value: 48.32),
            LineData(time: .string("2019-04-01"), value: 48.81),
            LineData(time: .string("2019-04-02"), value: 48.21),
            LineData(time: .string("2019-04-03"), value: 48.86),
            LineData(time: .string("2019-04-04"), value: 49.17),
            LineData(time: .string("2019-04-05"), value: 48.78),
            LineData(time: .string("2019-04-08"), value: 48.88),
            LineData(time: .string("2019-04-09"), value: 48.14),
            LineData(time: .string("2019-04-10"), value: 47.79),
            LineData(time: .string("2019-04-11"), value: 47.74),
            LineData(time: .string("2019-04-12"), value: 46.49),
            LineData(time: .string("2019-04-15"), value: 46.77),
            LineData(time: .string("2019-04-16"), value: 47.65),
            LineData(time: .string("2019-04-17"), value: 47.55),
            LineData(time: .string("2019-04-18"), value: 47.58),
            LineData(time: .string("2019-04-22"), value: 47.26),
            LineData(time: .string("2019-04-23"), value: 47.35),
            LineData(time: .string("2019-04-24"), value: 47.48),
            LineData(time: .string("2019-04-25"), value: 47.51),
            LineData(time: .string("2019-04-26"), value: 47.96),
            LineData(time: .string("2019-04-29"), value: 48.27),
            LineData(time: .string("2019-04-30"), value: 48.41),
            LineData(time: .string("2019-05-01"), value: 48.23),
            LineData(time: .string("2019-05-02"), value: 48.30),
            LineData(time: .string("2019-05-03"), value: 48.65),
            LineData(time: .string("2019-05-06"), value: 48.43),
            LineData(time: .string("2019-05-07"), value: 47.17),
            LineData(time: .string("2019-05-08"), value: 47.00),
            LineData(time: .string("2019-05-09"), value: 46.74),
            LineData(time: .string("2019-05-10"), value: 47.15),
            LineData(time: .string("2019-05-13"), value: 46.33),
            LineData(time: .string("2019-05-14"), value: 46.49),
            LineData(time: .string("2019-05-15"), value: 45.84),
            LineData(time: .string("2019-05-16"), value: 45.90),
            LineData(time: .string("2019-05-17"), value: 45.70),
            LineData(time: .string("2019-05-20"), value: 45.45),
            LineData(time: .string("2019-05-21"), value: 46.33),
            LineData(time: .string("2019-05-22"), value: 46.10),
            LineData(time: .string("2019-05-23"), value: 45.56),
            LineData(time: .string("2019-05-24"), value: 46.17),
            LineData(time: .string("2019-05-28"), value: 46.01)
        ]
        series.setData(data: data)
        self.series = series
    }

    @objc private func valueChanged(_ sender: UISegmentedControl) {
        let locale = locales[sender.selectedSegmentIndex]
        let dateFormat = locale == "ja-JP" ? "yyyy-MM-dd" : "dd MMM \'yy"
        let localizationOptions = LocalizationOptions(locale: locale, dateFormat: dateFormat)
        chart.applyOptions(options: ChartOptions(localization: localizationOptions))
    }
    
}
