//
//  ComplicationController.swift
//  Mini Counter WatchKit Extension
//
//  Created by Daniel Arden on 03.11.2021.
//

import ClockKit

final class ComplicationController: NSObject, CLKComplicationDataSource {
    // MARK: - Complication Configuration

    func getComplicationDescriptors(
        handler: @escaping ([CLKComplicationDescriptor]) -> Void
    ) {
        let descriptors = [
            CLKComplicationDescriptor(
                identifier: "complication",
                displayName: LocString.complicationDescriptorTitle(),
                supportedFamilies: Constants.complicationSupportedFamilies
            )
        ]

        handler(descriptors)
    }

    // MARK: - Timeline Configuration

    func getTimelineEndDate(
        for _: CLKComplication,
        withHandler handler: @escaping (Date?) -> Void
    ) {
        // Call the handler with the last entry date you can currently provide or nil if you can't support future timelines
        handler(nil)
    }

    func getPrivacyBehavior(
        for _: CLKComplication,
        withHandler handler: @escaping (CLKComplicationPrivacyBehavior) -> Void
    ) {
        // Call the handler with your desired behavior when the device is locked
        handler(.showOnLockScreen)
    }

    // MARK: - Timeline Population

    func getCurrentTimelineEntry(
        for complication: CLKComplication,
        withHandler handler: @escaping (CLKComplicationTimelineEntry?) -> Void
    ) {
        guard let template = getTemplate(for: complication) else {
            handler(nil)
            return
        }

        let entry = CLKComplicationTimelineEntry(
            date: Date(),
            complicationTemplate: template
        )
        handler(entry)
    }

    func getTimelineEntries(
        for _: CLKComplication,
        after _: Date,
        limit _: Int,
        withHandler handler: @escaping ([CLKComplicationTimelineEntry]?) -> Void
    ) {
        // Call the handler with the timeline entries after the given date
        handler(nil)
    }

    // MARK: - Sample Templates

    func getLocalizableSampleTemplate(
        for complication: CLKComplication,
        withHandler handler: @escaping (CLKComplicationTemplate?) -> Void
    ) {
        let template = getTemplate(for: complication)
        handler(template)
    }
}

// MARK: - Helpers

private extension ComplicationController {
    func getTemplate(for complication: CLKComplication) -> CLKComplicationTemplate? {
        // swiftlint:disable:next force_unwrapping
        let image = UIImage(named: R.image.complicationIcon.name)!
        let imageProvider = CLKImageProvider(onePieceImage: image)

        // Must match with Constants.complicationSupportedFamilies
        switch complication.family {
        case .circularSmall:
            return CLKComplicationTemplateCircularSmallSimpleImage(
                imageProvider: imageProvider
            )
        case .modularSmall:
            return CLKComplicationTemplateModularSmallSimpleImage(
                imageProvider: imageProvider
            )
        case .utilitarianSmall:
            return CLKComplicationTemplateUtilitarianSmallSquare(
                imageProvider: imageProvider
            )
        case .graphicCorner:
            return CLKComplicationTemplateGraphicCornerCircularImage(
                imageProvider: CLKFullColorImageProvider(
                    fullColorImage: image
                )
            )
        default:
            return nil
        }
    }
}
