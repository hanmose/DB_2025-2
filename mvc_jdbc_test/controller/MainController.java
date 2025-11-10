package mvc_jdbc_test.controller;

import jdbc_test.JDBCConnector;
import mvc_jdbc_test.entity.Customer;
import mvc_jdbc_test.view.InputCustomerInfoView;

import java.sql.*;
import java.util.Scanner;

public class MainController {

    public static void main(String[] args) {
        Connection con = JDBCConnector.getConnection();
        runMenu(con);
        try {
            if (con != null && !con.isClosed()) con.close();
        } catch (SQLException e) {
            System.out.println("연결 종료 중 오류 발생");
        }
    }

    private static void runMenu(Connection con) {
        Scanner sc = new Scanner(System.in);
        while (true) {
            System.out.println();
            System.out.println("===== 고객 관리 메뉴 =====");
            System.out.println("1. 고객 추가");
            System.out.println("2. 고객 수정");
            System.out.println("3. 고객 삭제");
            System.out.print("메뉴 선택: ");
            String sel = sc.nextLine().trim();

            if (sel.equals("1")) {
                inputCustomerAndInsert(con);
            } else if (sel.equals("2")) {
                updateCustomer(con);
            } else if (sel.equals("3")) {
                deleteCustomer(con);
            } else {
                System.out.println("잘못된 입력입니다.");
            }
        }
    }

    public static void inputCustomerAndInsert(Connection con) {
        InputCustomerInfoView inputView = new InputCustomerInfoView();
        Customer customer = inputView.inputCustomerInfo();
        String sql = "insert into 고객 values(?,?,?,?,?,?)";

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, customer.getCustomerid());
            pstmt.setString(2, customer.getCustomername());
            pstmt.setInt(3, customer.getAge());
            pstmt.setString(4, customer.getLevel());
            pstmt.setString(5, customer.getJob());
            pstmt.setInt(6, customer.getReward());

            int result = pstmt.executeUpdate();
            if (result == 1) {
                System.out.println("고객 정보가 추가되었습니다.");
            } else {
                System.out.println("고객 정보 추가에 실패했습니다.");
            }
        } catch (SQLException e) {
            System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
        }
    }

    public static void updateCustomer(Connection con) {
        Scanner sc = new Scanner(System.in);
        System.out.print("수정할 고객 아이디 입력: ");
        String targetId = sc.nextLine().trim();

        if (!existsCustomer(con, targetId)) {
            System.out.println("해당 아이디의 고객이 존재하지 않습니다.");
            return;
        }

        InputCustomerInfoView inputView = new InputCustomerInfoView();
        Customer newInfo = inputView.inputCustomerInfoWithoutId();

        String sql = "update 고객 set 고객이름=?, 나이=?, 등급=?, 직업=?, 적립금=? where 고객아이디=?";

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, newInfo.getCustomername());
            pstmt.setInt(2, newInfo.getAge());
            pstmt.setString(3, newInfo.getLevel());
            pstmt.setString(4, newInfo.getJob());
            pstmt.setInt(5, newInfo.getReward());
            pstmt.setString(6, targetId);

            int result = pstmt.executeUpdate();
            if (result == 1) {
                System.out.println("고객 정보가 수정되었습니다.");
            } else {
                System.out.println("고객 정보 수정에 실패했습니다.");
            }
        } catch (SQLException e) {
            System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
        }
    }

    public static void deleteCustomer(Connection con) {
        Scanner sc = new Scanner(System.in);
        System.out.print("삭제할 고객 아이디 입력: ");
        String targetId = sc.nextLine().trim();

        String sql = "delete from 고객 where 고객아이디 = ?";

        try (PreparedStatement pstmt = con.prepareStatement(sql)) {
            pstmt.setString(1, targetId);
            int result = pstmt.executeUpdate();

            if (result == 1) {
                System.out.println("고객 정보가 삭제되었습니다.");
            } else {
                System.out.println("해당 아이디의 고객이 없습니다.");
            }
        } catch (SQLException e) {
            System.out.println("데이터베이스 처리 중 오류가 발생했습니다.");
        }
    }

    private static boolean existsCustomer(Connection con, String id) {
        String sql = "select 1 from 고객 where 고객아이디 = ?";
        try (PreparedStatement ps = con.prepareStatement(sql)) {
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                return rs.next();
            }
        } catch (SQLException e) {
            return false;
        }
    }
}
