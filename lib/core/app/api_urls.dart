class ApiUrls{
  static String get baseUrl => 'https://ios.rp.devfactory.com';
  static String get rewardUrl => '$baseUrl/rewards';
  static String get transactionsUrl => '$rewardUrl/transactions';
  static String transactionDetailUrl(String txnId) => '$transactionsUrl/$txnId';
}
