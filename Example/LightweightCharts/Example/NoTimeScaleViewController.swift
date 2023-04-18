import UIKit
import LightweightCharts

class NoTimeScaleViewController: UIViewController {

    private var chart: LightweightCharts!
    private var areaSeries: AreaSeries!
    private var volumeSeries: HistogramSeries!
    private let legendLabel = UILabel()
    private let dateFormatter: DateFormatter = {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .full
        return dateFormatter
    }()
    
    private var leadingConstraint: NSLayoutConstraint!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if #available(iOS 13.0, *) {
            view.backgroundColor = .systemBackground
        } else {
            view.backgroundColor = .white
        }
        
        setupUI()
        setupData()
        setupSubscription()
    }
    
    private func setupUI() {
        let options = ChartOptions(
            layout: LayoutOptions(background: .solid(color: "#fafafa")),
            leftPriceScale: VisiblePriceScaleOptions(visible: false),
            rightPriceScale: VisiblePriceScaleOptions(visible: false),
            timeScale: TimeScaleOptions(visible: false),
            crosshair: CrosshairOptions(
                vertLine: CrosshairLineOptions(visible: false),
                horzLine: CrosshairLineOptions(visible: false)
            ),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "#fff"),
                horizontalLines: GridLineOptions(color: "#fff")
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
        
        legendLabel.font = .systemFont(ofSize: 11)
        legendLabel.textColor = .white
        legendLabel.textAlignment = .center
        legendLabel.backgroundColor = UIColor(red: 76/255.0, green: 175/255.0, blue: 80/255.0, alpha: 1)
        legendLabel.layer.cornerRadius = 4
        legendLabel.layer.masksToBounds = true
        legendLabel.isHidden = true
        
        view.addSubview(legendLabel)
        legendLabel.translatesAutoresizingMaskIntoConstraints = false
        leadingConstraint = legendLabel.leadingAnchor.constraint(equalTo: chart.leadingAnchor)
        NSLayoutConstraint.activate([
            legendLabel.widthAnchor.constraint(equalToConstant: 128),
            legendLabel.heightAnchor.constraint(equalToConstant: 24),
            legendLabel.topAnchor.constraint(equalTo: chart.topAnchor, constant: 16),
            leadingConstraint
        ])
    }
    
    private func setupData() {
        let areaSeriesOptions = AreaSeriesOptions(
            topColor: "rgba(76, 175, 80, 0.5)",
            bottomColor: "rgba(76, 175, 80, 0)",
            lineColor: "rgba(76, 175, 80, 1)",
            lineWidth: .two
        )
        let areaSeries = chart.addAreaSeries(options: areaSeriesOptions)
        let areaData = [
            AreaData(time: .string("2018-10-19"), value: 219.31),
            AreaData(time: .string("2018-10-22"), value: 220.65),
            AreaData(time: .string("2018-10-23"), value: 222.73),
            AreaData(time: .string("2018-10-24"), value: 215.09),
            AreaData(time: .string("2018-10-25"), value: 219.80),
            AreaData(time: .string("2018-10-26"), value: 216.30),
            AreaData(time: .string("2018-10-29"), value: 212.24),
            AreaData(time: .string("2018-10-30"), value: 213.30),
            AreaData(time: .string("2018-10-31"), value: 218.86),
            AreaData(time: .string("2018-11-01"), value: 222.22),
            AreaData(time: .string("2018-11-02"), value: 207.48),
            AreaData(time: .string("2018-11-05"), value: 201.59),
            AreaData(time: .string("2018-11-06"), value: 203.77),
            AreaData(time: .string("2018-11-07"), value: 209.95),
            AreaData(time: .string("2018-11-08"), value: 208.49),
            AreaData(time: .string("2018-11-09"), value: 204.47),
            AreaData(time: .string("2018-11-12"), value: 194.17),
            AreaData(time: .string("2018-11-13"), value: 192.23),
            AreaData(time: .string("2018-11-14"), value: 186.80),
            AreaData(time: .string("2018-11-15"), value: 191.41),
            AreaData(time: .string("2018-11-16"), value: 193.53),
            AreaData(time: .string("2018-11-19"), value: 185.86),
            AreaData(time: .string("2018-11-20"), value: 176.98),
            AreaData(time: .string("2018-11-21"), value: 176.78),
            AreaData(time: .string("2018-11-23"), value: 172.29),
            AreaData(time: .string("2018-11-26"), value: 174.62),
            AreaData(time: .string("2018-11-27"), value: 174.24),
            AreaData(time: .string("2018-11-28"), value: 180.94),
            AreaData(time: .string("2018-11-29"), value: 179.55),
            AreaData(time: .string("2018-11-30"), value: 178.58),
            AreaData(time: .string("2018-12-03"), value: 184.82),
            AreaData(time: .string("2018-12-04"), value: 176.69),
            AreaData(time: .string("2018-12-06"), value: 174.72),
            AreaData(time: .string("2018-12-07"), value: 168.49),
            AreaData(time: .string("2018-12-10"), value: 169.60),
            AreaData(time: .string("2018-12-11"), value: 168.63),
            AreaData(time: .string("2018-12-12"), value: 169.10),
            AreaData(time: .string("2018-12-13"), value: 170.95),
            AreaData(time: .string("2018-12-14"), value: 165.48),
            AreaData(time: .string("2018-12-17"), value: 163.94),
            AreaData(time: .string("2018-12-18"), value: 166.07),
            AreaData(time: .string("2018-12-19"), value: 160.89),
            AreaData(time: .string("2018-12-20"), value: 156.83),
            AreaData(time: .string("2018-12-21"), value: 150.73),
            AreaData(time: .string("2018-12-24"), value: 146.83),
            AreaData(time: .string("2018-12-26"), value: 157.17),
            AreaData(time: .string("2018-12-27"), value: 156.15),
            AreaData(time: .string("2018-12-28"), value: 156.23),
            AreaData(time: .string("2018-12-31"), value: 157.74),
            AreaData(time: .string("2019-01-02"), value: 157.92),
            AreaData(time: .string("2019-01-03"), value: 142.19),
            AreaData(time: .string("2019-01-04"), value: 148.26),
            AreaData(time: .string("2019-01-07"), value: 147.93),
            AreaData(time: .string("2019-01-08"), value: 150.75),
            AreaData(time: .string("2019-01-09"), value: 153.31),
            AreaData(time: .string("2019-01-10"), value: 153.80),
            AreaData(time: .string("2019-01-11"), value: 152.29),
            AreaData(time: .string("2019-01-14"), value: 150.00),
            AreaData(time: .string("2019-01-15"), value: 153.07),
            AreaData(time: .string("2019-01-16"), value: 154.94),
            AreaData(time: .string("2019-01-17"), value: 155.86),
            AreaData(time: .string("2019-01-18"), value: 156.82),
            AreaData(time: .string("2019-01-22"), value: 153.30),
            AreaData(time: .string("2019-01-23"), value: 153.92),
            AreaData(time: .string("2019-01-24"), value: 152.70),
            AreaData(time: .string("2019-01-25"), value: 157.76),
            AreaData(time: .string("2019-01-28"), value: 156.30),
            AreaData(time: .string("2019-01-29"), value: 154.68),
            AreaData(time: .string("2019-01-30"), value: 165.25),
            AreaData(time: .string("2019-01-31"), value: 166.44),
            AreaData(time: .string("2019-02-01"), value: 166.52),
            AreaData(time: .string("2019-02-04"), value: 171.25),
            AreaData(time: .string("2019-02-05"), value: 174.18),
            AreaData(time: .string("2019-02-06"), value: 174.24),
            AreaData(time: .string("2019-02-07"), value: 170.94),
            AreaData(time: .string("2019-02-08"), value: 170.41),
            AreaData(time: .string("2019-02-11"), value: 169.43),
            AreaData(time: .string("2019-02-12"), value: 170.89),
            AreaData(time: .string("2019-02-13"), value: 170.18),
            AreaData(time: .string("2019-02-14"), value: 170.80),
            AreaData(time: .string("2019-02-15"), value: 170.42),
            AreaData(time: .string("2019-02-19"), value: 170.93),
            AreaData(time: .string("2019-02-20"), value: 172.03),
            AreaData(time: .string("2019-02-21"), value: 171.06),
            AreaData(time: .string("2019-02-22"), value: 172.97),
            AreaData(time: .string("2019-02-25"), value: 174.23),
            AreaData(time: .string("2019-02-26"), value: 174.33),
            AreaData(time: .string("2019-02-27"), value: 174.87),
            AreaData(time: .string("2019-02-28"), value: 173.15),
            AreaData(time: .string("2019-03-01"), value: 174.97),
            AreaData(time: .string("2019-03-04"), value: 175.85),
            AreaData(time: .string("2019-03-05"), value: 175.53),
            AreaData(time: .string("2019-03-06"), value: 174.52),
            AreaData(time: .string("2019-03-07"), value: 172.50),
            AreaData(time: .string("2019-03-08"), value: 172.91),
            AreaData(time: .string("2019-03-11"), value: 178.90),
            AreaData(time: .string("2019-03-12"), value: 180.91),
            AreaData(time: .string("2019-03-13"), value: 181.71),
            AreaData(time: .string("2019-03-14"), value: 183.73),
            AreaData(time: .string("2019-03-15"), value: 186.12),
            AreaData(time: .string("2019-03-18"), value: 188.02),
            AreaData(time: .string("2019-03-19"), value: 186.53),
            AreaData(time: .string("2019-03-20"), value: 188.16),
            AreaData(time: .string("2019-03-21"), value: 195.09),
            AreaData(time: .string("2019-03-22"), value: 191.05),
            AreaData(time: .string("2019-03-25"), value: 188.74),
            AreaData(time: .string("2019-03-26"), value: 186.79),
            AreaData(time: .string("2019-03-27"), value: 188.47),
            AreaData(time: .string("2019-03-28"), value: 188.72),
            AreaData(time: .string("2019-03-29"), value: 189.95),
            AreaData(time: .string("2019-04-01"), value: 191.24),
            AreaData(time: .string("2019-04-02"), value: 194.02),
            AreaData(time: .string("2019-04-03"), value: 195.35),
            AreaData(time: .string("2019-04-04"), value: 195.69),
            AreaData(time: .string("2019-04-05"), value: 197.00),
            AreaData(time: .string("2019-04-08"), value: 200.10),
            AreaData(time: .string("2019-04-09"), value: 199.50),
            AreaData(time: .string("2019-04-10"), value: 200.62),
            AreaData(time: .string("2019-04-11"), value: 198.95),
            AreaData(time: .string("2019-04-12"), value: 198.87),
            AreaData(time: .string("2019-04-15"), value: 199.23),
            AreaData(time: .string("2019-04-16"), value: 199.25),
            AreaData(time: .string("2019-04-17"), value: 203.13),
            AreaData(time: .string("2019-04-18"), value: 203.86),
            AreaData(time: .string("2019-04-22"), value: 204.53),
            AreaData(time: .string("2019-04-23"), value: 207.48),
            AreaData(time: .string("2019-04-24"), value: 207.16),
            AreaData(time: .string("2019-04-25"), value: 205.28),
            AreaData(time: .string("2019-04-26"), value: 204.30),
            AreaData(time: .string("2019-04-29"), value: 204.61),
            AreaData(time: .string("2019-04-30"), value: 200.67),
            AreaData(time: .string("2019-05-01"), value: 210.52),
            AreaData(time: .string("2019-05-02"), value: 209.15),
            AreaData(time: .string("2019-05-03"), value: 211.75),
            AreaData(time: .string("2019-05-06"), value: 208.48),
            AreaData(time: .string("2019-05-07"), value: 202.86),
            AreaData(time: .string("2019-05-08"), value: 202.90),
            AreaData(time: .string("2019-05-09"), value: 200.72),
            AreaData(time: .string("2019-05-10"), value: 197.18),
            AreaData(time: .string("2019-05-13"), value: 185.72),
            AreaData(time: .string("2019-05-14"), value: 188.66),
            AreaData(time: .string("2019-05-15"), value: 190.92),
            AreaData(time: .string("2019-05-16"), value: 190.08),
            AreaData(time: .string("2019-05-17"), value: 189.00),
            AreaData(time: .string("2019-05-20"), value: 183.09),
            AreaData(time: .string("2019-05-21"), value: 186.60),
            AreaData(time: .string("2019-05-22"), value: 182.78),
            AreaData(time: .string("2019-05-23"), value: 179.66),
            AreaData(time: .string("2019-05-24"), value: 178.97),
            AreaData(time: .string("2019-05-28"), value: 178.67)
        ]
        areaSeries.setData(data: areaData)
        self.areaSeries = areaSeries
        
        let volumeSeriesOptions = HistogramSeriesOptions(
            priceScaleId: "123",
            priceLineVisible: false,
            priceFormat: .builtIn(BuiltInPriceFormat(type: .volume, precision: nil, minMove: nil)),
            color: "rgba(76, 175, 80, 0.5)"
        )
        let volumeSeries = chart.addHistogramSeries(options: volumeSeriesOptions)
        volumeSeries.priceScale().applyOptions(
            options: PriceScaleOptions(
                scaleMargins: PriceScaleMargins(
                    top: 0.85,
                    bottom: 0
                )
            )
        )
        let volumeData = [
            HistogramData(color: nil, time: .string("2018-10-19"), value: 33078726.00),
            HistogramData(color: nil, time: .string("2018-10-22"), value: 28792082.00),
            HistogramData(color: nil, time: .string("2018-10-23"), value: 38767846.00),
            HistogramData(color: nil, time: .string("2018-10-24"), value: 40925163.00),
            HistogramData(color: nil, time: .string("2018-10-25"), value: 29855768.00),
            HistogramData(color: nil, time: .string("2018-10-26"), value: 47258375.00),
            HistogramData(color: nil, time: .string("2018-10-29"), value: 45935520.00),
            HistogramData(color: nil, time: .string("2018-10-30"), value: 36659990.00),
            HistogramData(color: nil, time: .string("2018-10-31"), value: 38358933.00),
            HistogramData(color: nil, time: .string("2018-11-01"), value: 58323180.00),
            HistogramData(color: nil, time: .string("2018-11-02"), value: 91328654.00),
            HistogramData(color: nil, time: .string("2018-11-05"), value: 66163669.00),
            HistogramData(color: nil, time: .string("2018-11-06"), value: 31882881.00),
            HistogramData(color: nil, time: .string("2018-11-07"), value: 33424434.00),
            HistogramData(color: nil, time: .string("2018-11-08"), value: 25362636.00),
            HistogramData(color: nil, time: .string("2018-11-09"), value: 34365750.00),
            HistogramData(color: nil, time: .string("2018-11-12"), value: 51135518.00),
            HistogramData(color: nil, time: .string("2018-11-13"), value: 46882936.00),
            HistogramData(color: nil, time: .string("2018-11-14"), value: 60800957.00),
            HistogramData(color: nil, time: .string("2018-11-15"), value: 46478801.00),
            HistogramData(color: nil, time: .string("2018-11-16"), value: 36928253.00),
            HistogramData(color: nil, time: .string("2018-11-19"), value: 41920872.00),
            HistogramData(color: nil, time: .string("2018-11-20"), value: 67825247.00),
            HistogramData(color: nil, time: .string("2018-11-21"), value: 31124210.00),
            HistogramData(color: nil, time: .string("2018-11-23"), value: 23623972.00),
            HistogramData(color: nil, time: .string("2018-11-26"), value: 44998520.00),
            HistogramData(color: nil, time: .string("2018-11-27"), value: 41387377.00),
            HistogramData(color: nil, time: .string("2018-11-28"), value: 46062539.00),
            HistogramData(color: nil, time: .string("2018-11-29"), value: 41769992.00),
            HistogramData(color: nil, time: .string("2018-11-30"), value: 39531549.00),
            HistogramData(color: nil, time: .string("2018-12-03"), value: 40798002.00),
            HistogramData(color: nil, time: .string("2018-12-04"), value: 41344282.00),
            HistogramData(color: nil, time: .string("2018-12-06"), value: 43098410.00),
            HistogramData(color: nil, time: .string("2018-12-07"), value: 42281631.00),
            HistogramData(color: nil, time: .string("2018-12-10"), value: 62025994.00),
            HistogramData(color: nil, time: .string("2018-12-11"), value: 47281665.00),
            HistogramData(color: nil, time: .string("2018-12-12"), value: 35627674.00),
            HistogramData(color: nil, time: .string("2018-12-13"), value: 31897827.00),
            HistogramData(color: nil, time: .string("2018-12-14"), value: 40703710.00),
            HistogramData(color: nil, time: .string("2018-12-17"), value: 44287922.00),
            HistogramData(color: nil, time: .string("2018-12-18"), value: 33841518.00),
            HistogramData(color: nil, time: .string("2018-12-19"), value: 49047297.00),
            HistogramData(color: nil, time: .string("2018-12-20"), value: 64772960.00),
            HistogramData(color: nil, time: .string("2018-12-21"), value: 95744384.00),
            HistogramData(color: nil, time: .string("2018-12-24"), value: 37169232.00),
            HistogramData(color: nil, time: .string("2018-12-26"), value: 58582544.00),
            HistogramData(color: nil, time: .string("2018-12-27"), value: 53117065.00),
            HistogramData(color: nil, time: .string("2018-12-28"), value: 42291424.00),
            HistogramData(color: nil, time: .string("2018-12-31"), value: 35003466.00),
            HistogramData(color: nil, time: .string("2019-01-02"), value: 37039737.00),
            HistogramData(color: nil, time: .string("2019-01-03"), value: 91312195.00),
            HistogramData(color: nil, time: .string("2019-01-04"), value: 58607070.00),
            HistogramData(color: nil, time: .string("2019-01-07"), value: 54777764.00),
            HistogramData(color: nil, time: .string("2019-01-08"), value: 41025314.00),
            HistogramData(color: nil, time: .string("2019-01-09"), value: 45099081.00),
            HistogramData(color: nil, time: .string("2019-01-10"), value: 35780670.00),
            HistogramData(color: nil, time: .string("2019-01-11"), value: 27023241.00),
            HistogramData(color: nil, time: .string("2019-01-14"), value: 32439186.00),
            HistogramData(color: nil, time: .string("2019-01-15"), value: 28710324.00),
            HistogramData(color: nil, time: .string("2019-01-16"), value: 30569706.00),
            HistogramData(color: nil, time: .string("2019-01-17"), value: 29821160.00),
            HistogramData(color: nil, time: .string("2019-01-18"), value: 33751023.00),
            HistogramData(color: nil, time: .string("2019-01-22"), value: 30393970.00),
            HistogramData(color: nil, time: .string("2019-01-23"), value: 23130570.00),
            HistogramData(color: nil, time: .string("2019-01-24"), value: 25441549.00),
            HistogramData(color: nil, time: .string("2019-01-25"), value: 33547893.00),
            HistogramData(color: nil, time: .string("2019-01-28"), value: 26192058.00),
            HistogramData(color: nil, time: .string("2019-01-29"), value: 41587239.00),
            HistogramData(color: nil, time: .string("2019-01-30"), value: 61109780.00),
            HistogramData(color: nil, time: .string("2019-01-31"), value: 40739649.00),
            HistogramData(color: nil, time: .string("2019-02-01"), value: 32668138.00),
            HistogramData(color: nil, time: .string("2019-02-04"), value: 31495582.00),
            HistogramData(color: nil, time: .string("2019-02-05"), value: 36101628.00),
            HistogramData(color: nil, time: .string("2019-02-06"), value: 28239591.00),
            HistogramData(color: nil, time: .string("2019-02-07"), value: 31741690.00),
            HistogramData(color: nil, time: .string("2019-02-08"), value: 23819966.00),
            HistogramData(color: nil, time: .string("2019-02-11"), value: 20993425.00),
            HistogramData(color: nil, time: .string("2019-02-12"), value: 22283523.00),
            HistogramData(color: nil, time: .string("2019-02-13"), value: 22490233.00),
            HistogramData(color: nil, time: .string("2019-02-14"), value: 21835747.00),
            HistogramData(color: nil, time: .string("2019-02-15"), value: 24626814.00),
            HistogramData(color: nil, time: .string("2019-02-19"), value: 18972826.00),
            HistogramData(color: nil, time: .string("2019-02-20"), value: 26114362.00),
            HistogramData(color: nil, time: .string("2019-02-21"), value: 17249670.00),
            HistogramData(color: nil, time: .string("2019-02-22"), value: 18913154.00),
            HistogramData(color: nil, time: .string("2019-02-25"), value: 21873358.00),
            HistogramData(color: nil, time: .string("2019-02-26"), value: 17070211.00),
            HistogramData(color: nil, time: .string("2019-02-27"), value: 27835389.00),
            HistogramData(color: nil, time: .string("2019-02-28"), value: 28215416.00),
            HistogramData(color: nil, time: .string("2019-03-01"), value: 25886167.00),
            HistogramData(color: nil, time: .string("2019-03-04"), value: 27436203.00),
            HistogramData(color: nil, time: .string("2019-03-05"), value: 19737419.00),
            HistogramData(color: nil, time: .string("2019-03-06"), value: 20810384.00),
            HistogramData(color: nil, time: .string("2019-03-07"), value: 24796374.00),
            HistogramData(color: nil, time: .string("2019-03-08"), value: 23999358.00),
            HistogramData(color: nil, time: .string("2019-03-11"), value: 32011034.00),
            HistogramData(color: nil, time: .string("2019-03-12"), value: 32467584.00),
            HistogramData(color: nil, time: .string("2019-03-13"), value: 31032524.00),
            HistogramData(color: nil, time: .string("2019-03-14"), value: 23579508.00),
            HistogramData(color: nil, time: .string("2019-03-15"), value: 39042912.00),
            HistogramData(color: nil, time: .string("2019-03-18"), value: 26219832.00),
            HistogramData(color: nil, time: .string("2019-03-19"), value: 31646369.00),
            HistogramData(color: nil, time: .string("2019-03-20"), value: 31035231.00),
            HistogramData(color: nil, time: .string("2019-03-21"), value: 51034237.00),
            HistogramData(color: nil, time: .string("2019-03-22"), value: 42407666.00),
            HistogramData(color: nil, time: .string("2019-03-25"), value: 43845293.00),
            HistogramData(color: nil, time: .string("2019-03-26"), value: 49800538.00),
            HistogramData(color: nil, time: .string("2019-03-27"), value: 29848427.00),
            HistogramData(color: nil, time: .string("2019-03-28"), value: 20780363.00),
            HistogramData(color: nil, time: .string("2019-03-29"), value: 23563961.00),
            HistogramData(color: nil, time: .string("2019-04-01"), value: 27861964.00),
            HistogramData(color: nil, time: .string("2019-04-02"), value: 22765732.00),
            HistogramData(color: nil, time: .string("2019-04-03"), value: 23271830.00),
            HistogramData(color: nil, time: .string("2019-04-04"), value: 19114275.00),
            HistogramData(color: nil, time: .string("2019-04-05"), value: 18526644.00),
            HistogramData(color: nil, time: .string("2019-04-08"), value: 25881697.00),
            HistogramData(color: nil, time: .string("2019-04-09"), value: 35768237.00),
            HistogramData(color: nil, time: .string("2019-04-10"), value: 21695288.00),
            HistogramData(color: nil, time: .string("2019-04-11"), value: 20900808.00),
            HistogramData(color: nil, time: .string("2019-04-12"), value: 27760668.00),
            HistogramData(color: nil, time: .string("2019-04-15"), value: 17536646.00),
            HistogramData(color: nil, time: .string("2019-04-16"), value: 25696385.00),
            HistogramData(color: nil, time: .string("2019-04-17"), value: 28906780.00),
            HistogramData(color: nil, time: .string("2019-04-18"), value: 24195766.00),
            HistogramData(color: nil, time: .string("2019-04-22"), value: 19439545.00),
            HistogramData(color: nil, time: .string("2019-04-23"), value: 23322991.00),
            HistogramData(color: nil, time: .string("2019-04-24"), value: 17540609.00),
            HistogramData(color: nil, time: .string("2019-04-25"), value: 18543206.00),
            HistogramData(color: nil, time: .string("2019-04-26"), value: 18649102.00),
            HistogramData(color: nil, time: .string("2019-04-29"), value: 22204716.00),
            HistogramData(color: nil, time: .string("2019-04-30"), value: 46534923.00),
            HistogramData(color: nil, time: .string("2019-05-01"), value: 64827328.00),
            HistogramData(color: nil, time: .string("2019-05-02"), value: 31996324.00),
            HistogramData(color: nil, time: .string("2019-05-03"), value: 20892378.00),
            HistogramData(color: nil, time: .string("2019-05-06"), value: 32443113.00),
            HistogramData(color: nil, time: .string("2019-05-07"), value: 38763698.00),
            HistogramData(color: nil, time: .string("2019-05-08"), value: 26339504.00),
            HistogramData(color: nil, time: .string("2019-05-09"), value: 34908607.00),
            HistogramData(color: nil, time: .string("2019-05-10"), value: 41208712.00),
            HistogramData(color: nil, time: .string("2019-05-13"), value: 57430623.00),
            HistogramData(color: nil, time: .string("2019-05-14"), value: 36529677.00),
            HistogramData(color: nil, time: .string("2019-05-15"), value: 26544718.00),
            HistogramData(color: nil, time: .string("2019-05-16"), value: 33031364.00),
            HistogramData(color: nil, time: .string("2019-05-17"), value: 32879090.00),
            HistogramData(color: nil, time: .string("2019-05-20"), value: 38690198.00),
            HistogramData(color: nil, time: .string("2019-05-21"), value: 28364848.00),
            HistogramData(color: nil, time: .string("2019-05-22"), value: 29748556.00),
            HistogramData(color: nil, time: .string("2019-05-23"), value: 36217464.00),
            HistogramData(color: nil, time: .string("2019-05-24"), value: 23714686.00),
            HistogramData(color: nil, time: .string("2019-05-28"), value: 9264013.00)
        ]
        volumeSeries.setData(data: volumeData)
        self.volumeSeries = volumeSeries
    }

    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeCrosshairMove()
    }
    
}

// MARK: - ChartDelegate
extension NoTimeScaleViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        guard case let .lineData(price) = parameters.price(forSeries: areaSeries),
            let time = parameters.time,
            let point = parameters.point
            else {
                legendLabel.isHidden = true
                return
        }
        
        let dateString: String
        switch time {
        case let .businessDay(time):
            dateString = "\(time.year)-\(time.month)-\(time.day)"
        case let .utc(timestamp: time):
            let date = Date(timeIntervalSince1970: TimeInterval(time))
            dateString = dateFormatter.string(from: date)
        case let .businessDayString(time):
            dateString = time
        }
        
        legendLabel.text = "\((price.value! * 100 / 100).rounded()) | \(dateString)"
        legendLabel.isHidden = false
        let leading = CGFloat(point.x) - legendLabel.frame.width / 2
        let constant = max(0, min(self.chart.frame.width - legendLabel.frame.width, leading))
        leadingConstraint.constant = constant
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        
    }
    
}
