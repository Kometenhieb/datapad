local screenhigh = ScrH()
local screenwide = ScrW()
local function sc(x)
    return x / 1080 * screenhigh
end

function Settingsmenu(username)

    net.Start("Reik.getplayerssettings")
        net.WriteString(username)
    net.SendToServer()


    net.Receive("Reik.getsettingsdataforsettings", function ()
        local whitemode = net.ReadBool()
        local transperenz = net.ReadBool()
        local username = net.ReadString()
        
        local whitemodesetttingsbutton = submitdatapadscroll:Add("DButton")
    whitemodesetttingsbutton:SetPos(sc(380), sc(30))
    whitemodesetttingsbutton:SetSize(185, 50)
    whitemodesetttingsbutton:SetText("")
    whitemodesetttingsbutton.Paint = function (self, w, h)
        surface.SetDrawColor(fontdatapad)
        surface.DrawOutlinedRect(0, 0, w, h)
        if whitemode == true then
            draw.SimpleText("Aus", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif whitemode == false then
            draw.SimpleText("An", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

    end

    whitemodesetttingsbutton.DoClick = function (self, w, h)
        if whitemode == true then
            whitemode = false
        else
            whitemode = true
        end
    end

    local transperenzesetttingsbutton = submitdatapadscroll:Add("DButton")
    transperenzesetttingsbutton:SetPos(sc(380), sc(120))
    transperenzesetttingsbutton:SetSize(185, 50)
    transperenzesetttingsbutton:SetText("")
    transperenzesetttingsbutton.Paint = function (self, w, h)
        surface.SetDrawColor(fontdatapad)
        surface.DrawOutlinedRect(0, 0, w, h)
        if transperenz == false then
            draw.SimpleText("Aus", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        elseif transperenz == true then
            draw.SimpleText("An", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

    end

    transperenzesetttingsbutton.DoClick = function (self, w, h)
        if transperenz == true then
            transperenz = false
        else
            transperenz = true
        end
    end

    local submitsetttingsbutton = submitdatapadscroll:Add("DButton")
    submitsetttingsbutton:SetPos(sc(210), sc(630))
    submitsetttingsbutton:SetSize(185, 60)
    submitsetttingsbutton:SetText("")
    submitsetttingsbutton.Paint = function (self, w, h)
        surface.SetDrawColor(fontdatapad)
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Einstellung ändern!", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    submitsetttingsbutton.DoClick = function (self, w, h)
        net.Start("Reik.UpdateSetting")
            net.WriteBool(whitemode)
            net.WriteBool(transperenz)
            net.WriteString(username)
        net.SendToServer()

    end
    
    end)

    mainmenudatapad:Close()
    settingsmenudatapad = vgui.Create("DFrame")
    settingsmenudatapad:SetTitle("")
    settingsmenudatapad:Dock(FILL)
    settingsmenudatapad:SetDraggable(false)
    settingsmenudatapad:ShowCloseButton(true)
    settingsmenudatapad:MakePopup()
    settingsmenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Settingsmenu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        -- Whitemode
        draw.RoundedBox(1, sc(660), sc(400), 560, 1, fontdatapad)
        draw.RoundedBox(1, sc(660), sc(330), 560, 1, fontdatapad)
        draw.RoundedBox(1, sc(660), sc(335), 1, 60, fontdatapad)
        draw.RoundedBox(1, sc(1220), sc(335), 1, 60, fontdatapad)
        draw.SimpleText("Transperenz", "VFSFont_28", sc(720), sc(440), fontdatapad, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)

        -- Transperenz
        draw.RoundedBox(1, sc(660), sc(420), 560, 1, fontdatapad)
        draw.RoundedBox(1, sc(660), sc(490), 560, 1, fontdatapad)
        draw.RoundedBox(1, sc(660), sc(425), 1, 60, fontdatapad)
        draw.RoundedBox(1, sc(1220), sc(425), 1, 60, fontdatapad)
        draw.SimpleText("Darkmode", "VFSFont_28", sc(720), sc(350), fontdatapad, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
    end

    local settingsdatapaddzurueckbutton = settingsmenudatapad:Add("DButton")
    settingsdatapaddzurueckbutton:SetSize(300, 60)
    settingsdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    settingsdatapaddzurueckbutton:SetText(" ")

    settingsdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    settingsdatapaddzurueckbutton.DoClick = function(self, w, h)
        settingsmenudatapad:Close()
        Mainmenu()
    end


    submitdatapadscroll = settingsmenudatapad:Add("DScrollPanel")
    submitdatapadscroll:SetSize(600, 700)
    submitdatapadscroll:SetPos(640, 310)
    submitdatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end


end

