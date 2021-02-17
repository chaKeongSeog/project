package study;

import java.util.Arrays;

public class selectionSort{

    public static void main(String []args){
       int[] arr = {1, 10, 5, 8, 7, 4};
      
       for(int i =0; i <arr.length;i++) {
    	   int min = arr[i];
    	   int idx = i;
    	   
    	   for(int j = i+1;j<arr.length;j++) {
    		   if(min > arr[j]) {
    			   min = arr[j];
    			   idx = j;
    		   }
    	   }
    	   int temp = arr[i];
    	   arr[i] = min;
    	   arr[idx] = temp;
    	   
       }
           
       System.out.println("result = "+Arrays.toString(arr));

    }
}
