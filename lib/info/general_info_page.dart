// general_info_page.dart
import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class GeneralInfoPage extends StatelessWidget {
  const GeneralInfoPage({Key? key}) : super(key: key);

  // Sample content -- replace with dynamic content from your DB
  final List<DoctorTip> tips = const [
    DoctorTip(
      title: "Follow a routine",
      body:
          "A simple daily routine reduces anxiety and gives your mind structure. Start with small steps — wake up, hydrate and plan your day.",
    ),
    DoctorTip(
      title: "Limit overthinking triggers",
      body:
          "Avoid content or conversations that leave you mentally drained. Protect your emotional energy.",
    ),
    DoctorTip(
      title: "Talk to someone you trust",
      body:
          "Sharing how you feel with a friend or family member can reduce emotional pressure more than you realize.",
    ),
  ];

  final List<ActivityItem> activities = const [
    ActivityItem(
      title: "4-7-8 Breathing (5 min)",
      subtitle: "Inhale 4s → Hold 7s → Exhale 8s. Repeat 5 times.",
      durationMinutes: 5,
    ),
    ActivityItem(
      title: "2-min Thought Dump",
      subtitle: "Write whatever's on your mind for 2 minutes. No rules.",
      durationMinutes: 2,
    ),
    ActivityItem(
      title: "Short Walk",
      subtitle: "5 minute walk to reset your mood.",
      durationMinutes: 5,
    ),
  ];

  final List<VideoItem> videos = const [
    VideoItem(
      title: "Guided Deep Breathing — 5 min",
      url: "https://www.youtube.com/watch?v=SE3m6CKs5oM",
      thumbnail: "https://img.youtube.com/vi/SE3m6CKs5oM/maxresdefault.jpg",
    ),
    VideoItem(
      title: "Understanding Stress in 60 Seconds",
      url: "https://www.youtube.com/watch?v=example2",
      thumbnail: "https://img.youtube.com/vi/example2/maxresdefault.jpg",
    ),
    VideoItem(
      title: "Grounding Exercise (5-4-3-2-1)",
      url: "https://www.youtube.com/watch?v=example3",
      thumbnail: "https://img.youtube.com/vi/example3/maxresdefault.jpg",
    ),
  ];

  final List<String> affirmations = const [
    "I am safe. I am grounded.",
    "My feelings are valid.",
    "One step at a time is okay.",
    "I deserve rest and kindness.",
    "I am learning to take better care of myself.",
  ];

  @override
  Widget build(BuildContext context) {
    // Provide the sample data via local variables for building widgets
    return Scaffold(
      appBar: AppBar(
        title: const Text("General Info"),
        backgroundColor: const Color(0xFF6C63FF),
        elevation: 0,
      ),
      body: Container(
        color: const Color(0xFFF7F7FF),
        child: SafeArea(
          child: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            children: [
              const SizedBox(height: 8),
              _buildHeader(),
              const SizedBox(height: 10),
              _sectionTitle("Doctor-recommended Tips"),
              const SizedBox(height: 8),
              ...tips.map((t) => DoctorTipCard(tip: t)).toList(),
              const SizedBox(height: 14),
              _sectionTitle("Activities (5–10 mins)"),
              const SizedBox(height: 8),
              ...activities.map((a) => ActivityCard(item: a)).toList(),
              const SizedBox(height: 14),
              _sectionTitle("Helpful Videos"),
              const SizedBox(height: 8),
              SizedBox(
                // Increased to prevent bottom overflow of VideoCard content
                height: 210,
                child: ListView.separated(
                  scrollDirection: Axis.horizontal,
                  itemCount: videos.length,
                  separatorBuilder: (_, __) => const SizedBox(width: 12),
                  itemBuilder: (context, index) {
                    return VideoCard(video: videos[index]);
                  },
                ),
              ),
              const SizedBox(height: 14),
              _sectionTitle("Daily Affirmations"),
              const SizedBox(height: 8),
              Wrap(
                spacing: 8,
                runSpacing: 8,
                children: affirmations
                    .map((a) => AffirmationChip(text: a))
                    .toList(),
              ),
              const SizedBox(height: 24),
              const Center(
                child: Text(
                  "If you're feeling in crisis, please seek immediate help.",
                  style: TextStyle(fontWeight: FontWeight.w600),
                ),
              ),
              const SizedBox(height: 20),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return Row(
      children: [
        Container(
          decoration: BoxDecoration(
            color: const Color(0xFFEEF2FF),
            borderRadius: BorderRadius.circular(12),
          ),
          padding: const EdgeInsets.all(14),
          child: const Icon(
            Icons.info_outline,
            size: 30,
            color: Color(0xFF6C63FF),
          ),
        ),
        const SizedBox(width: 12),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                "Your Daily Mental Wellness",
                style: TextStyle(fontSize: 18, fontWeight: FontWeight.w700),
              ),
              SizedBox(height: 6),
              Text(
                "Quick tips, short activities and doctor-approved videos to help you feel a little better today.",
                style: TextStyle(fontSize: 13, color: Colors.black54),
              ),
            ],
          ),
        ),
      ],
    );
  }

  Widget _sectionTitle(String t) {
    return Text(
      t,
      style: const TextStyle(fontSize: 16, fontWeight: FontWeight.w700),
    );
  }
}

/* ----------------- Models ----------------- */
class DoctorTip {
  final String title;
  final String body;
  const DoctorTip({required this.title, required this.body});
}

class ActivityItem {
  final String title;
  final String subtitle;
  final int durationMinutes;
  const ActivityItem({
    required this.title,
    required this.subtitle,
    required this.durationMinutes,
  });
}

class VideoItem {
  final String title;
  final String url;
  final String thumbnail;
  const VideoItem({
    required this.title,
    required this.url,
    required this.thumbnail,
  });
}

/* ----------------- Widgets ----------------- */

class DoctorTipCard extends StatefulWidget {
  final DoctorTip tip;
  const DoctorTipCard({Key? key, required this.tip}) : super(key: key);

  @override
  State<DoctorTipCard> createState() => _DoctorTipCardState();
}

class _DoctorTipCardState extends State<DoctorTipCard> {
  bool expanded = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 1,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      margin: const EdgeInsets.symmetric(vertical: 8),
      child: InkWell(
        borderRadius: BorderRadius.circular(12),
        onTap: () => setState(() => expanded = !expanded),
        child: Padding(
          padding: const EdgeInsets.all(14),
          child: Row(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const Icon(
                Icons.medical_information_outlined,
                color: Color(0xFF6C63FF),
              ),
              const SizedBox(width: 12),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.tip.title,
                      style: const TextStyle(fontWeight: FontWeight.w700),
                    ),
                    const SizedBox(height: 6),
                    AnimatedCrossFade(
                      firstChild: Text(
                        widget.tip.body,
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: const TextStyle(color: Colors.black87),
                      ),
                      secondChild: Text(
                        widget.tip.body,
                        style: const TextStyle(color: Colors.black87),
                      ),
                      crossFadeState: expanded
                          ? CrossFadeState.showSecond
                          : CrossFadeState.showFirst,
                      duration: const Duration(milliseconds: 200),
                    ),
                  ],
                ),
              ),
              const SizedBox(width: 8),
              Icon(
                expanded ? Icons.keyboard_arrow_up : Icons.keyboard_arrow_down,
                color: Colors.black54,
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class ActivityCard extends StatefulWidget {
  final ActivityItem item;
  const ActivityCard({Key? key, required this.item}) : super(key: key);

  @override
  State<ActivityCard> createState() => _ActivityCardState();
}

class _ActivityCardState extends State<ActivityCard> {
  bool done = false;
  @override
  Widget build(BuildContext context) {
    return Card(
      color: done ? const Color(0xFFE9F7EE) : Colors.white,
      margin: const EdgeInsets.symmetric(vertical: 8),
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      child: ListTile(
        contentPadding: const EdgeInsets.symmetric(
          horizontal: 14,
          vertical: 10,
        ),
        leading: CircleAvatar(
          backgroundColor: const Color(0xFF6C63FF),
          child: Text(
            "${widget.item.durationMinutes}m",
            style: const TextStyle(color: Colors.white),
          ),
        ),
        title: Text(
          widget.item.title,
          style: const TextStyle(fontWeight: FontWeight.w700),
        ),
        subtitle: Text(widget.item.subtitle),
        trailing: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            IconButton(
              tooltip: done ? "Mark undone" : "Mark done",
              onPressed: () => setState(() => done = !done),
              icon: Icon(
                done ? Icons.check_circle : Icons.radio_button_unchecked,
                color: done ? Colors.green : Colors.grey,
              ),
            ),
            const SizedBox(width: 6),
            IconButton(
              tooltip: "Start",
              onPressed: () {
                // Start timer or guided activity
                ScaffoldMessenger.of(context).showSnackBar(
                  SnackBar(content: Text("Starting: ${widget.item.title}")),
                );
              },
              icon: const Icon(Icons.play_arrow),
            ),
          ],
        ),
      ),
    );
  }
}

class VideoCard extends StatelessWidget {
  final VideoItem video;
  const VideoCard({Key? key, required this.video}) : super(key: key);

  Future<void> _openUrl(BuildContext context, String url) async {
    final uri = Uri.parse(url);
    if (await canLaunchUrl(uri)) {
      await launchUrl(uri, mode: LaunchMode.externalApplication);
    } else {
      ScaffoldMessenger.of(
        context,
      ).showSnackBar(const SnackBar(content: Text("Could not open link")));
    }
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 280,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        elevation: 2,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          onTap: () => _openUrl(context, video.url),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // thumbnail
              ClipRRect(
                borderRadius: const BorderRadius.vertical(
                  top: Radius.circular(12),
                ),
                child: Image.network(
                  video.thumbnail,
                  height: 110,
                  width: double.infinity,
                  fit: BoxFit.cover,
                  errorBuilder: (context, _, __) => Container(
                    height: 110,
                    color: Colors.grey[300],
                    child: const Center(
                      child: Icon(Icons.play_circle_outline, size: 40),
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(12),
                child: Text(
                  video.title,
                  style: const TextStyle(fontWeight: FontWeight.w700),
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                  vertical: 6,
                ),
                child: Row(
                  children: const [
                    Icon(
                      Icons.play_circle_fill,
                      color: Color(0xFF6C63FF),
                      size: 18,
                    ),
                    SizedBox(width: 8),
                    Text("Watch", style: TextStyle(color: Colors.black54)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class AffirmationChip extends StatelessWidget {
  final String text;
  const AffirmationChip({Key? key, required this.text}) : super(key: key);

  void _copyToClipboard(BuildContext context, String text) {
    ScaffoldMessenger.of(
      context,
    ).showSnackBar(const SnackBar(content: Text("Affirmation copied")));
  }

  @override
  Widget build(BuildContext context) {
    return ActionChip(
      label: Text(text, style: const TextStyle(fontSize: 12)),
      onPressed: () => _copyToClipboard(context, text),
      backgroundColor: Colors.white,
      elevation: 1,
      padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 8),
      side: const BorderSide(color: Colors.black12),
    );
  }
}
