DROP TABLE BOOKMARK;

CREATE TABLE BOOKMARK (
    USERID VARCHAR2(50),
    CONTENTID VARCHAR2(10),
    CONTENTTYPEID VARCHAR2(5),
    TITLE VARCHAR2(200),
    ADDR VARCHAR2(200),
    IMG_SRC VARCHAR2(300),
    OVERVIEW LONG,
    MAPX VARCHAR2(20),
    MAPY VARCHAR2(20),
    PRIMARY KEY(USERID, CONTENTID),
    CONSTRAINT FK_USERID FOREIGN KEY(USERID)
    REFERENCES MEMBER(USERID) ON DELETE CASCADE
    );
    
    
select count(contentId)
from bookmark, member
where member.userid  = bookmark.userid and member.userid = 'jymaeng95' and contentId='1884191';

ALTER TABLE BOOKMARK DROP CONSTRAINT FK_USERID;

ALTER TABLE BOOKMARK ADD CONSTRAINT FK_USERID FOREIGN KEY(USERID)
REFERENCES MEMBER(USERID) ON DELETE CASCADE;

delete member
where userId='423412314';