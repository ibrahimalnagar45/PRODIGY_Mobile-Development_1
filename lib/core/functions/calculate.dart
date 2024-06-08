import 'package:expressions/expressions.dart';

class CalculatorService {
  double calculateExpression(List<String> expressionList) {
    String expression = expressionList.join('');

    Expression exp = Expression.parse(expression);

    const evaluator = ExpressionEvaluator();
    var result = evaluator.eval(exp, {});

    return double.parse(result.toString());
  }
}
