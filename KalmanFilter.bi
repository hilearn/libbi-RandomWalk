model KalmanFilter {
  param q, r;
  noise eta;
  state x;
  obs y;

  sub parameter {
    q <- 0.001;
    r <- 0.001;
  }

  sub proposal_parameter {
    q ~ log_gaussian(q, 1);
    r ~ log_gaussian(r, 1);
  }

  sub initial {
    x ~ gaussian(0, 0.001);
  }

  sub transition {
    eta ~ gaussian();
    x <- x + q * eta;
  }

  sub observation {
    y ~ gaussian(x, r);
  }
}
