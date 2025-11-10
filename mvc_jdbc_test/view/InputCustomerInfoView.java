package mvc_jdbc_test.view;

import mvc_jdbc_test.entity.Customer;

import java.util.Scanner;

public class InputCustomerInfoView {

    private final Scanner sc = new Scanner(System.in);

    public Customer inputCustomerInfo() {
        Customer customer = new Customer();

        System.out.println("======== 고객 정보 입력 (INSERT) ========\n");
        System.out.print("고객아이디 입력: ");
        customer.setCustomerid(sc.nextLine().trim());

        System.out.print("고객이름 입력: ");
        customer.setCustomername(sc.nextLine().trim());

        System.out.print("고객나이 입력: ");
        customer.setAge(readIntLine());

        System.out.print("고객등급 입력: ");
        customer.setLevel(sc.nextLine().trim());

        System.out.print("고객직업 입력: ");
        customer.setJob(sc.nextLine().trim());

        System.out.print("고객적립금 입력: ");
        customer.setReward(readIntLine());

        return customer;
    }

    public Customer inputCustomerInfoWithoutId() {
        Customer customer = new Customer();

        System.out.println("======== 고객 정보 입력 (UPDATE: 아이디 제외) ========\n");

        System.out.print("새 고객이름 입력: ");
        customer.setCustomername(sc.nextLine().trim());

        System.out.print("새 고객나이 입력: ");
        customer.setAge(readIntLine());

        System.out.print("새 고객등급 입력: ");
        customer.setLevel(sc.nextLine().trim());

        System.out.print("새 고객직업 입력: ");
        customer.setJob(sc.nextLine().trim());

        System.out.print("새 고객적립금 입력: ");
        customer.setReward(readIntLine());

        return customer;
    }

    private int readIntLine() {
        while (true) {
            String s = sc.nextLine().trim();
            try {
                return Integer.parseInt(s);
            } catch (NumberFormatException e) {
                System.out.print("숫자를 입력하세요: ");
            }
        }
    }
}
