--Creation of Database
USE master;
GO
CREATE DATABASE InequalityinEducation;

--Creation of Schema's
CREATE SCHEMA Education;


--Creation of Tables

--1. Child Identity: The table that shows the unique identity of the students and their individual characteristics;

SELECT 
UNIQUEID 'Student_Unique_ID',

SCHOOLID 'School_ID',

CLASSID 'Class_ID',

STUDENTID 'Student_ID',

case
when PROVINCE = 1 then replace(PROVINCE, 1, 'Ben Tre')
when PROVINCE = 2 then replace(PROVINCE, 2, 'Da Nang')
when PROVINCE = 3 then replace(PROVINCE, 3, 'Hung Yen')
when PROVINCE = 4 then replace(PROVINCE, 4, 'Lao Cai')
when PROVINCE = 5 then replace(PROVINCE, 5, 'Phu Yen')
else null
end as 'Province',

DISTRICTCODE 'District',

iif(LOCALITY =1,'Rural','Urban') as 'School_Location',

iif(GENDER = 1, 'Male','Female') 'Gender',

AGE 'Age',

iif(STDYLCHD=0,'No','Yes') 'Is_YL_Child?',

case
when ETHNICITY = 1 then replace (ETHNICITY, 1,'Kinh')
when ETHNICITY = 2 then replace (ETHNICITY, 2,'H’Mong')
when ETHNICITY = 3 then replace (ETHNICITY, 3,'Cham-HRoi')
when ETHNICITY = 4 then replace (ETHNICITY, 4,'Ede')
when ETHNICITY = 5 then replace (ETHNICITY, 5,'Ba Na')
when ETHNICITY = 6 then replace (ETHNICITY, 6,'Nung')
when ETHNICITY = 7 then replace (ETHNICITY, 7,'Tay')
when ETHNICITY = 8 then replace (ETHNICITY, 8,'Dao')
when ETHNICITY = 9 then replace (ETHNICITY, 9,'Giay')
when ETHNICITY = 10 then replace (ETHNICITY, 10,'Other')
else null
end as 'Ethnic_Group'

INTO Education.ChildIdentity
FROM [dbo].[Vietnam Wave1], [dbo].[Vietnam Wave1]


--2.Family Background: A table that shows the completed student questionnaire about the home background;

SELECT 
UNIQUEID 'Student_Unique_ID',

iif(MOM_READ=0,'No','Yes') 'Mom_Literate',

case
when MOM_EDUC = 0 then replace(MOM_EDUC,0,'Never been to school')
when MOM_EDUC = 1 then replace(MOM_EDUC,1,'Primary school (Grades 1-5)')
when MOM_EDUC = 2 then replace(MOM_EDUC,2,'Lower secondary school (Grades 6-9)')
when MOM_EDUC = 3 then replace(MOM_EDUC,3,'Intermediate vocational training')
when MOM_EDUC = 4 then replace(MOM_EDUC,4,'Upper secondary school (Grades 10)')
when MOM_EDUC = 5 then replace(MOM_EDUC,5,'Higher education (e.g. University/College)')
when MOM_EDUC = 6 then replace(MOM_EDUC,6,'Don’t know')
else null
end as 'Mom_Education_Level',

iif(DAD_READ =0,'No','Yes') 'Dad_Literate',

case
when DAD_EDUC = 0 then replace(DAD_EDUC,0,'Never been to school')
when DAD_EDUC = 1 then replace(DAD_EDUC,1,'Primary school (Grades 1-5)')
when DAD_EDUC = 2 then replace(DAD_EDUC,2,'Lower secondary school (Grades 6-9)')
when DAD_EDUC = 3 then replace(DAD_EDUC,3,'Intermediate vocational training')
when DAD_EDUC = 4 then replace(DAD_EDUC,4,'Upper secondary school (Grades 10)')
when DAD_EDUC = 5 then replace(DAD_EDUC,5,'Higher education (e.g. University/College)')
when DAD_EDUC = 6 then replace(DAD_EDUC,6,'Don’t know')
else null
end as 'Dad_Education_Level',

STPPLHM 'People_living_at_home?',

(STSIBOLD+STSIBYNG) 'Siblings',

STNMBOOK 'Books_at_Home(Not_Academic)',

iif(STPLSTDY =0,'No','Yes') 'Home_Study_Space',

iif(STHVMTEL =0,'No','Yes') 'Have_Mobile_Telephone?',

iif(STHVRADO =0,'No','Yes') 'Have_Radio?',

iif(STHVTELE =0,'No','Yes') 'Have_Television?',

iif(STHVBIKE =0,'No','Yes') 'Have_Bicycle?',

iif(STHVMTBK =0,'No','Yes') 'Have_Motorbike/Scooter?',

iif(STHVDESK =0,'No','Yes') 'Have_Study_Desk?',

iif(STHVCHR =0,'No','Yes') 'Have_Study_Chair?',

iif(STHVLAMP =0,'No','Yes') 'Have_Study_Lamp?',

iif(STHVEFAN =0,'No','Yes') 'Have_Electric_Fan?',

iif(STHVAIRC =0,'No','Yes') 'Have_Air_Conditioner?',

iif(STHVCAR =0,'No','Yes') 'Have_Car?',

iif(STHVCOMP =0,'No','Yes') 'Have_Computer?',

iif(STHVINTR =0,'No','Yes') 'Have_Internet?',

iif(STHVFRDG =0,'No','Yes') 'Have_Fridge?',

iif(STHVMCRO =0,'No','Yes') 'Have_Microwave?',

iif(STHVDVD =0,'No','Yes') 'Have_DVD_Player?',

iif(STHVCBLE =0,'No','Yes') 'Have_Cable_TV_Box?'

INTO Education.FamilyBackground

FROM [dbo].[Vietnam Wave1];


--3. Child Academic : A table that shows the completed student questionnaire about their individual academic overview and characteristices

SELECT
UNIQUEID 'Student_Unique_ID', 

ENG_RAWSCORE 'English Test Score',

MATH_RAWSCORE 'Maths Test Score',

STTMSCH 'Time_to_School(min)',

iif(STEATLNC =0,'No','Yes') 'Lunch_at_School',

case
when STPAYLNC =0 then replace(STPAYLNC ,0,'I do not eat lunch provided at school')
when STPAYLNC =1 then replace(STPAYLNC ,1,'Yes, school provides lunch and I pay for it')
when STPAYLNC =2 then replace(STPAYLNC ,2,'No, school provides lunch and I don’t pay for it')
else null
end as 'Pay_for_School_Lunch?',

case
when STRPTCL1 =0 then replace(STRPTCL1 ,0,'No, never')
when STRPTCL1 =1 then replace(STRPTCL1 ,1,'Yes, once')
when STRPTCL1 =2 then replace(STRPTCL1 ,2,'Yes, twice or more')
else null
end as 'Repeated_Grade?(1-5)',

case
when STRPTCL6 =0 then replace(STRPTCL6 ,0,'No, never')
when STRPTCL6 =1 then replace(STRPTCL6 ,1,'Yes, once')
when STRPTCL6 =2 then replace(STRPTCL6 ,2,'Yes, twice or more')
else null
end as 'Repeated_Grade?(6-9)',

case
when STRPTCL10 =0 then replace(STRPTCL10 ,0,'No, never')
when STRPTCL10 =1 then replace(STRPTCL10 ,1,'Yes, once')
when STRPTCL10 =2 then replace(STRPTCL10 ,2,'Yes, twice or more')
else null
end as 'Repeated_Grade?(10)',

case
when STTLTSCH =0 then replace(STTLTSCH ,0,'No')
when STTLTSCH =1 then replace(STTLTSCH ,1,'Yes')
when STTLTSCH =2 then replace(STTLTSCH ,2,'There are no toilets at my school')
else null
end as 'Use_School_Toilet?',

case
when STAGEENG =1 then replace(STAGEENG ,1,'Kindergarten')
when STAGEENG =2 then replace(STAGEENG ,2,'Grade 1 - 5')
when STAGEENG =3 then replace(STAGEENG ,3,'Grade 6 - 9')
when STAGEENG =4 then replace(STAGEENG ,4,'Grade 10') 
when STAGEENG =5 then replace(STAGEENG ,5,'I have never learned English in school') 
else null
end as 'Started_Learning_English',

iif(STITMOW1 =0,'No','Yes') 'Have_Grade10_Math_Textbooks(Compulsory)',

iif(STITMOW2 =0,'No','Yes') 'Have_Grade10_English_Textbooks(Compulsory)',

iif(STITMOW3 =0,'No','Yes') 'Have_Grade10 Math Textbooks(Non-Compulsory)',

iif(STITMOW4 =0,'No','Yes') 'Have_Grade10 English Textbooks(Non-Compulsory)',

iif(STITMOW5 =0,'No','Yes') 'Have_School_Bag',

iif(STITMOW6 =0,'No','Yes') 'Have_Ruler',

iif(STITMOW7 =0,'No','Yes') 'Have_Mobile_Phone',

iif(STITMOW8 =0,'No','Yes') 'Have_Pocket_Calculator',

case
when STBRWBK =0 then replace(STBRWBK ,0,'No, I do not borrow books, but there is a library or bookstore')
when STBRWBK =1 then replace(STBRWBK ,1,'Yes, I borrow books')
when STBRWBK =2 then replace(STBRWBK ,2,'There is no library or bookstore at school')
else null
end as 'Borrow_Books_from_BookStore/Library',

case
when STREADFN =1 then replace(STREADFN ,1,'Never or almost never')
when STREADFN =2 then replace(STREADFN ,2,'Once or twice a month')
when STREADFN =3 then replace(STREADFN ,3,'Once or twice a week')
when STREADFN =4 then replace(STREADFN ,4,'Every day or almost')
else null
end as 'Reading_for_Fun',

case
when STREADCH =1 then replace(STREADCH ,1,'Never or almost never')
when STREADCH =2 then replace(STREADCH ,2,'Once or twice a month')
when STREADCH =3 then replace(STREADCH ,3,'Once or twice a week')
when STREADCH =4 then replace(STREADCH ,4,'Every day or almost')
else null
end as 'Read_Things_You_Chose',

case
when STREADLR =1 then replace(STREADCH ,1,'Never or almost never')
when STREADLR =2 then replace(STREADCH ,2,'Once or twice a month')
when STREADLR =3 then replace(STREADCH ,3,'Once or twice a week')
when STREADLR =4 then replace(STREADCH ,4,'Every day or almost')
else null
end as 'Read_to_Learn',

case
when STPLHLRD =0 then replace(STPLHLRD ,0,'Never')
when STPLHLRD =1 then replace(STPLHLRD ,1,'Sometimes')
when STPLHLRD =2 then replace(STPLHLRD ,2,'Always')
else null
end as 'Relatives_Can_Help_with_School_Work?',

case
when STPLHL01 =1 then replace(STREADCH ,1,'Never or almost never')
when STPLHL01 =2 then replace(STREADCH ,2,'Once or twice a month')
when STPLHL01 =3 then replace(STREADCH ,3,'Once or twice a week')
when STPLHL01 =4 then replace(STREADCH ,4,'Every day or almost')
else null
end as 'Discuss_Your_Performance_at_School',

case
when STNONSCL =0 then replace(STNONSCL ,0,'None')
when STNONSCL =1 then replace(STNONSCL ,1,'Less than one hour')
when STNONSCL =2 then replace(STNONSCL ,2,'1 - 2 hours')
when STNONSCL =3 then replace(STNONSCL ,3,'2 - 3 hours')
when STNONSCL =4 then replace(STNONSCL ,4,'More than 4 hours')
else null
end as 'Hours_per_Day_Spent_on_Non-School_Work',

case
when STGR1001 =1 then replace(STGR1001 ,1,'Not important')
when STGR1001 =2 then replace(STGR1001 ,2,'Somewhat important')
when STGR1001 =3 then replace(STGR1001 ,3,'Important')
when STGR1001 =4 then replace(STGR1001 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Short_Travel_Distance)',

case
when STGR1002 =1 then replace(STGR1002 ,1,'Not important')
when STGR1002 =2 then replace(STGR1002 ,2,'Somewhat important')
when STGR1002 =3 then replace(STGR1002 ,3,'Important')
when STGR1002 =4 then replace(STGR1002 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Offers_Particular_Subjects)',

case
when STGR1003 =1 then replace(STGR1003 ,1,'Not important')
when STGR1003 =2 then replace(STGR1003 ,2,'Somewhat important')
when STGR1003 =3 then replace(STGR1003 ,3,'Important')
when STGR1003 =4 then replace(STGR1003 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Family_Members_Attended)',

case
when STGR1004 =1 then replace(STGR1004 ,1,'Not important')
when STGR1004 =2 then replace(STGR1004 ,2,'Somewhat important')
when STGR1004 =3 then replace(STGR1004 ,3,'Important')
when STGR1004 =4 then replace(STGR1004 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Low_Cost)',

case
when STGR1005 =1 then replace(STGR1005 ,1,'Not important')
when STGR1005 =2 then replace(STGR1005 ,2,'Somewhat important')
when STGR1005 =3 then replace(STGR1005 ,3,'Important')
when STGR1005 =4 then replace(STGR1005 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Has_Financial_Aid)',

case
when STGR1006 =1 then replace(STGR1006 ,1,'Not important')
when STGR1006 =2 then replace(STGR1006 ,2,'Somewhat important')
when STGR1006 =3 then replace(STGR1006 ,3,'Important')
when STGR1006 =4 then replace(STGR1006 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Teaching_Quality)',

case
when STGR1007 =1 then replace(STGR1007 ,1,'Not important')
when STGR1007 =2 then replace(STGR1007 ,2,'Somewhat important')
when STGR1007 =3 then replace(STGR1007 ,3,'Important')
when STGR1007 =4 then replace(STGR1007 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(High_Academic_Achievements)',

case
when STGR1008 =1 then replace(STGR1008 ,1,'Not important')
when STGR1008 =2 then replace(STGR1008 ,2,'Somewhat important')
when STGR1008 =3 then replace(STGR1008 ,3,'Important')
when STGR1008 =4 then replace(STGR1008 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Safe_Environment)',

case
when STGR1009 =1 then replace(STGR1009 ,1,'Not important')
when STGR1009 =2 then replace(STGR1009 ,2,'Somewhat important')
when STGR1009 =3 then replace(STGR1009 ,3,'Important')
when STGR1009 =4 then replace(STGR1009 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Grade10_Exam_Score)',

case
when STGR1011 =1 then replace(STGR1011 ,1,'Not important')
when STGR1011 =2 then replace(STGR1011 ,2,'Somewhat important')
when STGR1011 =3 then replace(STGR1011 ,3,'Important')
when STGR1004 =4 then replace(STGR1011 ,4,'Very important')
else null
end as 'Reason_for_Joining_School(Grade10_Exam_Not_Required)',

case
when STHGHGRD =1 then replace(STHGHGRD ,1,'Upper secondary (general)')
when STHGHGRD =2 then replace(STHGHGRD ,2,'Upper secondary (vocational)')
when STHGHGRD =3 then replace(STHGHGRD ,3,'Professional school')
when STHGHGRD =4 then replace(STHGHGRD ,4,'College (non - vocational)')
when STHGHGRD =5 then replace(STHGHGRD ,5,'College (vocational)')
when STHGHGRD =6 then replace(STHGHGRD ,6,'Bachelor’s degree')
when STHGHGRD =7 then replace(STHGHGRD ,7,'Master’s degree')
when STHGHGRD =8 then replace(STHGHGRD ,8,'Doctorate/PhD ')
when STHGHGRD =9 then replace(STHGHGRD ,9,'Don’t know')
else null
end as 'Highest_Education(Grade/Level)_Expected'

INTO Education.ChildAcademic
FROM [dbo].[Vietnam Wave1]

--4.Class Register: This table shows information on each school's session as well as resources for each class.

SELECT
UNIQUEID 'Student_Unique_ID',

GRLENRL 'Total_Girls_Enrolled',

BOYENRL 'Total_Boys_Enrolled',

TTLENRL 'Total_Students_Enrolled',

TGRLENRL 'Total_Girls_in_Attendance',

TBOYENRL 'Total_Boys_in_Attendance',

TTTLENRL 'Total_Students_in_Attendance',

case
when ATDTMSY =1 then replace( ATDTMSY ,1,'Normal')
when ATDTMSY =2 then replace( ATDTMSY ,2,'Higher than normal')
when ATDTMSY =3 then replace( ATDTMSY ,3,'Lower than normal')
else null
end as 'Student _Attendance_During_Survey',

case
when ATDDFSY =1 then replace( ATDDFSY ,1,'Patterns of farm work')
when ATDDFSY =2 then replace( ATDDFSY ,2,'Seasonal migration')
when ATDDFSY =3 then replace( ATDDFSY ,3,'Recent or forthcoming holiday or celebration')
when ATDDFSY =4 then replace( ATDDFSY ,4,'Other')
else null
end as 'Why_the_Student_Atttendance_Level',

iif(TGMTHENG =0,'No','Yes') 'Class_Taught_Together_for_Maths&English?',

case
when SCALLCT =0 then replace( SCALLCT ,0,'There is only one class in Grade 10')
when SCALLCT =1 then replace( SCALLCT ,1,'Randomly')
when SCALLCT =2 then replace( SCALLCT ,2,'Alphabetically')
when SCALLCT =3 then replace( SCALLCT ,3,'By ability (e.g. high/middle/low)')
when SCALLCT =4 then replace( SCALLCT ,4,'According to the level of fees they pay')
when SCALLCT =5 then replace( SCALLCT ,5,'By choice of subject')
when SCALLCT =6 then replace( SCALLCT ,6,'Other method')
when SCALLCT =7 then replace( SCALLCT ,7,'A combination of two or more of the above')
else null
end as 'Class_Allocation_for_Students',

case
when GRPABLTY =1 then replace( GRPABLTY ,1,'Low ability')
when GRPABLTY =2 then replace( GRPABLTY ,2,'Medium ability')
when GRPABLTY =3 then replace( GRPABLTY ,3,'High ability')
else null
end as 'Class_Ability',

iif(SCAVLB1 =0,'No','Yes') 'Present_in_class(Chalk/Board_Marker)',

iif(SCAVLB2 =0,'No','Yes') 'Present_in_class(Black/Whiteboard)',

iif(SCAVLB3 =0,'No','Yes') 'Present_in_class(Teacher`s_Desk)',

iif(SCAVLB4 =0,'No','Yes') 'Present_in_class(Teacher`s_Chair)',

iif(SCAVLB5 =0,'No','Yes') 'Present_in_class(Exercise_Books)',

iif(SCAVLB6 =0,'No','Yes') 'Present_in_class(Electric_light)',

iif(SCAVLB7 =0,'No','Yes') 'Present_in_class(Electric_fan)',

iif(SCAVLB8 =0,'No','Yes') 'Present_in_class(Windows_with_glass)',

iif(SCAVLB9 =0,'No','Yes') 'Present_in_class(Windows_without_glass)',

iif(SCAVLB10 =0,'No','Yes') 'Present_in_class(IT_Facilities)',

SCPRDDAY 'Number_of_Teaching_Periods',

SCLNONPR 'Average_Length_of_Teaching_Period(mins)',

SCMNMTIN 'Regular Maths Periods/week',
SCMNENIN 'Regular English Periods/week',
case
when SCTXTMTH =1 then replace( SCTXTMTH ,1,'Compulsory Maths textbooks')
when SCTXTMTH =2 then replace( SCTXTMTH ,1,'Non-compulsory/other Maths textbooks')
else null
end as 'Textbooks_for_Maths_Lesson',

case
when SCTXTENG =1 then replace( SCTXTENG ,1,'Compulsory Maths textbooks')
when SCTXTENG =2 then replace( SCTXTENG ,1,'Non-compulsory/other Maths textbooks')
else null
end as 'Textbooks_for_English_Lesson'

INTO Education.ClassRegister
FROM [dbo].[Vietnam Wave1];


--5.Head teacher/Principal: This table shows the background information of the Head Teacher, as well as information on the school and its resources.

SELECT
UNIQUEID 'Student_Unique_ID',

NUMG10CLS 'No._of_Grade10_Classes',

HTDINT 'Date_of_Interview',

HTAGE 'HeadTeacher_Age',

iif(HTSEX =1,'Male','Female') 'HeadTeacher_Gender',

iif(HTFRMPRV = 0,'No','Yes') 'Native_of_the_Province',

case
when HTLVLEDC = 1 then replace( HTLVLEDC ,1,'Upper secondary or equivalent ')
when HTLVLEDC = 2 then replace( HTLVLEDC ,2,'Vocational training school ')
when HTLVLEDC = 3 then replace( HTLVLEDC ,3,'College education')
when HTLVLEDC = 4 then replace( HTLVLEDC ,4,'University education (undergraduate)')
when HTLVLEDC = 5 then replace( HTLVLEDC ,5,'University education (postgraduate)')
else null
end as 'HeadTeacher_Highest_Education_Level',

case
when HTLVLTCH = 0 then replace(HTLVLTCH ,0,'I am not trained')
when HTLVLTCH = 1 then replace(HTLVLTCH ,1,'Short course or crash course in teaching profession')
when HTLVLTCH = 2 then replace(HTLVLTCH ,2,'Teacher training level (2 years after upper secondary education)')
when HTLVLTCH = 3 then replace(HTLVLTCH ,3,'Teacher training college level (3 years after upper secondary education)')
when HTLVLTCH = 4 then replace(HTLVLTCH ,4,'Teacher training university level (4 years after upper secondary education) or
higher')
else null
end as 'HeadTeacher_Highest_Teaching_Qualification',

case
when HTEXCTCH =0 then replace (HTEXCTCH ,0,'Never been an excellent teacher')
when HTEXCTCH =1 then replace (HTEXCTCH ,1,'Yes, school level')
when HTEXCTCH =2 then replace (HTEXCTCH ,2,'Yes, district level')
when HTEXCTCH =3 then replace (HTEXCTCH ,3,'Yes, province level or higher')
else null
end as 'Has_Excellent_Teacher_Award',

case
when HTTYPSCH =1 then replace (HTTYPSCH ,1,'Government')
when HTTYPSCH =2 then replace (HTTYPSCH ,2,'Private')
when HTTYPSCH =3 then replace (HTTYPSCH ,3,'Other')
else null
end as 'School_Type',

HTNMETST 'Total_Ethnic_Minority_Backgrounds_Enrolled',

case
when HTPRDIST = 0 then replace(HTPRDIST,0,'No')
when HTPRDIST = 1 then replace(HTPRDIST,1,'Yes')
when HTPRDIST = 2 then replace(HTPRDIST,2,'Don`t know')
else null
end as 'School_in_one_of_62_Poorest_Districts',

case
when HTBOARD = 0 then replace(HTBOARD,0,'No')
when HTBOARD = 1 then replace(HTBOARD,1,'Yes, all students board during the week and return home at weekends')
when HTBOARD = 2 then replace(HTBOARD,2,'Yes, all students board for the whole semester and return home during the
holidays')
when HTBOARD = 3 then replace(HTBOARD,3,'Yes, but it is a mix – some students board during the semester and others do not')
else null
end as 'Is_Boarding_School',

iif(HTEXTCUR =0,'No','Yes') 'Extra-curricular_Activities',

case
when HTPRTEXP = 1 then replace(HTPRTEXP,1,'There is constant pressure from many parents who expect our school to set
academic standards and to have our students achieve them')
when HTPRTEXP = 2 then replace(HTPRTEXP,2,'Pressure on the school to achieve higher academic standards among students
comes from a minority of parents')
when HTPRTEXP = 3 then replace(HTPRTEXP,3,'Pressure from parents on the school to achieve higher academic standards is
largely absent')
else null
end as 'Parental_Expectations',

case
when HTSCHAVL = 0 then replace (HTSCHAVL ,0,'There are no other upper secondary schools in this district that students could
attend')
when HTSCHAVL = 1 then replace (HTSCHAVL ,1,'There is one other upper secondary school in this district that students could
attend')
when HTSCHAVL = 3 then replace (HTSCHAVL ,2,'There are two or more other upper secondary schools in this district that students
could attend')
else null
end as 'Schooling_Availability'


INTO Education.HeadTeacher
FROM [dbo].[Vietnam Wave1];


--Creating Primary Keys for Student_Unique_ID on all tables
----First the ChildIdentity table was altered to make the Student_Unique_ID column not null 

ALTER TABLE [Education].[ChildIdentity] ALTER COLUMN [Student_Unique_ID] varchar(500) NOT NULL;

ALTER TABLE [Education].[ChildIdentity]
ADD CONSTRAINT PK_ChildID PRIMARY KEY ([Student_Unique_ID]);

ALTER TABLE [Education].[FamilyBackground]
ADD CONSTRAINT FK_FamB_ID
FOREIGN KEY ([Student_Unique_ID]) REFERENCES [Education].[ChildIdentity]([Student_Unique_ID]);

ALTER TABLE [Education].[ChildAcademic]
ADD CONSTRAINT FK_ChildAca_ID
FOREIGN KEY ([Student_Unique_ID]) REFERENCES [Education].[ChildIdentity]([Student_Unique_ID]);

ALTER TABLE [Education].[ClassRegister]
ADD CONSTRAINT FK_Class_ID
FOREIGN KEY ([Student_Unique_ID]) REFERENCES [Education].[ChildIdentity]([Student_Unique_ID]);

ALTER TABLE [Education].[HeadTeacher]
ADD CONSTRAINT FK_HTeach_ID
FOREIGN KEY ([Student_Unique_ID]) REFERENCES [Education].[ChildIdentity]([Student_Unique_ID]);

--Creation of views

--A view for the data used to analyse Inequality in Education
CREATE VIEW Education.InequalityinEducation
AS
SELECT CI.[Student_Unique_ID],[Province],[School_Location],[Gender],[English Test Score],[Maths Test Score],[Highest_Education(Grade/Level)_Expected], [HeadTeacher_Highest_Education_Level],[Present_in_class(Exercise_Books)], [Home_Study_Space],[Books_at_Home(Not_Academic)],[Have_Computer?],[Have_Internet?]
FROM [Education].[ChildIdentity] CI
INNER JOIN [Education].[ChildAcademic] CA ON CI.[Student_Unique_ID]=CA.[Student_Unique_ID]
INNER JOIN [Education].[ClassRegister] CR ON CI.[Student_Unique_ID]=CR.[Student_Unique_ID]
INNER JOIN [Education].[FamilyBackground] F ON CR.[Student_Unique_ID]=F.[Student_Unique_ID]
INNER JOIN[Education].[HeadTeacher] HT ON CA.Student_Unique_ID=HT.Student_Unique_ID

--Creating the summarized report on Inequality in Education with the use of views

--1. A report that shows gender Inequality in Education: The gender distribution of students grouped by province 
CREATE VIEW Education.Province_GenderDistribution
AS
SELECT Gender, COUNT(CASE PROVINCE WHEN 'Ben Tre' THEN 1 END) AS 'Ben Tre', COUNT(CASE PROVINCE WHEN 'Da Nang' THEN 2 END) AS 'Da Nang', COUNT(CASE PROVINCE WHEN 'Hung Yen' THEN 3 END) AS 'Hung Yen', COUNT(CASE PROVINCE WHEN 'Lao Cai' THEN 1 END) AS 'Lao Cai', COUNT(CASE PROVINCE WHEN 'Phu Yen' THEN 1 END) AS 'Phu Yen'
FROM Education.InequalityinEducation
GROUP BY Gender


--2. A report that shows the highest Education (Grade/Level) expected of the children are counted and grouped by gender for comparison
CREATE VIEW Education.Highest_EducationExpected
AS
SELECT [Highest_Education(Grade/Level)_Expected], COUNT(CASE PROVINCE WHEN 'Ben Tre' THEN 1 END) AS 'Ben Tre', COUNT(CASE PROVINCE WHEN 'Da Nang' THEN 2 END) AS 'Da Nang', COUNT(CASE PROVINCE WHEN 'Hung Yen' THEN 3 END) AS 'Hung Yen', COUNT(CASE PROVINCE WHEN 'Lao Cai' THEN 1 END) AS 'Lao Cai', COUNT(CASE PROVINCE WHEN 'Phu Yen' THEN 1 END) AS 'Phu Yen'
FROM Education.InequalityinEducation
WHERE [Highest_Education(Grade/Level)_Expected] IS NOT NULL AND [Highest_Education(Grade/Level)_Expected] NOT LIKE '%%know'
GROUP BY [Highest_Education(Grade/Level)_Expected]

--3. A view that shows the number of students whose headteacher's has university education grouped by the school location
CREATE VIEW Education.HeadTeacher_Highest_Education_Level
AS
SELECT [HeadTeacher_Highest_Education_Level], COUNT(CASE [School_Location] WHEN 'Rural' THEN 1 END) AS 'Rural',  COUNT(CASE [School_Location] WHEN 'Urban' THEN 2 END) AS 'Urban'
FROM Education.InequalityinEducation
WHERE [HeadTeacher_Highest_Education_Level] IS NOT NULL
GROUP BY [HeadTeacher_Highest_Education_Level];

--4. A view that shows the number of students that has atleast four books at home grouped by gender
CREATE VIEW Education.BooksatHome
AS
SELECT COUNT(CASE [Gender] WHEN 'Male' THEN 1 END) AS 'Male',  COUNT(CASE [Gender] WHEN 'Female' THEN 2 END) AS 'Female'
FROM Education.InequalityinEducation
WHERE [Books_at_Home(Not_Academic)]>= '4'



--A Stored Procedure that reveals the number of students per province

CREATE PROCEDURE Education.[Province] @Province varchar(200)
AS
SELECT Province, COUNT([Student_Unique_ID]) 'Number of Students'
FROM [Education].[ChildIdentity]
WHERE Province = @Province
GROUP BY Province;

--Excecuting the created stored procedure Education.[Province] for [Phu Yen] Province
EXEC Education.[Province] [Phu Yen]


 --TRIGGER

--Making a Trigger that prevents deletion of row from the Primary Key Table
CREATE TRIGGER Education.Prevent_Delete ON Education.Child_Identity
INSTEAD OF DELETE
AS
IF EXISTS (SELECT * FROM [Education].[Child_Identity])
DECLARE @ErrorMessage NVARCHAR(200)
SELECT	@ErrorMessage = 'A primary key is in this table'
BEGIN
RAISERROR( @ErrorMessage, 16, 1 )
ROLLBACK TRANSACTION
END;
GO


---Functions
--A Table Function that shows the gender per province
CREATE FUNCTION Education.GenderperProvince (@Gender NVARCHAR(200))
RETURNS TABLE AS
RETURN(
SELECT [Province],[Gender], count(*) 'Total'
FROM [Education].[ChildIdentity]
WHERE Gender = @Gender
GROUP BY [Province],Gender]);