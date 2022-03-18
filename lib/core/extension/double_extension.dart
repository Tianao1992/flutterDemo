import 'package:favorcate/ui/shares/size_fit.dart';

extension DoubleFit on double {
  double get px {
    return HYSizeFit.setPx(this);
  }

  double get rpx {
    return HYSizeFit.setRpx(this);
  }
}
