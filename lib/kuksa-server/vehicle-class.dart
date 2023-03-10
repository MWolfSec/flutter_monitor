// SPDX-License-Identifier: Apache-2.0

class vehicle {
  late bool isAcActive;
  late bool isFrontDefrosterActive;
  late bool isRearDefrosterActive;
  late bool isAcDirectionUp;
  late bool isAcDirectionDown;
  late bool isAcDirectionMiddle;
  late bool isRecirculationActive;
  late bool isAutoActive;
  late bool isFreshAirCirculateActive;

  vehicle({
    required this.isAcActive,
    required this.isAcDirectionDown,
    required this.isAcDirectionMiddle,
    required this.isAcDirectionUp,
    required this.isFrontDefrosterActive,
    required this.isRearDefrosterActive,
    required this.isRecirculationActive,
    required this.isAutoActive,
    required this.isFreshAirCirculateActive,
  });

  vehicle copywith({
    bool? isAcActive,
    bool? isAcDirectionDown,
    bool? isAcDirectionMiddle,
    bool? isAcDirectionUp,
    bool? isFrontDefrosterActive,
    bool? isRearDefrosterActive,
    bool? isRecirculationActive,
    bool? isAutoActive,
    bool? isFreshAirCirculateActive,
  }) {
    return vehicle(
      isAcActive: isAcActive ?? this.isAcActive,
      isAcDirectionDown: isAcDirectionDown ?? this.isAcDirectionDown,
      isAcDirectionMiddle: isAcDirectionMiddle ?? this.isAcDirectionMiddle,
      isAcDirectionUp: isAcDirectionUp ?? this.isAcDirectionUp,
      isFrontDefrosterActive:
          isFrontDefrosterActive ?? this.isFrontDefrosterActive,
      isRearDefrosterActive:
          isRearDefrosterActive ?? this.isRearDefrosterActive,
      isRecirculationActive:
          isRecirculationActive ?? this.isRecirculationActive,
      isAutoActive: isAutoActive ?? this.isAutoActive,
      isFreshAirCirculateActive: isFreshAirCirculateActive ?? this.isFreshAirCirculateActive,

    );
  }
}
