protocol PhoneCameraAppProtocol {
    var shareStrategy: ShareStrategyProtocol { get set }

    func share() -> Void
    func take() -> Void
    func save() -> Void
    func edit() -> Void
}

// Use a protocol extension to provide default implementation for things that don't change
extension PhoneCameraAppProtocol {
    func share() {
        shareStrategy.share()
    }

    func take() {
        print("Taking a photo.")
    }

    func save() {
        print("Saving a photo")
    }
}

protocol ShareStrategyProtocol {
    func share() -> Void
}

struct BasicCameraApp: PhoneCameraAppProtocol {
    var shareStrategy: ShareStrategyProtocol

    func edit() {
        print("Editing using basic functionalities")
    }
}

struct CameraAppPlus: PhoneCameraAppProtocol {
    var shareStrategy: ShareStrategyProtocol

    func edit() {
        print("Editing using plus functionalities")
    }
}

struct SocialShare: ShareStrategyProtocol {
    func share() {
        print("Social Sharing is in place")
    }
}

struct EmailShare: ShareStrategyProtocol {
    func share() {
        print("Email Sharing is in place")
    }
}

struct TxtShare: ShareStrategyProtocol {
    func share() {
        print("Txt Sharing is in place")
    }
}

let basicCameraApp = BasicCameraApp(shareStrategy: SocialShare())
basicCameraApp.share()

let plusCameraApp = CameraAppPlus(shareStrategy: EmailShare())
plusCameraApp.share()
