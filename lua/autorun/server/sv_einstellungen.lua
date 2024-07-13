
net.Receive("Reik.getplayerssettings", function(len, ply)
    local usernamee = net.ReadString()
    local settingsdatawithjson = file.Read("reik/datapad.json", "DATA")
    if not settingsdatawithjson then
        settingsdatawithjson = "[]"
    end
    
    local settingsdata = util.JSONToTable(settingsdatawithjson)
    local userExists = false

    for _, v in ipairs(settingsdata) do
        if v.username == usernamee then
            userExists = true
            break
        end
    end
    
    if userExists then
        playersttinegstoplayer(usernamee, ply)
    else
        local playerData = {
            username = usernamee,
            whitemode = true,
            transperenz = false,
        }
        
        table.insert(settingsdata, playerData)
        local newData = util.TableToJSON(settingsdata, true)
        file.Write("reik/datapad.json", newData)
        playersttinegstoplayer(usernamee, ply)
    end




end)

function playersttinegstoplayer(usernamee, ply)
    local settingsdatawithjson = file.Read("reik/datapad.json", "DATA")
    
    if not settingsdatawithjson then
        settingsdatawithjson = "[]"
    end
    local settingsdata = util.JSONToTable(settingsdatawithjson)
    local userExists = false
    for _, v in ipairs(settingsdata) do
        if v.username == usernamee then
            local userExists = true 
            if userExists then
                net.Start("Reik.getsettingsdata")
                    net.WriteBool(v.whitemode)
                    net.WriteBool(v.transperenz)
                net.Send(ply)
                net.Start("Reik.getsettingsdataforsettings")
                    net.WriteBool(v.whitemode)
                    net.WriteBool(v.transperenz)
                    net.WriteString(usernamee)
                net.Send(ply)
            end
            break
        end
    end
 

end

net.Receive("Reik.UpdateSetting", function ()
    local whitemodee = net.ReadBool()
    local transperenzz = net.ReadBool()
    local usernamee = net.ReadString()

    local settingsdatawithjson = file.Read("reik/datapad.json", "DATA")
    local settingsdata = util.JSONToTable(settingsdatawithjson)

    for _, v in ipairs(settingsdata) do
        if v.username == usernamee then
            v.whitemode = whitemodee
            v.transperenz = transperenzz

            local newData = util.TableToJSON(settingsdata, true)
            file.Write("reik/datapad.json", newData)
            return
        end
    end

    local playerData = {
        username = usernamee,
        whitemode = whitemodee,
        transperenz = transperenzz,
    }
    table.insert(settingsdata, playerData)
    local newData = util.TableToJSON(settingsdata, true)
    file.Write("reik/datapad.json", newData)
end)
