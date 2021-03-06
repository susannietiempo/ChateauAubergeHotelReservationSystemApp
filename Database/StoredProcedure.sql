USE [ChateuAubergeHotelManagementSystem]
GO
/****** Object:  StoredProcedure [dbo].[CountriesLookup]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[CountriesLookup] 
AS
BEGIN

SET NOCOUNT ON;

SELECT CountryId, CountryName FROM Country;

END
GO
/****** Object:  StoredProcedure [dbo].[spCountriesLookup]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[spCountriesLookup]
AS
BEGIN

SET NOCOUNT ON;

SELECT CountryId, CountryName FROM Country;

END
GO
/****** Object:  StoredProcedure [dbo].[spGetAdultRate]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [dbo].[spGetAdultRate]
	@CheckIn datetime2,
	@GuestType NVARCHAR(25)

AS
BEGIN

SET NOCOUNT ON;

SELECT TOP 1 GuestRate FROM GuestFee WHERE GuestType = @GuestType AND EffectiveDate <= @CheckIn  ORDER BY EffectiveDate DESC

END

GO
/****** Object:  StoredProcedure [dbo].[spGetClerk]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[spGetClerk]
	@UserName NVARCHAR(30)

AS
BEGIN

SET NOCOUNT ON;

SELECT ClerkId, FirstName, LastName, [Password], UserName FROM Clerk WHERE UserName = @UserName;
END
GO
/****** Object:  StoredProcedure [dbo].[spGetGuestRate]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [dbo].[spGetGuestRate]
	@GuestType NVARCHAR(25)

AS
BEGIN

SET NOCOUNT ON;

SELECT TOP 1 GuestRate FROM GuestFee WHERE GuestType = @GuestType AND EffectiveDate <= GETDATE()  ORDER BY EffectiveDate DESC

END
GO
/****** Object:  StoredProcedure [dbo].[spGetLastInsertedGuest]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER  PROCEDURE [dbo].[spGetLastInsertedGuest]
AS
BEGIN

SET NOCOUNT ON;

	SELECT IDENT_CURRENT('Guest')

END
GO
/****** Object:  StoredProcedure [dbo].[spInsertGuest]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO

CREATE OR ALTER PROCEDURE [dbo].[spInsertGuest]
	@FirstName NVARCHAR(50),
	@MiddleName NVARCHAR(50),
	@LastName NVARCHAR(50),
	@StreetAddress1 NVARCHAR(150),
	@Municipality NVARCHAR(100),
	@CountryId INT,
	@ProvinceId INT,
	@PostalCode CHAR(20),
	@HomePhoneNum CHAR(25),
	@MobilePhoneNum CHAR(25),
	@EmailAddress NVARCHAR(255),
	@DateOfBirth DateTime2
AS
BEGIN
	BEGIN TRY

		INSERT INTO Guest
			(FirstName, MiddleName, LastName, StreetAddress1, Municipality, ProvinceId, CountryId, PostalCode, HomePhoneNum, MobilePhoneNum, EmailAddress, DateOfBirth)
		VALUES
			(	@FirstName,
				@MiddleName,
				@LastName,
				@StreetAddress1,
				@Municipality,
				@ProvinceId,
				@CountryId,
				@PostalCode,
				@HomePhoneNum,
				@MobilePhoneNum,
				@EmailAddress,
				@DateOfBirth
			)


	END TRY
	BEGIN CATCH
		;THROW
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[spInsertReservation]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[spInsertReservation]
	@ConfirmationNumber VARCHAR(12),
	@CheckIn DateTime2,
	@CheckOut DateTime2,
	@NumAdults INT = 0,
	@NumChildren INT = 0,
	@RoomId CHAR(10),
	@ClerkId INT,
	@BaseRate DECIMAL,
	@AdultRate DECIMAL,
	@ChildRate DECIMAL,

	@FirstName NVARCHAR(50),
	@MiddleName NVARCHAR(50) = NULL,
	@LastName NVARCHAR(50),
	@StreetAddress1 NVARCHAR(150),
	@Municipality NVARCHAR(100),
	@CountryId INT,
	@ProvinceId INT = NULL,
	@PostalCode CHAR(20),
	@HomePhoneNum CHAR(25) = NULL,
	@MobilePhoneNum CHAR(25) = NULL,
	@EmailAddress NVARCHAR(255) = NULL,
	@DateOfBirth DateTime2

AS
BEGIN
	BEGIN TRY
			
			--BR 001
			IF ((CAST( @CheckOut  AS Date )) = (CAST( @CheckIn  AS Date )))
				THROW 51001, 'Reservation period must be for at least one day.No partial day is allowed.', 1;

			--BR 009
			IF ((@NumAdults + @NumChildren + 1) > (SELECT MaxOccupancy FROm Room WHERE RoomNumber = @RoomId))
				THROW 51001, 'The number of guests exceeds the maximum occupancy of the selected room.', 1;

			--BR 12
			IF ((@MobilePhoneNum IS NULL) AND (@HomePhoneNum IS NULL))
				THROW 51001, 'Guest must provide either a home phone number or mobile phone number.', 1;

			-- BR 13
			IF ( (SELECT 
						(CONVERT(int,CONVERT(char(8),GETDATE(),112)) - CONVERT(int,CONVERT(char(8),@DateOfBirth,112)))/10000) 
					<= 19)
				THROW 51001, 'Guest must be at least 19 years old.', 1;

			IF (@CheckIn < (SELECT CAST( GETDATE() AS Date )) OR @CheckOut < (SELECT CAST( GETDATE() AS Date )))
				THROW 51001, 'Reservation period cannot be made for past dates.', 1;


			DECLARE @GuestId INT

			INSERT INTO Guest
				(FirstName, MiddleName, LastName, StreetAddress1, Municipality, ProvinceId, CountryId, PostalCode, HomePhoneNum, MobilePhoneNum, EmailAddress, DateOfBirth)
			VALUES
				(	@FirstName,
					@MiddleName,
					@LastName,
					@StreetAddress1,
					@Municipality,
					@ProvinceId,
					@CountryId,
					@PostalCode,
					@HomePhoneNum,
					@MobilePhoneNum,
					@EmailAddress,
					@DateOfBirth
				)

			SET @GuestId = SCOPE_IDENTITY();

			INSERT INTO Reservation
				(ConfirmationNumber, CheckInDate, CheckOutDate, NumAdults, NumChildren, GuestID, RoomId, ClerkId, BaseFee, AdultRate, ChildRate)
			VALUES
				(		@ConfirmationNumber,
						@CheckIn,
						@CheckOut,
						@NumAdults,
						@NumChildren,
						@GuestId,
						@RoomId,
						@ClerkId,
						@BaseRate,
						@AdultRate,
						@ChildRate
				)

	END TRY
	BEGIN CATCH
		;THROW
	END CATCH

END

GO
/****** Object:  StoredProcedure [dbo].[spProvincesLookup]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER  PROCEDURE [dbo].[spProvincesLookup]
AS
BEGIN

SET NOCOUNT ON;

SELECT ProvinceId, ProvinceName FROM Province;

END
GO
/****** Object:  StoredProcedure [dbo].[spRetrieveAvailableRooms]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO


CREATE OR ALTER   PROCEDURE [dbo].[spRetrieveAvailableRooms]
 	@CheckIn datetime2,
	@CheckOut datetime2
AS	
BEGIN
	BEGIN TRY
		SELECT RoomNumber, RoomName, MaxOccupancy, BedType.Description AS NumBeds, RoomType.Description AS RoomType, BaseRate 
		FROM Room
		INNER JOIN BedType ON Room.NumBeds = BedType.BedID
		INNER JOIN RoomType ON Room.RoomTypeID = RoomType.RoomTypeID
		WHERE RoomNumber NOT IN
		(
			SELECT	RoomId
			FROM	Reservation
			WHERE	(CheckInDate <= @CheckIn AND CheckOutDate >=@CheckIn)
					OR (CheckInDate < @CheckOut AND CheckOutDate >= @CheckOut)
					OR (@CheckIn <= CheckInDate AND @CheckOut >= CheckInDate)
		)		

	END TRY	
	BEGIN CATCH
		;THROW
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spRetrieveConfirmationNumber]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[spRetrieveConfirmationNumber]
	@ConfirmationNumber VARCHAR(12)
AS
BEGIN

	SELECT ConfirmationNumber FROM Reservation WHERE @ConfirmationNumber = ConfirmationNumber;

END
GO
/****** Object:  StoredProcedure [dbo].[spRetrieveCountries]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[spRetrieveCountries]

AS	
BEGIN
	BEGIN TRY
		SELECT CountryId, CountryName
		FROM Country

	END TRY	
	BEGIN CATCH
		;THROW
	END CATCH
END
GO
/****** Object:  StoredProcedure [dbo].[spRetrieveRetrieveBySearchDateCheckIn]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER   PROCEDURE [dbo].[spRetrieveRetrieveBySearchDateCheckIn]
	@SearchDate DateTime2
AS
BEGIN

SET NOCOUNT ON;

	SELECT 
		
			FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName,
			StreetAddress1 + ', ' + Municipality + CHAR(13) + CHAR(10) + ISNULL((SELECT ProvinceName FROM PROVINCE WHERE ProvinceId = Guest.ProvinceId),'') + ' ' + CountryName + CHAR(13)+CHAR(10) + PostalCode AS  CompleteAddress,
			'Home: ' + ISNULL(HomePhoneNum, '') + '   ' + 'Mobile: ' +ISNULL(MobilePhoneNum, '') AS PhoneNumbers,
			EmailAddress,
			DateOfBirth,
			ConfirmationNumber,
			CheckInDate,
			CheckOutDate,
			'Adults:    ' + CONVERT(varchar(10),NumAdults)  + '             ' + 'Children:    ' + CONVERT(varchar(10),NumChildren)  AS AddGuestsNum,
			(ISNULL(NumAdults, 0) * AdultRate) + (ISNULL(NumChildren, 0) * ChildRate) + BaseFee AS DailyRate,
			'No: ' + RoomId + '   Name: ' + RoomName AS RoomNameNumber,
			'No: ' + RoomId + ' Name: ' + RoomName  + '    ' + ' Type: ' + RoomType.[Description]  + '    ' + ' No. Beds: '+  BedType.Description AS RoomDetails,
			LastName

	FROM Reservation
	INNER JOIN Guest
	ON Reservation.GuestID = Guest.GuestID
	INNER JOIN Country
	ON Guest.CountryId = Country.CountryId 
	INNER JOIN Room
	ON Room.RoomNumber = Reservation.RoomId 
	INNER JOIN RoomType
	ON Room.RoomTypeID = RoomType.RoomTypeID 
	INNER JOIN BedType
	ON BedType.BedID = Room.NumBeds 
	WHERE  CAST( CheckInDate AS Date )  =  CAST( @SearchDate  AS Date ); 

END

GO
/****** Object:  StoredProcedure [dbo].[spRetrieveRetrieveBySearchDateCheckOut]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[spRetrieveRetrieveBySearchDateCheckOut]
	@SearchDate DateTime2
AS
BEGIN

SET NOCOUNT ON;

	SELECT 
					
			FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName,
			StreetAddress1 + ', ' + Municipality + CHAR(13) + CHAR(10) + ISNULL((SELECT ProvinceName FROM PROVINCE WHERE ProvinceId = Guest.ProvinceId),'') + ' ' + CountryName + CHAR(13)+CHAR(10) + PostalCode AS  CompleteAddress,
			'Home: ' + ISNULL(HomePhoneNum, '') + '   ' + 'Mobile: ' +ISNULL(MobilePhoneNum, '') AS PhoneNumbers,
			EmailAddress,
			DateOfBirth,
			ConfirmationNumber,
			CheckInDate,
			CheckOutDate,
			'Adults:    ' + CONVERT(varchar(10),NumAdults)  + '             ' + 'Children:    ' + CONVERT(varchar(10),NumChildren)  AS AddGuestsNum,
			(ISNULL(NumAdults, 0) * AdultRate) + (ISNULL(NumChildren, 0) * ChildRate) + BaseFee AS DailyRate,
			'No: ' + RoomId + '   Name: ' + RoomName AS RoomNameNumber,
			'No: ' + RoomId + ' Name: ' + RoomName  + '    ' + ' Type: ' + RoomType.[Description]  + '    ' + ' No. Beds: '+  BedType.Description AS RoomDetails,
			LastName

	FROM Reservation
	INNER JOIN Guest
	ON Reservation.GuestID = Guest.GuestID
	INNER JOIN Country
	ON Guest.CountryId = Country.CountryId 
	INNER JOIN Room
	ON Room.RoomNumber = Reservation.RoomId 
	INNER JOIN RoomType
	ON Room.RoomTypeID = RoomType.RoomTypeID 
	INNER JOIN BedType
	ON BedType.BedID = Room.NumBeds 
	WHERE  CAST( CheckOutDate AS Date )  =  CAST( @SearchDate  AS Date ); 

END

GO
/****** Object:  StoredProcedure [dbo].[spRetrieveRetrieveBySearchString]    Script Date: 2020-11-22 12:15:07 AM ******/
SET ANSI_NULLS ON
GO
SET QUOTED_IDENTIFIER ON
GO
CREATE OR ALTER  PROCEDURE [dbo].[spRetrieveRetrieveBySearchString]
	@SearchString NVARCHAR(50)
AS
BEGIN

SET NOCOUNT ON;

	SELECT 
					
			FirstName + ' ' + ISNULL(MiddleName, '') + ' ' + LastName AS FullName,
			StreetAddress1 + ', ' + Municipality + CHAR(13) + CHAR(10) + ISNULL((SELECT ProvinceName FROM PROVINCE WHERE ProvinceId = Guest.ProvinceId),'') + ' ' + CountryName + CHAR(13)+CHAR(10) + PostalCode AS  CompleteAddress,
			'Home: ' + ISNULL(HomePhoneNum, '') + '   ' + 'Mobile: ' +ISNULL(MobilePhoneNum, '') AS PhoneNumbers,
			EmailAddress,
			DateOfBirth,
			ConfirmationNumber,
			CheckInDate,
			CheckOutDate,
			'Adults:    ' + CONVERT(varchar(10),NumAdults)  + '             ' + 'Children:    ' + CONVERT(varchar(10),NumChildren)  AS AddGuestsNum,
			(ISNULL(NumAdults, 0) * AdultRate) + (ISNULL(NumChildren, 0) * ChildRate) + BaseFee AS DailyRate,
			'No: ' + RoomId + '   Name: ' + RoomName AS RoomNameNumber,
			'No: ' + RoomId + ' Name: ' + RoomName  + '    ' + ' Type: ' + RoomType.[Description]  + '    ' + ' No. Beds: '+  BedType.Description AS RoomDetails,
			LastName

	FROM Reservation
	INNER JOIN Guest
	ON Reservation.GuestID = Guest.GuestID
	INNER JOIN Country
	ON Guest.CountryId = Country.CountryId 
	INNER JOIN Room
	ON Room.RoomNumber = Reservation.RoomId 
	INNER JOIN RoomType
	ON Room.RoomTypeID = RoomType.RoomTypeID 
	INNER JOIN BedType
	ON BedType.BedID = Room.NumBeds 
	WHERE LastName LIKE '%' + @SearchString + '%' 
						OR ConfirmationNumber LIKE '%' + @SearchString + '%'   
						OR ConfirmationNumber LIKE '%' + @SearchString + '%' 
						OR RoomId LIKE '%' + @SearchString + '%' 
						OR RoomName LIKE '%' + @SearchString + '%' 
	ORDER BY CheckInDate ASC

END

GO
