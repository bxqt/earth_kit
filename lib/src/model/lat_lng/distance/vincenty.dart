part of 'distance.dart';

class Vincenty implements DistanceCalculator {
  const Vincenty();

  /// Calculates distance with Vincenty algorithm.
  ///
  /// Accuracy is about 0.5mm
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Vincenty%27s_formulae)
  @override
  double distance(final LatLng p1, final LatLng p2) {
    const double a = EQUATOR_RADIUS, b = POLAR_RADIUS, f = FLATTENING; // WGS-84 ellipsoid params

    final double l = p2.longitudeRad - p1.longitudeRad;
    final double u1 = math.atan((1 - f) * math.tan(p1.latitudeRad));
    final double u2 = math.atan((1 - f) * math.tan(p2.latitudeRad));
    final double sinU1 = math.sin(u1), cosU1 = math.cos(u1);
    final double sinU2 = math.sin(u2), cosU2 = math.cos(u2);

    double sinLambda, cosLambda, sinSigma, cosSigma, sigma, sinAlpha, cosSqAlpha, cos2SigmaM;
    double lambda = l, lambdaP;
    int maxIterations = 200;

    do {
      sinLambda = math.sin(lambda);
      cosLambda = math.cos(lambda);
      sinSigma = math.sqrt((cosU2 * sinLambda) * (cosU2 * sinLambda) +
          (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda) * (cosU1 * sinU2 - sinU1 * cosU2 * cosLambda));

      if (sinSigma == 0) {
        return 0.0; // co-incident points
      }

      cosSigma = sinU1 * sinU2 + cosU1 * cosU2 * cosLambda;
      sigma = math.atan2(sinSigma, cosSigma);
      sinAlpha = cosU1 * cosU2 * sinLambda / sinSigma;
      cosSqAlpha = 1 - sinAlpha * sinAlpha;
      cos2SigmaM = cosSigma - 2 * sinU1 * sinU2 / cosSqAlpha;

      if (cos2SigmaM.isNaN) {
        cos2SigmaM = 0.0; // equatorial line: cosSqAlpha=0 (§6)
      }

      final C = f / 16 * cosSqAlpha * (4 + f * (4 - 3 * cosSqAlpha));
      lambdaP = lambda;
      lambda = l +
          (1 - C) *
              f *
              sinAlpha *
              (sigma + C * sinSigma * (cos2SigmaM + C * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));
    } while ((lambda - lambdaP).abs() > 1e-12 && --maxIterations > 0);

    if (maxIterations == 0) {
      throw StateError('Distance calculation faild to converge!');
    }

    final double uSq = cosSqAlpha * (a * a - b * b) / (b * b);
    final double A = 1 + uSq / 16384 * (4096 + uSq * (-768 + uSq * (320 - 175 * uSq)));
    final double B = uSq / 1024 * (256 + uSq * (-128 + uSq * (74 - 47 * uSq)));
    final double deltaSigma = B *
        sinSigma *
        (cos2SigmaM +
            B /
                4 *
                (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                    B / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));

    final double dist = b * A * (sigma - deltaSigma);

    return dist;
  }

  /// Vincenty inverse calculation
  ///
  /// More on [Wikipedia](https://en.wikipedia.org/wiki/Vincenty%27s_formulae)
  @override
  LatLng offset(final LatLng from, final double distanceInMeter, final double bearing) {
    const double equatorialRadius = EQUATOR_RADIUS;
    const double polarRadius = POLAR_RADIUS;
    const double flattening = FLATTENING; // WGS-84 ellipsoid params

    final double latitude = from.latitudeRad;
    final double longitude = from.longitudeRad;

    final double alpha1 = bearing.radians;
    final double sinAlpha1 = math.sin(alpha1);
    final double cosAlpha1 = math.cos(alpha1);

    final double tanU1 = (1 - flattening) * math.tan(latitude);
    final double cosU1 = 1 / math.sqrt(1 + tanU1 * tanU1);
    final double sinU1 = tanU1 * cosU1;

    final double sigma1 = math.atan2(tanU1, cosAlpha1);
    final double sinAlpha = cosU1 * sinAlpha1;
    final double cosSqAlpha = 1 - sinAlpha * sinAlpha;
    final double dfUSq =
        cosSqAlpha * (equatorialRadius * equatorialRadius - polarRadius * polarRadius) / (polarRadius * polarRadius);
    final double a = 1 + dfUSq / 16384 * (4096 + dfUSq * (-768 + dfUSq * (320 - 175 * dfUSq)));
    final double b = dfUSq / 1024 * (256 + dfUSq * (-128 + dfUSq * (74 - 47 * dfUSq)));

    double sigma = distanceInMeter / (polarRadius * a);
    double sigmaP = 2 * math.pi;

    double sinSigma = 0.0;
    double cosSigma = 0.0;
    double cos2SigmaM = 0.0;
    double deltaSigma;
    int maxIterations = 200;

    do {
      cos2SigmaM = math.cos(2 * sigma1 + sigma);
      sinSigma = math.sin(sigma);
      cosSigma = math.cos(sigma);
      deltaSigma = b *
          sinSigma *
          (cos2SigmaM +
              b /
                  4 *
                  (cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM) -
                      b / 6 * cos2SigmaM * (-3 + 4 * sinSigma * sinSigma) * (-3 + 4 * cos2SigmaM * cos2SigmaM)));
      sigmaP = sigma;
      sigma = distanceInMeter / (polarRadius * a) + deltaSigma;
    } while ((sigma - sigmaP).abs() > 1e-12 && --maxIterations > 0);

    if (maxIterations == 0) {
      throw StateError("offset calculation faild to converge!");
    }

    final double tmp = sinU1 * sinSigma - cosU1 * cosSigma * cosAlpha1;
    final double lat2 = math.atan2(
        sinU1 * cosSigma + cosU1 * sinSigma * cosAlpha1, (1 - flattening) * math.sqrt(sinAlpha * sinAlpha + tmp * tmp));

    final double lambda = math.atan2(sinSigma * sinAlpha1, cosU1 * cosSigma - sinU1 * sinSigma * cosAlpha1);
    final double c = flattening / 16 * cosSqAlpha * (4 + flattening * (4 - 3 * cosSqAlpha));
    final double l = lambda -
        (1 - c) *
            flattening *
            sinAlpha *
            (sigma + c * sinSigma * (cos2SigmaM + c * cosSigma * (-1 + 2 * cos2SigmaM * cos2SigmaM)));

    double lon2 = longitude + l;

    if (lon2 > math.pi) {
      lon2 = lon2 - 2 * math.pi;
    }
    if (lon2 < -1 * math.pi) {
      lon2 = lon2 + 2 * math.pi;
    }

    return LatLng(lat2.radians, lon2.radians);
  }
}
