/* =====================================================================

Name        : name of the procedure
Author      : your name
Written     : the date you first created the method
Purpose     : describe the purpose of this method
Returns     : what is returned from this method
Edit History: date of change - editor's name
                 + description of change

======================================================================== */

/* =====================================================================

Name        : sp_GET_workoutslist
Author      : Andrew Grimes
Written     : 2/23/20
Purpose     : Get the list of workout dates from a given user
Returns     : nothing if the operation did not work, list of workout dates
                and id of a given user
Edit History: 2/23/20 - Andrew Grimes
                 + Initial change

======================================================================== */

create procedure sp_GET_workoutsList
    @userId     INT = 0
AS BEGIN
    SET NOCOUNT ON

    SELECT userId, workoutDate
    FROM workouts
    WHERE ( (userId = @userId) OR (@userId = 0 ))
    --ORDER BY sortOrder
END
GO
--sp_GET_workoutsList 105
/* =====================================================================

Name        : sp_GET_distanceRan
Author      : Andrew Grimes
Written     : 2/23/20
Purpose     : Gets the total distance ran from a given user
Returns     : returns the miles ran from a user
Edit History: 2/23/20 - Andrew Grimes
                 + Creation

======================================================================== */

--drop procedure sp_GET_distanceRan

create procedure sp_GET_distanceRan
    @userId INT = 0
AS BEGIN
    SET NOCOUNT ON
   
    SELECT [USER ID] =@userId, [TOTAL MILES] =  SUM(totalMiles)
    FROM workouts
    WHERE ((userId = @userId) OR (@userId = 0))
END
GO

--sp_GET_distanceRan 105

/* =====================================================================

Name        : sp_GET_distanceRanByShoeBrand
Author      : Andrew Grimes
Written     : 2/23/20
Purpose     : Gets the total distance ran from a shoeBrandId
Returns     : returns the miles ran from a shoeBrand
Edit History: 2/23/20 - Andrew Grimes
                 + Creation

======================================================================== */

--drop procedure sp_GET_distanceRanByShoeBrand

create procedure sp_GET_distanceRanByShoeBrand
    @shoeBrandId INT = 0
   
AS BEGIN
   
    SELECT DISTINCT [SHOE BRAND ID] =@shoeBrandId,  [TOTAL MILES] =  SUM(totalMiles)
    FROM shoeBrands,workouts
    WHERE ((shoeBrandId = @shoeBrandId) OR (@shoeBrandId = 0))
END
GO


--sp_GET_distanceRanByShoeBrand 1


/* =====================================================================

Name        : sp_GET_TotalSecondsOfWorkout
Author      : Andrew Grimes
Written     : 2/23/20
Purpose     : Gets the list of total seconds from a list of workouts
Returns     : returns a list of seconds from workouts
Edit History: 2/23/20 - Andrew Grimes
                 + Creation

======================================================================== */

--drop procedure sp_GET_TotalSecondsOfWorkout

create procedure sp_GET_TotalSecondsOfWorkout
    @userId INT = 0
   
AS BEGIN
   
    SELECT userId,totalSeconds, workoutDate
    FROM workouts
    WHERE ((userId = @userId) OR (@userId = 0))
END
GO

--sp_GET_TotalSecondsOfWorkout 105

/* =====================================================================

Name        : sp_GET_DISTANCERANONSHOE
Author      : Andrew Grimes
Written     : 2/23/20
Purpose     : Gets the miles ran on shoes from a user ID
Returns     : returns a list of distances for each shoe
Edit History: 2/23/20 - Andrew Grimes
                 + Creation

======================================================================== */

--drop procedure sp_GET_DISTANCERANONSHOE

create procedure sp_GET_DISTANCERANONSHOE
    @userId INT = 0
    
AS BEGIN
   
    SELECT description, userId, totalMiles
    FROM shoeBrands,workouts
    WHERE ((userId = @userId) OR (@userId = 0))
    ORDER BY userId
END
GO

sp_GET_DISTANCERANONSHOE 










