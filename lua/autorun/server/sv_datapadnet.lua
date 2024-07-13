
net.Receive("Reik.Usernameandpasswordcheck", function(len, ply)
    local username = net.ReadString()
    local password = net.ReadString()

    local passwordquerry = sql.Query("SELECT password FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    local defconquerry = sql.Query("SELECT defcon FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    local accountquerry = sql.Query("SELECT account FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    local befehlequerry = sql.Query("SELECT befehle FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))
    local officerquerry = sql.Query("SELECT officer FROM Datapad_Accounts WHERE username = " .. sql.SQLStr(username))

    if passwordquerry then
        local storedPassword = passwordquerry[1].password
        local defconpermision = defconquerry[1].defcon
        local accountpermision = accountquerry[1].account
        local befehlepermision = befehlequerry[1].befehle
        local officerpermision = officerquerry[1].officer

        if password ~= storedPassword then
            net.Start("Reik.passwordorusernamenotfound")
            net.Send(ply)
        end

        if password == storedPassword then
            net.Start("Reik.openrealdatapad")
             net.WriteString(tostring(defconpermision))
             net.WriteString(tostring(accountpermision))
             net.WriteString(tostring(befehlepermision))
             net.WriteString(tostring(officerpermision))
             net.WriteString(username)
            net.Send(ply)
        end
    else
        net.Start("Reik.passwordorusernamenotfound")
        net.Send(ply)
    end
end)
