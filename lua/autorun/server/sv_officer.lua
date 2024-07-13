officerlogs = {}
xo = "N/A"
co = "N/A"
ao = "N/A"
net.Receive("Reik.giveowner", function ()
    local username = net.ReadString()
    local ownerquerry = sql.Query("SELECT owner FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    ownerrin = ownerquerry[1].owner   
end)


net.Receive("Reik.officerfromclientsite", function (len, ply)
    xo = net.ReadString()
    co = net.ReadString()
    ao = net.ReadString()

    if xo == nil then
        ao = "N/A " 
    end

    if co == nil then
        co = "N/A " 
    end

    if ao == nil then
        ao = "N/A " 
    end


    if ply:GetActiveWeapon():GetClass() == "sw_reikdatapadnew" then
        net.Start("Reik.officerfromsvtoclient")
         net.WriteString(xo)
         net.WriteString(co)
         net.WriteString(ao)
        net.Broadcast()
        for i, ply in ipairs(player.GetAll()) do
            VoidLib.Notify(ply, "Officer System", "Die Leitende Officere wurden Aktuallisiert!", Color(21, 255, 0), 5)
        end        
        addplayerforofficer()
    end
end)

hook.Add("PlayerSpawn","Defcontospawningplayer", function(ply, transition)
    timer.Simple(0.1, function ()
        net.Start("Reik.giveofficerdata")
         net.WriteString(xo)
         net.WriteString(co)
         net.WriteString(ao)
        net.Send(ply)
    end)
end)

function addplayerforofficer()
    local personforbefehle = {
        ownerr = ownerrin,
    } 
    table.insert(officerlogs, personforbefehle)
end

net.Receive("Reik.getofficerlogsdata", function (len, ply)
    net.Start("Reik.giveofficerlogsdata")
     net.WriteTable(officerlogs)
    net.Send(ply)
end)
