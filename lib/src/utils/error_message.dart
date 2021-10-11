import 'package:flutter/material.dart';
import 'package:graphql/client.dart';
import 'package:jica/src/utils/debugBro.dart';

void displayErrors(BuildContext context, OperationException exception,
    {Function load}) {
  String error = parseOperationException(exception);
  ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(error)));
}

String parseOperationException(OperationException error) {
  if (error != null) {
    logger.e(error);
    if (error.linkException?.originalException != null) {
      logger.e(error.linkException?.originalException);
      return 'Failed to connect to internet.';
    } else if (error.graphqlErrors.isNotEmpty) {
      final errors = error.graphqlErrors;
      return errors.first.message;
    }
  }
  return 'Unknown error';
}
