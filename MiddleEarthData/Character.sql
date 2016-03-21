CREATE TABLE [dbo].[Character]
(
	[CharacterId] INT           IDENTITY (1, 1) NOT NULL,
    [FirstName] VARCHAR(50) NULL, 
    [LastName] VARCHAR(50) NULL, 
    [Address] VARCHAR(50) NULL, 
    [City] VARCHAR(50) NULL, 
    [Age] INT NULL, 
    [Interests] VARCHAR(MAX) NULL, 
    [RaceId] INT NOT NULL, 
    [RegionId] INT NULL,
	 PRIMARY KEY CLUSTERED ([CharacterId] ASC),
	 CONSTRAINT [FK_dbo.Character_dbo.Race_RaceId] FOREIGN KEY ([RaceId])
		REFERENCES [dbo].[Race] ([RaceId]) ON DELETE CASCADE,
	 CONSTRAINT [FK_dbo.Character_dbo.Region_RegionId] FOREIGN KEY ([RegionId]) 
        REFERENCES [dbo].[Region] ([RegionId]) ON DELETE CASCADE
)

