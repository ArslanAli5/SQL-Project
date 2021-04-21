 -- CubicDisplacement

delimiter $$
CREATE function test1.CubicDisplacement(WType1 varchar(30))
    returns float
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        declare iter int;
		Declare len int;
		Declare width int;
        Declare height int;
		Declare cubic_disp float;
		declare mycur cursor for select iwt.Lenght, iwt.Width, iwt.Height from imperial_walker_type as iwt where iwt.WType = WType1;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        set iter = 0;
        open mycur;

        read_loop: loop
            fetch mycur into len, width, height;
            IF done THEN
                LEAVE read_loop;
			elseif (WType1 = 'AT-AT') then
				set cubic_disp = len * height * width * 0.016;
			elseif (WType1 = 'AT-ST') then
				set cubic_disp =  len * height * width * 0.12;     
		end if;            
        END loop;
    close mycur;
	RETURN cubic_disp; 
END;
$$
delimiter ;

-- MassDisplacement

delimiter $$
create FUNCTION test1.MassDisplacement(WType varchar(30))
RETURNS float
	BEGIN
    
	Declare mass_disp float;
	Declare cubic_disp float;

	set cubic_disp = test1.CubicDisplacement(WType);

	if (WType = 'AT-AT') then
		set mass_disp = cubic_disp * 64;
	elseif (WType = 'AT-ST') then
		set mass_disp = cubic_disp * 72;
	end if;
	RETURN mass_disp ; 
END;
$$
delimiter ;

-- Endurance
delimiter $$
CREATE function test1.Endurance(WType1 varchar(30))
    returns float
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        declare iter int;
		Declare oprange float;
		Declare max_speed float;
		Declare endurance float;
		Declare mass_disp float;	
		declare mycur cursor for select iwt.MaximumSpeed , iwt.OpRange from imperial_walker_type as iwt where iwt.WType = WType1;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        set iter = 0;
        set mass_disp = test1.MassDisplacement(WType1);
        open mycur;

        read_loop: loop
            fetch mycur into max_speed, oprange;
            IF done THEN
                LEAVE read_loop;
			elseif (WType1 = 'AT-AT') then
				set endurance = (oprange / max_speed) * mass_disp * 0.75;
			elseif (WType1 = 'AT-ST') then
				set endurance = (oprange / max_speed) * mass_disp * 0.35;     
		end if;            
        END loop;
    close mycur;
	RETURN endurance; 
END;
$$
delimiter ;

-- MassEnduranceRatio
delimiter $$
create FUNCTION test1.MassEnduranceRatio(WType varchar(30))
RETURNS float
BEGIN		
	Declare mass_endurance float;
	Declare mass_disp float;
	Declare endurance float;
			
	set mass_disp = test1.MassDisplacement(WType);
	
	set endurance = test1.Endurance(WType);
	if (WType = 'AT-AT') then
		set mass_endurance = (mass_disp / endurance) * 0.89;
	elseif (WType = 'AT-ST') then
		set mass_endurance = (mass_disp / endurance) * 1.11;
	end if;
	RETURN mass_endurance;  
END;
$$


-- formattedJoin

Delimiter $$
create FUNCTION test1.formattedJoin(var1 varchar(30), var2 varchar(30), var3 varchar(30))
RETURNS varchar(30)
BEGIN
	Declare var4 varchar(30);
	set var4 = var1 + var3 + var2;
	RETURN var4;  
END;
$$
delimiter ;

-- distanceTo

delimiter $$
create FUNCTION test1.distanceTo(x1 int, x2 int, y1 int, y2 int)
RETURNS float
BEGIN
	Declare result float;
	Declare x float;
	Declare y float;
	set x = x2 - x1;
	set y = y2 - y1;
	set result = (x * x) + (y * y);
	RETURN result;
END;
$$
delimiter ;



 -- WalkerType

delimiter $$
CREATE function test1.WalkerType(WUID varchar(30))
    returns varchar(20)
    BEGIN
        DECLARE done INT DEFAULT FALSE;
        declare iter int;
        declare id varchar(20);
		declare mycur cursor for select WalkerType from imperial_walkers_assign where WUID = WUID;
		DECLARE CONTINUE HANDLER FOR NOT FOUND SET done = TRUE;
        set iter = 0;
        open mycur;
        read_loop: loop
            fetch mycur into id;
            IF done THEN
                LEAVE read_loop;    
		end if;            
        END loop;
    close mycur;
	RETURN id; 
END;
$$
delimiter ;

 -- TroopCapacity

delimiter $$
CREATE function test1.TroopCapacity(WUID varchar(30))
    returns int (11)
    BEGIN
		declare iter int;
        declare TroopCapacity1 int(11);
		select TroopCapacity into TroopCapacity1 from imperial_walker_type where WType = test1.WalkerType(WUID);
	RETURN TroopCapacity1; 
END;
$$
delimiter ;

 -- OpRange

delimiter $$
CREATE function test1.OpRange(WUID varchar(30))
    returns float
    BEGIN
        declare OpRange1 float;
		select OpRange into OpRange1 from imperial_walker_type where WType = test1.WalkerType(WUID);
	RETURN OpRange1; 
END;
$$
delimiter ;

 -- WID

delimiter $$
CREATE function test1.WID(WUID varchar(30))
    returns varchar(30)
    BEGIN
        declare WID1 varchar(30);
        select WID into WID1 from imperial_walkers_assign where WUID = WUID limit 1;
	RETURN WID1; 
END;
$$
delimiter ;




-- STORED PRODEDURE
   DELIMITER //

   CREATE PROCEDURE test1.WalkerOpSpecs (WUID varchar(30))
   BEGIN
     declare c float;
     declare m float;
     declare e float;
     declare a float;
     declare d varchar(30);
     declare id varchar(30);
     declare trp float;
     declare op float;
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
  	      WalkerCost decimal(10, 2)
		);       
	 set d = test1.WID(WUID);
	 set id = test1.WalkerType(WUID);
	 set op = test1.OpRange(WUID);
     set trp = test1.TroopCapacity(WUID);
     set c = test1.CubicDisplacement('AT-ST');
     set m = test1.MassDisplacement('AT-ST');
	 set e = test1.Endurance('AT-ST');
     set a = test1.MassEnduranceRatio('AT-ST');       
     INSERT INTO AssignedWalkerTypeSpecs VALUES(WUID, d, id, c, m, e, a, op, trp);
     Select * from AssignedWalkerTypeSpecs;

   END; //

   DELIMITER ;



