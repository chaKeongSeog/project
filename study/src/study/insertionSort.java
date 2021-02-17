package study;

import java.util.Arrays;

public class insertionSort {
	public static void main(String[] args) {
		int[] arr = {1,10,5,8,7,4};
		for(int i = 0; i <arr.length-1;i++) {
			int j = i;
			while(j>= 0 && arr[j] > arr[j+1]) {
				int temp = arr[j];
				arr[j] = arr[j+1];
				arr[j+1] = temp;
				j--;
			}
		}
		System.out.println(Arrays.toString(arr));
	}
}
