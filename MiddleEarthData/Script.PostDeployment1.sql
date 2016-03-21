/*
Post-Deployment Script Template							
--------------------------------------------------------------------------------------
 This file contains SQL statements that will be appended to the build script.		
 Use SQLCMD syntax to include a file in the post-deployment script.			
 Example:      :r .\myfile.sql								
 Use SQLCMD syntax to reference a variable in the post-deployment script.		
 Example:      :setvar TableName MyTable							
               SELECT * FROM [$(TableName)]					
--------------------------------------------------------------------------------------
*/
MERGE INTO Race AS Target 
USING (VALUES 
        (1, 'Hobbit'), 
        (2, 'Elves'), 
        (3, 'Men'),
		(4,'Dwarves'),
		(5, 'Wizard' ),
		(6, 'Orc'),
		(7, 'Ent'),
		(8, 'Necromancer')
) 
AS Source (RaceID, Name) 
ON Target.RaceID = Source.RaceID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Name) 
VALUES (Name);

MERGE INTO Region AS Target 
USING (VALUES 
        (1, 'Shire'), 
        (2, 'Rivendale'), 
        (3, 'Lothlorien'),
		(4,'Gondor'),
		(5, 'Rohan' ),
		(6, 'Mordor'),
		(7, 'Eregion'),
		(8, 'Lonely Mountain'),
		(9, 'Iron Hills')
) 
AS Source (RegionID, Name) 
ON Target.RegionID = Source.RegionID
WHEN NOT MATCHED BY TARGET THEN 
INSERT (Name) 
VALUES (Name);

MERGE INTO Character AS Target
USING (VALUES 
        (1, 'Bilbo', 'Baggins', '#3 Bagshot Row', 'Hobbiton', 111, 'Writing', 1, 1 ), 
        (2,  'Frodo', 'Baggins', '#3 Bagshot Row', 'Hobbiton', 33, 'Cooking', 1, 1 ), 
		(3,  'Sam', 'Gamgee', '#6 Bagshot Row', 'Hobbiton', 35, 'Gardening', 1, 1 ),
		(4,  'Meridoc', 'Brandybuck', 'Brandy Hall', 'Buckleberry', 30, 'Horseback riding', 1, 1 ),
		(5,  'Peregrin', 'Took', 'Great Smials', 'Tuckborough', 30, 'Pipeweed', 1, 1 ),
		(6,  'Aragorn', 'Ellesar', 'Royal Palace', 'Minis Tirith', 85, 'Fencing', 3, 4 ),
		(7,  'Gandalf', 'Grey', 'Elf Lodge #5', 'Imladris', 1000, 'Fireworks', 5, 2),
		(8,  'Gimli', 'Gloinson', 'Hall #250', 'Lonely Mountain', 150, 'Geology', 4, 8)
)
AS Source (CharacterId, FirstName,LastName, Address, City, Age, Interests, RaceId, RegionId)
ON Target.CharacterId = Source.CharacterId
WHEN NOT MATCHED BY TARGET THEN
INSERT (FirstName,LastName, Address, City, Age, Interests, RaceId, RegionId)
VALUES (FirstName,LastName, Address, City, Age, Interests, RaceId, RegionId);