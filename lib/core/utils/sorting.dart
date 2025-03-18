List<Map<String, dynamic>> sortBoardContents(
    List<Map<String, dynamic>> boardContents) {
  boardContents.sort((a, b) {
    if (a['isPinned'] == b['isPinned']) {
      return DateTime.parse(b['date']).compareTo(DateTime.parse(a['date']));
    }
    return a['isPinned'] ? -1 : 1;
  });
  return boardContents;
}
