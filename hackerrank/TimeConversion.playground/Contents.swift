func timeConversion(s: String) -> String {
    var result = ""

    let components = s.split(separator: ":")

    var timeType = "PM"
    var seconds = 0
    let lastPart = components.last!
    let timeTypeParts = lastPart.split(separator: "A")
    if timeTypeParts.count > 1 {
        timeType = "AM"
        seconds = Int(timeTypeParts[0]) ?? 0
    } else {
        let newTimeTypeParts = lastPart.split(separator: "P")
        seconds = Int(newTimeTypeParts[0]) ?? 0
    }

    let hours = Int(components[0]) ?? 0
    let minutes = Int(components[1]) ?? 0

    var hoursIn24 = 0

    if timeType == "PM" {
        if hours < 12 {
            hoursIn24 = 12 + hours

        } else {
            hoursIn24 = 12
        }

    } else {
        if hours < 12 {
            hoursIn24 = hours

        } else {
            hoursIn24 = 0
        }
    }

    var hoursString = "\(hoursIn24)"
    if hoursIn24 < 10 {
        hoursString = "0\(hoursIn24)"
    }

    var minutesString = "\(minutes)"
    if minutes < 10 {
        minutesString = "0\(minutes)"
    }

    var secondsString = "\(seconds)"
    if seconds < 10 {
        secondsString = "0\(seconds)"
    }

    result = "\(hoursString):\(minutesString):\(secondsString)"

    return result
}

print(timeConversion(s: "06:40:03AM"))
