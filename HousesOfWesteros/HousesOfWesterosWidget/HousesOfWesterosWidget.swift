//
//  HousesOfWesterosWidget.swift
//  HousesOfWesterosWidget
//
//  Created by Matthias Zarzecki on 20.10.21.
//

import WidgetKit
import SwiftUI
import Intents

struct Provider: IntentTimelineProvider {
  // Is shown as "redacted" when placing widget,
  // before loading the actual widget.
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(
      date: Date(),
      index: 77,
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      configuration: ConfigurationIntent()
    )
  }

  // Defines the preview for the widget
  // when choosing widget-sizes.
  func getSnapshot(
    for configuration: ConfigurationIntent,
    in context: Context, completion: @escaping (SimpleEntry) -> ()
  ) {
    let entry = SimpleEntry(
      date: Date(),
      index: 2,
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      configuration: configuration
    )
    completion(entry)
  }

  func getTimeline(
    for configuration: ConfigurationIntent,
    in context: Context, completion: @escaping (Timeline<Entry>) -> ()
  ) {
    var entries: [SimpleEntry] = []

    let id = Int.random(in: 0..<444)
    
    Api.getSingleHouse(id: id) { result in
      switch result {
      case .success(let receivedObject):
        let house: HouseBasic = receivedObject

        // Generate a timeline consisting of five entries
        // an hour apart, starting from the current date.
        let currentDate = Date()
        for hourOffset in 0 ..< 5 {
          let entryDate = Calendar.current.date(
            byAdding: .minute,
            value: hourOffset,
            to: currentDate
          )!
          let entry = SimpleEntry(
            date: entryDate,
            index: hourOffset,
            house: house,
            configuration: configuration
          )
          entries.append(entry)
        }

        let timeline = Timeline(entries: entries, policy: .atEnd)
        completion(timeline)

      case .failure(let error):
        print("Error! \(error)")
      }
    }
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let index: Int
  let house: HouseBasic
  let configuration: ConfigurationIntent
}

struct HousesOfWesterosWidgetEntryView : View {
  var entry: Provider.Entry

  var body: some View {
    VStack {
      Text("\(entry.index), \(entry.date, style: .time)")
      Text(entry.house.name)
      HouseIconColors(
        colors: entry.house.heraldryColors,
        initialLetter: entry.house.initialLetter,
        iconSize: .largeForHeader
      )
    }
  }
}

@main
struct HousesOfWesterosWidget: Widget {
  let kind: String = "HousesOfWesterosWidget"

  var body: some WidgetConfiguration {
    IntentConfiguration(
      kind: kind,
      intent: ConfigurationIntent.self,
      provider: Provider()
    ) { entry in
      HousesOfWesterosWidgetEntryView(entry: entry)
    }
    .configurationDisplayName("My Widget")
    .description("This is an example widget.")
  }
}

struct HousesOfWesterosWidget_Previews: PreviewProvider {
  static var previews: some View {
    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        index: 0,
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))
    
    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        index: 0,
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemMedium))
    
    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        index: 0,
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
