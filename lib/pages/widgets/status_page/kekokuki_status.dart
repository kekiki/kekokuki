class KekokukiStatus {
  final bool isLoading;
  final bool isError;
  final bool isSuccess;
  final bool isEmpty;
  final String? errorMessage;

  KekokukiStatus._({
    this.isEmpty = false,
    this.isLoading = false,
    this.isError = false,
    this.isSuccess = false,
    this.errorMessage,
  });

  factory KekokukiStatus.loading() {
    return KekokukiStatus._(isLoading: true);
  }

  factory KekokukiStatus.success() {
    return KekokukiStatus._(isSuccess: true);
  }

  factory KekokukiStatus.error([String? message]) {
    return KekokukiStatus._(isError: true, errorMessage: message);
  }

  factory KekokukiStatus.empty() {
    return KekokukiStatus._(isEmpty: true);
  }
}
