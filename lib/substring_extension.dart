// ignore_for_file: unnecessary_this

extension SubEx on String {
  String substringWithOverflow(int start, [int? end]) {
    if (end == null || end > this.length) {
      end = this.length;
    }
    if (start > end) return '';
    return this.substring(start, end);
  }
}
