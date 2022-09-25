class NetworkException implements Exception {
  String msg;
  String userMsg;
  NetworkException({required this.msg, required this.userMsg});
  String toString() => 'Network Exception: $msg';
}

class WhiteListException extends NetworkException {
  WhiteListException()
      : super(
            msg: "Whitelist - user is not whitelisted",
            userMsg:
                "Please pay the registration fee for participating in the event");
}

class BadRequestException extends NetworkException {
  BadRequestException(String userMsg)
      : super(msg: "Bad Request : ${userMsg}", userMsg: userMsg);
}

class BadGatewayException extends NetworkException {
  BadGatewayException()
      : super(
            msg: "Bad Gateway",
            userMsg: "Maintenance is going on. Try after sometime.");
}

class TooManyRequestException extends NetworkException {
  TooManyRequestException()
      : super(
            msg: "429 : Too Many Request",
            userMsg: "Hang on there! Too many request");
}

class NoInternetException extends NetworkException {
  NoInternetException()
      : super(msg: "Socket Exception", userMsg: "Please Connect to Internet");
}

class DefaultException extends NetworkException {
  DefaultException()
      : super(msg: "Default Exception", userMsg: "An error occured");
}
