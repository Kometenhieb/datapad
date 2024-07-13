local reason = "Freigang"
local Defcon = "Defcon 5"
personfordefcon = {}

net.Receive("Reik.Senddefcontotheserver", function (len, ply)
    Defcon = net.ReadString()
    reason = net.ReadString()
    local color  = net.ReadColor()
    local aktivweapon = ply:GetActiveWeapon():GetClass()
    local benutzername = net.ReadString()

    local defconquerry = sql.Query("SELECT defcon FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(benutzername))

    if defconquerry and aktivweapon == "sw_reikdatapadnew" then
        for i, ply in ipairs(player.GetAll()) do
            VoidLib.Notify(ply, "DEFCON SYSTEM", "Das Defcon wurde auf " .. Defcon .. " geändert", color, 5)
        end
        net.Start("Reik.updatedefcon")
         net.WriteString(Defcon)
         net.WriteString(reason)
        net.Broadcast()
        addplayerfordefcon(ply, benutzername)
    end
end)

hook.Add("PlayerSpawn","Defcontospawningplayer", function(ply, transition)
    timer.Simple(0.1, function ()
        net.Start("Reik.givedefcondata")
         net.WriteString(Defcon)
         net.WriteString(reason)
        net.Send(ply)
    end)
end)


function addplayerfordefcon(ply, benutzername)
    local personfordefconn = {
        username = benutzername,
        defcon = Defcon,
        reason = reason,
    }
    table.insert(personfordefcon, personfordefconn)
    net.Start("Reik.givelogdatadefcon")
     net.WriteTable(personfordefcon)
    net.Send(ply)
end