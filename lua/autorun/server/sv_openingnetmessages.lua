-- net to open the Datapad
net.Receive("Reik.datapadopenmenufromweapon", function (len, ply)
    net.Start("Reik.Datapadopenmenu")
    net.Send(ply)
end)

net.Receive("Reik.Datapadopenaccountmenusv", function (len, ply)
    local username = net.ReadString()
    local accountquerry = sql.Query("SELECT account FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    local accountpermision = accountquerry[1].account

    if accountpermision == "1" then
        ply:Kick("Hör auf zu hacken!")
    else
        net.Start("Reik.Datapadopenaccountmenu")
        net.WriteString(username)
       net.Send(ply)
    end
end)

net.Receive("Reik.Datapadmainmenuopenerpersidemenuessv", function (len, ply)
    net.Start("Reik.Datapadmainmenuopenerpersidemenues")
    net.Send(ply)
end)

net.Receive("Reik.Opendefconmenucl", function (len, ply)
    local username = net.ReadString()
    net.Start("Reik.Opendefconmenu")
     net.WriteString(username)
    net.Send(ply)
end)