CREATE TABLE "회원" (
    "회원아이디" VARCHAR2(20) NOT NULL,
    "비밀번호"  VARCHAR2(20) NOT NULL,
    "이름"      VARCHAR2(10) NOT NULL,
    "나이"      NUMBER,
    "직업"      VARCHAR2(20),
    "등급"      VARCHAR2(10) DEFAULT 'silver' NOT NULL,
    "적립금"    NUMBER DEFAULT 0 NOT NULL,
    PRIMARY KEY ("회원아이디"),
    CHECK ("나이" >= 0),
    CHECK ("등급" IN ('silver', 'gold', 'vip'))
);

CREATE TABLE "상품" (
    "상품번호"   VARCHAR2(20) NOT NULL,
    "상품명"     VARCHAR2(50) NOT NULL,
    "재고량"     NUMBER DEFAULT 0 NOT NULL,
    "단가"       NUMBER DEFAULT 0 NOT NULL,
    "제조업체명" VARCHAR2(20) NOT NULL,
    "공급일자"   VARCHAR2(20) NOT NULL,
    "공급량"     NUMBER DEFAULT 0 NOT NULL,

    PRIMARY KEY ("상품번호"),
    FOREIGN KEY ("제조업체명") REFERENCES "제조업체"("제조업체명"),
    CHECK ("재고량" >= 0),
    CHECK ("단가" >= 0)
);

CREATE TABLE "제조업체" (
    "제조업체명" VARCHAR2(20) NOT NULL,
    "전화번호"   VARCHAR2(50) NOT NULL,
    "위치"       VARCHAR2(50) NOT NULL,
    "담당"       VARCHAR2(50) NOT NULL,

    PRIMARY KEY ("제조업체명")
);

CREATE TABLE "게시글" (
    "글번호"     VARCHAR2(50) NOT NULL,
    "글제목"     VARCHAR2(50) NOT NULL,
    "글내용"     VARCHAR2(50) NOT NULL,
    "작성일자"   DATE         NOT NULL,
    "회원아이디" VARCHAR2(20) NOT NULL,

    PRIMARY KEY ("글번호"),
    FOREIGN KEY ("회원아이디") REFERENCES "회원"("회원아이디")
);

CREATE TABLE "주문" (
    "주문번호"   VARCHAR2(20) NOT NULL,
    "글제목"     VARCHAR2(50) NOT NULL,
    "배송지"     VARCHAR2(50) NOT NULL,
    "주문일자"   DATE         NOT NULL,
    "회원아이디" VARCHAR2(20) NOT NULL,
    "상품번호"   VARCHAR2(20) NOT NULL,

    PRIMARY KEY ("주문번호"),
    FOREIGN KEY ("회원아이디") REFERENCES "회원"("회원아이디"),
    FOREIGN KEY ("상품번호") REFERENCES "상품"("상품번호")
);


