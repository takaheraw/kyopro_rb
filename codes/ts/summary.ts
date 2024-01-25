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
