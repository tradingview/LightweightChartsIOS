import UIKit
import LightweightCharts

class IntradayDataViewController: UIViewController {

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
            layout: LayoutOptions(background: .solid(color: "#ffffff"), textColor: "rgba(33, 56, 77, 1)"),
            timeScale: TimeScaleOptions(timeVisible: true, secondsVisible: false),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "rgba(197, 203, 206, 0.7)"),
                horizontalLines: GridLineOptions(color: "rgba(197, 203, 206, 0.7)")
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
        let series = chart.addLineSeries(options: nil)
        let data = [
            LineData(time: .utc(timestamp: 1556877600), value: 230.12),
            LineData(time: .utc(timestamp: 1556881200), value: 230.24),
            LineData(time: .utc(timestamp: 1556884800), value: 230.63),
            LineData(time: .utc(timestamp: 1556888400), value: 231.35),
            LineData(time: .utc(timestamp: 1556892000), value: 232.24),
            LineData(time: .utc(timestamp: 1556895600), value: 232.52),
            LineData(time: .utc(timestamp: 1557126000), value: 228.71),
            LineData(time: .utc(timestamp: 1557129600), value: 228.88),
            LineData(time: .utc(timestamp: 1557133200), value: 228.18),
            LineData(time: .utc(timestamp: 1557136800), value: 228.89),
            LineData(time: .utc(timestamp: 1557140400), value: 229.05),
            LineData(time: .utc(timestamp: 1557144000), value: 229.46),
            LineData(time: .utc(timestamp: 1557147600), value: 230.98),
            LineData(time: .utc(timestamp: 1557151200), value: 231.71),
            LineData(time: .utc(timestamp: 1557154800), value: 232.8),
            LineData(time: .utc(timestamp: 1557212400), value: 233.1),
            LineData(time: .utc(timestamp: 1557216000), value: 232.9),
            LineData(time: .utc(timestamp: 1557219600), value: 232.9),
            LineData(time: .utc(timestamp: 1557223200), value: 232.76),
            LineData(time: .utc(timestamp: 1557226800), value: 232.41),
            LineData(time: .utc(timestamp: 1557230400), value: 231.2),
            LineData(time: .utc(timestamp: 1557234000), value: 230.83),
            LineData(time: .utc(timestamp: 1557237600), value: 230.57),
            LineData(time: .utc(timestamp: 1557241200), value: 231.49),
            LineData(time: .utc(timestamp: 1557298800), value: 231.5),
            LineData(time: .utc(timestamp: 1557302400), value: 230.87),
            LineData(time: .utc(timestamp: 1557306000), value: 229.79),
            LineData(time: .utc(timestamp: 1557309600), value: 230.06),
            LineData(time: .utc(timestamp: 1557313200), value: 230.53),
            LineData(time: .utc(timestamp: 1557316800), value: 231.04),
            LineData(time: .utc(timestamp: 1557320400), value: 230.63),
            LineData(time: .utc(timestamp: 1557324000), value: 230.83),
            LineData(time: .utc(timestamp: 1557327600), value: 230),
            LineData(time: .utc(timestamp: 1557471600), value: 228.8),
            LineData(time: .utc(timestamp: 1557475200), value: 227.73),
            LineData(time: .utc(timestamp: 1557478800), value: 227.73),
            LineData(time: .utc(timestamp: 1557482400), value: 227.84),
            LineData(time: .utc(timestamp: 1557486000), value: 228.2),
            LineData(time: .utc(timestamp: 1557489600), value: 228.33),
            LineData(time: .utc(timestamp: 1557493200), value: 228.6),
            LineData(time: .utc(timestamp: 1557496800), value: 227.11),
            LineData(time: .utc(timestamp: 1557500400), value: 227),
            LineData(time: .utc(timestamp: 1557730800), value: 226.29),
            LineData(time: .utc(timestamp: 1557734400), value: 227.04),
            LineData(time: .utc(timestamp: 1557738000), value: 227.97),
            LineData(time: .utc(timestamp: 1557741600), value: 227.85),
            LineData(time: .utc(timestamp: 1557745200), value: 227.13),
            LineData(time: .utc(timestamp: 1557748800), value: 225.64),
            LineData(time: .utc(timestamp: 1557752400), value: 224.46),
            LineData(time: .utc(timestamp: 1557756000), value: 225.22),
            LineData(time: .utc(timestamp: 1557759600), value: 224.22),
            LineData(time: .utc(timestamp: 1557817200), value: 225.9),
            LineData(time: .utc(timestamp: 1557820800), value: 226.15),
            LineData(time: .utc(timestamp: 1557824400), value: 227.9),
            LineData(time: .utc(timestamp: 1557828000), value: 228.86),
            LineData(time: .utc(timestamp: 1557831600), value: 228.83),
            LineData(time: .utc(timestamp: 1557835200), value: 228.17),
            LineData(time: .utc(timestamp: 1557838800), value: 228.71),
            LineData(time: .utc(timestamp: 1557842400), value: 227.68),
            LineData(time: .utc(timestamp: 1557846000), value: 227.88),
            LineData(time: .utc(timestamp: 1557903600), value: 227.67),
            LineData(time: .utc(timestamp: 1557907200), value: 227.52),
            LineData(time: .utc(timestamp: 1557910800), value: 226.05),
            LineData(time: .utc(timestamp: 1557914400), value: 224.54),
            LineData(time: .utc(timestamp: 1557918000), value: 225.96),
            LineData(time: .utc(timestamp: 1557921600), value: 224.88),
            LineData(time: .utc(timestamp: 1557925200), value: 226.78),
            LineData(time: .utc(timestamp: 1557928800), value: 229.09),
            LineData(time: .utc(timestamp: 1557932400), value: 228.69),
            LineData(time: .utc(timestamp: 1557990000), value: 230.22),
            LineData(time: .utc(timestamp: 1557993600), value: 231.12),
            LineData(time: .utc(timestamp: 1557997200), value: 229.67),
            LineData(time: .utc(timestamp: 1558000800), value: 229.44),
            LineData(time: .utc(timestamp: 1558004400), value: 229.72),
            LineData(time: .utc(timestamp: 1558008000), value: 229.57),
            LineData(time: .utc(timestamp: 1558011600), value: 229.42),
            LineData(time: .utc(timestamp: 1558015200), value: 229.23),
            LineData(time: .utc(timestamp: 1558018800), value: 228.19),
            LineData(time: .utc(timestamp: 1558076400), value: 227.72),
            LineData(time: .utc(timestamp: 1558080000), value: 227.31),
            LineData(time: .utc(timestamp: 1558083600), value: 226.93),
            LineData(time: .utc(timestamp: 1558087200), value: 227.15),
            LineData(time: .utc(timestamp: 1558090800), value: 226.75),
            LineData(time: .utc(timestamp: 1558094400), value: 226.5),
            LineData(time: .utc(timestamp: 1558098000), value: 227.4),
            LineData(time: .utc(timestamp: 1558101600), value: 227.96),
            LineData(time: .utc(timestamp: 1558105200), value: 226.94),
            LineData(time: .utc(timestamp: 1558335600), value: 227.64),
            LineData(time: .utc(timestamp: 1558339200), value: 226.39),
            LineData(time: .utc(timestamp: 1558342800), value: 226.03),
            LineData(time: .utc(timestamp: 1558346400), value: 225.91),
            LineData(time: .utc(timestamp: 1558350000), value: 226.21),
            LineData(time: .utc(timestamp: 1558353600), value: 225.52),
            LineData(time: .utc(timestamp: 1558357200), value: 225.71),
            LineData(time: .utc(timestamp: 1558360800), value: 226.18),
            LineData(time: .utc(timestamp: 1558364400), value: 226),
            LineData(time: .utc(timestamp: 1558422000), value: 226.81),
            LineData(time: .utc(timestamp: 1558425600), value: 226.52),
            LineData(time: .utc(timestamp: 1558429200), value: 226.98),
            LineData(time: .utc(timestamp: 1558432800), value: 229.19),
            LineData(time: .utc(timestamp: 1558436400), value: 229.65),
            LineData(time: .utc(timestamp: 1558440000), value: 229.8),
            LineData(time: .utc(timestamp: 1558443600), value: 229.37),
            LineData(time: .utc(timestamp: 1558447200), value: 231.13),
            LineData(time: .utc(timestamp: 1558450800), value: 232.71),
            LineData(time: .utc(timestamp: 1558508400), value: 231.06),
            LineData(time: .utc(timestamp: 1558512000), value: 231.93),
            LineData(time: .utc(timestamp: 1558515600), value: 236.04),
            LineData(time: .utc(timestamp: 1558519200), value: 235.81),
            LineData(time: .utc(timestamp: 1558522800), value: 237.09),
            LineData(time: .utc(timestamp: 1558526400), value: 236.79),
            LineData(time: .utc(timestamp: 1558530000), value: 236.6),
            LineData(time: .utc(timestamp: 1558533600), value: 235.73),
            LineData(time: .utc(timestamp: 1558537200), value: 235.86),
            LineData(time: .utc(timestamp: 1558594800), value: 233.31),
            LineData(time: .utc(timestamp: 1558598400), value: 232.46),
            LineData(time: .utc(timestamp: 1558602000), value: 233.03),
            LineData(time: .utc(timestamp: 1558605600), value: 233.2),
            LineData(time: .utc(timestamp: 1558609200), value: 232.8),
            LineData(time: .utc(timestamp: 1558612800), value: 231.67),
            LineData(time: .utc(timestamp: 1558616400), value: 230.71),
            LineData(time: .utc(timestamp: 1558620000), value: 229.05),
            LineData(time: .utc(timestamp: 1558623600), value: 229.3),
            LineData(time: .utc(timestamp: 1558681200), value: 234.3),
            LineData(time: .utc(timestamp: 1558684800), value: 233.85),
            LineData(time: .utc(timestamp: 1558688400), value: 233.68),
            LineData(time: .utc(timestamp: 1558692000), value: 234.95),
            LineData(time: .utc(timestamp: 1558695600), value: 235.34),
            LineData(time: .utc(timestamp: 1558699200), value: 235.34),
            LineData(time: .utc(timestamp: 1558702800), value: 234.76),
            LineData(time: .utc(timestamp: 1558706400), value: 233.3),
            LineData(time: .utc(timestamp: 1558710000), value: 234.45),
            LineData(time: .utc(timestamp: 1558940400), value: 235.6),
            LineData(time: .utc(timestamp: 1558944000), value: 235.7),
            LineData(time: .utc(timestamp: 1558947600), value: 234.95),
            LineData(time: .utc(timestamp: 1558951200), value: 235.03),
            LineData(time: .utc(timestamp: 1558954800), value: 234.93),
            LineData(time: .utc(timestamp: 1558958400), value: 234.33),
            LineData(time: .utc(timestamp: 1558962000), value: 234.25),
            LineData(time: .utc(timestamp: 1558965600), value: 234.98),
            LineData(time: .utc(timestamp: 1558969200), value: 236),
            LineData(time: .utc(timestamp: 1559026800), value: 236.11),
            LineData(time: .utc(timestamp: 1559030400), value: 235.83),
            LineData(time: .utc(timestamp: 1559034000), value: 235.98),
            LineData(time: .utc(timestamp: 1559037600), value: 235.94),
            LineData(time: .utc(timestamp: 1559041200), value: 236.36),
            LineData(time: .utc(timestamp: 1559044800), value: 236.07),
            LineData(time: .utc(timestamp: 1559048400), value: 235.69),
            LineData(time: .utc(timestamp: 1559052000), value: 232.94),
            LineData(time: .utc(timestamp: 1559055600), value: 233.79)
        ]
        series.setData(data: data)
        self.series = series
    }

}
