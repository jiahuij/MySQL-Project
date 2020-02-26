create schema CHURCH_DB;
use CHURCH_DB;
create table CHURCH_ACTIVITY (
	Event_ID INT NOT NULL,
    Event_City VARCHAR(20),
	Event_Address VARCHAR(40),
	Event_Start_Time INT,
	Event_End_Time INT,
	Event_Host VARCHAR(20),
	Worship_Song_Name VARCHAR(45),
	Ministry_Title VARCHAR(45) NOT NULL,
    CONSTRAINT CA_PK PRIMARY KEY (Event_ID)) engine=InnoDB;
    
create table SERVICE_DETAIL (
	Service_Date INT NOT NULL,
    Speaker VARCHAR(20),
	Passage VARCHAR(45),
	Worship_Leader VARCHAR(20),
    CONSTRAINT SD_PK PRIMARY KEY (Service_Date)) engine=InnoDB;
    
create table GROUP_MEMBER (
	Group_Name VARCHAR(45) NOT NULL,
	Group_Member VARCHAR(45),
    CONSTRAINT GM_PK PRIMARY KEY (Group_Name)) engine=InnoDB;

create table SUNDAY_SERVICE (
	Event_ID INT NOT NULL,
	Service_Date INT,
	Member_ID INT,
	Event_Name VARCHAR(45),
    CONSTRAINT SS_PK PRIMARY KEY (Event_ID)) engine=InnoDB;  
    
create table OTHER_EVENT (
	Event_Name VARCHAR(45) NOT NULL,
	Event_ID INT NOT NULL,
	Group_Name VARCHAR(45),
	Member_ID INT,
    CONSTRAINT OE_PK PRIMARY KEY (Event_Name,Event_ID)) engine=InnoDB;  
    
create table CELL_GROUP (
	Event_ID INT NOT NULL,
	Group_Name VARCHAR(45),
	Event_Name VARCHAR(45),
    CONSTRAINT CG_PK PRIMARY KEY (Event_ID)) engine=InnoDB;   
    
create table WORSHIP_SONG (
	Worship_Song_Name VARCHAR(45) NOT NULL,
	Worship_Song_Lyrics VARCHAR(10000),
	Worship_Song_Arthor VARCHAR(45),
    CONSTRAINT WS_PK PRIMARY KEY (Worship_Song_Name)) engine=InnoDB;
    
create table MINISTRY_OPPORTUNITY (
	Ministry_Title VARCHAR(50) NOT NULL,
	Ministry_CiTy VARCHAR(45),
	Ministry_Address VARCHAR(45),
	Ministry_Hour VARCHAR(20),
	Ministry_Description VARCHAR(45),
    CONSTRAINT MO_PK PRIMARY KEY (Ministry_Title)) engine=InnoDB;
    
create table CHURCH_MEMBER (
	Member_ID INT NOT NULL,
	Member_Name VARCHAR(45),
	Join_Date INT,
	Worship_Song_Name VARCHAR(45),
    CONSTRAINT CM_OK PRIMARY KEY (Member_ID)) engine=InnoDB; 
    
create table MENTOR (
	Member_ID INT NOT NULL,
	Member_Name VARCHAR(45) NOT NULL,
	Mentor_ID INT NOT NULL,
	Group_Name VARCHAR(45),
	Ministry_Title VARCHAR(45),
    CONSTRAINT MR_PK PRIMARY KEY (Member_ID,Member_Name, Mentor_ID)) engine=InnoDB; 
    
create table MENTOREE (
	Member_ID INT NOT NULL,
	Member_Name VARCHAR(45) NOT NULL,
	Mentoree_ID VARCHAR(45) NOT NULL,
	Group_Name VARCHAR(45),
	Ministry_Title VARCHAR(45),
	Mentor_ID INT,
    CONSTRAINT ME_PK PRIMARY KEY (Member_ID,Member_Name,Mentoree_ID )) engine=InnoDB;     

ALTER TABLE CHURCH_ACTIVITY
	ADD CONSTRAINT FK_CA_WSN FOREIGN KEY (Worship_Song_Name) REFERENCES
		WORSHIP_SONG(Worship_Song_Name);
ALTER TABLE CHURCH_ACTIVITY
    ADD CONSTRAINT FK_CA_MT FOREIGN KEY (Ministry_Title) REFERENCES
		MINISTRY_OPPORTUNITY(Ministry_Title);

ALTER TABLE SUNDAY_SERVICE
	ADD CONSTRAINT FK_SS_SD FOREIGN KEY (Service_Date) REFERENCES
		SERVICE_DETAIL(Service_Date);
ALTER TABLE SUNDAY_SERVICE
    ADD CONSTRAINT FK_SS_CM FOREIGN KEY (Member_ID) REFERENCES
		CHURCH_MEMBER(Member_ID);
ALTER TABLE SUNDAY_SERVICE
    ADD CONSTRAINT FK_SS_OE FOREIGN KEY (Event_Name) REFERENCES
		OTHER_EVENT(Event_Name);        


ALTER TABLE OTHER_EVENT
    ADD CONSTRAINT FK_OE_GM FOREIGN KEY (Group_Name) REFERENCES
		GROUP_MEMBER(Group_Name);
ALTER TABLE OTHER_EVENT
    ADD CONSTRAINT FK_OE_CM FOREIGN KEY (Member_ID) REFERENCES
		CHURCH_MEMBER(Member_ID);   


ALTER TABLE CELL_GROUP
    ADD CONSTRAINT FK_CG_GM FOREIGN KEY (Group_Name) REFERENCES
		GROUP_MEMBER(Group_Name);
ALTER TABLE CELL_GROUP
    ADD CONSTRAINT FK_CG_OE FOREIGN KEY (Event_Name) REFERENCES
		OTHER_EVENT(Event_Name);  


ALTER TABLE CHURCH_MEMBER
    ADD CONSTRAINT FK_CM_WS FOREIGN KEY (Worship_Song_Name) REFERENCES
		WORSHIP_SONG(Worship_Song_Name);
     
     
ALTER TABLE MENTOR
    ADD CONSTRAINT FK_MR_GM FOREIGN KEY (Group_Name) REFERENCES
		GROUP_MEMBER(Group_Name);
ALTER TABLE MENTOR
    ADD CONSTRAINT FK_MR_MO FOREIGN KEY (Ministry_Title) REFERENCES
		MINISTRY_OPPORTUNITY(Ministry_Title);
        
        
 
ALTER TABLE MENTOREE
    ADD CONSTRAINT FK_ME_GM FOREIGN KEY (Group_Name) REFERENCES
		GROUP_MEMBER(Group_Name);
ALTER TABLE MENTOREE
    ADD CONSTRAINT FK_ME_MO FOREIGN KEY (Ministry_Title) REFERENCES
		MINISTRY_OPPORTUNITY(Ministry_Title);        
/* ALTER TABLE MENTOREE
    ADD CONSTRAINT FK_ME_MR FOREIGN KEY (Mentor_ID) REFERENCES
		MENTOR(Mentor_ID);           */    


/*drop table CHURCH_ACTIVITY;
drop table SERVICE_DETAIL;
drop table GROUP_MEMBER;
drop table SUNDAY_SERVICE;
drop table OTHER_EVENT;
drop table CELL_GROUP;
drop table WORSHIP_SONG;
drop table MINISTRY_OPPORTUNITY;
drop table CHURCH_MEMBER;
drop table MENTOR;
drop table MENTOREE;


/////////////////////////////////////////////////  DML  ///////////////////////////////////////////*/

INSERT INTO WORSHIP_SONG VALUES
("First Novel",
 "Noel, Noel
Noel, Noel
The First Noel, the Angels did say
Was to certain poor shepherds in fields as they lay
In fields where they lay keeping their sheep
On a cold winter's night that was so deep
Noel, Noel, Noel, Noel
Born is the King of Israel!
Noel, Noel
Noel, Noel
They looked up and saw a star
Shining in the East beyond them far
And to the earth it gave great light
And so it continued both day and night
Noel, Noel
Noel, Noel
Noel, Noel
Noel, Noel
Noel, Noel
Noel, Noel
Born is the King of Israel!
Noel, Noel, Noel, Noel
Born is the King of Israel!
Born is the King of Israel!
Noel, Noel
Noel, Noel",
"Garth Risk Hallberg");

INSERT INTO WORSHIP_SONG VALUES
("10,000 Reasons",
"Bless the Lord oh my soul
Oh my soul
Worship His Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
The sun comes up
It's a new day dawning
It's time to sing Your song again
Whatever may pass
And whatever lies before me
Let me be singing
When the evening comes
Bless the Lord oh my soul
Oh my soul
Worship His Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
You're rich in love
And You're slow to anger
Your name is great
And Your heart is kind
For all Your goodness
I will keep on singing
Ten thousand reasons
For my heart to find
Bless the Lord oh my soul
Oh my soul
Worship His Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
Bless You Lord
And on that day
When my strength is failing
The end draws near
And my time has come
Still my soul will
Sing Your praise unending
Ten thousand years
And then forevermore
Forevermore
Bless the Lord oh my soul
Oh my soul
Worship His Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
Bless the Lord oh my soul
Oh my soul
Worship His Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
Yes I'll worship Your Holy name
I'll worship Your Holy name
Sing like never before
Oh my soul
I'll worship Your Holy name
Jesus I will worship Your Holy name
Worship Your Holy name",
"Matt Redman");


INSERT INTO MINISTRY_OPPORTUNITY VALUES
	("Youth Group", "La Mirada", "13800 Biola Avenue", 2000, "Gathering of youths");
INSERT INTO MINISTRY_OPPORTUNITY VALUES
	("Choir", "La Mirada", "13800 Biola Avenue", 2100, "Singing Songs");
INSERT INTO MINISTRY_OPPORTUNITY VALUES
	("Gospel", "La Mirada", "13800 Biola Avenue", 0000, "Evanglization");
    
INSERT INTO CHURCH_ACTIVITY VALUES
	(0001, "La Mirada", "13800 Biola Avenue", 2000,2200, "Eric", "First Novel", "Youth Group");
INSERT INTO CHURCH_ACTIVITY VALUES
	(0002, "La Mirada", "13800 Biola Avenue", 1730,2030, "Susie Yang", "10,000 Reasons", "Choir");
INSERT INTO CHURCH_ACTIVITY VALUES
	(0003, "La Mirada", "13800 Biola Avenue", 1300,1500, "Connor Brock", NULL, "Gospel");
    
INSERT INTO SERVICE_DETAIL VALUES
	(0912, "Aaron","Psamls 16","Susie" );
INSERT INTO SERVICE_DETAIL VALUES
	(0919, "Thomas","Psamls 17","Aaron" );
INSERT INTO SERVICE_DETAIL VALUES
	(0926, "John","Psamls 18","Derek" );
    
INSERT INTO CHURCH_MEMBER VALUES
	(01, "Susie Yang",09051996,"First Novel" );
INSERT INTO CHURCH_MEMBER VALUES
	(02, "Connor Brock", 12081999,"10,000 Reasons" );
INSERT INTO CHURCH_MEMBER VALUES
	(03, "Derek Ton",10022000,"First Novel" );
INSERT INTO CHURCH_MEMBER VALUES
	(04, "Aaron Zhang", 12122005,"10,000 Reasons" );
    
INSERT INTO GROUP_MEMBER VALUES
	("NBT", "Susie Yang" );
INSERT INTO GROUP_MEMBER VALUES
	("TRU", "Derek Ton" );
    
INSERT INTO CELL_GROUP VALUES
	(0016, "NBT", NULL);
INSERT INTO CELL_GROUP VALUES
	(0017, "TRU", NULL);		

INSERT INTO OTHER_EVENT VALUES
	("Mission Announcement", 0009,"NBT",01 );
INSERT INTO OTHER_EVENT VALUES
	("Christmas Performance", 0010,"TRU",04 );
    
INSERT INTO SUNDAY_SERVICE VALUES
	(0015, 0912,01,"Mission Announcement" );
INSERT INTO SUNDAY_SERVICE VALUES
	(0016, 0919,02,"Christmas Performance" );
INSERT INTO SUNDAY_SERVICE VALUES
	(0017, 0926,03,"Mission Announcement" );
    
INSERT INTO MENTOR VALUES
	(01, "Susie Yang", "001", "NBT", "Youth Group");

INSERT INTO MENTOREE VALUES
	(02, "Connor Brock", "001", "NBT", "Youth Group", 001);

    
    
/*////////////////////////////////////////////////  Functional Test Cases  ///////////////////////////////////////////*/


SELECT * FROM CHURCH_ACTIVITY;

SELECT * FROM SUNDAY_SERVICE;

SELECT * FROM SERVICE_DETAIL;

SELECT * FROM CHURCH_MEMBER;

SELECT * FROM WORSHIP_SONG;

SELECT * FROM MINISTRY_OPPORTUNITY;

SELECT Mentor_ID FROM MENTOREE WHERE Group_Name = "NBT";

SELECT * FROM GROUP_MEMBER;















