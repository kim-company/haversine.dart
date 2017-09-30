// Copyright (c) 2017, yeradis. All rights reserved. Use of this source code
// is governed by a BSD-style license that can be found in the LICENSE file.

import 'package:haversine/haversine.dart';
import 'package:test/test.dart';

void main() {
    group('Simple Harvesine distance tests', () {
        Haversine harvesine;
        final lat1 = 41.139129;
        final lon1 = 1.402244;

        final lat2 = 41.139074;
        final lon2 = 1.402315;

        setUp(() {
            harvesine = new Haversine.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat2, longitude2: lon2);
        });

        test('Distance from location 1 to location 2 - Should return non zero', () {
            expect(harvesine.distance(), isNonZero);
        });

        test('Distance from location 1 to location 2 - Should return non negative', () {
            expect(harvesine.distance(), isNonNegative);
        });

        test('Distance from location1 to same location should be Zero', () {
            final harvesine = new Haversine.fromDegrees(
                latitude1: lat1, longitude1: lon1, latitude2: lat1, longitude2: lon1);
            expect(harvesine.distance(), isZero);
        });

        test('Distance having ceros values as coordinates should be Zero', () {
            final harvesine = new Haversine.fromDegrees(
                latitude1: 0.0, longitude1: 0.0, latitude2: 0.0, longitude2: 0.0);
            expect(harvesine.distance(), isZero);
        });

        test('Distance from location1 to location2 should be around 8.529573134008796', () {
            expect(harvesine.distance(), inInclusiveRange(8.52, 8.53));
        });

        test('Distance from location1 to location2 should greather than 8', () {
            expect(harvesine.distance(), greaterThan(8));
        });
    });
}
