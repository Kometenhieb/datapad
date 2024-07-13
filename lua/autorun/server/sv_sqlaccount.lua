hook.Add("Initialize", "SQLDatapadaccounts", function (ply)
    --sql.Query("DROP TABLE Datapad_Accounts")
    if not sql.Query("SELECT * FROM Datapad_Accounts") then
        sql.Query("CREATE TABLE Datapad_Accounts (username TEXT, password TEXT, owner TEXT, defcon INT, account INT, befehle INT, officer INT, flotte INT, hacking INT, st INT, datenverwaltung INT, sicherheit INT)")
        sql.Query("INSERT INTO Datapad_Accounts (username, password, owner, defcon, account, befehle, officer, flotte, hacking, st, datenverwaltung, sicherheit) VALUES (".. sql.SQLStr("Admin") ..", ".. sql.SQLStr("Admin") ..",".. sql.SQLStr("Admin") .. ", 2, 2, 2, 2, 2, 2, 2, 2, 2)")
    end

    if not (file.Exists("reik", "DATA")) then
        file.CreateDir("reik")
    end
    
    if not (file.Exists("reik/datapad.json", "DATA")) then
        file.Write("reik/datapad.json", "{}")
    end
end)

