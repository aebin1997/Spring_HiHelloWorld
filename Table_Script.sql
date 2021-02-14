------------------------------------------------------------------------------------------------------------------- 계정 생성
--CREATE USER coca IDENTIFIED BY coca;
--GRANT CONNECT, RESOURCE TO coca;

------------------------------------------------------------------------------------------------------------------- 날짜 및 시간 설정
--ALTER SESSION SET NLS_DATE_FORMAT = 'RR/MM/DD';
--ALTER SESSION SET NLS_TIMESTAMP_FORMAT = 'HH24:MI';

------------------------------------------------------------------------------------------------------------------- 모든 테이블 리셋

DROP TABLE MEMBER CASCADE CONSTRAINTS; 
DROP TABLE N_TYPE CASCADE CONSTRAINTS; 
DROP TABLE NOTICE CASCADE CONSTRAINTS; 
DROP TABLE B_TYPE CASCADE CONSTRAINTS; 
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE REPLY CASCADE CONSTRAINTS;
DROP TABLE BLAME CASCADE CONSTRAINTS;
DROP TABLE P_BOARD CASCADE CONSTRAINTS;
DROP TABLE P_REPLY CASCADE CONSTRAINTS;
DROP TABLE QA CASCADE CONSTRAINTS;
DROP TABLE QA_REPLY CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;

------------------------------------------------------------------------------------------------------------------- 모든 시퀀스 리셋
DROP SEQUENCE SEQ_NID;
DROP SEQUENCE SEQ_BID;
DROP SEQUENCE SEQ_RID;
DROP SEQUENCE SEQ_BLID;
DROP SEQUENCE SEQ_PID;
DROP SEQUENCE SEQ_PRID;
DROP SEQUENCE SEQ_QA;
DROP SEQUENCE SEQ_QARID;
DROP SEQUENCE SEQ_PAYID;
DROP SEQUENCE SEQ_POINTID;

------------------------------------------------------------------------------------------------------------------- MEMBER 생성
CREATE TABLE MEMBER (
  ID		 VARCHAR2(30) NOT NULL,
  PWD 		 VARCHAR2(100) NOT NULL,
  NAME		 VARCHAR2(15),
  NICKNAME 	 VARCHAR2(30) NOT NULL,
  EMAIL		 VARCHAR2(100),
  SEX	 VARCHAR2(1) DEFAULT 'n' CHECK (SEX IN('m', 'w', 'n')),
  PHONE 		 VARCHAR2(13),
  ADDRESS 	 VARCHAR2(100),
  ENROLLDATE 	 DATE DEFAULT SYSDATE,
  UPDATEDATE 	 DATE DEFAULT SYSDATE,
  MSTATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MSTATUS IN('Y', 'N')),
  CONSTRAINT PK_NICKNAME PRIMARY KEY(NICKNAME)
);
------------------------------------------------------------------------------------------게시판 작성자 이름으로? 닉네임으로?? <우선 닉네임으로 넣어둠>

------------------------------------------------------------------------------------------------------------------- MEMBER 컬러명 지정
COMMENT ON COLUMN MEMBER.ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.NICKNAME IS '회원닉네임';
COMMENT ON COLUMN MEMBER.EMAIL IS '회원이메일';
COMMENT ON COLUMN MEMBER.SEX IS '회원성별';
COMMENT ON COLUMN MEMBER.PHONE IS '회원전화번호';
COMMENT ON COLUMN MEMBER.ADDRESS IS '회원주소';
COMMENT ON COLUMN MEMBER.ENROLLDATE IS '회원가입날짜';
COMMENT ON COLUMN MEMBER.UPDATEDATE IS '회원수정날짜';
COMMENT ON COLUMN MEMBER.MSTATUS IS '회원상태값';

------------------------------------------------------------------------------------------------------------------- 샘플데이터(MEMBER)
INSERT INTO MEMBER VALUES ('admin', '1234', '관리자', '관리자', 'admin@ict.or.kr', 'n', '01011112222', '서울시 강남구', '21/01/24', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user01', 'pass01', '김우린', '일반회원1', 'user01@ict.or.kr', 'w', '01033334444', '경기도 일산', '21/01/24', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user02', 'pass02', '박예빈', '일반회원2',  'user02@ict.or.kr', 'w', '01055556666', '서울시 홍대', '21/01/24', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user03', 'pass04', '이강선', '일반회원3',  'user03@ict.or.kr', 'm', '01077778888', '인천 계양구', '21/01/24', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user05', 'pass05', '최은영', '일반회원4',  'user04@ict.or.kr', 'w', '01099996666', '경기도 부천', '21/01/24', DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user06', 'pass06', '황경필', '일반회원5',  'user05@ict.or.kr', 'm', '01011111234', '경기도 안산', '21/01/24', DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- N_TYPE 생성
CREATE TABLE N_TYPE(
TYPE_NO      CHAR(2),
TYPE_NAME  CHAR(50),
CONSTRAINT PK_TYPE_NO PRIMARY KEY(TYPE_NO)
);

------------------------------------------------------------------------------------------------------------------- N_TYPE 컬러명 지정
COMMENT ON COLUMN N_TYPE.TYPE_NO IS '구분번호';
COMMENT ON COLUMN N_TYPE.TYPE_NAME IS '구분명';

------------------------------------------------------------------------------------------------------------------- 샘플데이터(N_TYPE)
INSERT INTO N_TYPE VALUES('1', '공지사항');
INSERT INTO N_TYPE VALUES('2', '이벤트');
INSERT INTO N_TYPE VALUES('3', '긴급');
INSERT INTO N_TYPE VALUES('4', '필독');

------------------------------------------------------------------------------------------------------------------- NOTICE(공지사항) 생성
CREATE TABLE NOTICE(
NID                            NUMBER,
NTYPE                        CHAR(2) DEFAULT 1, 
NWRITER                     VARCHAR2(100) NOT NULL,
NTITLE                        VARCHAR2(500) NOT NULL,
NCONTENT                  VARCHAR2(4000),
N_FILE_NAME               VARCHAR2(50),
N_RFILE_NAME             VARCHAR2(50),
N_DATE                       DATE,
N_MODFIY_DATE           DATE,
NCOUNT                     NUMBER DEFAULT 0,
NSTATUS		              CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_NID PRIMARY KEY(NID),
CONSTRAINT FK_NTYPE FOREIGN KEY (NTYPE) REFERENCES N_TYPE(TYPE_NO) ON DELETE SET NULL,
CONSTRAINT FK_NWRITER FOREIGN KEY (NWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- NOTICE 컬러명 지정
COMMENT ON COLUMN NOTICE.NID IS '공지사항글 번호';
COMMENT ON COLUMN NOTICE.NTYPE IS '공지사항글 구분(1. 공지사항, 2. 이벤트, 3.긴급, 4. 필독)';
COMMENT ON COLUMN NOTICE.NWRITER IS '공지사항 작성자';
COMMENT ON COLUMN NOTICE.NTITLE IS '공지사항 제목';
COMMENT ON COLUMN NOTICE.NCONTENT IS '공지사항 내용';
COMMENT ON COLUMN NOTICE.N_FILE_NAME IS '공지사항 원래 첨부파일 명';
COMMENT ON COLUMN NOTICE.N_RFILE_NAME IS '공지사항 바뀐 첨부파일 명';
COMMENT ON COLUMN NOTICE.N_DATE IS '공지사항 날짜';
COMMENT ON COLUMN NOTICE.N_MODFIY_DATE IS '공지사항 수정날짜';
COMMENT ON COLUMN NOTICE.NCOUNT IS '공지사항 조회수';
COMMENT ON COLUMN NOTICE.NSTATUS IS '공지사항 상태';

------------------------------------------------------------------------------------------------------------------- NOTICE 시퀀스
CREATE SEQUENCE SEQ_NID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(NOTICE)
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, DEFAULT, '관리자', '공지사항 테스트', '공지사항 테스트', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, DEFAULT, '관리자', '사이트 이용방법 안내', '사이트 이용 방법은 About Us -> 사이트 이용방법을 확인해보세요', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO NOTICE VALUES(SEQ_NID.NEXTVAL, DEFAULT, '관리자', 'Hi Hello World 오픈!',  '앞으로 저희 Hi Hello World를 많이 이용해 주세요!!', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- B_TYPE 생성
CREATE TABLE B_TYPE(
BTYPE_NO      CHAR(2),
BTYPE_NAME  CHAR(50),
CONSTRAINT PK_BTYPE_NO PRIMARY KEY(BTYPE_NO)
);

------------------------------------------------------------------------------------------------------------------- B_TYPE 컬러명 지정
COMMENT ON COLUMN B_TYPE.BTYPE_NO IS '구분번호';
COMMENT ON COLUMN B_TYPE.BTYPE_NAME IS '구분명';

------------------------------------------------------------------------------------------------------------------- 샘플데이터(B_TYPE)
INSERT INTO B_TYPE VALUES('1', '질문이요');
INSERT INTO B_TYPE VALUES('2', '일상글이요');
INSERT INTO B_TYPE VALUES('3', '칭찬글이요');
INSERT INTO B_TYPE VALUES('4', '참고글이요');

------------------------------------------------------------------------------------------------------------------- BOARD(자유게시판) 생성
CREATE TABLE BOARD(
BID                            NUMBER,
BTYPE                        CHAR(2) DEFAULT 1, 
BWRITER                     VARCHAR2(100) NOT NULL,
BTITLE                        VARCHAR2(500) NOT NULL,
BCONTENT                  VARCHAR2(4000),
B_ORIGINAL_FILENAME    VARCHAR2(100),
B_RENAME_FILENAME     VARCHAR2(100),
B_CREATE_DATE            DATE,
B_MODFIY_DATE           DATE,
BCOUNT                     NUMBER DEFAULT 0,
BSTATUS		       CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_BID PRIMARY KEY(BID),
CONSTRAINT FK_BTYPE FOREIGN KEY (BTYPE) REFERENCES B_TYPE(BTYPE_NO) ON DELETE SET NULL,
CONSTRAINT FK_BWRITER FOREIGN KEY (BWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- BOARD 컬러명 지정
COMMENT ON COLUMN BOARD.BID IS '게시판 글 번호';
COMMENT ON COLUMN BOARD.BTYPE IS '게시판 글 구분(1. 질문이요, 2. 일상글이요, 3. 칭찬글이요, 4. 참고글이요)';
COMMENT ON COLUMN BOARD.BWRITER IS '게시판 작성자';
COMMENT ON COLUMN BOARD.BTITLE IS '게시판 제목';
COMMENT ON COLUMN BOARD.BCONTENT IS '게시판 내용';
COMMENT ON COLUMN BOARD.B_ORIGINAL_FILENAME IS '게시판 원래 첨부파일 명';
COMMENT ON COLUMN BOARD.B_RENAME_FILENAME IS '게시판 바뀐 첨부파일 명';
COMMENT ON COLUMN BOARD.B_CREATE_DATE IS '게시판 날짜';
COMMENT ON COLUMN BOARD.B_MODFIY_DATE IS '게시판 수정날짜';
COMMENT ON COLUMN BOARD.BCOUNT IS '게시판 조회수';
COMMENT ON COLUMN BOARD.BSTATUS IS '게시판 상태';

------------------------------------------------------------------------------------------------------------------- BOARD 시퀀스
CREATE SEQUENCE SEQ_BID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BOARD)
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, DEFAULT, '일반회원1', '게시판 테스트 입니다.', '게시판 테스트', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, 4, '일반회원2', 'SQL 에러 확인하는 방법!', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, 3, '일반회원3', '일반회원2 님을 칭찬합니다!!',  '좋은 정보글을 남겨주셔서 감다합니다!!', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- REPLY(리플 테이블) 생성
CREATE TABLE REPLY(
  RID                   NUMBER,
  RCONTENT          VARCHAR2(400),
  REF_BID		 NUMBER,
  RWRITER             VARCHAR2(100) NOT NULL,
  R_CREATE_DATE   DATE,
  R_MODIFY_DATE   DATE,
  R_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_RID PRIMARY KEY(RID),
  CONSTRAINT FK_RWRITER FOREIGN KEY (RWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- REPLY 컬러명 지정
COMMENT ON COLUMN REPLY.RID IS '공지사항 댓글 번호';
COMMENT ON COLUMN REPLY.RCONTENT IS '공지사항 댓글 내용';
COMMENT ON COLUMN REPLY.REF_BID IS '참조 게시글 번호';
COMMENT ON COLUMN REPLY.RWRITER IS '공지사항 댓글 작성자';
COMMENT ON COLUMN REPLY.R_CREATE_DATE IS '공지사항 댓글 작성 일자';
COMMENT ON COLUMN REPLY.R_MODIFY_DATE IS '공지사항 댓글 수정 일자';
COMMENT ON COLUMN REPLY.R_STATUS IS '공지사항 댓글 상태';

------------------------------------------------------------------------------------------------------------------- REPLY 시퀀스
CREATE SEQUENCE SEQ_RID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(REPLY)
INSERT INTO REPLY VALUES(SEQ_RID.NEXTVAL, '게시판 첫번째 댓글입니다.', '1', '일반회원1', '21/01/24', NULL, DEFAULT);
INSERT INTO REPLY VALUES(SEQ_RID.NEXTVAL, '게시판 두번째 댓글입니다.', '12',  '일반회원2', '21/01/24', NULL, DEFAULT);
INSERT INTO REPLY VALUES(SEQ_RID.NEXTVAL, '게시판 세번째 댓글입니다.', '12',  '일반회원3', '21/01/24', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- BLAME (자유게시판 신고한 내역 저장) 테이블 생성
CREATE TABLE BLAME(
BLAME_NO 		NUMBER,
TARGET_NO 		NUMBER,   
TARGET_TYPE 		NUMBER(1), 
MEMBER_NM	 	VARCHAR2(20),
TARGET_MEMBER_NM	VARCHAR2(20),
BLAME_DATETIME 		DATE,
BLAME_IP 		VARCHAR2(20),
CONSTRAINT PK_BLAME_NO PRIMARY KEY(BLAME_NO),
CONSTRAINT FK_MEMBER_NM FOREIGN KEY (MEMBER_NM) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_TARGET_MEMBER_NM FOREIGN KEY (TARGET_MEMBER_NM) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_TARGET_NO FOREIGN KEY (TARGET_NO) REFERENCES BOARD(BID) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- BLAME (신고한 내역이 저장) 컬럼명 생성
COMMENT ON COLUMN BLAME.BLAME_NO IS '신고번호';
COMMENT ON COLUMN BLAME.TARGET_NO IS '신고당한 게시물/댓글/쪽지 의 번호';
COMMENT ON COLUMN BLAME.TARGET_TYPE IS '1 이면 게시물, 2 이면 댓글, 3 이면 쪽지';
COMMENT ON COLUMN BLAME.MEMBER_NM IS '신고한 회원';
COMMENT ON COLUMN BLAME.TARGET_MEMBER_NM IS '신고당한 회원';
COMMENT ON COLUMN BLAME.BLAME_DATETIME IS '신고한 일시';
COMMENT ON COLUMN BLAME.BLAME_IP IS '신고한 IP';

------------------------------------------------------------------------------------------------------------------- BLAME 시퀀스
CREATE SEQUENCE SEQ_BLID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BLAME)
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '1', '1', '일반회원1', '일반회원4', '21/01/24', NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '2', '2', '일반회원2', '일반회원5', '21/01/24', NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '3', '3', '일반회원3', '일반회원1', '21/01/24', NULL);


------------------------------------------------------------------------------------------------------------------- P_BOARD(진행게시판) 생성
CREATE TABLE P_BOARD(
PID                            NUMBER,
PWRITER                     VARCHAR2(100) NOT NULL,
PTITLE                        VARCHAR2(500) NOT NULL,
PCONTENT                  VARCHAR2(4000),
P_FILE_NAME               VARCHAR2(50),
P_RFILE_NAME             VARCHAR2(50),
P_DATE                       DATE,
P_MODFIY_DATE           DATE,
PCOUNT                     NUMBER DEFAULT 0,
PSTATUS		       CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_PID PRIMARY KEY(PID),
CONSTRAINT FK_PWRITER FOREIGN KEY (PWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- P_BOARD 컬럼명 지정
COMMENT ON COLUMN P_BOARD.PID IS '진행게시판 글 번호';
COMMENT ON COLUMN P_BOARD.PWRITER IS '진행게시판 작성자';
COMMENT ON COLUMN P_BOARD.PTITLE IS '진행게시판 제목';
COMMENT ON COLUMN P_BOARD.PCONTENT IS '진행게시판 내용';
COMMENT ON COLUMN P_BOARD.P_FILE_NAME IS '진행게시판 원래 첨부파일 명';
COMMENT ON COLUMN P_BOARD.P_RFILE_NAME IS '진행게시판 바뀐 첨부파일 명';
COMMENT ON COLUMN P_BOARD.P_DATE IS '진행게시판 날짜';
COMMENT ON COLUMN P_BOARD.P_MODFIY_DATE IS '진행게시판 수정날짜';
COMMENT ON COLUMN P_BOARD.PCOUNT IS '진행게시판 조회수';
COMMENT ON COLUMN P_BOARD.PSTATUS IS '진행게시판 상태';


------------------------------------------------------------------------------------------------------------------- P_BOARD 시퀀스
CREATE SEQUENCE SEQ_PID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(P_BOARD)
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, '일반회원1', '게시판 테스트 입니다.', '게시판 테스트', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, '일반회원2', 'SQL 에러 확인하는 방법!', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, '일반회원3', '일반회원2 님을 칭찬합니다!!',  '좋은 정보글을 남겨주셔서 감다합니다!!', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT);


------------------------------------------------------------------------------------------------------------------- 게시판 리플 테이블 P_REPLY 생성
CREATE TABLE P_REPLY(
  PRID                  NUMBER,
  PRCONTENT          VARCHAR2(400),
  PRWRITER             VARCHAR2(100) NOT NULL,
  PR_DATE               DATE,
  PR_MODIFY_DATE   DATE,
  PR_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_PRID PRIMARY KEY(PRID),
  CONSTRAINT FK_PRWRITER FOREIGN KEY (PRWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- P_REPLY 컬러명 지정
COMMENT ON COLUMN P_REPLY.PRID IS '진행게시판 댓글 번호';
COMMENT ON COLUMN P_REPLY.PRCONTENT IS '진행게시판 댓글 내용';
COMMENT ON COLUMN P_REPLY.PRWRITER IS '진행게시판 댓글 작성자';
COMMENT ON COLUMN P_REPLY.PR_DATE IS '진행게시판 댓글 작성 일자';
COMMENT ON COLUMN P_REPLY.PR_MODIFY_DATE IS '진행게시판 댓글 수정 일자';
COMMENT ON COLUMN P_REPLY.PR_STATUS IS '진행게시판 댓글 상태';

------------------------------------------------------------------------------------------------------------------- P_REPLY 시퀀스
CREATE SEQUENCE SEQ_PRID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(P_REPLY)
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, '진행게시판 첫번째 댓글입니다.', '일반회원1', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, '진행게시판 두번째 댓글입니다.', '일반회원2', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, '진행게시판 세번째 댓글입니다.', '일반회원3', '21/01/24', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- QA 생성
CREATE TABLE QA(
    QA_ID                  NUMBER NOT NULL,
    QA_TITLE                VARCHAR2(200) NOT NULL,
    QA_WRITER            VARCHAR2(20) NOT NULL,
    QA_CONTENT        VARCHAR2(4000) NOT NULL,
    QA_ORIGIN_FILE_NAME     VARCHAR2(50)   NULL,
    QA_RENAME_FILE_NAME   VARCHAR2(50)   NULL,
    QA_READCOUNT    NUMBER DEFAULT 0,
    QA_CREATE_DATE      DATE DEFAULT SYSDATE,
    QA_MODIFY_DATE      DATE DEFAULT SYSDATE,
    QA_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (QA_STATUS IN('Y', 'N')),
    CONSTRAINT PK_QA_ID PRIMARY KEY (QA_ID),
    CONSTRAINT FK_QA_WRITER FOREIGN KEY (QA_WRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- QA 컬럼명 지정
COMMENT ON COLUMN QA.QA_ID  IS '문의사항 번호';
COMMENT ON COLUMN QA.QA_TITLE IS '게시글 제목';
COMMENT ON COLUMN QA.QA_WRITER IS '작성자 아이디';
COMMENT ON COLUMN QA.QA_CONTENT IS '게시글 내용';
COMMENT ON COLUMN QA.QA_ORIGIN_FILE_NAME IS '첨부파일 이름 변경전';
COMMENT ON COLUMN QA.QA_RENAME_FILE_NAME IS '첨부파일 이름 변경후';
COMMENT ON COLUMN QA.QA_READCOUNT IS '조회수';
COMMENT ON COLUMN QA.QA_CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN QA.QA_MODIFY_DATE IS '게시글수정한날짜';
COMMENT ON COLUMN QA.QA_STATUS IS '게시글상태값';

------------------------------------------------------------------------------------------------------------------- QA 시퀀스


CREATE SEQUENCE SEQ_QA
START WITH 1
INCREMENT BY 1
NOMAXVALUE
NOCYCLE
NOCACHE;

------------------------------------------------------------------------------------------------------------------- QA 샘플데이터
INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '일반회원1', 
       '저희 사이트를 이용해 주셔서 감사합니다.', NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '2222', '일반회원1', 
       '222.', NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '3333', '일반회원1', 
       '333333', NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '3333', '일반회원1', 
       '333333', NULL, NULL, 
       1, SYSDATE, SYSDATE, DEFAULT);
       
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '3333', '일반회원1', 
       '333333', NULL, NULL, 
       2, SYSDATE, SYSDATE, DEFAULT);
       
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '3333', '일반회원1', 
       '333333', NULL, NULL, 
       3, SYSDATE, SYSDATE, DEFAULT);
       
       
----------------------------------------------------
---------------     QA_REPLY 관련         -------------------   
----------------------------------------------------


CREATE TABLE QA_REPLY(
  QARID                  NUMBER,
  QARCONTENT          VARCHAR2(400),
  QAREF_BID                  NUMBER,
  QARWRITER             VARCHAR2(100) NOT NULL,
  QAR_DATE               DATE,
  QAR_MODIFY_DATE   DATE,
  QAR_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_QARID PRIMARY KEY(QARID),
  CONSTRAINT FK_QARWRITER FOREIGN KEY (QARWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);


COMMENT ON COLUMN QA_REPLY.QARID IS '댓글번호';
COMMENT ON COLUMN QA_REPLY.QARCONTENT IS '댓글내용';
COMMENT ON COLUMN QA_REPLY.QAREF_BID IS '참조게시글번호';
COMMENT ON COLUMN QA_REPLY.QARWRITER IS '댓글작성자아이디';
COMMENT ON COLUMN QA_REPLY.QAR_DATE IS '댓글작성날짜';
COMMENT ON COLUMN QA_REPLY.QAR_MODIFY_DATE IS '댓글수정날짜';
COMMENT ON COLUMN QA_REPLY.QAR_STATUS IS '댓글상태값';

CREATE SEQUENCE SEQ_QARID;

INSERT INTO QA_REPLY
VALUES(SEQ_QARID.NEXTVAL, '첫번째 댓글입니다.', 1, '일반회원1', SYSDATE, SYSDATE, DEFAULT);

INSERT INTO QA_REPLY
VALUES(SEQ_QARID.NEXTVAL, '첫번째 댓글입니다.', 13, '일반회원1', SYSDATE, SYSDATE, DEFAULT);

INSERT INTO QA_REPLY
VALUES(SEQ_QARID.NEXTVAL, '두번째 댓글입니다.', 13, '일반회원1', SYSDATE, SYSDATE, DEFAULT);

INSERT INTO QA_REPLY
VALUES(SEQ_QARID.NEXTVAL, '마지막 댓글입니다.', 13, '일반회원1', SYSDATE, SYSDATE, DEFAULT);


------------------------------------------------------------------------------------------------------------------- PAY 테이블 생성
CREATE TABLE PAY(
PAY_ID   		NUMBER,
MEMBER_ID	VARCHAR2(30),
PAY_KAKAO   	VARCHAR2(20),
PAY_DATA   	VARCHAR2(1000),
PAY_DATETIME 	DATE,
PAY_IP  		VARCHAR2(20),
 CONSTRAINT PK_PAY_ID PRIMARY KEY (PAY_ID),
 CONSTRAINT FK_MEMBER_ID FOREIGN KEY (MEMBER_ID) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL  ----------- 우선 유저 닉네임으로 했음
);

------------------------------------------------------------------------------------------------------------------- PAY 컬러명 지정
COMMENT ON COLUMN PAY.PAY_ID IS '결제 번호';
COMMENT ON COLUMN PAY.MEMBER_ID IS '결제 회원';
COMMENT ON COLUMN PAY.PAY_KAKAO IS '카카오페이';
COMMENT ON COLUMN PAY.PAY_DATA IS '결제 내용';
COMMENT ON COLUMN PAY.PAY_DATETIME IS '결제 일시';
COMMENT ON COLUMN PAY.PAY_IP IS '결제 IP';

------------------------------------------------------------------------------------------------------------------- PAY 시퀀스
CREATE SEQUENCE SEQ_PAYID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(PAY)
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '일반회원1', '10000', '10000', '21/01/24', NULL);
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '일반회원2', '50000', '50000', '21/01/24', NULL);
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '일반회원3', '100000',  '100000', '21/01/24', NULL);


------------------------------------------------------------------------------------------------------------------- POINT 테이블 생성
CREATE TABLE POINT (
POINT_ID   	NUMBER,
P_MEMBER_ID  	VARCHAR2(30),
POINT_DATETIME   DATE,
POINT_POINT   	NUMBER,   
POINT_TYPE   	VARCHAR2(30),
 CONSTRAINT PK_POINT_ID PRIMARY KEY (POINT_ID),
 CONSTRAINT FK_P_MEMBER_ID FOREIGN KEY (P_MEMBER_ID) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL  ----------- 우선 유저 닉네임으로 했음
);

------------------------------------------------------------------------------------------------------------------- POINT 컬럼명 지정
COMMENT ON COLUMN POINT.POINT_ID IS '포인트 번호';
COMMENT ON COLUMN POINT.P_MEMBER_ID IS '회원 아이디';
COMMENT ON COLUMN POINT.POINT_DATETIME IS '포인트 발행 일시';
COMMENT ON COLUMN POINT.POINT_POINT IS '포인트 점수';
COMMENT ON COLUMN POINT.POINT_TYPE IS '포인트 종류';

------------------------------------------------------------------------------------------------------------------- POINT 시퀀스
CREATE SEQUENCE SEQ_POINTID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(POINT)
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '일반회원1', '21/01/24', '100', '충전포인트');
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '일반회원2', '21/01/24', '500', '이벤트 포인트');
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '일반회원3', '21/01/24', '1000',  '00포인트');


------------------------------------------------------------------------------------------------------------------- MEMBER_AUTH_EMAIL 테이블 생성 예정
--CREATE TABLE MEMBER_AUTH_EMAIL (
--MAE_ID    		 INT   PK
--MEM_ID   		 INT   이메일 인증이 필요한 회원 PK
--MAE_KEY  		 VARCHAR   이메일 인증키
--MAE_TYPE  	 	TINYINT   인증종류 1: 회원가입, 2 : 이메일변경, 3 : 패스워드 분실
--MAE_GENERATE_DATETIME   DATE   인증키 생성 일자
--MAE_USE_DATETIME   	DATE   인증키 사용 일자
--MAE_EXPIRED   		TINYINT   인증키 파기 여부

COMMIT;
