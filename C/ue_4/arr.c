#include <math.h>
#include <stdio.h>

double calcAverage(double a[], int size) {
  double ave = 0.0;
  for (int i = 0; i < size - 1; i++) {
    ave += a[i];
  }
  ave /= size;
  return ave;
}

double calcAverageSE(double a[], int size, int start, int end) {
  double ave = 0.0;
  for (int i = start - 1; i < end - 1; i++) {
    ave += a[i];
  }
  ave /= size;
  return ave;
}

void ausgabe(double a[], int size) {
  for (int i = 0; i < size - 1; i++) {
    printf("%f \n", a[i]);
  }
}

double calcTempDiff(double arr1[], double arr2[], int index) {
  return fabs(arr1[index] - arr2[index]);
}

int main() {
  double arr1[] = {18.3, 17.2, 11.9, 5.5,  3.9,  1.5, 6.6,
                   7.5,  10.0, 14.9, 16.8, 18.9, 20.0};
  double arr2[] = {15.3, 11.0, 5.1,  2.8,  2.0,  1.4, 6.1,
                   10.5, 12.7, 18.5, 18.4, 18.1, 14.5};

  int size = sizeof(arr1) / sizeof(arr1[0]);
  // printf("size %d\n", size);

  double average = 0.0;
  double stdDev = 0.0;

  // avg
  average = calcAverage(arr1, size);
  printf("avg %0.2f\n", average);
  // end avg

  // std
  for (int i = 0; i < size - 1; i++) {
    stdDev += arr1[i] - average;
  }

  stdDev /= size;

  stdDev = sqrt(stdDev);
  printf("stdDev %0.2f\n", stdDev);
  // end std

  // ave seasons
  printf("fall 23 : %0.2f\n", calcAverageSE(arr1, size, 2, 4));
  printf("fall 24 : %0.2f\n", calcAverageSE(arr2, size, 2, 4));
  printf("fall 23/24 : %0.2f\n\n", (calcAverageSE(arr1, size, 2, 4)+calcAverageSE(arr2, size, 2, 4))/2);
  
  printf("winter 23/24  : %0.2f\n", calcAverageSE(arr1, size, 5, 7));
  printf("winter 24/25 : %0.2f\n", calcAverageSE(arr2, size, 5, 7));
  printf("winter 23/24 24/25 : %0.2f\n\n", (calcAverageSE(arr1, size, 5, 7)+calcAverageSE(arr2, size, 5, 7))/2);

  printf("spring 24 : %0.2f\n", calcAverageSE(arr1, size, 8, 10));
  printf("spring 25 : %0.2f\n", calcAverageSE(arr2, size, 8, 10));
  printf("spring 24 25 : %0.2f\n\n", (calcAverageSE(arr1, size, 8, 10)+calcAverageSE(arr2, size, 8, 10))/2);


  printf("summer 24 : %0.2f\n", calcAverageSE(arr1, size, 11, 12));
  printf("summer 25 : %0.2f\n", calcAverageSE(arr2, size, 11, 12));
  printf("summer 24 25 : %0.2f\n\n", (calcAverageSE(arr1, size, 11, 12) +calcAverageSE(arr2, size, 11, 12))/2);


  // Temperaturunterschiede pro Monat
  printf("\nTemperaturunterschiede zwischen 2024 und 2025:\n");
  const char* monate[] = {"Januar", "Februar", "März", "April", "Mai", "Juni", 
                         "Juli", "August", "September", "Oktober", "November", "Dezember"};
  
  for(int i = 0; i < size; i++) {
    printf("%s: %.2fC\n", monate[i], calcTempDiff(arr1, arr2, i));
  }

  // Größte Differenz finden ; nochmal überarbeiten tbh
  double maxDiff = 0.0;
  int maxDiffMonth = 0;
  
  for(int i = 0; i < size; i++) {
    double diff = calcTempDiff(arr1, arr2, i);
    if(diff > maxDiff) {
      maxDiff = diff;
      maxDiffMonth = i;
    }
  }
  
  printf("\nGrößte Temperaturdifferenz: %.2fC im %s\n", maxDiff, monate[maxDiffMonth]);

  return 0;
}
