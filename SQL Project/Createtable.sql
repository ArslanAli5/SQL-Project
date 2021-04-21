CREATE database test1;
use test1;

CREATE TABLE imperial_walker_type (
    WTypeID varchar(30),
    WType varchar(30),
    Height float,
    Lenght float,
    Width float,
    Weight float,
    crew int,
    TroopCapacity int,
    MaximumSpeed float,
    OpRange float
);

CREATE TABLE Imperial_walkers_assign(
	WID varchar(30),
    WUID varchar(30),
    WalkerType varchar(30),
    Status varchar(30)
);

CREATE TABLE walker_units (
	WUID varchar(30),
    BattleGroup varchar(30),
    Location_X int,
    Location_Y int
);
CREATE TABLE imperial_bettlegroup (
	BGID varchar(30),
    Designation varchar(30),
    HQ_LocationX varchar(30),
    HQ_LocationY varchar(30)
);
    
