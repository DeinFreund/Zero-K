include "constants.lua"

local spSetUnitShieldState = Spring.SetUnitShieldState

--------------------------------------------------------------------------------
-- pieces
--------------------------------------------------------------------------------
local torso = piece 'torso' 
local lfirept = piece 'lfirept' 
local rbigflash = piece 'rbigflash' 
local nanospray = piece 'nanospray' 
local nanolathe = piece 'nanolathe' 
local luparm = piece 'luparm' 
local ruparm = piece 'ruparm' 
local pelvis = piece 'pelvis' 
local rthigh = piece 'rthigh' 
local lthigh = piece 'lthigh' 
local biggun = piece 'biggun' 
local lleg = piece 'lleg' 
local l_foot = piece 'l_foot' 
local rleg = piece 'rleg' 
local r_foot = piece 'r_foot' 
local head = piece 'head' 

smokePiece = {torso}
--------------------------------------------------------------------------------
-- constants
--------------------------------------------------------------------------------
local SIG_WALK = 1
local SIG_LASER = 2
local SIG_DGUN = 4
local SIG_RESTORE_LASER = 8
local SIG_RESTORE_DGUN = 16

local TORSO_SPEED_YAW = math.rad(300)
local ARM_SPEED_PITCH = math.rad(180)

local PACE = 1.6
local BASE_VELOCITY = UnitDefNames.corcom1.speed or 1.25*30
local VELOCITY = UnitDefs[unitDefID].speed or BASE_VELOCITY
PACE = PACE * VELOCITY/BASE_VELOCITY

local THIGH_FRONT_ANGLE = -math.rad(40)
local THIGH_FRONT_SPEED = math.rad(60) * PACE
local THIGH_BACK_ANGLE = math.rad(20)
local THIGH_BACK_SPEED = math.rad(60) * PACE
local SHIN_FRONT_ANGLE = math.rad(35)
local SHIN_FRONT_SPEED = math.rad(90) * PACE
local SHIN_BACK_ANGLE = math.rad(5)
local SHIN_BACK_SPEED = math.rad(90) * PACE

local ARM_FRONT_ANGLE = -math.rad(15)
local ARM_FRONT_SPEED = math.rad(22.5) * PACE
local ARM_BACK_ANGLE = math.rad(5)
local ARM_BACK_SPEED = math.rad(22.5) * PACE
--[[
local FOREARM_FRONT_ANGLE = -math.rad(15)
local FOREARM_FRONT_SPEED = math.rad(40) * PACE
local FOREARM_BACK_ANGLE = -math.rad(10)
local FOREARM_BACK_SPEED = math.rad(40) * PACE
]]--

local TORSO_ANGLE_MOTION = math.rad(8)
local TORSO_SPEED_MOTION = math.rad(15)*PACE

local RESTORE_DELAY_LASER = 4000
local RESTORE_DELAY_DGUN = 2500

--------------------------------------------------------------------------------
-- vars
--------------------------------------------------------------------------------
local isMoving, isLasering, isDgunning, gunLockOut, shieldOn = false, false, false, false, true

local flamers = {}
local wepTable = UnitDefs[unitDefID].weapons
wepTable.n = nil
for index, weapon in pairs(wepTable) do
	local weaponDef = WeaponDefs[weapon.weaponDef]
	if weaponDef.type == "Flame" or (weaponDef.customParams and weaponDef.customParams.flamethrower) then
		flamers[index] = true
	end
end
wepTable = nil

--------------------------------------------------------------------------------
-- funcs
--------------------------------------------------------------------------------
local function Walk()
	Signal(SIG_WALK)
	SetSignalMask(SIG_WALK)
	while true do
		--left leg up, right leg back
		Turn(lthigh, x_axis, THIGH_FRONT_ANGLE, THIGH_FRONT_SPEED)
		Turn(lleg, x_axis, SHIN_FRONT_ANGLE, SHIN_FRONT_SPEED)
		Turn(rthigh, x_axis, THIGH_BACK_ANGLE, THIGH_BACK_SPEED)
		Turn(rleg, x_axis, SHIN_BACK_ANGLE, SHIN_BACK_SPEED)
		if not(isLasering or isDgunning) then
			--left arm back, right arm front
			Turn(torso, y_axis, TORSO_ANGLE_MOTION, TORSO_SPEED_MOTION)
			Turn(luparm, x_axis, ARM_BACK_ANGLE, ARM_BACK_SPEED)
			Turn(ruparm, x_axis, ARM_FRONT_ANGLE, ARM_FRONT_SPEED)
		end
		WaitForTurn(lthigh, x_axis)
		Sleep(0)
		
		--right leg up, left leg back
		Turn(lthigh, x_axis,  THIGH_BACK_ANGLE, THIGH_BACK_SPEED)
		Turn(lleg, x_axis, SHIN_BACK_ANGLE, SHIN_BACK_SPEED)
		Turn(rthigh, x_axis, THIGH_FRONT_ANGLE, THIGH_FRONT_SPEED)
		Turn(rleg, x_axis, SHIN_FRONT_ANGLE, SHIN_FRONT_SPEED)
		if not(isLasering or isDgunning) then
			--left arm front, right arm back
			Turn(torso, y_axis, -TORSO_ANGLE_MOTION, TORSO_SPEED_MOTION)
			Turn(luparm, x_axis, ARM_FRONT_ANGLE, ARM_FRONT_SPEED)
			Turn(ruparm, x_axis, ARM_BACK_ANGLE, ARM_BACK_SPEED)
		end
		WaitForTurn(rthigh, x_axis)		
		Sleep(0)
	end
end

local function RestoreLegs()
	Move( pelvis , y_axis, 0 , 1 )
	Turn( rthigh , x_axis, 0, math.rad(200) )
	Turn( rleg , x_axis, 0, math.rad(200) )
	Turn( lthigh , x_axis, 0, math.rad(200) )
	Turn( lleg , x_axis, 0, math.rad(200) )
end


function script.Create()
	Hide( lfirept)
	Hide( rbigflash)
	Hide( nanospray)
	
	Turn( luparm , x_axis, math.rad(30) )
	Turn( ruparm , x_axis, math.rad(-10) )
	Turn( biggun , x_axis, math.rad(41) )
	Turn( nanolathe , x_axis, math.rad(36) )
	
	StartThread(SmokeUnit)
end

function script.StartMoving() 
	isMoving = true
	StartThread(Walk)
end

function script.StopMoving() 
	isMoving = false
	Signal(SIG_WALK)
	RestoreLegs()
end

function script.AimFromWeapon(num)
	return torso
end

function script.QueryWeapon(num)
	if num == 3 then
		return rbigflash
	elseif num == 2 or num == 4 then
		return torso
	else
		return lfirept
	end
end

function script.FireWeapon(num) 
	if num == 5 then
		EmitSfx( lfirept,  1024 )
	elseif num == 3 then
		EmitSfx( rbigflash,  1026 )
	end
end

function script.Shot(num) 
	if num == 5 then
		EmitSfx( lfirept,  1025 )
	elseif num == 3 then
		EmitSfx( rbigflash,  1027 )
	end
	if flamers[num] then
		GG.LUPS.FlameShot(unitID, unitDefID, _, num)
	end	
end

local function RestoreLaser()
	Signal( SIG_RESTORE_LASER)
	SetSignalMask( SIG_RESTORE_LASER)
	Sleep(RESTORE_DELAY_LASER)
	isLasering = false
	Turn( luparm , x_axis, 0, ARM_SPEED_PITCH )
	Turn( biggun , x_axis, math.rad(41), ARM_SPEED_PITCH  )
	if not isDgunning then 
		Turn( torso , y_axis, 0, TORSO_SPEED_YAW) 
	end
end

local function RestoreDgun()
	Signal( SIG_RESTORE_DGUN)
	SetSignalMask( SIG_RESTORE_DGUN)
	Sleep(RESTORE_DELAY_DGUN)
	isDgunning = false
	Turn( ruparm , x_axis, 0, ARM_SPEED_PITCH )
	Turn( nanolathe , x_axis, math.rad(36), ARM_SPEED_PITCH )
	if not isLasering then 
		Turn( torso , y_axis, 0, TORSO_SPEED_YAW) 
	end
end

function script.AimWeapon(num, heading, pitch)
	if num >= 5 then
		Signal( SIG_LASER)
		SetSignalMask( SIG_LASER)
		isLasering = true
		if not isDgunning then 
			Turn( torso , y_axis, heading, TORSO_SPEED_YAW )
		end
		Turn( luparm , x_axis, math.rad(0) - pitch, ARM_SPEED_PITCH )
		Turn( nanolathe , x_axis, math.rad(0) , ARM_SPEED_PITCH )
		WaitForTurn(torso, y_axis)
		WaitForTurn(luparm, x_axis)
		StartThread(RestoreLaser)
		return true
	elseif num == 3 then
		Signal( SIG_DGUN)
		SetSignalMask( SIG_DGUN)
		isDgunning = true
		Turn( torso , y_axis, heading, TORSO_SPEED_YAW )
		Turn( ruparm , x_axis, math.rad(0) - pitch, ARM_SPEED_PITCH )
		Turn( biggun , x_axis, math.rad(0) , ARM_SPEED_PITCH )
		WaitForTurn(torso, y_axis)
		WaitForTurn(ruparm, x_axis)
		StartThread(RestoreDgun)
		return true
	elseif num == 2 or num == 4 then
		Sleep(100)
		return (shieldOn)
	end
	return false
end

function script.StopBuilding()
	SetUnitValue(COB.INBUILDSTANCE, 0)
	Turn( ruparm , x_axis, 0, ARM_SPEED_PITCH )
	if not (isLasering or isDgunning) then Turn(torso, y_axis, 0 ,TORSO_SPEED_YAW) end
end

function script.StartBuilding(heading, pitch) 
	Turn( ruparm , x_axis, math.rad(-30) - pitch, ARM_SPEED_PITCH )
	if not (isDgunning) then Turn(torso, y_axis, heading, TORSO_SPEED_YAW) end
	SetUnitValue(COB.INBUILDSTANCE, 1)
end

function script.QueryNanoPiece()
	GG.LUPS.QueryNanoPiece(unitID,unitDefID,Spring.GetUnitTeam(unitID),rbigflash)
	return rbigflash
end

function script.Activate()
	--spSetUnitShieldState(unitID, 2, true)
end

function script.Deactivate()
	--spSetUnitShieldState(unitID, 2, false)
end

function script.Killed(recentDamage, maxHealth)
	local severity = recentDamage/maxHealth
	if severity < 0.5 then
		Explode(torso, sfxNone)
		Explode(luparm, sfxNone)
		Explode(ruparm, sfxNone)
		Explode(pelvis, sfxNone)
		Explode(lthigh, sfxNone)
		Explode(rthigh, sfxNone)
		Explode(nanospray, sfxNone)
		Explode(biggun, sfxNone)
		Explode(lleg, sfxNone)
		Explode(rleg, sfxNone)
		return 1
	else
		Explode(torso, sfxShatter)
		Explode(luparm, sfxSmoke + sfxFire + sfxExplode)
		Explode(ruparm, sfxSmoke + sfxFire + sfxExplode)
		Explode(pelvis, sfxShatter)
		Explode(lthigh, sfxShatter)
		Explode(rthigh, sfxShatter)
		Explode(nanospray, sfxSmoke + sfxFire + sfxExplode)
		Explode(biggun, sfxSmoke + sfxFire + sfxExplode)
		Explode(lleg, sfxShatter)
		Explode(rleg, sfxShatter)
		Explode(head, sfxSmoke + sfxFire)
		return 2
	end
end