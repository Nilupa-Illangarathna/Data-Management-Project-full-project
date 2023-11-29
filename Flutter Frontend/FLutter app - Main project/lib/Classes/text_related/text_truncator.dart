//text_truncator (hello worl...)
String limitTextWithEllipsis(String text, [int maxLength = 20]) =>
    text.length <= maxLength ? text : text.substring(0, maxLength) + '..';
