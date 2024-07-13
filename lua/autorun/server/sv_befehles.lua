local befehllogs = befehllogs or {}

local function addplayerforbefehlee(overeason, reason, ownerrforbefehl)
    local personforbefehle = {
        overeasontable = overeason,
        resontable = reason,
        ownerforbefehl = ownerrforbefehl,
    } 
    table.insert(befehllogs, personforbefehle)
end

net.Receive("Reik.givedataforannocment", function (len, ply)
    local overeason = net.ReadString()
    local reason = net.ReadString()
    local time = tonumber(net.ReadString())
    local color = net.ReadColor()
    local username = net.ReadString()
    local ownerquerry = sql.Query("SELECT owner FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    
    if not ownerquerry or not ownerquerry[1] then
        print("Owner query failed or no results found")
        return
    end
    
    local ownerrforbefehl = ownerquerry[1].owner
    if ply:GetActiveWeapon():GetClass() == "sw_reikdatapadnew" then
        for _, player in ipairs(player.GetAll()) do
            VoidLib.Notify(player, overeason, reason, color, time)
        end
        net.Start("Reik.soundannocmant")
        net.Broadcast()
        addplayerforbefehlee(overeason, reason, ownerrforbefehl)
        net.Start("Reik.givelogdatabefehle")
        net.WriteTable(befehllogs)
        net.Send(ply)
    end
end)
