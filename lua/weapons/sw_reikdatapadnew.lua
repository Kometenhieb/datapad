if ( SERVER ) then
	AddCSLuaFile( "sw_reikdatapadnew.lua" )
	SWEP.HoldType = "slam"
end

if ( CLIENT ) then
	SWEP.PrintName = "Datapad"
	SWEP.Author = "Reik"
	SWEP.Contact = ""
	SWEP.Purpose = "Datapad"
	SWEP.Instructions = "Datapad"
	SWEP.Slot = 1
	SWEP.SlotPos = 1
	SWEP.DrawAmmo = false					 

end

SWEP.Category = "Datapadstuff"

SWEP.Spawnable= true
SWEP.AdminSpawnable= true
SWEP.AdminOnly = false

SWEP.ViewModelFOV = 50
SWEP.ViewModel = "models/swcw_items/sw_datapad_v.mdl" 
SWEP.WorldModel = "models/swcw_items/sw_datapad.mdl"
SWEP.ViewModelFlip = false

SWEP.AutoSwitchTo = false
SWEP.AutoSwitchFrom = false

SWEP.UseHands = true

SWEP.HoldType = "slam" 

SWEP.FiresUnderwater = false

SWEP.DrawCrosshair = false

SWEP.DrawAmmo = false

SWEP.Base = "weapon_base"

SWEP.Primary.Damage = 0
SWEP.Primary.ClipSize = -1 
SWEP.Primary.Delay = 0
SWEP.Primary.DefaultClip = -1 
SWEP.Primary.Automatic = false 
SWEP.Primary.Ammo = "none" 

SWEP.Secondary.ClipSize = -1 
SWEP.Secondary.DefaultClip = -1 
SWEP.Secondary.Damage = 0 
SWEP.Secondary.Automatic = false 	 
SWEP.Secondary.Ammo = "none" 

function SWEP:Initialize() 
    self:SetWeaponHoldType( "slam" )
end 

function SWEP:PrimaryAttack()
	if CLIENT then
    	net.Start("Reik.datapadopenmenufromweapon")
		net.SendToServer()
	end
	self:SetNextPrimaryFire(CurTime() + 1)
end
	
function SWEP:SecondaryAttack()
end

function SWEP:Reload() 
end

