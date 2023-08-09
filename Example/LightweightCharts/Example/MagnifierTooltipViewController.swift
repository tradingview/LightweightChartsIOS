import UIKit
import LightweightCharts

class MagnifierTooltipViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private let tooltipView = TooltipView(accentColor: UIColor(red: 0, green: 120/255.0, blue: 1, alpha: 0.9))
    private let legend = "⬤ AERO"
    
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
            leftPriceScale: VisiblePriceScaleOptions(
                scaleMargins: PriceScaleMargins(top: 0.2, bottom: 0.2),
                borderVisible: false
            ),
            timeScale: TimeScaleOptions(borderVisible: false),
            crosshair: CrosshairOptions(
                vertLine: CrosshairLineOptions(
                    color: "rgba(32, 38, 46, 0.1)",
                    width: .two,
                    style: .solid,
                    visible: true,
                    labelVisible: false
                ),
                horzLine: CrosshairLineOptions(visible: false, labelVisible: false)
            ),
            grid: GridOptions(
                verticalLines: GridLineOptions(color: "#ffffff"),
                horizontalLines: GridLineOptions(color: "#eee")
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
        
        let shadowRadius: CGFloat = 4
        tooltipView.backgroundColor = .clear
        tooltipView.layer.borderWidth = 1
        tooltipView.layer.shadowRadius = shadowRadius
        tooltipView.layer.shadowOpacity = 0.75
        tooltipView.layer.shadowColor = UIColor.black.cgColor
        tooltipView.layer.shadowOffset = .zero
        view.addSubview(tooltipView)
        tooltipView.translatesAutoresizingMaskIntoConstraints = false
        leadingConstraint = tooltipView.leadingAnchor.constraint(equalTo: chart.leadingAnchor)
        NSLayoutConstraint.activate([
            tooltipView.topAnchor.constraint(equalTo: chart.topAnchor, constant: shadowRadius),
            tooltipView.bottomAnchor.constraint(equalTo: chart.bottomAnchor, constant: -shadowRadius),
            tooltipView.widthAnchor.constraint(equalToConstant: 128),
            leadingConstraint
        ])
        
        tooltipView.isHidden = true
        
        view.bringSubviewToFront(tooltipView)
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(0, 120, 255, 0.2)",
            bottomColor: "rgba(0, 120, 255, 0.0)",
            lineColor: "rgba(0, 120, 255, 1)",
            lineWidth: .three
        )
        let series = chart.addAreaSeries(options: options)
        let data = [
            AreaData(time: .string("2018-03-28"), value: 154),
            AreaData(time: .string("2018-03-29"), value: 154.2),
            AreaData(time: .string("2018-03-30"), value: 155.60001),
            AreaData(time: .string("2018-04-02"), value: 156.25),
            AreaData(time: .string("2018-04-03"), value: 156.25),
            AreaData(time: .string("2018-04-04"), value: 156.05),
            AreaData(time: .string("2018-04-05"), value: 158.05),
            AreaData(time: .string("2018-04-06"), value: 157.3),
            AreaData(time: .string("2018-04-09"), value: 144),
            AreaData(time: .string("2018-04-10"), value: 144.8),
            AreaData(time: .string("2018-04-11"), value: 143.5),
            AreaData(time: .string("2018-04-12"), value: 147.05),
            AreaData(time: .string("2018-04-13"), value: 144.85001),
            AreaData(time: .string("2018-04-16"), value: 145.39999),
            AreaData(time: .string("2018-04-17"), value: 147.3),
            AreaData(time: .string("2018-04-18"), value: 153.55),
            AreaData(time: .string("2018-04-19"), value: 150.95),
            AreaData(time: .string("2018-04-20"), value: 149.39999),
            AreaData(time: .string("2018-04-23"), value: 148.5),
            AreaData(time: .string("2018-04-24"), value: 146.60001),
            AreaData(time: .string("2018-04-25"), value: 144.45),
            AreaData(time: .string("2018-04-26"), value: 145.60001),
            AreaData(time: .string("2018-04-27"), value: 144.3),
            AreaData(time: .string("2018-04-30"), value: 144),
            AreaData(time: .string("2018-05-02"), value: 147.3),
            AreaData(time: .string("2018-05-03"), value: 144.2),
            AreaData(time: .string("2018-05-04"), value: 141.64999),
            AreaData(time: .string("2018-05-07"), value: 141.89999),
            AreaData(time: .string("2018-05-08"), value: 140.39999),
            AreaData(time: .string("2018-05-10"), value: 139.8),
            AreaData(time: .string("2018-05-11"), value: 137.5),
            AreaData(time: .string("2018-05-14"), value: 136.14999),
            AreaData(time: .string("2018-05-15"), value: 138),
            AreaData(time: .string("2018-05-16"), value: 137.95),
            AreaData(time: .string("2018-05-17"), value: 137.95),
            AreaData(time: .string("2018-05-18"), value: 136.75),
            AreaData(time: .string("2018-05-21"), value: 136.2),
            AreaData(time: .string("2018-05-22"), value: 135),
            AreaData(time: .string("2018-05-23"), value: 132.55),
            AreaData(time: .string("2018-05-24"), value: 132.7),
            AreaData(time: .string("2018-05-25"), value: 132.2),
            AreaData(time: .string("2018-05-28"), value: 131.55),
            AreaData(time: .string("2018-05-29"), value: 131.85001),
            AreaData(time: .string("2018-05-30"), value: 139.85001),
            AreaData(time: .string("2018-05-31"), value: 140.8),
            AreaData(time: .string("2018-06-01"), value: 139.64999),
            AreaData(time: .string("2018-06-04"), value: 137.10001),
            AreaData(time: .string("2018-06-05"), value: 139.25),
            AreaData(time: .string("2018-06-06"), value: 141.3),
            AreaData(time: .string("2018-06-07"), value: 145),
            AreaData(time: .string("2018-06-08"), value: 143.89999),
            AreaData(time: .string("2018-06-11"), value: 142.7),
            AreaData(time: .string("2018-06-13"), value: 144.05),
            AreaData(time: .string("2018-06-14"), value: 143.55),
            AreaData(time: .string("2018-06-15"), value: 140.5),
            AreaData(time: .string("2018-06-18"), value: 139.64999),
            AreaData(time: .string("2018-06-19"), value: 138),
            AreaData(time: .string("2018-06-20"), value: 141),
            AreaData(time: .string("2018-06-21"), value: 140.55),
            AreaData(time: .string("2018-06-22"), value: 140.55),
            AreaData(time: .string("2018-06-25"), value: 140.75),
            AreaData(time: .string("2018-06-26"), value: 140.64999),
            AreaData(time: .string("2018-06-27"), value: 141.14999),
            AreaData(time: .string("2018-06-28"), value: 139.8),
            AreaData(time: .string("2018-06-29"), value: 139.8),
            AreaData(time: .string("2018-07-02"), value: 140.14999),
            AreaData(time: .string("2018-07-03"), value: 143.05),
            AreaData(time: .string("2018-07-04"), value: 140),
            AreaData(time: .string("2018-07-05"), value: 129.2),
            AreaData(time: .string("2018-07-06"), value: 129.55),
            AreaData(time: .string("2018-07-09"), value: 128.3),
            AreaData(time: .string("2018-07-10"), value: 126.55),
            AreaData(time: .string("2018-07-11"), value: 124.3),
            AreaData(time: .string("2018-07-12"), value: 124.8),
            AreaData(time: .string("2018-07-13"), value: 123.25),
            AreaData(time: .string("2018-07-16"), value: 123),
            AreaData(time: .string("2018-07-17"), value: 124.25),
            AreaData(time: .string("2018-07-18"), value: 123),
            AreaData(time: .string("2018-07-19"), value: 121),
            AreaData(time: .string("2018-07-20"), value: 121.45),
            AreaData(time: .string("2018-07-23"), value: 123.8),
            AreaData(time: .string("2018-07-24"), value: 122.15),
            AreaData(time: .string("2018-07-25"), value: 121.3),
            AreaData(time: .string("2018-07-26"), value: 122.7),
            AreaData(time: .string("2018-07-27"), value: 122.2),
            AreaData(time: .string("2018-07-30"), value: 121.7),
            AreaData(time: .string("2018-07-31"), value: 122.95),
            AreaData(time: .string("2018-08-01"), value: 121),
            AreaData(time: .string("2018-08-02"), value: 116),
            AreaData(time: .string("2018-08-03"), value: 118.1),
            AreaData(time: .string("2018-08-06"), value: 114.3),
            AreaData(time: .string("2018-08-07"), value: 114.25),
            AreaData(time: .string("2018-08-08"), value: 111.85),
            AreaData(time: .string("2018-08-09"), value: 109.7),
            AreaData(time: .string("2018-08-10"), value: 105),
            AreaData(time: .string("2018-08-13"), value: 105.75),
            AreaData(time: .string("2018-08-14"), value: 107.25),
            AreaData(time: .string("2018-08-15"), value: 107.4),
            AreaData(time: .string("2018-08-16"), value: 110.5),
            AreaData(time: .string("2018-08-17"), value: 109),
            AreaData(time: .string("2018-08-20"), value: 108.95),
            AreaData(time: .string("2018-08-21"), value: 108.35),
            AreaData(time: .string("2018-08-22"), value: 108.6),
            AreaData(time: .string("2018-08-23"), value: 105.65),
            AreaData(time: .string("2018-08-24"), value: 104.45),
            AreaData(time: .string("2018-08-27"), value: 106.2),
            AreaData(time: .string("2018-08-28"), value: 106.55),
            AreaData(time: .string("2018-08-29"), value: 111.8),
            AreaData(time: .string("2018-08-30"), value: 115.5),
            AreaData(time: .string("2018-08-31"), value: 115.5),
            AreaData(time: .string("2018-09-03"), value: 114.55),
            AreaData(time: .string("2018-09-04"), value: 112.75),
            AreaData(time: .string("2018-09-05"), value: 111.5),
            AreaData(time: .string("2018-09-06"), value: 108.1),
            AreaData(time: .string("2018-09-07"), value: 108.55),
            AreaData(time: .string("2018-09-10"), value: 106.5),
            AreaData(time: .string("2018-09-11"), value: 105.1),
            AreaData(time: .string("2018-09-12"), value: 107.2),
            AreaData(time: .string("2018-09-13"), value: 107.1),
            AreaData(time: .string("2018-09-14"), value: 105.75),
            AreaData(time: .string("2018-09-17"), value: 106.05),
            AreaData(time: .string("2018-09-18"), value: 109.15),
            AreaData(time: .string("2018-09-19"), value: 111.4),
            AreaData(time: .string("2018-09-20"), value: 111),
            AreaData(time: .string("2018-09-21"), value: 111),
            AreaData(time: .string("2018-09-24"), value: 108.95),
            AreaData(time: .string("2018-09-25"), value: 106.65),
            AreaData(time: .string("2018-09-26"), value: 106.7),
            AreaData(time: .string("2018-09-27"), value: 107.05),
            AreaData(time: .string("2018-09-28"), value: 106.55),
            AreaData(time: .string("2018-10-01"), value: 106.2),
            AreaData(time: .string("2018-10-02"), value: 106.4),
            AreaData(time: .string("2018-10-03"), value: 107.1),
            AreaData(time: .string("2018-10-04"), value: 106.4),
            AreaData(time: .string("2018-10-05"), value: 104.65),
            AreaData(time: .string("2018-10-08"), value: 102.65),
            AreaData(time: .string("2018-10-09"), value: 102.1),
            AreaData(time: .string("2018-10-10"), value: 102.15),
            AreaData(time: .string("2018-10-11"), value: 100.9),
            AreaData(time: .string("2018-10-12"), value: 102),
            AreaData(time: .string("2018-10-15"), value: 100.15),
            AreaData(time: .string("2018-10-16"), value: 99),
            AreaData(time: .string("2018-10-17"), value: 98),
            AreaData(time: .string("2018-10-18"), value: 96),
            AreaData(time: .string("2018-10-19"), value: 95.5),
            AreaData(time: .string("2018-10-22"), value: 92.400002),
            AreaData(time: .string("2018-10-23"), value: 92.300003),
            AreaData(time: .string("2018-10-24"), value: 92.900002),
            AreaData(time: .string("2018-10-25"), value: 91.849998),
            AreaData(time: .string("2018-10-26"), value: 91.599998),
            AreaData(time: .string("2018-10-29"), value: 94.050003),
            AreaData(time: .string("2018-10-30"), value: 98.25),
            AreaData(time: .string("2018-10-31"), value: 97.25),
            AreaData(time: .string("2018-11-01"), value: 96.879997),
            AreaData(time: .string("2018-11-02"), value: 101.78),
            AreaData(time: .string("2018-11-06"), value: 102.4),
            AreaData(time: .string("2018-11-07"), value: 100.6),
            AreaData(time: .string("2018-11-08"), value: 98.5),
            AreaData(time: .string("2018-11-09"), value: 95.139999),
            AreaData(time: .string("2018-11-12"), value: 96.900002),
            AreaData(time: .string("2018-11-13"), value: 97.400002),
            AreaData(time: .string("2018-11-14"), value: 103.3),
            AreaData(time: .string("2018-11-15"), value: 102.74),
            AreaData(time: .string("2018-11-16"), value: 101.2),
            AreaData(time: .string("2018-11-19"), value: 98.720001),
            AreaData(time: .string("2018-11-20"), value: 102.2),
            AreaData(time: .string("2018-11-21"), value: 108.8),
            AreaData(time: .string("2018-11-22"), value: 109.9),
            AreaData(time: .string("2018-11-23"), value: 113.74),
            AreaData(time: .string("2018-11-26"), value: 110.9),
            AreaData(time: .string("2018-11-27"), value: 113.28),
            AreaData(time: .string("2018-11-28"), value: 113.6),
            AreaData(time: .string("2018-11-29"), value: 113.14),
            AreaData(time: .string("2018-11-30"), value: 114.4),
            AreaData(time: .string("2018-12-03"), value: 111.84),
            AreaData(time: .string("2018-12-04"), value: 106.7),
            AreaData(time: .string("2018-12-05"), value: 107.8),
            AreaData(time: .string("2018-12-06"), value: 106.44),
            AreaData(time: .string("2018-12-07"), value: 103.7),
            AreaData(time: .string("2018-12-10"), value: 101.02),
            AreaData(time: .string("2018-12-11"), value: 102.72),
            AreaData(time: .string("2018-12-12"), value: 101.8),
            AreaData(time: .string("2018-12-13"), value: 102),
            AreaData(time: .string("2018-12-14"), value: 102.1),
            AreaData(time: .string("2018-12-17"), value: 101.04),
            AreaData(time: .string("2018-12-18"), value: 101.6),
            AreaData(time: .string("2018-12-19"), value: 102),
            AreaData(time: .string("2018-12-20"), value: 102.02),
            AreaData(time: .string("2018-12-21"), value: 102.2),
            AreaData(time: .string("2018-12-24"), value: 102.1),
            AreaData(time: .string("2018-12-25"), value: 100.8),
            AreaData(time: .string("2018-12-26"), value: 101.02),
            AreaData(time: .string("2018-12-27"), value: 100.5),
            AreaData(time: .string("2018-12-28"), value: 101),
            AreaData(time: .string("2019-01-03"), value: 101.5),
            AreaData(time: .string("2019-01-04"), value: 101.1),
            AreaData(time: .string("2019-01-08"), value: 101.1),
            AreaData(time: .string("2019-01-09"), value: 102.06),
            AreaData(time: .string("2019-01-10"), value: 105.14),
            AreaData(time: .string("2019-01-11"), value: 104.66),
            AreaData(time: .string("2019-01-14"), value: 106.22),
            AreaData(time: .string("2019-01-15"), value: 106.98),
            AreaData(time: .string("2019-01-16"), value: 108.4),
            AreaData(time: .string("2019-01-17"), value: 109.06),
            AreaData(time: .string("2019-01-18"), value: 107),
            AreaData(time: .string("2019-01-21"), value: 105.8),
            AreaData(time: .string("2019-01-22"), value: 105.24),
            AreaData(time: .string("2019-01-23"), value: 105.4),
            AreaData(time: .string("2019-01-24"), value: 105.38),
            AreaData(time: .string("2019-01-25"), value: 105.7),
            AreaData(time: .string("2019-01-28"), value: 105.8),
            AreaData(time: .string("2019-01-29"), value: 106.1),
            AreaData(time: .string("2019-01-30"), value: 108.6),
            AreaData(time: .string("2019-01-31"), value: 107.92),
            AreaData(time: .string("2019-02-01"), value: 105.22),
            AreaData(time: .string("2019-02-04"), value: 102.44),
            AreaData(time: .string("2019-02-05"), value: 102.26),
            AreaData(time: .string("2019-02-06"), value: 102),
            AreaData(time: .string("2019-02-07"), value: 101.62),
            AreaData(time: .string("2019-02-08"), value: 101.9),
            AreaData(time: .string("2019-02-11"), value: 101.78),
            AreaData(time: .string("2019-02-12"), value: 102.7),
            AreaData(time: .string("2019-02-13"), value: 100.14),
            AreaData(time: .string("2019-02-14"), value: 101.36),
            AreaData(time: .string("2019-02-15"), value: 101.62),
            AreaData(time: .string("2019-02-18"), value: 100.74),
            AreaData(time: .string("2019-02-19"), value: 100),
            AreaData(time: .string("2019-02-20"), value: 100.04),
            AreaData(time: .string("2019-02-21"), value: 100),
            AreaData(time: .string("2019-02-22"), value: 100.12),
            AreaData(time: .string("2019-02-25"), value: 100.04),
            AreaData(time: .string("2019-02-26"), value: 98.980003),
            AreaData(time: .string("2019-02-27"), value: 97.699997),
            AreaData(time: .string("2019-02-28"), value: 97.099998),
            AreaData(time: .string("2019-03-01"), value: 96.760002),
            AreaData(time: .string("2019-03-04"), value: 98.360001),
            AreaData(time: .string("2019-03-05"), value: 96.260002),
            AreaData(time: .string("2019-03-06"), value: 98.120003),
            AreaData(time: .string("2019-03-07"), value: 99.68),
            AreaData(time: .string("2019-03-11"), value: 102.1),
            AreaData(time: .string("2019-03-12"), value: 100.22),
            AreaData(time: .string("2019-03-13"), value: 100.5),
            AreaData(time: .string("2019-03-14"), value: 99.660004),
            AreaData(time: .string("2019-03-15"), value: 100.08),
            AreaData(time: .string("2019-03-18"), value: 99.919998),
            AreaData(time: .string("2019-03-19"), value: 99.459999),
            AreaData(time: .string("2019-03-20"), value: 98.220001),
            AreaData(time: .string("2019-03-21"), value: 97.300003),
            AreaData(time: .string("2019-03-22"), value: 97.660004),
            AreaData(time: .string("2019-03-25"), value: 97),
            AreaData(time: .string("2019-03-26"), value: 97.019997),
            AreaData(time: .string("2019-03-27"), value: 96.099998),
            AreaData(time: .string("2019-03-28"), value: 96.699997),
            AreaData(time: .string("2019-03-29"), value: 96.300003),
            AreaData(time: .string("2019-04-01"), value: 97.779999),
            AreaData(time: .string("2019-04-02"), value: 98.360001),
            AreaData(time: .string("2019-04-03"), value: 98.5),
            AreaData(time: .string("2019-04-04"), value: 98.360001),
            AreaData(time: .string("2019-04-05"), value: 99.540001),
            AreaData(time: .string("2019-04-08"), value: 98.580002),
            AreaData(time: .string("2019-04-09"), value: 97.239998),
            AreaData(time: .string("2019-04-10"), value: 97.32),
            AreaData(time: .string("2019-04-11"), value: 98.400002),
            AreaData(time: .string("2019-04-12"), value: 98.220001),
            AreaData(time: .string("2019-04-15"), value: 98.720001),
            AreaData(time: .string("2019-04-16"), value: 99.120003),
            AreaData(time: .string("2019-04-17"), value: 98.620003),
            AreaData(time: .string("2019-04-18"), value: 98),
            AreaData(time: .string("2019-04-19"), value: 97.599998),
            AreaData(time: .string("2019-04-22"), value: 97.599998),
            AreaData(time: .string("2019-04-23"), value: 96.800003),
            AreaData(time: .string("2019-04-24"), value: 96.32),
            AreaData(time: .string("2019-04-25"), value: 96.339996),
            AreaData(time: .string("2019-04-26"), value: 97.120003),
            AreaData(time: .string("2019-04-29"), value: 96.980003),
            AreaData(time: .string("2019-04-30"), value: 96.32),
            AreaData(time: .string("2019-05-02"), value: 96.860001),
            AreaData(time: .string("2019-05-03"), value: 96.699997),
            AreaData(time: .string("2019-05-06"), value: 94.940002),
            AreaData(time: .string("2019-05-07"), value: 94.5),
            AreaData(time: .string("2019-05-08"), value: 94.239998),
            AreaData(time: .string("2019-05-10"), value: 92.900002),
            AreaData(time: .string("2019-05-13"), value: 91.279999),
            AreaData(time: .string("2019-05-14"), value: 91.599998),
            AreaData(time: .string("2019-05-15"), value: 90.080002),
            AreaData(time: .string("2019-05-16"), value: 91.68),
            AreaData(time: .string("2019-05-17"), value: 91.959999),
            AreaData(time: .string("2019-05-20"), value: 91.080002),
            AreaData(time: .string("2019-05-21"), value: 90.760002),
            AreaData(time: .string("2019-05-22"), value: 91),
            AreaData(time: .string("2019-05-23"), value: 90.739998),
            AreaData(time: .string("2019-05-24"), value: 91),
            AreaData(time: .string("2019-05-27"), value: 91.199997),
            AreaData(time: .string("2019-05-28"), value: 90.68),
            AreaData(time: .string("2019-05-29"), value: 91.120003),
            AreaData(time: .string("2019-05-30"), value: 90.419998),
            AreaData(time: .string("2019-05-31"), value: 93.800003),
            AreaData(time: .string("2019-06-03"), value: 96.800003),
            AreaData(time: .string("2019-06-04"), value: 96.34),
            AreaData(time: .string("2019-06-05"), value: 95.94)
        ]
        series.setData(data: data)
        self.series = series
    }
    
    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeCrosshairMove()
    }
    
}

// MARK: - ChartDelegate
extension MagnifierTooltipViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        if case let .businessDayString(data) = parameters.time,
            let point = parameters.point,
            case let .lineData(price) = parameters.price(forSeries: series) {
            
            let dateString = data
            tooltipView.update(title: legend, price: price.value!, date: dateString)
            tooltipView.isHidden = false
            
            let x = CGFloat(point.x)
            let targetConstant = x - tooltipView.frame.width * 0.5
            let maximumOffset = self.chart.frame.width - tooltipView.frame.width - 50
            
            switch targetConstant {
            case ...0:
                leadingConstraint.constant = 0
            case maximumOffset...:
                leadingConstraint.constant = maximumOffset
            default:
                leadingConstraint.constant = targetConstant
            }
        } else {
            self.tooltipView.isHidden = true
        }
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        
    }
    
}
