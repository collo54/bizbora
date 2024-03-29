class API {
  static const String host = 'connect.squareupsandbox.com';


  Uri createCustomerPost() => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers',
      );

  Uri deleteCustomerDelete(int version, String customerId) => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers/$customerId',
        queryParameters: {'version': version},
      );

  Uri updateCustomerPut(String value, String customerId) => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers/$customerId',
      );

  Uri listCustomersGet() => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers',
      );

  Uri retrieveCustomerGet(String customerId) => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers/$customerId',
      );

  Uri searchCustomersPost() => Uri(
        scheme: 'https',
        host: host,
        path: 'v2/customers/search',
      );
}
