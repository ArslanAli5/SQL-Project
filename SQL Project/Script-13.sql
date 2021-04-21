-- CubicDisplacement
go
create FUNCTION test.CubicDisplacement(@WType varchar)
RETURNS float
AS
	BEGIN
	Declare @height int
	Declare @len int
	Declare @width int
	Declare @cubic_disp float
	
	select @len=iwt.`Length`, @width=iwt.Width, @height=iwt.Height 
		from imperial_walker_type iwt 
		where iwt.`WType` = @WType
	
	if (@wt = 'AT-AT')
		set @cubic_disp = @height * @len * @width * 0.016
	else if (@wt = 'AT-ST')
		set @cubic_disp = @height * @len * @width * 0.12
	RETURN @cubic_disp  
	END
go	

Execution:
select test.CubicDisplacement('AT-ST')
select test.CubicDisplacement('AT-AT')


-- MassDisplacement
go
create FUNCTION test.MassDisplacement(@WType varchar)
RETURNS float
AS
BEGIN
	
Declare @mass_disp float
Declare @cubic_disp float

select @cubic_disp = test.CubicDisplacement(@WType)

if (@WType = 'AT-AT')
	set @mass_disp = @cubic_disp * 64
else if (@WType = 'AT-ST')
	set @mass_disp = @cubic_disp * 72
RETURN @mass_disp  
END
go	

Execution:
select test.MassDisplacement('AT-ST')
select test.MassDisplacement('AT-AT')




-- Endurance
go
	create FUNCTION test.Endurance(@WType varchar)
	RETURNS float
AS
	BEGIN
		
	Declare @oprange float
	Declare @max_speed float
	Declare @endurance float
	Declare @mass_disp float
	
	select @max_speed=iwt.MaximumSpeed , @oprange=iwt.OpRange 
		from imperial_walker_type iwt 
		where iwt.`WType` = @WType
		
	select @mass_disp = test.MassDisplacement(@WType)
	
	if (@WType = 'AT-AT')
		set @endurance = (@oprange / @max_speed) * @mass_disp * 0.75
	else if (@WType = 'AT-ST')
		set @endurance = (@oprange / @max_speed) * @mass_disp * 0.35
	RETURN @endurance
	END
go	

Execution:
select test.Endurance('AT-ST')
select test.Endurance('AT-AT')




-- MassEnduranceRatio
go
	create FUNCTION test.MassEnduranceRatio(@WType varchar)
	RETURNS float
AS
	BEGIN
		
	Declare @mass_endurance float
	Declare @mass_disp float
	Declare @endurance float
			
	select @mass_disp = test.MassDisplacement(@WType)
	
	select @endurance = test.Endurance(@WType)
	
	if (@WType = 'AT-AT')
		set @mass_endurance = (@mass_disp / @endurance) * 0.89
	else if (@WType = 'AT-ST')
		set @mass_endurance = (@mass_disp / @endurance) * 1.11
	RETURN @mass_endurance  
	END
go	

Execution:
select test.MassEnduranceRatio('AT-ST')
select test.MassEnduranceRatio('AT-AT')




-- formattedJoin

go
	create FUNCTION test.formattedJoin(@var1 varchar, @var2 varchar, @var3 varchar)
	RETURNS varchar
AS
	BEGIN
	Declare @var4 varchar
	set @var4 = @var1 + @var3 + @var2
	RETURN @var4  
	END
go	

Execution:
select test.formattedJoin('Hello', 'World', ' ')



-- distanceTo

go
	create FUNCTION test.distanceTo(@x1 int, @x2 int, @y1 int, @y2 int)
	RETURNS float
AS
	BEGIN
	Declare @result float
	Declare @x float
	Declare @y float
	set @x = @x2 - @x1
	set @y = @y2 - @y1
	set @result = (@x * @x) + (@y * @y)
	RETURN @result
	END
go	

Execution:
select test.distanceTo(1,2,3,4)



-- STORED PRODEDURE

CREATE PROCEDURE WalkerOpSpecs(@WUID varchar)
   BEGIN
      create table AssignedWalkerTypeSpecs
      (
	      WalkerUnit varchar(100),
	      WTypeID varchar(20),
	      WType varchar(20),
	      cubic_disp decimal(10, 2),
  	      mass_disp decimal(10, 2),
  	      mass_endurance decimal(10, 2),
	      op_endurance decimal(10, 2),
	      troop_capacity int(10),
  	      WalkerCost decimal(10, 2),
      );

     declare @c float
     declare @m float
     declare @e float
     declare @a float
     declare @d float
     declare @id float
     declare @trp float
     declare @op float
     
     select @d = WID, @id = WalkerType from imperial_walker_assign iwt where WUID = @WUID
     
     select @op = op_range, @trp = TroopCapacity from imperial_walker_type iwt where WType = @id
     
     select @c = test.CubicDisplacement('AT-ST')
     select @m = test.MassDisplacement('AT-ST')
	 select @e = test.Endurance('AT-ST')
     select @a = test.MassEnduranceRatio('AT-ST')
     INSERT INTO AssignedWalkerTypeSpecs VALUES(@WUID, @d, @id, @c, @m, @e, @a, @op, @trp, 50);
   END;


exec WalkerOpSpecs(1)

