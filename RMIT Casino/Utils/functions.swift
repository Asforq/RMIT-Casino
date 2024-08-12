import Foundation

public func randomizeImages() -> [String] {
    let possibleImages = [
        "apple",
        "bar",
        "bell",
        "cherry",
        "clover",
        "diamond",
        "grape",
        "heart",
        "horseshoe",
        "lemon",
        "melon",
        "money",
        "orange"
    ]
    return [
        possibleImages.randomElement() ?? "apple",
        possibleImages.randomElement() ?? "bar",
        possibleImages.randomElement() ?? "bell"
    ]
}

public func checkWinCon(spinImages: [String], user: inout User) {
    if spinImages[0] == spinImages[1] && spinImages[1] == spinImages[2] {
        user.money += user.betAmount*300  // Add money if user wins
        user.highScore += 10
    } else {
        user.money -= user.betAmount
    }
}
