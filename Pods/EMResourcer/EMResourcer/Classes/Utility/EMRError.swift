//
//  EMRError.swift
//  Copyright © 2020 Elegant Media Pvt Ltd. All rights reserved.
//

public enum EMRError: Error {
    
    case failedToPickMedia
    case failedToPickDocument
    case failedToRecordAudio
    case failedToFindRecordedAudioPath
}

extension EMRError: LocalizedError {
    
    public var errorDescription: String? {
        switch self {
        case .failedToPickMedia:
            return NSLocalizedString("Failed to pick media.", comment: "")
        case .failedToPickDocument:
            return NSLocalizedString("Failed to pick document.", comment: "")
        case .failedToRecordAudio:
            return NSLocalizedString("Failed to record audio.", comment: "")
        case .failedToFindRecordedAudioPath:
            return NSLocalizedString("Failed to find path of the recorded audio file.", comment: "")
        }
    }
}
