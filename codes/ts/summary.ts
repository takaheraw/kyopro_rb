console.log('累積和');
const visitors: number[] = [62, 65, 41, 13, 20, 11, 18, 44, 53, 12, 18, 17, 14, 10, 39];
const accumulates: number[] = new Array(visitors.length + 1).fill(0);

for (let i = 1; i <= visitors.length; i++) {
  accumulates[i] = accumulates[i - 1] + visitors[i - 1];
}

const targets: [number, number][] = [[2, 4], [4, 13]];

targets.forEach(([l, r]) => {
  console.log(accumulates[r] - accumulates[l - 1]);
});


console.log('クイックソート');
function quicksort(arr: number[]): number[] {
  if (arr.length <= 1) {
    return arr;
  }

  const pivot: number = arr[Math.floor(Math.random() * arr.length)];
  const less: number[] = arr.filter(x => x < pivot);
  const equal: number[] = arr.filter(x => x === pivot);
  const greater: number[] = arr.filter(x => x > pivot);

  return [...quicksort(less), ...equal, ...quicksort(greater)];
}

const arrayToSort: number[] = [3, 1, 4, 1, 5, 9, 2, 6, 5, 3, 5];
const sortedArray: number[] = quicksort(arrayToSort);
console.log(sortedArray);


console.log('二分探索');
function binarySearch(arr: number[], target: number): number | undefined {
  let low = 0;
  let high = arr.length - 1;

  while (low <= high) {
    const mid = Math.floor((low + high) / 2);

    if (arr[mid] === target) {
      return mid;
    } else if (arr[mid] < target) {
      low = mid + 1;
    } else {
      high = mid - 1;
    }
  }

  return undefined;
}

const target = 5;
const index = binarySearch(sortedArray, target);
console.log(index);


console.log('動的計画法');
const roomCount: number = 5;
const pattern1: number[] = [2, 4, 1, 3];
const pattern2: number[] = [5, 3, 7];

const dp: number[] = new Array(roomCount + 1);
dp[1] = 0;
dp[2] = pattern1[0];


for (let i = 3; i <= roomCount; i++) {
  dp[i] = Math.min(dp[i - 1] + pattern1[i - 2], dp[i - 2] + pattern2[i - 3]);
}

console.log(dp[roomCount]);

console.log('素数');

function isPrime(n: number): boolean {
  const limit = Math.sqrt(n);
  for (let i = 2; i <= limit; i++) {
    if (n % i === 0) {
      return false;
    }
  }
  return true;
}

console.log(isPrime(17));
console.log(isPrime(35));

console.log('最大公約数');

function gcd(a: number, b: number): number {
  while (a >= 1 && b >= 1) {
    if (a >= b) {
      a = a % b;
    } else {
      b = b % a;
    }
  }

  return a >= 1 ? a : b;
}

console.log(gcd(900, 100));
console.log(gcd(117, 432));
