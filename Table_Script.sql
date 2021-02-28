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
DROP TABLE B_REPLY CASCADE CONSTRAINTS;
DROP TABLE BLAME CASCADE CONSTRAINTS;
DROP TABLE QA CASCADE CONSTRAINTS;
DROP TABLE QA_REPLY CASCADE CONSTRAINTS;
DROP TABLE PROGRESS CASCADE CONSTRAINTS;
DROP TABLE P_BOARD CASCADE CONSTRAINTS;
DROP TABLE P_REPLY CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;
DROP TABLE RE_BLAME CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE RE_TYPE CASCADE CONSTRAINTS;
DROP TABLE RE_REPLY CASCADE CONSTRAINTS;

------------------------------------------------------------------------------------------------------------------- 모든 시퀀스 리셋
DROP SEQUENCE SEQ_NID;
DROP SEQUENCE SEQ_BID;
DROP SEQUENCE SEQ_BRID;
DROP SEQUENCE SEQ_BLID;
DROP SEQUENCE SEQ_QA;
DROP SEQUENCE SEQ_QARID;
DROP SEQUENCE SEQ_PRO;
DROP SEQUENCE SEQ_PID;
DROP SEQUENCE SEQ_PRID;
DROP SEQUENCE SEQ_PAYID;
DROP SEQUENCE SEQ_POINTID;

------------------------------------------------------------------------------------------------------------------- MEMBER 생성

CREATE TABLE MEMBER (
  ID       			VARCHAR2(30) NOT NULL,
  PWD       		 VARCHAR2(100) NOT NULL,
  NAME       		VARCHAR2(15),
  NICKNAME 		    VARCHAR2(30) NOT NULL,
  EMAIL      		 VARCHAR2(100),
  SEX 			   VARCHAR2(1) DEFAULT 'n' CHECK (SEX IN('m', 'w', 'n')),
  PHONE    			    VARCHAR2(13),
  ADDRESS   			  VARCHAR2(100),
  ENROLLDATE   			  DATE DEFAULT SYSDATE,
  UPDATEDATE    			 DATE DEFAULT SYSDATE,
  MSTATUS VARCHAR2(1)			 DEFAULT 'Y' CHECK(MSTATUS IN('Y', 'N')),
  SELFINTRO_HEAD 			VARCHAR2(90) NULL, 
  SELFINTRO_CONTENT 			VARCHAR2(600) NULL,
  PROPIC 			VARCHAR2(60) NULL,
  USER_LV			 VARCHAR2(50) DEFAULT 'A' CHECK (user_lv IN('A', 'B')),
  GRADE			VARCHAR2(50) DEFAULT '1',
  CONSTRAINT PK_NICKNAME PRIMARY KEY(NICKNAME));

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
COMMENT ON COLUMN MEMBER.SELFINTRO_HEAD IS '한줄소개';
COMMENT ON COLUMN MEMBER.SELFINTRO_CONTENT IS '상세소개';
COMMENT ON COLUMN MEMBER.PROPIC IS '프로필사진';
COMMENT ON COLUMN MEMBER.USER_LV IS '회원레벨';
COMMENT ON COLUMN MEMBER.GRADE IS '회원등급';

INSERT INTO MEMBER VALUES ('admin', '1234', '관리자', '관리자', 'admin@ict.or.kr', 'n', '01011112222', '서울시 강남구', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user01', 'pass01', '김우린', '일반회원1', 'user01@ict.or.kr', 'w', '01033334444', '경기도 일산', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user02', 'pass02', '박예빈', '일반회원2',  'user02@ict.or.kr', 'w', '01055556666', '서울시 홍대', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user03', 'pass04', '이강선', '일반회원3',  'user03@ict.or.kr', 'm', '01077778888', '인천 계양구', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user05', 'pass05', '최은영', '일반회원4',  'user04@ict.or.kr', 'w', '01099996666', '경기도 부천', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user06', 'pass06', '황경필', '일반회원5',  'user05@ict.or.kr', 'm', '01011111234', '경기도 안산', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- N_TYPE 생성
CREATE TABLE N_TYPE(
TYPE_NO      CHAR(2),
TYPE_NAME  CHAR(50),
CONSTRAINT PK_TYPE_NAME PRIMARY KEY(TYPE_NAME)
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
NTYPE                        CHAR(50) DEFAULT '공지사항', 
NWRITER                     VARCHAR2(100) NOT NULL,
NTITLE                        VARCHAR2(500) NOT NULL,
NCONTENT                  VARCHAR2(4000),
N_FILE_NAME               VARCHAR2(50),
N_RFILE_NAME             VARCHAR2(50),
N_DATE                       DATE,
N_MODFIY_DATE           DATE,
NCOUNT                     NUMBER DEFAULT 0,
NSTATUS              CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_NID PRIMARY KEY(NID),
CONSTRAINT FK_NTYPE FOREIGN KEY (NTYPE) REFERENCES N_TYPE(TYPE_NAME) ON DELETE SET NULL,
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
CONSTRAINT PK_BTYPE_NAME PRIMARY KEY(BTYPE_NAME)
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
BTYPE                        CHAR(50) DEFAULT '질문이요', 
BWRITER                     VARCHAR2(100) NOT NULL,
BTITLE                        VARCHAR2(500) NOT NULL,
BCONTENT                  VARCHAR2(4000),
B_ORIGINAL_FILENAME    VARCHAR2(100),
B_RENAME_FILENAME     VARCHAR2(100),
B_CREATE_DATE            DATE,
B_MODFIY_DATE           DATE,
BCOUNT                     NUMBER DEFAULT 0,
B_RCOUNT                  NUMBER DEFAULT 0,
BSTATUS             CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_BID PRIMARY KEY(BID),
CONSTRAINT FK_BTYPE FOREIGN KEY (BTYPE) REFERENCES B_TYPE(BTYPE_NAME) ON DELETE SET NULL,
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
COMMENT ON COLUMN BOARD.B_RCOUNT IS '게시판 댓글 조회수';
COMMENT ON COLUMN BOARD.BSTATUS IS '게시판 상태';

------------------------------------------------------------------------------------------------------------------- BOARD 시퀀스
CREATE SEQUENCE SEQ_BID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BOARD)
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, DEFAULT, '일반회원1', '게시판 테스트 입니다.', '게시판 테스트', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '참고글이요', '일반회원2', 'SQL 에러 확인하는 방법!', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '칭찬글이요', '일반회원3', '일반회원2 님을 칭찬합니다!!',  '좋은 정보글을 남겨주셔서 감다합니다!!', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);

------------------------------------------------------------------------------------------------------------------- B_REPLY(리플 테이블) 생성
CREATE TABLE B_REPLY(
  B_RID                   NUMBER,
  B_RCONTENT          VARCHAR2(400),
  B_REF_BID       NUMBER,
  B_RWRITER             VARCHAR2(100) NOT NULL,
  B_CREATE_DATE     DATE,
  B_MODIFY_DATE     DATE,
  B_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_B_RID PRIMARY KEY(B_RID),
  CONSTRAINT FK_B_RWRITER FOREIGN KEY (B_RWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- B_REPLY 컬러명 지정
COMMENT ON COLUMN B_REPLY.B_RID IS '게시글 댓글 번호';
COMMENT ON COLUMN B_REPLY.B_RCONTENT IS '게시글 댓글 내용';
COMMENT ON COLUMN B_REPLY.B_REF_BID IS '참조 게시글 번호';
COMMENT ON COLUMN B_REPLY.B_RWRITER IS '게시글 댓글 작성자';
COMMENT ON COLUMN B_REPLY.B_CREATE_DATE IS '게시글 댓글 작성 일자';
COMMENT ON COLUMN B_REPLY.B_MODIFY_DATE IS '게시글 댓글 수정 일자';
COMMENT ON COLUMN B_REPLY.B_STATUS IS '게시글 댓글 상태';

------------------------------------------------------------------------------------------------------------------- B_REPLY 시퀀스
CREATE SEQUENCE SEQ_BRID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(B_REPLY)
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 첫번째 댓글입니다.', '1', '일반회원1', '21/01/24', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 두번째 댓글입니다.', '12',  '일반회원2', '21/01/24', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 세번째 댓글입니다.', '12',  '일반회원3', '21/01/24', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- BLAME (자유게시판 신고한 내역 저장) 테이블 생성
CREATE TABLE BLAME(
BLAME_NO       NUMBER,
BLAME_BID       NUMBER,   
BLAME_TYPE       CHAR(50) DEFAULT '부적절', 
MM_NICKNAME       VARCHAR2(20),
TARGET_NICKNAME   VARCHAR2(20),
BLAME_DATE       DATE,
BLAME_CONTENT       VARCHAR2(2000),
BLAME_IP       VARCHAR2(50),
CONSTRAINT PK_BLAME_NO PRIMARY KEY(BLAME_NO),
CONSTRAINT FK_MM_NICKNAME FOREIGN KEY (MM_NICKNAME) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_TARGET_NICKNAME FOREIGN KEY (TARGET_NICKNAME) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_BLAME_BID FOREIGN KEY (BLAME_BID) REFERENCES BOARD(BID) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- BLAME (신고한 내역이 저장) 컬럼명 생성
COMMENT ON COLUMN BLAME.BLAME_NO IS '신고번호';
COMMENT ON COLUMN BLAME.BLAME_BID IS '신고 게시물의 번호';
COMMENT ON COLUMN BLAME.BLAME_TYPE IS '신고 글 구분(1. 부적절, 2. 욕설, 3. 사기, 4. 음란물)';
COMMENT ON COLUMN BLAME.MM_NICKNAME IS '신고한 회원';
COMMENT ON COLUMN BLAME.TARGET_NICKNAME IS '신고당한 회원';
COMMENT ON COLUMN BLAME.BLAME_DATE IS '신고 일시';
COMMENT ON COLUMN BLAME.BLAME_CONTENT IS '신고 내용';
COMMENT ON COLUMN BLAME.BLAME_IP IS '신고자 IP';

------------------------------------------------------------------------------------------------------------------- BLAME 시퀀스
CREATE SEQUENCE SEQ_BLID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(BLAME)
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '1', '1', '일반회원1', '일반회원4', '21/01/24', '광고성 홍보글을 올리고 있어요', NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '2', '2', '일반회원2', '일반회원5', '21/01/24', '코딩 못 한다고 욕하네요;;',  NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '3', '3', '일반회원3', '일반회원1', '21/01/24', '의뢰내용 완료했는데 돈을 안주네요;;',  NULL);


------------------------------------------------------------------------------------------------------------------- QA 생성
CREATE TABLE QA(
    QA_ID          NUMBER PRIMARY KEY,
    QA_TITLE                VARCHAR2(200),
    QA_WRITER            VARCHAR2(20),
    QA_CONTENT        VARCHAR2(4000),
    QA_POINT            NUMBER DEFAULT 0,
    QA_ORIGIN_FILE_NAME     VARCHAR2(50)   NULL,
    QA_RENAME_FILE_NAME   VARCHAR2(50)   NULL,
    QA_READCOUNT    NUMBER DEFAULT 0,
    QA_CREATE_DATE      DATE DEFAULT SYSDATE,
    QA_MODIFY_DATE      DATE DEFAULT SYSDATE,
    QA_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (QA_STATUS IN('Y', 'N')),
    CONSTRAINT FK_QA_WRITER FOREIGN KEY (QA_WRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- QA 컬럼명 지정
COMMENT ON COLUMN QA.QA_ID  IS '문의사항 번호';
COMMENT ON COLUMN QA.QA_TITLE IS '문의사항 제목';
COMMENT ON COLUMN QA.QA_WRITER IS '작성자 아이디';
COMMENT ON COLUMN QA.QA_CONTENT IS '문의사항 내용';
COMMENT ON COLUMN QA.QA_POINT IS '문의사항 포인트';
COMMENT ON COLUMN QA.QA_ORIGIN_FILE_NAME IS '첨부파일 이름 변경전';
COMMENT ON COLUMN QA.QA_RENAME_FILE_NAME IS '첨부파일 이름 변경후';
COMMENT ON COLUMN QA.QA_READCOUNT IS '조회수';
COMMENT ON COLUMN QA.QA_CREATE_DATE IS '문의사항올린날짜';
COMMENT ON COLUMN QA.QA_MODIFY_DATE IS '문의사항수정한날짜';
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
VALUES(SEQ_QA.NEXTVAL, '자바스크립트 질문', '김우린',
       '클로저가 뭔가요?',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       INSERT INTO QA
VALUES(SEQ_QA.NEXTVAL, '관리자 게시글', '관리자',
       '저희 사이트를 이용해 주셔서 감사합니다.',100 , NULL, NULL, 
       DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
------------------------------------------------------------------------------------------------------------------- QA_REPLY 관련
 
CREATE TABLE QAR(
  QAR_ID NUMBER PRIMARY KEY,
  QAR_CONTENT VARCHAR2(4000),
  REF_QA_ID NUMBER,
  QAR_WRITER VARCHAR2(15),
  QAR_CREATE_DATE DATE,
  QAR_MODIFY_DATE DATE,
  QAR_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (QAR_STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_QA_ID) REFERENCES QA(qa_id) ON DELETE CASCADE, 
  FOREIGN KEY (QAR_WRITER) REFERENCES MEMBER(NICKNAME) ON DELETE CASCADE 
);


COMMENT ON COLUMN QAR.QAR_ID IS '댓글번호';
COMMENT ON COLUMN QAR.QAR_CONTENT IS '댓글내용';
COMMENT ON COLUMN QAR.REF_QA_ID IS '참조게시글번호';
COMMENT ON COLUMN QAR.QAR_WRITER IS '댓글작성자아이디';
COMMENT ON COLUMN QAR.QAR_CREATE_DATE IS '댓글작성날짜';
COMMENT ON COLUMN QAR.QAR_MODIFY_DATE IS '댓글수정날짜';
COMMENT ON COLUMN QAR.QAR_STATUS IS '댓글상태값';

CREATE SEQUENCE SEQ_QAR;

INSERT INTO QAR
VALUES(SEQ_QAR.NEXTVAL, SEQ_QAR.NEXTVAL,SEQ_QAR.NEXTVAL,
            '일반회원1', SYSDATE, SYSDATE, DEFAULT);
            

--------------------------------------------------------------------------------------------------------------------의뢰 테이블(PROGRESS)
CREATE TABLE PROGRESS(
PRO_ID                            NUMBER,
PRO_QID                      NUMBER,
PRO_WRITER                     VARCHAR2(100) NOT NULL,
PRO_ANSWERER                     VARCHAR2(100) NOT NULL,
PRO_DEADLINE                      DATE,
PRO_PAY                     NUMBER DEFAULT 0,
PRO_PROCESS                    NUMBER DEFAULT 0,
PRO_STATUS		       CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_PRO_ID PRIMARY KEY(PRO_ID),
CONSTRAINT FK_QID FOREIGN KEY (PRO_QID) REFERENCES QA(QA_ID) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- PROGRESS 코멘트

COMMENT ON COLUMN PROGRESS.PRO_ID IS '프로젝트 아이디';
COMMENT ON COLUMN PROGRESS.PRO_QID IS '진행의뢰 참조 의뢰글 번호';
COMMENT ON COLUMN PROGRESS.PRO_WRITER IS '질문자 닉네임';
COMMENT ON COLUMN PROGRESS.PRO_ANSWERER IS '답변자 닉네임';
COMMENT ON COLUMN PROGRESS.PRO_DEADLINE IS '프로젝트 마감기한';
COMMENT ON COLUMN PROGRESS.PRO_PAY IS '프로젝트 결제금액';
COMMENT ON COLUMN PROGRESS.PRO_PROCESS IS '프로젝트 진행도';
COMMENT ON COLUMN PROGRESS.PRO_STATUS IS '프로젝트 상태'; -------- 'W' 수락대기중, 'Y' 진행중, 'C' 채택완료됨, 'N' 만료됨, 'D' 거절됨, 'X' 미사용

------------------------------------------------------------------------------------------------------------------- PROGRESS 시퀀스
CREATE SEQUENCE SEQ_PRO 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(PROGRESS)
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 1,'김우린', '캣티천사', '21/03/05', default, default, default);
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 2, '안녕녀', '캣티천사', '21/03/05', default,default, default);
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 3, '안녕녀',  '캣티천사', '21/03/05', default, default, default);

------------------------------------------------------------------------------------------------------------------- 진행테이블()                                             
CREATE TABLE P_BOARD(
PID                            NUMBER,
P_PROID                    NUMBER,
PWRITER                     VARCHAR2(100) NOT NULL,
PTITLE                       VARCHAR2(1000) NOT NULL,
PCONTENT                  VARCHAR2(4000),
P_FILE_NAME               VARCHAR2(50),
P_RFILE_NAME             VARCHAR2(50),
P_DATE                       DATE,
P_MODFIY_DATE           DATE,
PCOUNT                  NUMBER DEFAULT 0,
PSTATUS		       CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_PID PRIMARY KEY(PID),
CONSTRAINT FK_P_PROID FOREIGN KEY (P_PROID) REFERENCES PROGRESS(PRO_ID) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- P_BOARD 컬럼명 지정
COMMENT ON COLUMN P_BOARD.PID IS '진행게시판 글 번호';
COMMENT ON COLUMN P_BOARD.P_PROID  IS '진행 프로젝트 참조 번호';
COMMENT ON COLUMN P_BOARD.PWRITER IS '진행게시판 작성자';
COMMENT ON COLUMN P_BOARD.PTITLE IS '진행게시판 글 제목';
COMMENT ON COLUMN P_BOARD.PCONTENT IS '진행게시판 내용';
COMMENT ON COLUMN P_BOARD.P_FILE_NAME IS '진행게시판 원래 첨부파일 명';
COMMENT ON COLUMN P_BOARD.P_RFILE_NAME IS '진행게시판 바뀐 첨부파일 명';
COMMENT ON COLUMN P_BOARD.P_DATE IS '진행게시판 작성 날짜';
COMMENT ON COLUMN P_BOARD.P_MODFIY_DATE IS '진행게시판 수정날짜';
COMMENT ON COLUMN P_BOARD.PCOUNT IS '진행게시글 조회수';
COMMENT ON COLUMN P_BOARD.PSTATUS IS '진행게시판 상태';
                                        
------------------------------------------------------------------------------------------------------------------- P_BOARD 시퀀스
CREATE SEQUENCE SEQ_PID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(P_BOARD)
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '김우린', '게시판 테스트 답변1', '게시판 테스트', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '캣티천사', '게시판 테스트 답변2', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '안녕녀', '게시판 테스트 질문1', '좋은 정보글을 남겨주셔서 감다합니다!!', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
------------------------------------------------------------------------------------------------------------------- 게시판 리플 테이블 P_REPLY 생성
CREATE TABLE P_REPLY(
  PRID                  NUMBER,
  REF_PID		 NUMBER,
  PRCONTENT          VARCHAR2(400),
  PRWRITER             VARCHAR2(100) NOT NULL,
  PR_DATE               DATE,
  PR_MODIFY_DATE   DATE,
  PR_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_PRID PRIMARY KEY(PRID),
  CONSTRAINT FK_PID FOREIGN KEY (REF_PID) REFERENCES P_BOARD(PID) ON DELETE SET NULL
);


------------------------------------------------------------------------------------------------------------------- P_REPLY 컬러명 지정
COMMENT ON COLUMN P_REPLY.PRID IS '진행게시판 댓글 번호';
COMMENT ON COLUMN P_REPLY.REF_PID IS '참조 진행게시글 번호';
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
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 1, '진행게시판 첫번째 댓글입니다.', '안녕녀', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 1, '진행게시판 두번째 댓글입니다.', '캣티천사', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 2, '진행게시판 세번째 댓글입니다.', '안녕녀', '21/01/24', NULL, DEFAULT);
                                             
                                             
------------------------------------------------------------------------------------------------------------------- PAY 테이블 생성
CREATE TABLE PAY(
PAYID   		NUMBER,
MEMBERID	VARCHAR2(30),
PAYPG	VARCHAR2(20),
PAYINFO	VARCHAR2(1000),
PAYDATE 	DATE,
PAYIP  		VARCHAR2(20),
 CONSTRAINT PK_PAY_ID PRIMARY KEY (PAYID),
 CONSTRAINT FK_MEMBER_ID FOREIGN KEY (MEMBERID) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL  ----------- 우선 유저 닉네임으로 했음
);

------------------------------------------------------------------------------------------------------------------- PAY 컬러명 지정
COMMENT ON COLUMN PAY.PAYID IS '결제 번호';
COMMENT ON COLUMN PAY.MEMBERID IS '결제 회원';
COMMENT ON COLUMN PAY.PAYPG IS 'PG사';
COMMENT ON COLUMN PAY.PAYINFO IS '결제 내용';
COMMENT ON COLUMN PAY.PAYDATE IS '결제 일시';
COMMENT ON COLUMN PAY.PAYIP IS '결제 IP';

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

                                             
------------------------------------------------------------------------------------------------------------------- RE_TYPE 생성
CREATE TABLE RE_TYPE(
RE_TYPE_NO      CHAR(2),
RE_TYPE_NAME  CHAR(50),
CONSTRAINT PK_RE_TYPE_NAME PRIMARY KEY(RE_TYPE_NAME)
);

------------------------------------------------------------------------------------------------------------------- RE_TYPE 컬러명 지정
COMMENT ON COLUMN RE_TYPE.RE_TYPE_NO IS '별점';
COMMENT ON COLUMN RE_TYPE.RE_TYPE_NAME IS '별개수';

------------------------------------------------------------------------------------------------------------------- 샘플데이터(RE_TYPE)
INSERT INTO RE_TYPE VALUES('1', '★');
INSERT INTO RE_TYPE VALUES('2', '★★');
INSERT INTO RE_TYPE VALUES('3', '★★★');
INSERT INTO RE_TYPE VALUES('4', '★★★★');
INSERT INTO RE_TYPE VALUES('5', '★★★★★');

------------------------------------------------------------------------------------------------------------------- REVIEW(리뷰게시판) 생성
CREATE TABLE REVIEW(
REID                            NUMBER,
RETYPE                        CHAR(50) DEFAULT '★', 
REWRITER                     VARCHAR2(100) NOT NULL,
RERECOMMENDER            VARCHAR2(100) NOT NULL,
RETITLE                        VARCHAR2(500) NOT NULL,
RECONTENT                  VARCHAR2(4000),
RE_ORIGINAL_FILENAME    VARCHAR2(100),
RE_RENAME_FILENAME     VARCHAR2(100),
RE_CREATE_DATE            DATE,
RE_MODFIY_DATE           DATE,
RECOUNT                     NUMBER DEFAULT 0,
RE_RCOUNT                  NUMBER DEFAULT 0,
RESTATUS            CHAR(2) DEFAULT 'Y',
CONSTRAINT PK_REID PRIMARY KEY(REID),
CONSTRAINT FK_RETYPE FOREIGN KEY (RETYPE) REFERENCES RE_TYPE (RE_TYPE_NAME) ON DELETE SET NULL,
CONSTRAINT FK_REWRITER FOREIGN KEY (REWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_RERECOMMENDER FOREIGN KEY (RERECOMMENDER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- REVIEW컬러명 지정
COMMENT ON COLUMN REVIEW.REID IS '리뷰 글 번호';
COMMENT ON COLUMN REVIEW.RETYPE IS '리뷰 글 구분(1. ★, 2. ★★, 3. ★★★, 4. ★★★★, 5. ★★★★★)';
COMMENT ON COLUMN REVIEW.REWRITER IS '리뷰 작성자';
COMMENT ON COLUMN REVIEW.RERECOMMENDER IS '리뷰 추천자';
COMMENT ON COLUMN REVIEW.RETITLE IS '리뷰 제목';
COMMENT ON COLUMN REVIEW.RECONTENT IS '리뷰 내용';
COMMENT ON COLUMN REVIEW.RE_ORIGINAL_FILENAME IS '리뷰 원래 첨부파일 명';
COMMENT ON COLUMN REVIEW.RE_RENAME_FILENAME IS '리뷰 바뀐 첨부파일 명';
COMMENT ON COLUMN REVIEW.RE_CREATE_DATE IS '리뷰 날짜';
COMMENT ON COLUMN REVIEW.RE_MODFIY_DATE IS '리뷰 수정날짜';
COMMENT ON COLUMN REVIEW.RECOUNT IS '리뷰 조회수';
COMMENT ON COLUMN REVIEW.RE_RCOUNT IS '리뷰 댓글 조회수';
COMMENT ON COLUMN REVIEW.RESTATUS IS '리뷰 상태';

------------------------------------------------------------------------------------------------------------------- REVIEW시퀀스
CREATE SEQUENCE SEQ_REID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(REVIEW)
INSERT INTO REVIEW VALUES(SEQ_REID.NEXTVAL, DEFAULT, '일반회원1', '일반회원4','이분 불친절해요...', '기간도 조금 넘가가구 불친절 해요;;', NULL, NULL, '21/01/24', NULL, DEFAULT,DEFAULT, DEFAULT);
INSERT INTO REVIEW VALUES(SEQ_REID.NEXTVAL, '★★★★', '일반회원2', '일반회원3','일반회원3님 덕분에 프로젝트 완료했습니다~', '실력은 돈과 비례한다,,, 금액이 좀 부담되지만 프로젝트는 만족해서 별 4개 드립니다 ^^', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT,DEFAULT);
INSERT INTO REVIEW VALUES(SEQ_REID.NEXTVAL, '★★★★★', '일반회원4', '일반회원5','가성비, 실력 모두 갖추신분!! 괜히 베스트가 아님!!',  '무조건 이분한테 받으세요!! 예약 ㄱㄱ 최고임', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT,DEFAULT);


------------------------------------------------------------------------------------------------------------------- RE_REPLY(리뷰 게시판 리플 테이블) 생성
CREATE TABLE RE_REPLY(
  RE_REID                   NUMBER,
  RE_RCONTENT          VARCHAR2(400),
  RE_REF_REID       NUMBER,
  RE_REWRITER             VARCHAR2(100) NOT NULL,
  RE_CREATE_DATE   DATE,
  RE_MODIFY_DATE   DATE,
  RE_STATUS            CHAR(1) DEFAULT 'Y',
  CONSTRAINT PK_RE_REID PRIMARY KEY(RE_REID),
  CONSTRAINT FK_RE_REWRITER FOREIGN KEY (RE_REWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- RE_REPLY컬러명 지정
COMMENT ON COLUMN RE_REPLY.RE_REID IS '리뷰글 글 번호';
COMMENT ON COLUMN RE_REPLY.RE_RCONTENT IS '리뷰글  댓글 내용';
COMMENT ON COLUMN RE_REPLY.RE_REF_REID IS '참조 리뷰글  번호';
COMMENT ON COLUMN RE_REPLY.RE_REWRITER IS '리뷰글  댓글 작성자';
COMMENT ON COLUMN RE_REPLY.RE_CREATE_DATE IS '리뷰글  댓글 작성 일자';
COMMENT ON COLUMN RE_REPLY.RE_MODIFY_DATE IS '리뷰글  댓글 수정 일자';
COMMENT ON COLUMN RE_REPLY.RE_STATUS IS '리뷰글 댓글 상태';

------------------------------------------------------------------------------------------------------------------- RE_REPLY시퀀스
CREATE SEQUENCE SEQ_RREID 
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(RE_REPLY)
INSERT INTO RE_REPLY VALUES(SEQ_RREID.NEXTVAL, '리뷰글  첫번째 댓글입니다.', '1', '일반회원1', '21/01/24', NULL, DEFAULT);
INSERT INTO RE_REPLY VALUES(SEQ_RREID.NEXTVAL, '리뷰글  두번째 댓글입니다.', '12',  '일반회원2', '21/01/24', NULL, DEFAULT);
INSERT INTO RE_REPLY VALUES(SEQ_RREID.NEXTVAL, '리뷰글  세번째 댓글입니다.', '12',  '일반회원3', '21/01/24', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- RE_BLAME (리뷰게시판 신고한 내역 저장) 테이블 생성
CREATE TABLE RE_BLAME(
RE_BLAME_NO       NUMBER,
RE_BLAME_BID       NUMBER,   
RE_BLAME_TYPE       CHAR(50) DEFAULT '부적절', 
RE_MM_NICKNAME   VARCHAR2(20),
RE_TARGET_NICKNAME   VARCHAR2(20),
RE_BLAME_DATE       DATE,
RE_BLAME_CONTENT    VARCHAR2(2000),
RE_BLAME_IP       VARCHAR2(50),
CONSTRAINT PK_RE_BLAME_NO PRIMARY KEY(RE_BLAME_NO),
CONSTRAINT FK_RE_MM_NICKNAME FOREIGN KEY (RE_MM_NICKNAME) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_RE_TARGET_NICKNAME FOREIGN KEY (RE_TARGET_NICKNAME) REFERENCES MEMBER(NICKNAME) ON DELETE SET NULL,
CONSTRAINT FK_RE_BLAME_BID FOREIGN KEY (RE_BLAME_BID) REFERENCES BOARD(BID) ON DELETE SET NULL
);

------------------------------------------------------------------------------------------------------------------- RE_BLAME(신고한 내역이 저장) 컬럼명 생성
COMMENT ON COLUMN RE_BLAME.RE_BLAME_NO IS '신고번호';
COMMENT ON COLUMN RE_BLAME.RE_BLAME_BID IS '신고 게시물의 번호';
COMMENT ON COLUMN RE_BLAME.RE_BLAME_TYPE IS '신고 글 구분(1. 부적절, 2. 욕설, 3. 사기, 4. 음란물)';
COMMENT ON COLUMN RE_BLAME.RE_MM_NICKNAME IS '신고한 회원';
COMMENT ON COLUMN RE_BLAME.RE_TARGET_NICKNAME IS '신고당한 회원';
COMMENT ON COLUMN RE_BLAME.RE_BLAME_DATE IS '신고 일시';
COMMENT ON COLUMN RE_BLAME.RE_BLAME_CONTENT IS '신고 내용';
COMMENT ON COLUMN RE_BLAME.RE_BLAME_IP IS '신고자 IP';

------------------------------------------------------------------------------------------------------------------- RE_BLAME시퀀스
CREATE SEQUENCE SEQ_REBLID
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(RE_BLAME)
INSERT INTO RE_BLAME VALUES(SEQ_REBLID.NEXTVAL, '1', '1', '일반회원1', '일반회원4', '21/01/24', '광고성 홍보글을 올리고 있어요', NULL);
INSERT INTO RE_BLAME VALUES(SEQ_REBLID.NEXTVAL, '2', '2', '일반회원2', '일반회원5', '21/01/24', '코딩 못 한다고 욕하네요;;',  NULL);
INSERT INTO RE_BLAME VALUES(SEQ_REBLID.NEXTVAL, '3', '3', '일반회원3', '일반회원1', '21/01/24', '의뢰내용 완료했는데 돈을 안주네요;;',  NULL);

                                             
                                             
                                             

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
