import Foundation
import LaunchAgent

let launchAgent = LaunchAgent(label: "net.duhnnie.dateWriter", program: ["/Users/daniel/Projects/LaunchAgentTest/.build/x86_64-apple-macosx/debug/DateWriter"])

launchAgent.startInterval = 10

do {
    try LaunchControl.shared.write(launchAgent)
    try launchAgent.load()
    launchAgent.start()
    launchAgent.stop()
    try launchAgent.unload()
    try LaunchControl.shared.write(launchAgent, called: "deleteme")
} catch {
    print("Unexpected error:", error)
}
