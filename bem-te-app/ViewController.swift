//
//  ViewController.swift
//  bem-te-app
//
//  Created by Frederico Westphalen Mendes Machado on 10/09/21.
//

import UIKit
import AVFoundation

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
  
    @IBOutlet weak var soundsTable: UITableView!
    
    var player: AVAudioPlayer?
    
    let sounds = ["Bem-te-vi", "Ba dum tss", "Aplausos"]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        soundsTable.delegate = self
        soundsTable.dataSource = self
        
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return sounds.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "soundCell", for: indexPath) as! SoundTableViewCell
        
        let soundName = sounds[indexPath.row]
        
        cell.soundName.text = soundName
        
        return cell
        
    }
    
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let soundName = sounds[indexPath.row]
        
        playSound(soundName: soundName)
        
    }
    
    func playSound(soundName: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: "mp3") else { return }

        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)

            /* The following line is required for the player to work on iOS 11. Change the file type accordingly*/
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)

            /* iOS 10 and earlier require the following line:
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileTypeMPEGLayer3) */

            guard let player = player else { return }

            player.play()

        } catch let error {
            print(error.localizedDescription)
        }
    }

}
