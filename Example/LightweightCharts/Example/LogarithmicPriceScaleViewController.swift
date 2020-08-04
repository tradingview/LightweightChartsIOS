import UIKit
import LightweightCharts

class LogarithmicPriceScaleViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: LineSeries!
    
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
            rightPriceScale: VisiblePriceScaleOptions(
                mode: .logarithmic,
                scaleMargins: PriceScaleMargins(
                    top: 0.1,
                    bottom: 0.1
                )
            )
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
        let options = LineSeriesOptions(color: "rgba(38, 198, 218, 1)", lineWidth: .three)
        let series = chart.addLineSeries(options: options)
        let data = [
            LineData(time: .string("2016-07-18"), value: 661.47),
            LineData(time: .string("2016-07-25"), value: 623.83),
            LineData(time: .string("2016-08-01"), value: 592.47),
            LineData(time: .string("2016-08-08"), value: 568.76),
            LineData(time: .string("2016-08-15"), value: 577.55),
            LineData(time: .string("2016-08-22"), value: 573.20),
            LineData(time: .string("2016-08-29"), value: 603.72),
            LineData(time: .string("2016-09-05"), value: 606.32),
            LineData(time: .string("2016-09-12"), value: 608.00),
            LineData(time: .string("2016-09-19"), value: 598.98),
            LineData(time: .string("2016-09-26"), value: 608.60),
            LineData(time: .string("2016-10-03"), value: 613.06),
            LineData(time: .string("2016-10-10"), value: 638.97),
            LineData(time: .string("2016-10-17"), value: 648.74),
            LineData(time: .string("2016-10-24"), value: 697.23),
            LineData(time: .string("2016-10-31"), value: 709.93),
            LineData(time: .string("2016-11-07"), value: 700.38),
            LineData(time: .string("2016-11-14"), value: 727.09),
            LineData(time: .string("2016-11-21"), value: 727.32),
            LineData(time: .string("2016-11-28"), value: 762.00),
            LineData(time: .string("2016-12-05"), value: 768.97),
            LineData(time: .string("2016-12-12"), value: 788.67),
            LineData(time: .string("2016-12-19"), value: 890.67),
            LineData(time: .string("2016-12-26"), value: 997.75),
            LineData(time: .string("2017-01-02"), value: 909.75),
            LineData(time: .string("2017-01-09"), value: 821.86),
            LineData(time: .string("2017-01-16"), value: 923.76),
            LineData(time: .string("2017-01-23"), value: 912.01),
            LineData(time: .string("2017-01-30"), value: 1011.07),
            LineData(time: .string("2017-02-06"), value: 1000.73),
            LineData(time: .string("2017-02-13"), value: 1051.80),
            LineData(time: .string("2017-02-20"), value: 1179.05),
            LineData(time: .string("2017-02-27"), value: 1273.00),
            LineData(time: .string("2017-03-06"), value: 1226.62),
            LineData(time: .string("2017-03-13"), value: 1017.97),
            LineData(time: .string("2017-03-20"), value: 960.00),
            LineData(time: .string("2017-03-27"), value: 1078.01),
            LineData(time: .string("2017-04-03"), value: 1206.20),
            LineData(time: .string("2017-04-10"), value: 1162.31),
            LineData(time: .string("2017-04-17"), value: 1241.99),
            LineData(time: .string("2017-04-24"), value: 1350.21),
            LineData(time: .string("2017-05-01"), value: 1554.01),
            LineData(time: .string("2017-05-08"), value: 1784.00),
            LineData(time: .string("2017-05-15"), value: 2017.55),
            LineData(time: .string("2017-05-22"), value: 2178.81),
            LineData(time: .string("2017-05-29"), value: 2530.27),
            LineData(time: .string("2017-06-05"), value: 2954.22),
            LineData(time: .string("2017-06-12"), value: 2516.98),
            LineData(time: .string("2017-06-19"), value: 2502.03),
            LineData(time: .string("2017-06-26"), value: 2504.37),
            LineData(time: .string("2017-07-03"), value: 2502.28),
            LineData(time: .string("2017-07-10"), value: 1917.63),
            LineData(time: .string("2017-07-17"), value: 2749.02),
            LineData(time: .string("2017-07-24"), value: 2742.37),
            LineData(time: .string("2017-07-31"), value: 3222.75),
            LineData(time: .string("2017-08-07"), value: 4053.87),
            LineData(time: .string("2017-08-14"), value: 4058.68),
            LineData(time: .string("2017-08-21"), value: 4337.68),
            LineData(time: .string("2017-08-28"), value: 4606.26),
            LineData(time: .string("2017-09-04"), value: 4226.22),
            LineData(time: .string("2017-09-11"), value: 3662.99),
            LineData(time: .string("2017-09-18"), value: 3664.22),
            LineData(time: .string("2017-09-25"), value: 4377.22),
            LineData(time: .string("2017-10-02"), value: 4597.98),
            LineData(time: .string("2017-10-09"), value: 5679.70),
            LineData(time: .string("2017-10-16"), value: 5969.00),
            LineData(time: .string("2017-10-23"), value: 6137.37),
            LineData(time: .string("2017-10-30"), value: 7372.72),
            LineData(time: .string("2017-11-06"), value: 5870.37),
            LineData(time: .string("2017-11-13"), value: 8016.58),
            LineData(time: .string("2017-11-20"), value: 9271.06),
            LineData(time: .string("2017-11-27"), value: 11250.00),
            LineData(time: .string("2017-12-04"), value: 14691.00),
            LineData(time: .string("2017-12-11"), value: 18953.00),
            LineData(time: .string("2017-12-18"), value: 14157.87),
            LineData(time: .string("2017-12-25"), value: 13880.00),
            LineData(time: .string("2018-01-01"), value: 16124.02),
            LineData(time: .string("2018-01-08"), value: 13647.99),
            LineData(time: .string("2018-01-15"), value: 11558.87),
            LineData(time: .string("2018-01-22"), value: 11685.58),
            LineData(time: .string("2018-01-29"), value: 8191.00),
            LineData(time: .string("2018-02-05"), value: 8067.00),
            LineData(time: .string("2018-02-12"), value: 10421.06),
            LineData(time: .string("2018-02-19"), value: 9590.04),
            LineData(time: .string("2018-02-26"), value: 11463.27),
            LineData(time: .string("2018-03-05"), value: 9535.04),
            LineData(time: .string("2018-03-12"), value: 8188.24),
            LineData(time: .string("2018-03-19"), value: 8453.90),
            LineData(time: .string("2018-03-26"), value: 6813.52),
            LineData(time: .string("2018-04-02"), value: 7027.26),
            LineData(time: .string("2018-04-09"), value: 8354.22),
            LineData(time: .string("2018-04-16"), value: 8789.96),
            LineData(time: .string("2018-04-23"), value: 9393.99),
            LineData(time: .string("2018-04-30"), value: 9623.54),
            LineData(time: .string("2018-05-07"), value: 8696.58),
            LineData(time: .string("2018-05-14"), value: 8518.48),
            LineData(time: .string("2018-05-21"), value: 7347.39),
            LineData(time: .string("2018-05-28"), value: 7703.67),
            LineData(time: .string("2018-06-04"), value: 6781.17),
            LineData(time: .string("2018-06-11"), value: 6453.41),
            LineData(time: .string("2018-06-18"), value: 6153.40),
            LineData(time: .string("2018-06-25"), value: 6349.99),
            LineData(time: .string("2018-07-02"), value: 6706.60),
            LineData(time: .string("2018-07-09"), value: 6349.30),
            LineData(time: .string("2018-07-16"), value: 7396.60),
            LineData(time: .string("2018-07-23"), value: 8216.74),
            LineData(time: .string("2018-07-30"), value: 7032.61),
            LineData(time: .string("2018-08-06"), value: 6310.82),
            LineData(time: .string("2018-08-13"), value: 6481.99),
            LineData(time: .string("2018-08-20"), value: 6700.46),
            LineData(time: .string("2018-08-27"), value: 7290.31),
            LineData(time: .string("2018-09-03"), value: 6236.04),
            LineData(time: .string("2018-09-10"), value: 6499.98),
            LineData(time: .string("2018-09-17"), value: 6702.22),
            LineData(time: .string("2018-09-24"), value: 6597.81),
            LineData(time: .string("2018-10-01"), value: 6577.63),
            LineData(time: .string("2018-10-08"), value: 6183.00),
            LineData(time: .string("2018-10-15"), value: 6413.38),
            LineData(time: .string("2018-10-22"), value: 6405.57),
            LineData(time: .string("2018-10-29"), value: 6421.76),
            LineData(time: .string("2018-11-05"), value: 6357.54),
            LineData(time: .string("2018-11-12"), value: 5559.26),
            LineData(time: .string("2018-11-19"), value: 3938.89),
            LineData(time: .string("2018-11-26"), value: 4102.05),
            LineData(time: .string("2018-12-03"), value: 3529.75),
            LineData(time: .string("2018-12-10"), value: 3193.78),
            LineData(time: .string("2018-12-17"), value: 3943.83),
            LineData(time: .string("2018-12-24"), value: 3835.79),
            LineData(time: .string("2018-12-31"), value: 4040.71),
            LineData(time: .string("2019-01-07"), value: 3515.95),
            LineData(time: .string("2019-01-14"), value: 3536.72),
            LineData(time: .string("2019-01-21"), value: 3533.23),
            LineData(time: .string("2019-01-28"), value: 3414.82),
            LineData(time: .string("2019-02-04"), value: 3650.37),
            LineData(time: .string("2019-02-11"), value: 3625.60),
            LineData(time: .string("2019-02-18"), value: 3730.68),
            LineData(time: .string("2019-02-25"), value: 3789.52),
            LineData(time: .string("2019-03-04"), value: 3897.92),
            LineData(time: .string("2019-03-11"), value: 3965.50),
            LineData(time: .string("2019-03-18"), value: 3969.99),
            LineData(time: .string("2019-03-25"), value: 4096.08),
            LineData(time: .string("2019-04-01"), value: 5190.85),
            LineData(time: .string("2019-04-08"), value: 5162.72),
            LineData(time: .string("2019-04-15"), value: 5295.65),
            LineData(time: .string("2019-04-22"), value: 5160.98),
            LineData(time: .string("2019-04-29"), value: 5709.32),
            LineData(time: .string("2019-05-06"), value: 6974.35),
            LineData(time: .string("2019-05-13"), value: 8200.00),
            LineData(time: .string("2019-05-20"), value: 8733.26),
            LineData(time: .string("2019-05-27"), value: 8702.43)
        ]
        series.setData(data: data)
        self.series = series
    }

}
