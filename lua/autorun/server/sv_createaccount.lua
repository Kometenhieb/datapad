net.Receive("Reik.Datapadcreatenewaccount", function (len, ply)
    local usernamepercreate = net.ReadString()
    local ownerpercreate = net.ReadString()
    local passwordpercreate = net.ReadString()
    local accountcreationpermisionpercreate = tonumber(net.ReadString())
    local defconpermisionpercreate = tonumber(net.ReadString())
    local befehlepermisionpercreate = tonumber(net.ReadString())
    local officerpermisionpercreate = tonumber(net.ReadString())
    local existingusernames = sql.Query("SELECT username FROM Datapad_Accounts")

   if existingusernames == nil then
        print("Fehler bei der Datenbankabfrage ")
        return
   end

    local userExists = false

    for _, row in ipairs(existingusernames) do
        if row.username == usernamepercreate then
            userExists = true
            break
        end
    end

    if userExists then
        net.Start("Reik.Usernameexistforcreatenewaccount")
        net.Send(ply)
    elseif ply:GetActiveWeapon():GetClass() == "sw_reikdatapadnew" then
        net.Start("Reik.Accountcreationsubmit")
        net.Send(ply)
        sql.Query("INSERT INTO Datapad_Accounts (username, password, owner, defcon, account, befehle, officer) VALUES (".. sql.SQLStr(usernamepercreate) ..", ".. sql.SQLStr(passwordpercreate) ..",".. sql.SQLStr(ownerpercreate) .. "," .. defconpermisionpercreate ..", "..accountcreationpermisionpercreate .. "," .. befehlepermisionpercreate .. " ,".. officerpermisionpercreate ..")")
    end
end)


net.Receive("Reik.getalluserersforaccountmanage", function (len, ply)
    local existingusernames = sql.Query("SELECT username FROM Datapad_Accounts")
    if existingusernames == nil then
        print("Fehler bei der Datenbankabfrage ")
        return
    end
    net.Start("Reik.getalluserersforaccountmanageforcl")
     net.WriteTable(existingusernames)
    net.Send(ply)

end)


net.Receive("Reik.deleteaccountpermenu", function (len, ply)
    local username = net.ReadString()
    local usernamefrompersonwhodelete = net.ReadString()
    local accountquerry = sql.Query("SELECT account FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(usernamefrompersonwhodelete))

    if accountquerry and ply:GetActiveWeapon():GetClass() == "sw_reikdatapadnew" then
        local deleteQuery = "DELETE FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username)
        local result = sql.Query(deleteQuery)
        net.Start("Reik.refreshtheaccountmanagment")
        net.Send(ply)
    else
        ply:Kick("Reik!")
    end
end)