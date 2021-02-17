package study;



import java.util.ArrayList;
import java.util.List;
import java.util.Scanner;

public class BaskinRobbins31 {
	public static void main(String[] args) {
		System.out.println("베스킨 라빈 31 게임");
		int index = 0;
		List<Integer> arr = new ArrayList<Integer>();
		String[] arr2 = {"□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□","□"};
		
		while(true) {
			index++;
			if(index % 2 != 0) {
				System.out.println("당신 차례입니다");
				Scanner sc = new Scanner(System.in);
				System.out.println("1.1자리  2.2자리  3.3자리 4.끝내기");
				int number = sc.nextInt();
				if(number == 1) {
					arr.add(arr.size()+1);
				}else if(number == 2) {
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
				}else if(number == 3) {
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
				}else if(number == 4) {
					System.out.println("게임을 종료합니다");
					break;
				}
				if(arr.size() >= 31) {
					System.out.println("당신의 패배 입니다");
					for(int i = 0; i <arr2.length;i++) {
						for(int j = 0; j <31;j++) {
							arr2[j] = "■";
						}
					}
						
					for(int i = 0;i<arr2.length;i++) {
						System.out.print(arr2[i]);
					}
					System.out.print("("+31+"/"+31+")");
					break;
				}
				System.out.println(arr.toString());
				
				for(int i = 0; i <arr2.length;i++) {
					for(int j = 0; j <arr.size();j++) {
						arr2[j] = "■";
					}
				}
					
				for(int i = 0;i<arr2.length;i++) {
					System.out.print(arr2[i]);
				}
				System.out.print("("+arr.size()+"/"+31+")");
				System.out.println();
				
				System.out.println("--------------------------------------------------------------------------------------------------------------");
				
			}else {
				System.out.println("컴퓨터 차례입니다");
				int number = (int)(Math.random() * 3)+1;
				if(number == 1) {
					arr.add(arr.size()+1);
				}else if(number == 2) {
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
				}else if(number == 3) {
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
					arr.add(arr.size()+1);
				}
				if(arr.size() >= 31) {
					System.out.println("컴퓨터의 패배 입니다");
					for(int i = 0; i <arr2.length;i++) {
						for(int j = 0; j <31;j++) {
							arr2[j] = "■";
						}
					}
						
					for(int i = 0;i<arr2.length;i++) {
						System.out.print(arr2[i]);
					}
					System.out.print("("+31+"/"+31+")");
					break;
				}
				System.out.println(arr.toString());
				for(int i = 0; i <arr2.length;i++) {
					for(int j = 0; j <arr.size();j++) {
						arr2[j] = "■";
					}
				}
				for(int i = 0;i<arr2.length;i++) {
					System.out.print(arr2[i]);
				}
				System.out.print("("+arr.size()+"/"+31+")");
				System.out.println();
				System.out.println("--------------------------------------------------------------------------------------------------------------");
			}
			
		}
		
	}
}
