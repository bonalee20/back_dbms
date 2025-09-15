-- 1) 제목에 맥북을 포함하고 있는 게시글에 달린 댓글 조회
SELECT *
FROM TBL_REPLY
WHERE POST_ID = (
   SELECT ID
   FROM TBL_POST
   WHERE POST_TITLE LIKE '%맥북%'
);

-- 2) 내용에 컴퓨터를 포함하고 있는 글을 작성한 유저의 이메일

SELECT *
FROM TBL_USER
WHERE ID IN (
   SELECT ID
   FROM TBL_POST
   WHERE POST_CONTENT LIKE '%컴퓨터%'
);

-- 3) 내용에 고장을 포함하고 있는 글에 댓글을 작성한 유저 조회
SELECT *
FROM TBL_USER
WHERE ID IN (
   SELECT USER_ID
   FROM TBL_REPLY
   WHERE POST_ID IN (
      SELECT ID
      FROM TBL_POST
      WHERE POST_CONTENT LIKE '%고장%'
   )
);

-- 4) 경기도에 거주하면서 댓글을 단 사용자 조회
SELECT *
FROM TBL_REPLY
WHERE USER_ID = (
   SELECT ID
   FROM TBL_USER
   WHERE USER_ADDRESS LIKE '%경기도%'
);

-- 5) 가장 나이가 어린 사용자가 작성한 게시글들 조회, ROWNUM
SELECT * 
FROM TBL_POST
WHERE USER_ID IN (
   SELECT ID
   FROM (
      SELECT * 
      FROM TBL_USER
      ORDER BY USER_BIRTH DESC
   )
   WHERE ROWNUM <= 3
);

-- 6) 서울에 살고 있는 인원 수에 해당하는 번호에 게시글 조회
-- 7) 주소가 '구'로 끝나는 유저가 작성한 게시글에 달린 모든 댓글들 조회
-- 8) 댓글에 '한민'이가 포함된 게시글에 달린 모든 댓글 조회
-- 9) 평균 댓글 개수보다 작게 달린 게시글을 작성한 유저
-- 10) 가장 댓글을 적게 작성한 유저가 작성한 게시글