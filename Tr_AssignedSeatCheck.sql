USE [Airline]
GO

/****** Object:  Trigger [dbo].[Tr_AssignedSeatCheck]    Script Date: 11/22/2020 1:47:02 AM ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

-- =============================================
-- Author:		Yen Pham
-- Description:	This trigger is designed for assigning ticket seat randomly
-- =============================================
CREATE TRIGGER [dbo].[Tr_AssignedSeatCheck]
   ON   [dbo].[Ticket]
   INSTEAD OF INSERT
AS 
	
BEGIN
	--Declare parameters
	DECLARE @FareType nchar(3), @FlightID nchar(10), @NumberOfFCSeats int, @NumberOfBCSeats int, @NumberOfECSeats int, @MaxAssignedSeat int, @PassengerID nchar(10);

	SET NOCOUNT ON;

    -- Insert statements for trigger here
	SELECT @FareType = INSERTED.FareID, @FlightID = INSERTED.Flight_ID, @PassengerID = INSERTED.Passenger_ID FROM INSERTED;
	SELECT @NumberOfFCSeats = Aircraft.FirstClassSeats,
		@NumberOfBCSeats = Aircraft.BusinessClassSeats, 
		@NumberOfECSeats = Aircraft.EconomyClassSeats
	FROM Inserted, Flight, Aircraft
	WHERE Inserted.Flight_ID = Flight.Flight_ID AND Aircraft.Aircraft_ID  = Flight.Aircraft_ID;

	-- Assign the highest numer of seat in the seat number column to max assigned seat
	SELECT @MaxAssignedSeat = MAX(Ticket.Seat_Number) FROM Ticket WHERE Ticket.FareID = @FareType AND Ticket.Flight_ID = @FlightID;
	IF EXISTS(SELECT * FROM dbo.ufnGetFlightCustomers(@FlightID) AS FlightCustomers WHERE FlightCustomers.Passenger_ID = @PassengerID )
		BEGIN
	-- If seat is first class
		IF @FareType = 'F'
			BEGIN	
				IF @MaxAssignedSeat IS NULL 
				--If no seat is assigned yet
					(SELECT @MaxAssignedSeat = 0)
				-- Else increment the max number of seat by 1
				IF @MaxAssignedSeat < @NumberOfFCSeats
					BEGIN 
					INSERT Ticket SELECT Ticket_ID, Passenger_ID,Flight_ID,NumberofCarryOn, NumberofCheckedBag, FareID, (@MaxAssignedSeat+1) FROM INSERTED;		
					END
				ELSE
				-- If max number of seat reached the max seat availale for that class in an aircraft, set trigger
					BEGIN
						RAISERROR ('The selected Flight is out of Seat for the given Fare Class', 16, 1);
						ROLLBACK TRANSACTION;
					END
			END
	-- If seat is business class, do the same as first class
		ELSE IF @FareType = 'J'
			BEGIN
				IF @MaxAssignedSeat IS NULL 
					(SELECT @MaxAssignedSeat = @NumberOfFCSeats)
				IF @MaxAssignedSeat < (@NumberOfFCSeats + @NumberOfBCSeats) 
					BEGIN
					INSERT Ticket SELECT Ticket_ID, Passenger_ID,Flight_ID,NumberofCarryOn, NumberofCheckedBag, FareID, (@MaxAssignedSeat+1) FROM INSERTED;	
					END
				ELSE
					BEGIN
						RAISERROR ('The selected Flight is out of Seat for the given Fare Class', 16, 1);
						ROLLBACK TRANSACTION;
				END
			END
		-- If seat is economy class, do the same as frst class
		ELSE IF @FareType = 'Y'
			BEGIN 
				IF @MaxAssignedSeat IS NULL 
					(SELECT @MaxAssignedSeat = @NumberOfFCSeats + @NumberOfBCSeats)
				IF @MaxAssignedSeat < (@NumberOfFCSeats + @NumberOfBCSeats + @NumberOfECSeats) 
					BEGIN
					INSERT Ticket SELECT Ticket_ID, Passenger_ID,Flight_ID,NumberofCarryOn, NumberofCheckedBag, FareID, (@MaxAssignedSeat+1) FROM INSERTED;		
					END
				ELSE
					BEGIN
						RAISERROR ('The selected Flight is out of Seat for the given Fare Class', 16, 1);
						ROLLBACK TRANSACTION;
					END
			END
		ELSE
			BEGIN
				RAISERROR ('The selected Fare Class is invalid', 16, 1);
				ROLLBACK TRANSACTION;
			END
		END
		ELSE
		BEGIN
			RAISERROR('The selected Passenger ID is not assigned in this flight', 16, 1);
			ROLLBACK TRANSACTION;
		END
END
GO

ALTER TABLE [dbo].[Ticket] ENABLE TRIGGER [Tr_AssignedSeatCheck]
GO


