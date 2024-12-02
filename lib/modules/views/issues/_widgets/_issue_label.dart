part of '../issues_view.dart';

class _IssueLabels extends StatelessWidget {
  const _IssueLabels({
    required this.issue,
  });

  final Issue issue;

  @override
  Widget build(BuildContext context) {
    final color = MMTheme.of(context).color;
    return Wrap(
      children: [
        // labels
        if (issue.labels.isNotEmpty)
          ...issue.labels.map(
            (label) {
              final bgColor = Color(int.parse('0xFF${label.color}'));

              return SizedBox(
                height: kSpace4,
                child: FittedBox(
                  child: Padding(
                    padding: const EdgeInsets.only(right: kSpace1),
                    child: Chip(
                      label: MMText.subtitle(
                        label.name,
                        color: label.isColorDark
                            ? color.primary
                            : color.background,
                      ),
                      backgroundColor: bgColor,
                    ),
                  ),
                ),
              );
            },
          ),
      ],
    );
  }
}
