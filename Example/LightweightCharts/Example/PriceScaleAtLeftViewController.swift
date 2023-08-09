import UIKit
import LightweightCharts

class PriceScaleAtLeftViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    
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
        let options = ChartOptions(
            leftPriceScale: VisiblePriceScaleOptions(visible: true),
            rightPriceScale: VisiblePriceScaleOptions(visible: false)
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
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(251, 192, 45, 0.56)",
            bottomColor: "rgba(251, 192, 45, 0.04)",
            lineColor: "rgba(251, 192, 45, 1)",
            lineWidth: .two
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            AreaData(time: .string("2018-10-19"), value: 154.05),
            AreaData(time: .string("2018-10-22"), value: 154.78),
            AreaData(time: .string("2018-10-23"), value: 154.39),
            AreaData(time: .string("2018-10-24"), value: 146.04),
            AreaData(time: .string("2018-10-25"), value: 150.95),
            AreaData(time: .string("2018-10-26"), value: 145.37),
            AreaData(time: .string("2018-10-29"), value: 142.09),
            AreaData(time: .string("2018-10-30"), value: 146.22),
            AreaData(time: .string("2018-10-31"), value: 151.79),
            AreaData(time: .string("2018-11-01"), value: 151.75),
            AreaData(time: .string("2018-11-02"), value: 150.35),
            AreaData(time: .string("2018-11-05"), value: 148.68),
            AreaData(time: .string("2018-11-06"), value: 149.94),
            AreaData(time: .string("2018-11-07"), value: 151.53),
            AreaData(time: .string("2018-11-08"), value: 147.87),
            AreaData(time: .string("2018-11-09"), value: 144.96),
            AreaData(time: .string("2018-11-12"), value: 141.55),
            AreaData(time: .string("2018-11-13"), value: 142.16),
            AreaData(time: .string("2018-11-14"), value: 144.22),
            AreaData(time: .string("2018-11-15"), value: 143.85),
            AreaData(time: .string("2018-11-16"), value: 139.53),
            AreaData(time: .string("2018-11-19"), value: 131.55),
            AreaData(time: .string("2018-11-20"), value: 132.43),
            AreaData(time: .string("2018-11-21"), value: 134.82),
            AreaData(time: .string("2018-11-23"), value: 131.73),
            AreaData(time: .string("2018-11-26"), value: 136.38),
            AreaData(time: .string("2018-11-27"), value: 135.00),
            AreaData(time: .string("2018-11-28"), value: 136.76),
            AreaData(time: .string("2018-11-29"), value: 138.68),
            AreaData(time: .string("2018-11-30"), value: 140.61),
            AreaData(time: .string("2018-12-03"), value: 141.09),
            AreaData(time: .string("2018-12-04"), value: 137.93),
            AreaData(time: .string("2018-12-06"), value: 139.63),
            AreaData(time: .string("2018-12-07"), value: 137.42),
            AreaData(time: .string("2018-12-10"), value: 141.85),
            AreaData(time: .string("2018-12-11"), value: 142.08),
            AreaData(time: .string("2018-12-12"), value: 144.50),
            AreaData(time: .string("2018-12-13"), value: 145.01),
            AreaData(time: .string("2018-12-14"), value: 144.06),
            AreaData(time: .string("2018-12-17"), value: 140.19),
            AreaData(time: .string("2018-12-18"), value: 143.66),
            AreaData(time: .string("2018-12-19"), value: 133.24),
            AreaData(time: .string("2018-12-20"), value: 133.40),
            AreaData(time: .string("2018-12-21"), value: 124.95),
            AreaData(time: .string("2018-12-24"), value: 124.06),
            AreaData(time: .string("2018-12-26"), value: 134.18),
            AreaData(time: .string("2018-12-27"), value: 134.52),
            AreaData(time: .string("2018-12-28"), value: 133.20),
            AreaData(time: .string("2018-12-31"), value: 131.09),
            AreaData(time: .string("2019-01-02"), value: 135.68),
            AreaData(time: .string("2019-01-03"), value: 131.74),
            AreaData(time: .string("2019-01-04"), value: 137.95),
            AreaData(time: .string("2019-01-07"), value: 138.05),
            AreaData(time: .string("2019-01-08"), value: 142.53),
            AreaData(time: .string("2019-01-09"), value: 144.23),
            AreaData(time: .string("2019-01-10"), value: 144.20),
            AreaData(time: .string("2019-01-11"), value: 143.80),
            AreaData(time: .string("2019-01-14"), value: 145.39),
            AreaData(time: .string("2019-01-15"), value: 148.95),
            AreaData(time: .string("2019-01-16"), value: 147.54),
            AreaData(time: .string("2019-01-17"), value: 148.30),
            AreaData(time: .string("2019-01-18"), value: 150.04),
            AreaData(time: .string("2019-01-22"), value: 147.57),
            AreaData(time: .string("2019-01-23"), value: 144.30),
            AreaData(time: .string("2019-01-24"), value: 145.83),
            AreaData(time: .string("2019-01-25"), value: 149.01),
            AreaData(time: .string("2019-01-28"), value: 147.47),
            AreaData(time: .string("2019-01-29"), value: 144.19),
            AreaData(time: .string("2019-01-30"), value: 150.42),
            AreaData(time: .string("2019-01-31"), value: 166.69),
            AreaData(time: .string("2019-02-01"), value: 165.71),
            AreaData(time: .string("2019-02-04"), value: 169.25),
            AreaData(time: .string("2019-02-05"), value: 171.16),
            AreaData(time: .string("2019-02-06"), value: 170.49),
            AreaData(time: .string("2019-02-07"), value: 166.38),
            AreaData(time: .string("2019-02-08"), value: 167.33),
            AreaData(time: .string("2019-02-11"), value: 165.79),
            AreaData(time: .string("2019-02-12"), value: 165.04),
            AreaData(time: .string("2019-02-13"), value: 164.07),
            AreaData(time: .string("2019-02-14"), value: 163.95),
            AreaData(time: .string("2019-02-15"), value: 162.50),
            AreaData(time: .string("2019-02-19"), value: 162.29),
            AreaData(time: .string("2019-02-20"), value: 162.56),
            AreaData(time: .string("2019-02-21"), value: 160.04),
            AreaData(time: .string("2019-02-22"), value: 161.89),
            AreaData(time: .string("2019-02-25"), value: 164.62),
            AreaData(time: .string("2019-02-26"), value: 164.13),
            AreaData(time: .string("2019-02-27"), value: 162.81),
            AreaData(time: .string("2019-02-28"), value: 161.45),
            AreaData(time: .string("2019-03-01"), value: 162.28),
            AreaData(time: .string("2019-03-04"), value: 167.37),
            AreaData(time: .string("2019-03-05"), value: 171.26),
            AreaData(time: .string("2019-03-06"), value: 172.51),
            AreaData(time: .string("2019-03-07"), value: 169.13),
            AreaData(time: .string("2019-03-08"), value: 169.60),
            AreaData(time: .string("2019-03-11"), value: 172.07),
            AreaData(time: .string("2019-03-12"), value: 171.92),
            AreaData(time: .string("2019-03-13"), value: 173.37),
            AreaData(time: .string("2019-03-14"), value: 170.17),
            AreaData(time: .string("2019-03-15"), value: 165.98),
            AreaData(time: .string("2019-03-18"), value: 160.47),
            AreaData(time: .string("2019-03-19"), value: 161.57),
            AreaData(time: .string("2019-03-20"), value: 165.44),
            AreaData(time: .string("2019-03-21"), value: 166.08),
            AreaData(time: .string("2019-03-22"), value: 164.34),
            AreaData(time: .string("2019-03-25"), value: 166.29),
            AreaData(time: .string("2019-03-26"), value: 167.68),
            AreaData(time: .string("2019-03-27"), value: 165.87),
            AreaData(time: .string("2019-03-28"), value: 165.55),
            AreaData(time: .string("2019-03-29"), value: 166.69),
            AreaData(time: .string("2019-04-01"), value: 168.70),
            AreaData(time: .string("2019-04-02"), value: 174.20),
            AreaData(time: .string("2019-04-03"), value: 173.54),
            AreaData(time: .string("2019-04-04"), value: 176.02),
            AreaData(time: .string("2019-04-05"), value: 175.72),
            AreaData(time: .string("2019-04-08"), value: 174.93),
            AreaData(time: .string("2019-04-09"), value: 177.58),
            AreaData(time: .string("2019-04-10"), value: 177.82),
            AreaData(time: .string("2019-04-11"), value: 177.51),
            AreaData(time: .string("2019-04-12"), value: 179.10),
            AreaData(time: .string("2019-04-15"), value: 179.65),
            AreaData(time: .string("2019-04-16"), value: 178.87),
            AreaData(time: .string("2019-04-17"), value: 178.78),
            AreaData(time: .string("2019-04-18"), value: 178.28),
            AreaData(time: .string("2019-04-22"), value: 181.44),
            AreaData(time: .string("2019-04-23"), value: 183.78),
            AreaData(time: .string("2019-04-24"), value: 182.58),
            AreaData(time: .string("2019-04-25"), value: 193.26),
            AreaData(time: .string("2019-04-26"), value: 191.49),
            AreaData(time: .string("2019-04-29"), value: 194.78),
            AreaData(time: .string("2019-04-30"), value: 193.40),
            AreaData(time: .string("2019-05-01"), value: 193.03),
            AreaData(time: .string("2019-05-02"), value: 192.53),
            AreaData(time: .string("2019-05-03"), value: 195.47),
            AreaData(time: .string("2019-05-06"), value: 193.88),
            AreaData(time: .string("2019-05-07"), value: 189.77),
            AreaData(time: .string("2019-05-08"), value: 189.54),
            AreaData(time: .string("2019-05-09"), value: 188.65),
            AreaData(time: .string("2019-05-10"), value: 188.34),
            AreaData(time: .string("2019-05-13"), value: 181.54),
            AreaData(time: .string("2019-05-14"), value: 180.73),
            AreaData(time: .string("2019-05-15"), value: 186.27),
            AreaData(time: .string("2019-05-16"), value: 186.99),
            AreaData(time: .string("2019-05-17"), value: 185.30),
            AreaData(time: .string("2019-05-20"), value: 182.72),
            AreaData(time: .string("2019-05-21"), value: 184.82),
            AreaData(time: .string("2019-05-22"), value: 185.32),
            AreaData(time: .string("2019-05-23"), value: 180.87),
            AreaData(time: .string("2019-05-24"), value: 181.06),
            AreaData(time: .string("2019-05-28"), value: 183.39)
        ]
        series.setData(data: data)
        self.series = series
    }

}
