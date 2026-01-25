//
//  LoopingVideoView.swift
//  E-commerce
//
//  Created by Luis Manuel Valdivia Oceguera on 1/24/26.
//

import SwiftUI
import AVFoundation

struct LoopingVideoView: View {
    let videoName: String
    @State private var videoHeight: CGFloat = 200

    var body: some View {
        VideoPlayerLoopView(videoName: videoName, videoHeight: $videoHeight)
            .frame(height: videoHeight)
            .clipped()
    }
}

struct VideoPlayerLoopView: UIViewRepresentable {
    let videoName: String
    @Binding var videoHeight: CGFloat

    func makeCoordinator() -> VideoPlayerCoordinator {
        return VideoPlayerCoordinator(videoName: videoName)
    }

    func makeUIView(context: Context) -> UIView {
        let view = UIView(frame: .zero)

        // Calcula la altura según la relación de aspecto
        if let track = context.coordinator.asset.tracks(withMediaType: .video).first {
            let size = track.naturalSize.applying(track.preferredTransform)
            let aspectRatio = abs(size.width / size.height)
            DispatchQueue.main.async {
                self.videoHeight = UIScreen.main.bounds.width / aspectRatio
            }
        }

        context.coordinator.playerLayer.frame = view.bounds
        view.layer.addSublayer(context.coordinator.playerLayer)

        context.coordinator.player.play() // reproduce automáticamente

        return view
    }

    func updateUIView(_ uiView: UIView, context: Context) {
        context.coordinator.playerLayer.frame = uiView.bounds
    }
}

// Coordinador para mantener player y looper vivos
class VideoPlayerCoordinator {
    let player: AVQueuePlayer
    let looper: AVPlayerLooper
    let playerLayer: AVPlayerLayer
    let asset: AVAsset

    init(videoName: String) {
        guard let url = Bundle.main.url(forResource: videoName, withExtension: "mp4") else {
            fatalError("No se encontró el video \(videoName)")
        }

        self.asset = AVAsset(url: url)

        let item = AVPlayerItem(url: url)
        self.player = AVQueuePlayer(playerItem: item)
        self.looper = AVPlayerLooper(player: player, templateItem: item)
        self.playerLayer = AVPlayerLayer(player: player)
        playerLayer.videoGravity = .resizeAspectFill

        self.player.isMuted = true
    }
}
