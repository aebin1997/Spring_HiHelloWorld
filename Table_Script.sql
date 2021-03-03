
DROP TABLE MEMBER CASCADE CONSTRAINTS; 
DROP TABLE N_TYPE CASCADE CONSTRAINTS; 
DROP TABLE NOTICE CASCADE CONSTRAINTS; 
DROP TABLE B_TYPE CASCADE CONSTRAINTS; 
DROP TABLE BOARD CASCADE CONSTRAINTS;
DROP TABLE B_REPLY CASCADE CONSTRAINTS;
DROP TABLE BLAME CASCADE CONSTRAINTS;
DROP TABLE QA CASCADE CONSTRAINTS;
DROP TABLE QAR CASCADE CONSTRAINTS;
DROP TABLE PROGRESS CASCADE CONSTRAINTS;
DROP TABLE P_BOARD CASCADE CONSTRAINTS;
DROP TABLE P_REPLY CASCADE CONSTRAINTS;
DROP TABLE PAY CASCADE CONSTRAINTS;
DROP TABLE POINT CASCADE CONSTRAINTS;
DROP TABLE REVIEW CASCADE CONSTRAINTS;
DROP TABLE RE_REPLY CASCADE CONSTRAINTS;

------------------------------------------------------------------------------------------------------------------- 모든 시퀀스 리셋
DROP SEQUENCE SEQ_NID;
DROP SEQUENCE SEQ_BID;
DROP SEQUENCE SEQ_BRID;
DROP SEQUENCE SEQ_BLID;
DROP SEQUENCE SEQ_QA;
DROP SEQUENCE SEQ_QAR;
DROP SEQUENCE SEQ_PRO;
DROP SEQUENCE SEQ_PID;
DROP SEQUENCE SEQ_PRID;
DROP SEQUENCE SEQ_PAYID;
DROP SEQUENCE SEQ_POINTID;
DROP SEQUENCE SEQ_REVIEW;
DROP SEQUENCE SEQ_RID;

------------------------------------------------------------------------------------------------------------------- MEMBER 생성

CREATE TABLE MEMBER (
  ID                VARCHAR2(30) NOT NULL,
  PWD              VARCHAR2(100) NOT NULL,
  NAME             VARCHAR2(15),
  NICKNAME           VARCHAR2(30) NOT NULL,
  EMAIL             VARCHAR2(100),
  SEX             VARCHAR2(1) DEFAULT 'n' CHECK (SEX IN('m', 'w', 'n')),
  PHONE                 VARCHAR2(13),
  ADDRESS              VARCHAR2(100),
  ENROLLDATE              DATE DEFAULT SYSDATE,
  UPDATEDATE              DATE DEFAULT SYSDATE,
  MSTATUS VARCHAR2(1)          DEFAULT 'Y' CHECK(MSTATUS IN('Y', 'N')),
  SELFINTRO_HEAD          VARCHAR2(90) NULL, 
  SELFINTRO_CONTENT          VARCHAR2(600) NULL,
  PROPIC          VARCHAR2(60) NULL,
  USER_LV          VARCHAR2(50) DEFAULT 'A' CHECK (user_lv IN('A', 'B')),
  GRADE         VARCHAR2(50) DEFAULT '1',
  CONSTRAINT PK_NICKNAME PRIMARY KEY(NICKNAME));

------------------------------------------------------------------------------------------------------------------- MEMBER 컬럼명 지정
                                     
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

------------------------------------------------------------------------------------------------------------------- MEMBER 데이터 
                                     
INSERT INTO MEMBER VALUES ('admin', '1234', '관리자', '관리자', 'admin@ict.or.kr', 'n', '01011112222', '서울시 강남구', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user01', 'pass01', '김우린', '김우린', 'user01@ict.or.kr', 'w', '01033334444', '경기도 일산', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user02', 'pass02', '박예빈', '박예빈',  'user02@ict.or.kr', 'w', '01055556666', '서울시 홍대', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user03', 'pass04', '이강선', '이강선',  'user03@ict.or.kr', 'm', '01077778888', '인천 계양구', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user05', 'pass05', '최은영', '최은영',  'user04@ict.or.kr', 'w', '01099996666', '경기도 부천', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);
INSERT INTO MEMBER VALUES ('user06', 'pass06', '황경필', '황경필',  'user05@ict.or.kr', 'm', '01011111234', '경기도 안산', '21/01/24', DEFAULT, DEFAULT, null, null, null, DEFAULT, DEFAULT);

-- 비밀번호 암호화 처리로 회원가입 새로 해야 로그인 가능하다
-- 관리자는 oracle에서 update member set user_lv = 'B', grade = 0 where id = '관리자아이디'; 로 유저레벨을 변경해준다.
                         
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
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, DEFAULT, '김우린', '게시판 테스트 입니다.', '게시판 테스트', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '참고글이요', '관리자', 'SQL 에러 확인하는 방법!', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);
INSERT INTO BOARD VALUES(SEQ_BID.NEXTVAL, '칭찬글이요', '황경필', '황경필 님을 칭찬합니다!!',  '좋은 정보글을 남겨주셔서 감사합니다!!', NULL, NULL, '21/01/24', NULL, DEFAULT, DEFAULT, DEFAULT);

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
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 첫번째 댓글입니다.', '1', '김우린', '21/01/24', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 두번째 댓글입니다.', '12',  '최은영', '21/01/24', NULL, DEFAULT);
INSERT INTO B_REPLY VALUES(SEQ_BRID.NEXTVAL, '게시판 세번째 댓글입니다.', '12',  '박예빈', '21/01/24', NULL, DEFAULT);


------------------------------------------------------------------------------------------------------------------- BLAME (자유게시판 신고한 내역 저장) 테이블 생성
CREATE TABLE BLAME(
BLAME_NO       NUMBER,
BLAME_BID       NUMBER,   
BLAME_TYPE       CHAR(50) DEFAULT '부적절', 
MM_NICKNAME       VARCHAR2(100),
TARGET_NICKNAME   VARCHAR2(100),
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
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '1', '부적절', '김우린', '박예빈', '21/01/24', '광고성 홍보글을 올리고 있어요', NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '2', '욕설', '이강선', '박예빈', '21/01/24', '코딩 못 한다고 욕하네요;;',  NULL);
INSERT INTO BLAME VALUES(SEQ_BLID.NEXTVAL, '2', '사기', '이강선', '박예빈', '21/01/24', '의뢰내용 완료했는데 돈을 안주네요;;',  NULL);

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
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, '자바스크립트 질문', '김우린','클로저가 뭔가요?',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, '자바 질문', '김우린','상속 설명해주실 분?.',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, '스프링 에러', '김우린','404에러가 뜹니다...',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT);
                                             
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, '자바스크립트 비동기 처리', '황경필','너무 어려워요',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT);  
                                             
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, 'ClassNotFound Error', '황경필','BoardController 120번째 줄에서 난 에러입니다.',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT); 
                                             
INSERT INTO QA VALUES(SEQ_QA.NEXTVAL, '500 에러', '황경필','500번 에러 어떻게 잡죠..?',100 , NULL, NULL, DEFAULT, SYSDATE, SYSDATE, DEFAULT);
       
------------------------------------------------------------------------------------------------------------------- QA_REPLY 관련
 
 CREATE TABLE QAR(
  QAR_ID NUMBER PRIMARY KEY,
  QAR_CONTENT VARCHAR2(4000) not null,
  REF_QA_ID NUMBER,
  QAR_WRITER VARCHAR2(15),
  QAR_CREATE_DATE DATE,
  QAR_MODIFY_DATE DATE,
  QAR_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (QAR_STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_QA_ID) REFERENCES QA(qa_id) ON DELETE CASCADE, 
  FOREIGN KEY (QAR_WRITER) REFERENCES MEMBER(NICKNAME) ON DELETE CASCADE 
);

------------------------------------------------------------------------------------------------------------------- QAR 컬럼명


COMMENT ON COLUMN QAR.QAR_ID IS '댓글번호';
COMMENT ON COLUMN QAR.QAR_CONTENT IS '댓글내용';
COMMENT ON COLUMN QAR.REF_QA_ID IS '참조게시글번호';
COMMENT ON COLUMN QAR.QAR_WRITER IS '댓글작성자아이디';
COMMENT ON COLUMN QAR.QAR_CREATE_DATE IS '댓글작성날짜';
COMMENT ON COLUMN QAR.QAR_MODIFY_DATE IS '댓글수정날짜';
COMMENT ON COLUMN QAR.QAR_STATUS IS '댓글상태값';

------------------------------------------------------------------------------------------------------------------- QAR 시퀀스 생성                                            
CREATE SEQUENCE SEQ_QAR;
                                            
------------------------------------------------------------------------------------------------------------------- QAR 데이터 삽입
                                            
INSERT INTO QAR
VALUES(SEQ_QAR.NEXTVAL, SEQ_QAR.NEXTVAL,SEQ_QAR.NEXTVAL,'이강선', SYSDATE, SYSDATE, DEFAULT);

--------------------------------------------------------------------------------------------------------------------의뢰 테이블(PROGRESS)
CREATE TABLE PROGRESS(
PRO_ID                            NUMBER,
PRO_QID                      NUMBER,
PRO_WRITER                     VARCHAR2(100) NOT NULL,
PRO_ANSWERER                     VARCHAR2(100) NOT NULL,
PRO_DEADLINE                      DATE,
PRO_PAY                     NUMBER DEFAULT 0,
PRO_PROCESS                    NUMBER DEFAULT 0,
PRO_STATUS             CHAR(2) DEFAULT 'Y',
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
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 1,'김우린', '황경필', '21/03/02', default, default, default);
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 2, '김우린', '이강선', '21/03/02', default,default, default);
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 3, '김우린',  '최은영', '21/03/02', default, default, default);
INSERT INTO PROGRESS VALUES(SEQ_PRO.NEXTVAL, 3, '황경필',  '김우린', '21/03/02', default, default, default);

------------------------------------------------------------------------------------------------------------------- 진행테이블(P_BOARD) 생성                                             
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
PSTATUS             CHAR(2) DEFAULT 'Y',
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
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '김우린', '자바 질문', '자꾸 NullPointException이 뜹니다.', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '황경필', '에러 해결하는 법은', '일단 구글에 검색해 보시고, SQL 구문의 오류를 찾아가보면 100% 오타있습니다.', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
INSERT INTO P_BOARD VALUES(SEQ_PID.NEXTVAL, 1, '김우린', '해결 되었습니다.', '좋은 정보글을 남겨주셔서 감다합니다!!', NULL, NULL, SYSDATE, NULL, DEFAULT, DEFAULT);
                                            
------------------------------------------------------------------------------------------------------------------- 게시판 리플 테이블 P_REPLY 생성
CREATE TABLE P_REPLY(
  PRID                  NUMBER,
  REF_PID       NUMBER,
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
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 1, '진행게시판 첫번째 댓글입니다.', '김우린', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 1, '진행게시판 두번째 댓글입니다.', '황경필', '21/01/24', NULL, DEFAULT);
INSERT INTO P_REPLY VALUES(SEQ_PRID.NEXTVAL, 2, '진행게시판 세번째 댓글입니다.', '박예빈', '21/01/24', NULL, DEFAULT);
                                             
                                             
------------------------------------------------------------------------------------------------------------------- PAY 테이블 생성
CREATE TABLE PAY(
PAYID         NUMBER,
MEMBERID   VARCHAR2(30),
PAYPG   VARCHAR2(20),
PAYINFO   VARCHAR2(1000),
PAYDATE    DATE,
PAYIP        VARCHAR2(20),
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
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '김우린', '10000', '10000', '21/01/24', NULL);
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '박예빈', '50000', '50000', '21/01/24', NULL);
INSERT INTO PAY VALUES(SEQ_PAYID.NEXTVAL, '이강선', '100000',  '100000', '21/01/24', NULL);


------------------------------------------------------------------------------------------------------------------- POINT 테이블 생성
CREATE TABLE POINT (
POINT_ID      NUMBER,
P_MEMBER_ID     VARCHAR2(30),
POINT_DATETIME   DATE,
POINT_POINT      NUMBER,   
POINT_TYPE      VARCHAR2(30),
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
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '박예빈', '21/01/24', '100', '충전포인트');
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '최은영', '21/01/24', '500', '이벤트 포인트');
INSERT INTO POINT VALUES(SEQ_POINTID.NEXTVAL, '이강선', '21/01/24', '1000',  '00포인트');

------------------------------------------------------------------------------------------------------------------- REVIEW(리뷰게시판) 생성
CREATE TABLE REVIEW(
  RID NUMBER PRIMARY KEY,
  REF_PROID NUMBER,
  REF_QID NUMBER,
  RTITLE VARCHAR2(100) NOT NULL,
  RWRITER VARCHAR2(15),
  RCONTENT VARCHAR2(4000),
  R_ORIGINAL_FILENAME VARCHAR2(100),
  R_RENAME_FILENAME VARCHAR2(100),
  RCOUNT NUMBER DEFAULT 0,
  R_CREATE_DATE DATE,
  R_MODIFY_DATE DATE,
  R_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (R_STATUS IN('Y', 'N')),
  FOREIGN KEY (REF_PROID) REFERENCES PROGRESS(PRO_ID) ON DELETE CASCADE,
  FOREIGN KEY (REF_QID) REFERENCES QA(QA_ID) ON DELETE CASCADE,
  FOREIGN KEY (RWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE CASCADE
);  

------------------------------------------------------------------------------------------------------------------- REVIEW 컬럼명 지정
COMMENT ON COLUMN REVIEW.RID IS '게시글번호';
COMMENT ON COLUMN REVIEW.REF_PROID IS '참조 진행번호';
COMMENT ON COLUMN REVIEW.REF_QID IS '참조 질문번호';
COMMENT ON COLUMN REVIEW.RTITLE IS '게시글제목';
COMMENT ON COLUMN REVIEW.RWRITER IS '게시글작성자 아이디';
COMMENT ON COLUMN REVIEW.RCONTENT IS '게시글내용';
COMMENT ON COLUMN REVIEW.R_ORIGINAL_FILENAME IS '첨부파일원래이름';
COMMENT ON COLUMN REVIEW.R_RENAME_FILENAME IS '첨부파일변경이름';
COMMENT ON COLUMN REVIEW.RCOUNT IS '게시글조회수';
COMMENT ON COLUMN REVIEW.R_CREATE_DATE IS '게시글올린날짜';
COMMENT ON COLUMN REVIEW.R_MODIFY_DATE IS '게시글수정한날짜';
COMMENT ON COLUMN REVIEW.R_STATUS IS '게시글상태값';

------------------------------------------------------------------------------------------------------------------- REVIEW 시퀀스
CREATE SEQUENCE SEQ_REVIEW
START WITH 1
INCREMENT BY 1;

------------------------------------------------------------------------------------------------------------------- 샘플데이터(REVIEW)
INSERT INTO REVIEW VALUES(SEQ_REVIEW.NEXTVAL, 1, 1, '첫번째 리뷰', '김우린', '친절하셨어요.', NULL, NULL, DEFAULT, '2020-03-02', '2020-03-02', DEFAULT);
INSERT INTO REVIEW VALUES(SEQ_REVIEW.NEXTVAL, 2, 2, '두번째 리뷰', '김우린', '답변이 빨라요.', NULL, NULL, DEFAULT, '2020-03-02', '2020-03-02', DEFAULT);
INSERT INTO REVIEW VALUES(SEQ_REVIEW.NEXTVAL, 3, 3, '세번째 리뷰', '김우린', '답변이 느려요', NULL, NULL, DEFAULT, '2020-03-02', '2020-03-02', DEFAULT);
                                          
------------------------------------------------------------------------------------------------------------------- RE_REPLY(리뷰게시판 댓글) 생성
CREATE TABLE RE_REPLY(
  RID NUMBER PRIMARY KEY,
  REF_RID NUMBER,
  RCONTENT VARCHAR2(400),
  RWRITER VARCHAR2(15),
  R_CREATE_DATE DATE,
  R_MODIFY_DATE DATE,
  R_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK (R_STATUS IN ('Y', 'N')),
  FOREIGN KEY (REF_RID) REFERENCES REVIEW(RID) ON DELETE CASCADE, 
  FOREIGN KEY (RWRITER) REFERENCES MEMBER(NICKNAME) ON DELETE CASCADE 
);                                          
                                          
------------------------------------------------------------------------------------------------------------------- RE_REPLY 컬럼명 지정
COMMENT ON COLUMN RE_REPLY.RID IS '댓글번호';
COMMENT ON COLUMN RE_REPLY.REF_RID IS '참조게시글번호';
COMMENT ON COLUMN RE_REPLY.RCONTENT IS '댓글내용';
COMMENT ON COLUMN RE_REPLY.RWRITER IS '댓글작성자아이디';
COMMENT ON COLUMN RE_REPLY.R_CREATE_DATE IS '댓글작성날짜';
COMMENT ON COLUMN RE_REPLY.R_MODIFY_DATE IS '댓글수정날짜';
COMMENT ON COLUMN RE_REPLY.R_STATUS IS '댓글상태값';                                 
                                          
------------------------------------------------------------------------------------------------------------------- RE_REPLY 시퀀스 
CREATE SEQUENCE SEQ_RID
START WITH 1
INCREMENT BY 1;;
                                          
------------------------------------------------------------------------------------------------------------------- 샘플데이터(RE_REPLY)

INSERT INTO RE_REPLY VALUES(SEQ_RID.NEXTVAL,  1, '첫번째 댓글입니다.', '김우린', '2020-03-02', '2020-03-02', DEFAULT);

INSERT INTO RE_REPLY VALUES(SEQ_RID.NEXTVAL, 1, '첫번째 댓글입니다.',  '김우린', '2020-03-02', '2020-03-02', DEFAULT);

INSERT INTO RE_REPLY VALUES(SEQ_RID.NEXTVAL, 2, '두번째 댓글입니다.',  '황경필', '2020-03-02', '2020-03-02', DEFAULT);

INSERT INTO RE_REPLY VALUES(SEQ_RID.NEXTVAL, 2, '마지막 댓글입니다.',  '최은영', '2020-03-02', '2020-03-02', DEFAULT);                              
                                             
------------------------------------------------------------------------------------------------------------------- MEMBER_AUTH_EMAIL 테이블 생성 예정
--CREATE TABLE MEMBER_AUTH_EMAIL (
--MAE_ID           INT   PK
--MEM_ID          INT   이메일 인증이 필요한 회원 PK
--MAE_KEY         VARCHAR   이메일 인증키
--MAE_TYPE         TINYINT   인증종류 1: 회원가입, 2 : 이메일변경, 3 : 패스워드 분실
--MAE_GENERATE_DATETIME   DATE   인증키 생성 일자
--MAE_USE_DATETIME      DATE   인증키 사용 일자
--MAE_EXPIRED         TINYINT   인증키 파기 여부

COMMIT;
