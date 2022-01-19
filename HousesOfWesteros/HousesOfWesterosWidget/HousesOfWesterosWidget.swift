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
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      configuration: ConfigurationIntent()
    )
  }

  // Defines the preview for the widget
  // when choosing widget-sizes.
  func getSnapshot(
    for configuration: ConfigurationIntent,
    in context: Context, completion: @escaping (SimpleEntry) -> Void
  ) {
    let entry = SimpleEntry(
      date: Date(),
      house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
      configuration: configuration
    )
    completion(entry)
  }

  func getTimeline(
    for configuration: ConfigurationIntent,
    in context: Context,
    completion: @escaping (Timeline<Entry>) -> Void
  ) {
    var entries: [SimpleEntry] = []

    let numberOfHouses = 444
    let id = Int.random(in: 0..<numberOfHouses)

    Api.getSingleHouse(id: id) { result in
      switch result {
      case .success(let receivedObject):
        let house: HouseBasic = receivedObject

        let entry = SimpleEntry(
          date: Date(),
          house: house,
          configuration: configuration
        )
        entries.append(entry)

        // 60 secs * 60 min * 12 hours
        let interval: Double = 60 * 60 * 12

        let timeline = Timeline(
          entries: entries,
          policy: .after(Date().addingTimeInterval(interval))
        )

        completion(timeline)

      case .failure(let error):
        print("Error! \(error)")
      }
    }
  }
}

struct SimpleEntry: TimelineEntry {
  let date: Date
  let house: HouseBasic
  let configuration: ConfigurationIntent
}

struct HousesOfWesterosWidgetEntryView: View {
  var entry: Provider.Entry

  var body: some View {
    ZStack {
      HouseIconColors(
        colors: entry.house.heraldryColors,
        initialLetter: entry.house.initialLetter,
        iconSize: .widgetBackground
      )
      VStack {
        Text("House of the Day:")
          .font(.caption)
          .shadow(color: .white, radius: 5)

        Text(entry.house.name)
          .font(.caption)
          .shadow(color: .white, radius: 5)
      }
    }
    .padding()
  }
}

@main
struct HousesOfWesterosWidget: Widget {
  let kind: String = "HousesOfWesterosWidget"

  // Configuration can be INTENT or STATIC. Intent
  // can handle more dynamic data display.
  var body: some WidgetConfiguration {
    IntentConfiguration(
      kind: kind,
      intent: ConfigurationIntent.self,
      provider: Provider()
    ) { entry in
      HousesOfWesterosWidgetEntryView(entry: entry)
    }
    // These appear when selecting the widget-size.
    .configurationDisplayName("House of the Day")
    .description("You will get a shortcut to a House of the Day, which will change periodically.")
  }
}

struct HousesOfWesterosWidget_Previews: PreviewProvider {
  static var previews: some View {
    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemSmall))

    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemMedium))

    HousesOfWesterosWidgetEntryView(
      entry: SimpleEntry(
        date: Date(),
        house: MockClasses.houseBasicWithLinksAndWithCoatOfArms,
        configuration: ConfigurationIntent()
      )
    )
    .previewContext(WidgetPreviewContext(family: .systemLarge))
  }
}
