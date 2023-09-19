
String convertPublishedAt(String publishedAt) {
  DateTime tempDate = DateTime.parse(publishedAt);
  
  final DateTime publishedDate = DateTime(tempDate.year,tempDate.month, tempDate.day);
  final today = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day);
  final yesterday = DateTime(DateTime.now().year, DateTime.now().month, DateTime.now().day - 1);
  Duration diff = DateTime.now().difference(tempDate);
  
  if (diff.inDays < 1) {
    return "${diff.inMinutes} minute ago";
  } else if (publishedDate == today) {
    return "Today";
  } else if (publishedDate == yesterday) {
    return "Yesterday";
  }
  return "${tempDate.day}/${tempDate.month}/${tempDate.year}";
}
