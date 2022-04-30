
import UIKit
import FSCalendar

class CalendarViewController: UIViewController ,FSCalendarDelegate ,FSCalendarDataSource {
    
    @IBOutlet var currentDateLabel: UILabel!
    @IBOutlet var calendar: FSCalendar!
    @IBOutlet var currentIslamicDateLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setUpView()
    }
    
    func setUpView(){
        self._navigationBarSetUp()
        calendar.delegate = self
        calendar.dataSource = self
        calendar.appearance.headerDateFormat = "MMM yyyy"
        self.calendar.appearance.headerMinimumDissolvedAlpha = 0.0;
        currentDateLabel.text =  getDate()
        calendar.layer.masksToBounds = false
        calendar.layer.cornerRadius = 15
        calendar.layer.shadowColor = UIColor(displayP3Red: 19/255.0, green: 46/255.0, blue: 10/255.0, alpha: 0.2).cgColor
        calendar.layer.shadowOpacity = 1
        calendar.layer.shadowOffset = CGSize(width: 0, height: 0)
        calendar.layer.shadowRadius = 10
        calendar.layer.shouldRasterize = true
        calendar.layer.rasterizationScale = UIScreen.main.scale
    }
    
    func getDate() -> String {
        let time = Date()
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MMM/dd/yyyy"
        let stringDate = timeFormatter.string(from: time)
        islamcDate(date: time)
        return stringDate
    }
    
    func islamcDate(date : Date){
        let outputCalendar = Calendar(identifier: .islamicUmmAlQura)
        let outputFormatter = DateFormatter()
        outputFormatter.calendar = outputCalendar
        outputFormatter.dateFormat = "dd/MMMM/yyyy"
        let outputFormattedDate = outputFormatter.string(from: date)
        currentIslamicDateLabel.text = outputFormattedDate
    }
    
    func calendar(_ calendar: FSCalendar, didSelect date: Date, at monthPosition: FSCalendarMonthPosition) {
        calendar.appearance.todayColor = .white
        let timeFormatter = DateFormatter()
        timeFormatter.dateFormat = "MMM/dd/yyyy"
        let stringDate = timeFormatter.string(from: date)
        currentDateLabel.text =  stringDate
        islamcDate(date: date)
    }
}

