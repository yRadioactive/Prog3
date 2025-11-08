#include <stdbool.h>
#include <stdio.h>

double bobsPlan(double etf[], double bit[], int len) {

  double bitcoin_shares = 100000 / bit[0];
  double etf_shares = 0.0;

  for (int i = 0; i < len - 1; i++) {
    if (bitcoin_shares * bit[i] > 100000) {
      etf_shares = (bitcoin_shares * bit[i]) / etf[i];
      printf("mehr als 100000\n");
      return etf_shares * etf[len - 1];

    }
    if (bitcoin_shares * bit[i] < 50000) {
      return bitcoin_shares * bit[i];
    }
  }
}

double AlicePlan(double etf[], double bit[], int len) {
  double etf_shares = 50000 / etf[0];
  double bitcoin_shares = 50000 / bit[0];
  return ((etf_shares * etf[len - 1]) + (bitcoin_shares * bit[len - 1]));
}

int main() {
  double prices1[] = {35.38, 37.06, 35.83, 36.11, 37.26, 35.33, 37.8,  40.2,
                      34.56, 40.26, 41.4,  42.81, 44.91, 35.19, 41.67, 43.2,
                      46.99, 51.16, 54.28, 54.62, 60.85, 58.91, 51.25, 51.81,
                      52.29, 54.92, 58.05, 57.59, 61.31, 67.99, 69.81, 71.24};

  double prices2[] = {
      913.5,   1007.0,  2142.9,  3659.0,  11994.5, 5615.0,  5457.7,  5687.0,
      3235.9,  3646.2,  9452.5,  7619.0,  6397.4,  5835.8,  8139.4,  9189.9,
      23647.2, 50016.3, 29580.7, 37862.1, 40650.2, 41095.8, 19038.6, 19816.9,
      15423.0, 26266.5, 27899.8, 25507.0, 38404.5, 66064.3, 58422.2, 56874.6};

  int prices_len = 32;

  double auszahlungBob = bobsPlan(prices1, prices2, prices_len);
  double auszahlungAlice = AlicePlan(prices1, prices2, prices_len);

  printf("Bob: %0.2f \nAlice: %0.2f", auszahlungBob, auszahlungAlice);

  return 0;
}
