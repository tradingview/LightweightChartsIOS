import UIKit
import LightweightCharts

class ThreeLineLegendViewController: UIViewController {

    private var chart: LightweightCharts!
    private var series: AreaSeries!
    private let legendLabel = UILabel()
    private let legend = "AEROSPACE"
    private let data = [
        AreaData(time: .string("2018-03-28"), value: 21.00),
        AreaData(time: .string("2018-03-29"), value: 20.80),
        AreaData(time: .string("2018-03-30"), value: 19.40),
        AreaData(time: .string("2018-04-02"), value: 18.75),
        AreaData(time: .string("2018-04-03"), value: 18.75),
        AreaData(time: .string("2018-04-04"), value: 18.95),
        AreaData(time: .string("2018-04-05"), value: 16.95),
        AreaData(time: .string("2018-04-06"), value: 17.70),
        AreaData(time: .string("2018-04-09"), value: 31.00),
        AreaData(time: .string("2018-04-10"), value: 30.20),
        AreaData(time: .string("2018-04-11"), value: 31.50),
        AreaData(time: .string("2018-04-12"), value: 27.95),
        AreaData(time: .string("2018-04-13"), value: 30.15),
        AreaData(time: .string("2018-04-16"), value: 29.60),
        AreaData(time: .string("2018-04-17"), value: 27.70),
        AreaData(time: .string("2018-04-18"), value: 21.45),
        AreaData(time: .string("2018-04-19"), value: 24.05),
        AreaData(time: .string("2018-04-20"), value: 25.60),
        AreaData(time: .string("2018-04-23"), value: 26.50),
        AreaData(time: .string("2018-04-24"), value: 28.40),
        AreaData(time: .string("2018-04-25"), value: 30.55),
        AreaData(time: .string("2018-04-26"), value: 29.40),
        AreaData(time: .string("2018-04-27"), value: 30.70),
        AreaData(time: .string("2018-04-30"), value: 31.00),
        AreaData(time: .string("2018-05-02"), value: 27.70),
        AreaData(time: .string("2018-05-03"), value: 30.80),
        AreaData(time: .string("2018-05-04"), value: 33.35),
        AreaData(time: .string("2018-05-07"), value: 33.10),
        AreaData(time: .string("2018-05-08"), value: 34.60),
        AreaData(time: .string("2018-05-10"), value: 35.20),
        AreaData(time: .string("2018-05-11"), value: 37.50),
        AreaData(time: .string("2018-05-14"), value: 38.85),
        AreaData(time: .string("2018-05-15"), value: 37.00),
        AreaData(time: .string("2018-05-16"), value: 37.05),
        AreaData(time: .string("2018-05-17"), value: 37.05),
        AreaData(time: .string("2018-05-18"), value: 38.25),
        AreaData(time: .string("2018-05-21"), value: 38.80),
        AreaData(time: .string("2018-05-22"), value: 40.00),
        AreaData(time: .string("2018-05-23"), value: 42.45),
        AreaData(time: .string("2018-05-24"), value: 42.30),
        AreaData(time: .string("2018-05-25"), value: 42.80),
        AreaData(time: .string("2018-05-28"), value: 43.45),
        AreaData(time: .string("2018-05-29"), value: 43.15),
        AreaData(time: .string("2018-05-30"), value: 35.15),
        AreaData(time: .string("2018-05-31"), value: 34.20),
        AreaData(time: .string("2018-06-01"), value: 35.35),
        AreaData(time: .string("2018-06-04"), value: 37.90),
        AreaData(time: .string("2018-06-05"), value: 35.75),
        AreaData(time: .string("2018-06-06"), value: 33.70),
        AreaData(time: .string("2018-06-07"), value: 30.00),
        AreaData(time: .string("2018-06-08"), value: 31.10),
        AreaData(time: .string("2018-06-11"), value: 32.30),
        AreaData(time: .string("2018-06-13"), value: 30.95),
        AreaData(time: .string("2018-06-14"), value: 31.45),
        AreaData(time: .string("2018-06-15"), value: 34.50),
        AreaData(time: .string("2018-06-18"), value: 35.35),
        AreaData(time: .string("2018-06-19"), value: 37.00),
        AreaData(time: .string("2018-06-20"), value: 34.00),
        AreaData(time: .string("2018-06-21"), value: 34.45),
        AreaData(time: .string("2018-06-22"), value: 34.45),
        AreaData(time: .string("2018-06-25"), value: 34.25),
        AreaData(time: .string("2018-06-26"), value: 34.35),
        AreaData(time: .string("2018-06-27"), value: 33.85),
        AreaData(time: .string("2018-06-28"), value: 35.20),
        AreaData(time: .string("2018-06-29"), value: 35.20),
        AreaData(time: .string("2018-07-02"), value: 34.85),
        AreaData(time: .string("2018-07-03"), value: 31.95),
        AreaData(time: .string("2018-07-04"), value: 35.00),
        AreaData(time: .string("2018-07-05"), value: 45.80),
        AreaData(time: .string("2018-07-06"), value: 45.45),
        AreaData(time: .string("2018-07-09"), value: 46.70),
        AreaData(time: .string("2018-07-10"), value: 48.45),
        AreaData(time: .string("2018-07-11"), value: 50.70),
        AreaData(time: .string("2018-07-12"), value: 50.20),
        AreaData(time: .string("2018-07-13"), value: 51.75),
        AreaData(time: .string("2018-07-16"), value: 52.00),
        AreaData(time: .string("2018-07-17"), value: 50.75),
        AreaData(time: .string("2018-07-18"), value: 52.00),
        AreaData(time: .string("2018-07-19"), value: 54.00),
        AreaData(time: .string("2018-07-20"), value: 53.55),
        AreaData(time: .string("2018-07-23"), value: 51.20),
        AreaData(time: .string("2018-07-24"), value: 52.85),
        AreaData(time: .string("2018-07-25"), value: 53.70),
        AreaData(time: .string("2018-07-26"), value: 52.30),
        AreaData(time: .string("2018-07-27"), value: 52.80),
        AreaData(time: .string("2018-07-30"), value: 53.30),
        AreaData(time: .string("2018-07-31"), value: 52.05),
        AreaData(time: .string("2018-08-01"), value: 54.00),
        AreaData(time: .string("2018-08-02"), value: 59.00),
        AreaData(time: .string("2018-08-03"), value: 56.90),
        AreaData(time: .string("2018-08-06"), value: 60.70),
        AreaData(time: .string("2018-08-07"), value: 60.75),
        AreaData(time: .string("2018-08-08"), value: 63.15),
        AreaData(time: .string("2018-08-09"), value: 65.30),
        AreaData(time: .string("2018-08-10"), value: 70.00),
        AreaData(time: .string("2018-08-13"), value: 69.25),
        AreaData(time: .string("2018-08-14"), value: 67.75),
        AreaData(time: .string("2018-08-15"), value: 67.60),
        AreaData(time: .string("2018-08-16"), value: 64.50),
        AreaData(time: .string("2018-08-17"), value: 66.00),
        AreaData(time: .string("2018-08-20"), value: 66.05),
        AreaData(time: .string("2018-08-21"), value: 66.65),
        AreaData(time: .string("2018-08-22"), value: 66.40),
        AreaData(time: .string("2018-08-23"), value: 69.35),
        AreaData(time: .string("2018-08-24"), value: 70.55),
        AreaData(time: .string("2018-08-27"), value: 68.80),
        AreaData(time: .string("2018-08-28"), value: 68.45),
        AreaData(time: .string("2018-08-29"), value: 63.20),
        AreaData(time: .string("2018-08-30"), value: 59.50),
        AreaData(time: .string("2018-08-31"), value: 59.50),
        AreaData(time: .string("2018-09-03"), value: 60.45),
        AreaData(time: .string("2018-09-04"), value: 62.25),
        AreaData(time: .string("2018-09-05"), value: 63.50),
        AreaData(time: .string("2018-09-06"), value: 66.90),
        AreaData(time: .string("2018-09-07"), value: 66.45),
        AreaData(time: .string("2018-09-10"), value: 68.50),
        AreaData(time: .string("2018-09-11"), value: 69.90),
        AreaData(time: .string("2018-09-12"), value: 67.80),
        AreaData(time: .string("2018-09-13"), value: 67.90),
        AreaData(time: .string("2018-09-14"), value: 69.25),
        AreaData(time: .string("2018-09-17"), value: 68.95),
        AreaData(time: .string("2018-09-18"), value: 65.85),
        AreaData(time: .string("2018-09-19"), value: 63.60),
        AreaData(time: .string("2018-09-20"), value: 64.00),
        AreaData(time: .string("2018-09-21"), value: 64.00),
        AreaData(time: .string("2018-09-24"), value: 66.05),
        AreaData(time: .string("2018-09-25"), value: 68.35),
        AreaData(time: .string("2018-09-26"), value: 68.30),
        AreaData(time: .string("2018-09-27"), value: 67.95),
        AreaData(time: .string("2018-09-28"), value: 68.45),
        AreaData(time: .string("2018-10-01"), value: 68.80),
        AreaData(time: .string("2018-10-02"), value: 68.60),
        AreaData(time: .string("2018-10-03"), value: 67.90),
        AreaData(time: .string("2018-10-04"), value: 68.60),
        AreaData(time: .string("2018-10-05"), value: 70.35),
        AreaData(time: .string("2018-10-08"), value: 72.35),
        AreaData(time: .string("2018-10-09"), value: 72.90),
        AreaData(time: .string("2018-10-10"), value: 72.85),
        AreaData(time: .string("2018-10-11"), value: 74.10),
        AreaData(time: .string("2018-10-12"), value: 73.00),
        AreaData(time: .string("2018-10-15"), value: 74.85),
        AreaData(time: .string("2018-10-16"), value: 76.00),
        AreaData(time: .string("2018-10-17"), value: 77.00),
        AreaData(time: .string("2018-10-18"), value: 79.00),
        AreaData(time: .string("2018-10-19"), value: 79.50),
        AreaData(time: .string("2018-10-22"), value: 82.60),
        AreaData(time: .string("2018-10-23"), value: 82.70),
        AreaData(time: .string("2018-10-24"), value: 82.10),
        AreaData(time: .string("2018-10-25"), value: 83.15),
        AreaData(time: .string("2018-10-26"), value: 83.40),
        AreaData(time: .string("2018-10-29"), value: 80.95),
        AreaData(time: .string("2018-10-30"), value: 76.75),
        AreaData(time: .string("2018-10-31"), value: 77.75),
        AreaData(time: .string("2018-11-01"), value: 78.12),
        AreaData(time: .string("2018-11-02"), value: 73.22),
        AreaData(time: .string("2018-11-06"), value: 72.60),
        AreaData(time: .string("2018-11-07"), value: 74.40),
        AreaData(time: .string("2018-11-08"), value: 76.50),
        AreaData(time: .string("2018-11-09"), value: 79.86),
        AreaData(time: .string("2018-11-12"), value: 78.10),
        AreaData(time: .string("2018-11-13"), value: 77.60),
        AreaData(time: .string("2018-11-14"), value: 71.70),
        AreaData(time: .string("2018-11-15"), value: 72.26),
        AreaData(time: .string("2018-11-16"), value: 73.80),
        AreaData(time: .string("2018-11-19"), value: 76.28),
        AreaData(time: .string("2018-11-20"), value: 72.80),
        AreaData(time: .string("2018-11-21"), value: 66.20),
        AreaData(time: .string("2018-11-22"), value: 65.10),
        AreaData(time: .string("2018-11-23"), value: 61.26),
        AreaData(time: .string("2018-11-26"), value: 64.10),
        AreaData(time: .string("2018-11-27"), value: 61.72),
        AreaData(time: .string("2018-11-28"), value: 61.40),
        AreaData(time: .string("2018-11-29"), value: 61.86),
        AreaData(time: .string("2018-11-30"), value: 60.60),
        AreaData(time: .string("2018-12-03"), value: 63.16),
        AreaData(time: .string("2018-12-04"), value: 68.30),
        AreaData(time: .string("2018-12-05"), value: 67.20),
        AreaData(time: .string("2018-12-06"), value: 68.56),
        AreaData(time: .string("2018-12-07"), value: 71.30),
        AreaData(time: .string("2018-12-10"), value: 73.98),
        AreaData(time: .string("2018-12-11"), value: 72.28),
        AreaData(time: .string("2018-12-12"), value: 73.20),
        AreaData(time: .string("2018-12-13"), value: 73.00),
        AreaData(time: .string("2018-12-14"), value: 72.90),
        AreaData(time: .string("2018-12-17"), value: 73.96),
        AreaData(time: .string("2018-12-18"), value: 73.40),
        AreaData(time: .string("2018-12-19"), value: 73.00),
        AreaData(time: .string("2018-12-20"), value: 72.98),
        AreaData(time: .string("2018-12-21"), value: 72.80),
        AreaData(time: .string("2018-12-24"), value: 72.90),
        AreaData(time: .string("2018-12-25"), value: 74.20),
        AreaData(time: .string("2018-12-26"), value: 73.98),
        AreaData(time: .string("2018-12-27"), value: 74.50),
        AreaData(time: .string("2018-12-28"), value: 74.00),
        AreaData(time: .string("2019-01-03"), value: 73.50),
        AreaData(time: .string("2019-01-04"), value: 73.90),
        AreaData(time: .string("2019-01-08"), value: 73.90),
        AreaData(time: .string("2019-01-09"), value: 72.94),
        AreaData(time: .string("2019-01-10"), value: 69.86),
        AreaData(time: .string("2019-01-11"), value: 70.34),
        AreaData(time: .string("2019-01-14"), value: 68.78),
        AreaData(time: .string("2019-01-15"), value: 68.02),
        AreaData(time: .string("2019-01-16"), value: 66.60),
        AreaData(time: .string("2019-01-17"), value: 65.94),
        AreaData(time: .string("2019-01-18"), value: 68.00),
        AreaData(time: .string("2019-01-21"), value: 69.20),
        AreaData(time: .string("2019-01-22"), value: 69.76),
        AreaData(time: .string("2019-01-23"), value: 69.60),
        AreaData(time: .string("2019-01-24"), value: 69.62),
        AreaData(time: .string("2019-01-25"), value: 69.30),
        AreaData(time: .string("2019-01-28"), value: 69.20),
        AreaData(time: .string("2019-01-29"), value: 68.90),
        AreaData(time: .string("2019-01-30"), value: 66.40),
        AreaData(time: .string("2019-01-31"), value: 67.08),
        AreaData(time: .string("2019-02-01"), value: 69.78),
        AreaData(time: .string("2019-02-04"), value: 72.56),
        AreaData(time: .string("2019-02-05"), value: 72.74),
        AreaData(time: .string("2019-02-06"), value: 73.00),
        AreaData(time: .string("2019-02-07"), value: 73.38),
        AreaData(time: .string("2019-02-08"), value: 73.10),
        AreaData(time: .string("2019-02-11"), value: 73.22),
        AreaData(time: .string("2019-02-12"), value: 72.30),
        AreaData(time: .string("2019-02-13"), value: 74.86),
        AreaData(time: .string("2019-02-14"), value: 73.64),
        AreaData(time: .string("2019-02-15"), value: 73.38),
        AreaData(time: .string("2019-02-18"), value: 74.26),
        AreaData(time: .string("2019-02-19"), value: 75.00),
        AreaData(time: .string("2019-02-20"), value: 74.96),
        AreaData(time: .string("2019-02-21"), value: 75.00),
        AreaData(time: .string("2019-02-22"), value: 74.88),
        AreaData(time: .string("2019-02-25"), value: 74.96),
        AreaData(time: .string("2019-02-26"), value: 76.02),
        AreaData(time: .string("2019-02-27"), value: 77.30),
        AreaData(time: .string("2019-02-28"), value: 77.90),
        AreaData(time: .string("2019-03-01"), value: 78.24),
        AreaData(time: .string("2019-03-04"), value: 76.64),
        AreaData(time: .string("2019-03-05"), value: 78.74),
        AreaData(time: .string("2019-03-06"), value: 76.88),
        AreaData(time: .string("2019-03-07"), value: 75.32),
        AreaData(time: .string("2019-03-11"), value: 72.90),
        AreaData(time: .string("2019-03-12"), value: 74.78),
        AreaData(time: .string("2019-03-13"), value: 74.50),
        AreaData(time: .string("2019-03-14"), value: 75.34),
        AreaData(time: .string("2019-03-15"), value: 74.92),
        AreaData(time: .string("2019-03-18"), value: 75.08),
        AreaData(time: .string("2019-03-19"), value: 75.54),
        AreaData(time: .string("2019-03-20"), value: 76.78),
        AreaData(time: .string("2019-03-21"), value: 77.70),
        AreaData(time: .string("2019-03-22"), value: 77.34),
        AreaData(time: .string("2019-03-25"), value: 78.00),
        AreaData(time: .string("2019-03-26"), value: 77.98),
        AreaData(time: .string("2019-03-27"), value: 78.90),
        AreaData(time: .string("2019-03-28"), value: 78.30),
        AreaData(time: .string("2019-03-29"), value: 78.70),
        AreaData(time: .string("2019-04-01"), value: 77.22),
        AreaData(time: .string("2019-04-02"), value: 76.64),
        AreaData(time: .string("2019-04-03"), value: 76.50),
        AreaData(time: .string("2019-04-04"), value: 76.64),
        AreaData(time: .string("2019-04-05"), value: 75.46),
        AreaData(time: .string("2019-04-08"), value: 76.42),
        AreaData(time: .string("2019-04-09"), value: 77.76),
        AreaData(time: .string("2019-04-10"), value: 77.68),
        AreaData(time: .string("2019-04-11"), value: 76.60),
        AreaData(time: .string("2019-04-12"), value: 76.78),
        AreaData(time: .string("2019-04-15"), value: 76.28),
        AreaData(time: .string("2019-04-16"), value: 75.88),
        AreaData(time: .string("2019-04-17"), value: 76.38),
        AreaData(time: .string("2019-04-18"), value: 77.00),
        AreaData(time: .string("2019-04-19"), value: 77.40),
        AreaData(time: .string("2019-04-22"), value: 77.40),
        AreaData(time: .string("2019-04-23"), value: 78.20),
        AreaData(time: .string("2019-04-24"), value: 78.68),
        AreaData(time: .string("2019-04-25"), value: 78.66),
        AreaData(time: .string("2019-04-26"), value: 77.88),
        AreaData(time: .string("2019-04-29"), value: 78.02),
        AreaData(time: .string("2019-04-30"), value: 78.68),
        AreaData(time: .string("2019-05-02"), value: 78.14),
        AreaData(time: .string("2019-05-03"), value: 78.30),
        AreaData(time: .string("2019-05-06"), value: 80.06),
        AreaData(time: .string("2019-05-07"), value: 80.50),
        AreaData(time: .string("2019-05-08"), value: 80.76),
        AreaData(time: .string("2019-05-10"), value: 82.10),
        AreaData(time: .string("2019-05-13"), value: 83.72),
        AreaData(time: .string("2019-05-14"), value: 83.55),
        AreaData(time: .string("2019-05-15"), value: 84.92),
        AreaData(time: .string("2019-05-16"), value: 83.32),
        AreaData(time: .string("2019-05-17"), value: 83.04),
        AreaData(time: .string("2019-05-20"), value: 83.92),
        AreaData(time: .string("2019-05-21"), value: 84.24),
        AreaData(time: .string("2019-05-22"), value: 84.00),
        AreaData(time: .string("2019-05-23"), value: 84.26),
        AreaData(time: .string("2019-05-24"), value: 84.00),
        AreaData(time: .string("2019-05-27"), value: 83.80),
        AreaData(time: .string("2019-05-28"), value: 84.32),
        AreaData(time: .string("2019-05-29"), value: 83.88),
        AreaData(time: .string("2019-05-30"), value: 84.58),
        AreaData(time: .string("2019-05-31"), value: 81.20),
        AreaData(time: .string("2019-06-03"), value: 84.35),
        AreaData(time: .string("2019-06-04"), value: 85.66),
        AreaData(time: .string("2019-06-05"), value: 86.51)
    ]
    
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
        setLastBarText()
    }
    
    private func setupUI() {
        let padding: CGFloat = 16
        legendLabel.text = legend
        legendLabel.font = .systemFont(ofSize: 18)
        legendLabel.textColor = .darkText
        legendLabel.numberOfLines = 3
        view.addSubview(legendLabel)
        legendLabel.translatesAutoresizingMaskIntoConstraints = false
        if #available(iOS 11.0, *) {
            NSLayoutConstraint.activate([
                legendLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: padding),
                legendLabel.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: -padding),
                legendLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: padding)
            ])
        } else {
            NSLayoutConstraint.activate([
                legendLabel.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: padding),
                legendLabel.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -padding),
                legendLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: padding)
            ])
        }
        
        let options = ChartOptions(
            rightPriceScale: VisiblePriceScaleOptions(
                scaleMargins: PriceScaleMargins(top: 0.35, bottom: 0.2),
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
                horizontalLines: GridLineOptions(color: "#eee", visible: false)
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
        
        view.bringSubviewToFront(legendLabel)
    }
    
    private func setupData() {
        let options = AreaSeriesOptions(
            topColor: "rgba(19, 68, 193, 0.4)",
            bottomColor: "rgba(0, 120, 255, 0.0)",
            lineColor: "rgba(19, 40, 153, 1.0)",
            lineWidth: .three
        )
        let series = chart.addAreaSeries(options: options)
        series.setData(data: data)
        self.series = series
    }
    
    private func setupSubscription() {
        chart.delegate = self
        chart.subscribeCrosshairMove()
    }

    private func setLastBarText() {
        let bar = data.last!
        let dateString: String
        switch bar.time {
        case let .businessDay(date):
            dateString = "\(date.year) - \(date.month) - \(date.day)"
        case let .string(date):
            dateString = date.split(separator: "-").joined(separator: " - ")
        case let .utc(timestamp: date):
            dateString = "\(date)"
        }
        legendLabel.text = "\(legend)\n\((bar.value! * 100).rounded() / 100)\n\(dateString)"
    }
    
}

// MARK: - ChartDelegate
extension ThreeLineLegendViewController: ChartDelegate {
    
    func didClick(onChart chart: ChartApi, parameters: MouseEventParams) {
        
    }
    
    func didCrosshairMove(onChart chart: ChartApi, parameters: MouseEventParams) {
        if case let .businessDayString(date) = parameters.time,
            case let .lineData(price) = parameters.price(forSeries: series) {
            
            self.legendLabel.text = "\(self.legend)\n\((price.value! * 100).rounded() / 100)\n\(date)"
        } else {
            setLastBarText()
        }
    }
    
    func didVisibleTimeRangeChange(onChart chart: ChartApi, parameters: TimeRange?) {
        
    }
    
}
