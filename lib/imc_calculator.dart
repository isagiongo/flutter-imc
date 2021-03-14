class ImcCalculator {
  String calculate(String weight, String height) {
    double imc = double.parse(weight) /
        (double.parse(height) / 100 * double.parse(height) / 100);

    if (imc < 18.6) {
      return 'Your IMC is ' +
          imc.toStringAsPrecision(3) +
          ' and you are underweight.';
    }
    if (imc < 24.9) {
      return 'Your IMC is ' +
          imc.toStringAsPrecision(3) +
          ' and you are at your ideal weight.';
    }
    if (imc < 29.9) {
      return 'Your IMC is ' +
          imc.toStringAsPrecision(3) +
          ' and you are slightly overweight.';
    }
    if (imc < 34.9) {
      return 'Your IMC is ' +
          imc.toStringAsPrecision(3) +
          ' and you are obese level 1.';
    }
    if (imc < 39.9) {
      return 'Your IMC is ' +
          imc.toStringAsPrecision(3) +
          ' and you are obese level 2';
    }
    return 'Your IMC is ' +
        imc.toStringAsPrecision(3) +
        ' and you are obese level 3';
  }
}
