import 'package:flutter/material.dart';
import 'events_card.dart';
class Events extends StatefulWidget {
  const Events({super.key});

  @override
  State<Events> createState() => _EventsState();
}

class _EventsState extends State<Events> {
  @override
  Widget build(BuildContext context) {
    return Container(
      constraints: BoxConstraints(
        maxWidth: 1512,
      ),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: Row(
          spacing: 24,
          children: [
            EventsCard(content: "Learn how to list cabins, set lease terms and convert commercial spaces into rentable units.",
                location: "Host Onboarding — Bengaluru", date: "Jan 20, 2026 • 10:00 AM"),
            EventsCard(content: "Learn how to list cabins, set lease terms and convert commercial spaces into rentable units.",
                location: "Host Onboarding — Bengaluru", date: "Jan 20, 2026 • 10:00 AM"),
            EventsCard(content: "Learn how to list cabins, set lease terms and convert commercial spaces into rentable units.",
                location: "Host Onboarding — Bengaluru", date: "Jan 20, 2026 • 10:00 AM"),
            EventsCard(content: "Learn how to list cabins, set lease terms and convert commercial spaces into rentable units.",
                location: "Host Onboarding — Bengaluru", date: "Jan 20, 2026 • 10:00 AM")
          ],
        ),
      ),
    );
  }
}
