import Foundation

let documentsURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)

let fileURL = documentsURL
    .appendingPathComponent("dates")
    .appendingPathExtension("txt")

if !FileManager.default.fileExists(atPath: fileURL.path) {
    FileManager.default.createFile(atPath: fileURL.path, contents: nil, attributes: [:])
}

let date = Date()
let data = "\(date)\n".data(using: .utf8)!
let fileHandle = try FileHandle(forWritingTo: fileURL)

if #available(macOS 10.15.4, *) {
    try fileHandle.seekToEnd()
    try fileHandle.write(contentsOf: data)
    try fileHandle.close()
    print("written")
} else {
    print("not written")
}
