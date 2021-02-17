//
//  CharacterView.swift
//  GotTest
//
//  Created by Matthias Zarzecki on 19.01.21.
//

import SwiftUI

/// Shows information about the specified character.
struct CharacterView: View {
  var character: Character
  
  var body: some View {
    VStack {
      Text("\(character.name)")
        .font(.title)
      
      Form {
        if character.born.exists {
          Section(header: SectionHeader(text: "Born")) {
            Text("\(character.born)")
          }
        }
        
        if character.culture.exists {
          Section(header: SectionHeader(text: "Culture")) {
            Text("\(character.culture)")
          }
        }
        
        if character.died.exists {
          Section(header: SectionHeader(text: "Died")) {
            Text("☠️ \(character.died)")
          }
        }
        
        if character.titles.hasNonEmptyEntries {
          Section(header: SectionHeader(text: "Titles")) {
            ForEach(character.titles, id: \.self) { title in
              Text("🎖️ \(title)")
            }
          }
        }
        
        if character.aliases.hasNonEmptyEntries {
          Section(header: SectionHeader(text: "Aliases")) {
            ForEach(character.aliases, id: \.self) { alias in
              Text("\(alias)")
            }
          }
        }
        
        if character.tvShowAppearances.hasNonEmptyEntries {
          Section(header: SectionHeader(text: "TV Show Appearances")) {
            ForEach(character.tvShowAppearances, id: \.self) { appearance in
              Text("📺 \(appearance)")
            }
          }
        }
        
        if character.portrayedBy.hasNonEmptyEntries {
          Section(header: SectionHeader(text: "Portayed by")) {
            ForEach(character.portrayedBy, id: \.self) { actor in
              HStack {
                CharacterIcon(
                  initialLetter: actor[0],
                  size: 24
                )
                Text("\(actor)")
              }
            }
          }
        }
      }
    }
  }
}

struct CharacterView_Previews: PreviewProvider {
  static var previews: some View {
    CharacterView(character: MockClasses.character)
  }
}
