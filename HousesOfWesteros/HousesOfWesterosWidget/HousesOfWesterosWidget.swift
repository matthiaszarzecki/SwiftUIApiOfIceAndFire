//
//  HousesOfWesterosWidget.swift
//  HousesOfWesterosWidget
//
//  Created by Matthias Zarzecki on 20.10.21.
//

import Intents
import SwiftUI
import WidgetKit

struct Provider: IntentTimelineProvider {
  // Is shown as "redacted" when placing widget,
  // before loading the actual widget.
  func placeholder(in context: Context) -> SimpleEntry {
    SimpleEntry(
      date: Date(),
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
      configuration: ConfigurationIntent()
    )
  }

  // Defines the preview for the widget
  // when choosing widget-sizes.
  func getSnapshot(
    for configuration: ConfigurationIntent,
    in context: Context,
    completion: @escaping (SimpleEntry) -> Void
  ) {
    let entry = SimpleEntry(
      date: Date(),
      house: .mockHouseBasicWithLinksAndWithCoatOfArms,
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

    let id = Int.random(in: 0..<Constants.numberOfHouses)

    Api.shared.getSingleHouse(id: id) { result in
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

  @Environment(\.widgetFamily) var widgetFamily

  @ViewBuilder
  var body: some View {
    switch widgetFamily {
    case .systemSmall, .systemMedium:
      GeometryReader { geometry in
        ZStack {
          HouseIconColors(
            colors: entry.house.heraldryColors,
            initialLetter: entry.house.initialLetter,
            iconSize: .widgetBackgroundSmall
          )
          VStack(spacing: .spacing8) {
            Text("House of the Day:")
              .font(.system(size: 14))
              .multilineTextAlignment(.center)
              .shadow(color: .white, radius: 5)

            Text(entry.house.name)
              .font(.caption)
              .multilineTextAlignment(.center)
              .shadow(color: .white, radius: 5)
          }
        }
        .frame(
          width: geometry.size.width,
          height: geometry.size.height,
          alignment: .center
        )
        .background(
          Image("background_01")
            .resizable(resizingMode: .tile)
        )
      }
    case .systemLarge:
      ZStack {
        HouseIconColors(
          colors: entry.house.heraldryColors,
          initialLetter: entry.house.initialLetter,
          iconSize: .widgetBackgroundLarge
        )
        VStack(spacing: .spacing8) {
          Text("House of the Day:")
            .font(.system(size: 14))
            .multilineTextAlignment(.center)
            .shadow(color: .white, radius: 5)

          Text(entry.house.name)
            .font(.caption)
            .multilineTextAlignment(.center)
            .shadow(color: .white, radius: 5)
        }
      }
    case .systemExtraLarge:
      Text("systemExtraLarge")
    case .accessoryCircular:
      Text("accessoryCircular")
    case .accessoryRectangular:
      Text("accessoryRectangular")
    case .accessoryInline:
      Text("accessoryInline")
    @unknown default:
      Text("default")
    }
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

#if !TESTING
struct HousesOfWesterosWidget_Previews: PreviewProvider {
  static var previews: some View {
    ForEach(MockDevice.widgetSizes, id: \.self) { widgetSize in
      HousesOfWesterosWidgetEntryView(
        entry: SimpleEntry(
          date: Date(),
          house: .mockHouseBasicWithLinksAndWithCoatOfArms,
          configuration: ConfigurationIntent()
        )
      )
      .previewContext(
        WidgetPreviewContext(family: widgetSize)
      )
    }
  }
}
#endif
