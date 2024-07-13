net.Receive("Reik.openrealdatapad", function ()
    authenikatiorframe:Close()
    defconpermisionfromnet = net.ReadString()
    accountpermisionfromnet = net.ReadString()
    befehlspermisionfromnet = net.ReadString()
    officerpermisionfromnet = net.ReadString()
    usernamefromnet = net.ReadString()
    Mainmenu(defconpermision, accountpermision, befehlspermision, officerpermision, username)
    net.Start("Reik.giveowner")
     net.WriteString(usernamefromnet)
    net.SendToServer()
    net.Start("Reik.getplayerssettings")
        net.WriteString(usernamefromnet)
    net.SendToServer()

end)

backgroundcolor = Color(151,151,163,93)
maincolor = Color(255, 255, 255)
fontdatapad = color_black


net.Receive("Reik.getsettingsdata", function ()
    local whitemode = net.ReadBool()
    local transperenz = net.ReadBool()
    if whitemode == false then
        backgroundcolor = Color(8,66,255,136)
        maincolor = Color(0, 0, 0)
        fontdatapad = color_white
    else
        backgroundcolor = Color(151,151,163,93)
        maincolor = Color(255, 255, 255)
        fontdatapad = color_black
    end
    if transperenz == true then
        local maincolorr = maincolor.r
        local maincolorg = maincolor.g
        local maincolorb = maincolor.b
        local maincolora = maincolor.a
        local newalphamaincolor = maincolora - 60
        maincolor = Color(maincolorr, maincolorg, maincolorb, newalphamaincolor)

        backgroundcolor = Color(122,125,128,136)
        local backgroundcolorr = backgroundcolor.r
        local backgroundcolorg = backgroundcolor.g
        local backgroundcolorb = backgroundcolor.b
        local backgroundcolora = backgroundcolor.a
        local newalphabackgroundcolor = backgroundcolora - 120
        backgroundcolor = Color(backgroundcolorr, backgroundcolorg, backgroundcolorb, newalphabackgroundcolor)
    elseif transperenz == true and whitemode == true then
        local maincolorr = maincolor.r
        local maincolorg = maincolor.g
        local maincolorb = maincolor.b
        local maincolora = maincolor.a
        local newalphamaincolor = maincolora - 250
        maincolor = Color(maincolorr, maincolorg, maincolorb, newalphamaincolor)

        local backgroundcolorr = backgroundcolor.r
        local backgroundcolorg = backgroundcolor.g
        local backgroundcolorb = backgroundcolor.b
        local backgroundcolora = backgroundcolor.a
        local newalphabackgroundcolor = backgroundcolora - 120
        backgroundcolor = Color(backgroundcolorr, backgroundcolorg, backgroundcolorb, newalphabackgroundcolor)
    end
end)


local screenhigh = ScrH()
local screenwide = ScrW()

local function sc(x)
    return x / 1080 * screenhigh
end


function Mainmenu()
    net.Start("Reik.getplayerssettings")
        net.WriteString(usernamefromnet)
    net.SendToServer()


    local defconpermision = defconpermisionfromnet
    local accountpermision = accountpermisionfromnet
    local befehlspermision = befehlspermisionfromnet
    local officerpermision = officerpermisionfromnet
    local username = usernamefromnet

    mainmenudatapad = vgui.Create("DFrame")
    mainmenudatapad:SetTitle("")
    mainmenudatapad:Dock(FILL)
    mainmenudatapad:SetDraggable(false)
    mainmenudatapad:ShowCloseButton(true)
    mainmenudatapad:MakePopup()
    mainmenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)
        
        draw.RoundedBox(25, w / 9.25, h / 8.1, 310, 100, backgroundcolor)
        draw.RoundedBox(25, w / 9, h / 7.8, 300, 90, maincolor)

        draw.SimpleText("Lexikon", "VFSFont_35", w / 2.05, sc(205), fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

    local datapadlexikonbutton = mainmenudatapad:Add("DButton")
    datapadlexikonbutton:SetSize(300, 60)
    datapadlexikonbutton:SetPos(screenwide /  2.4, sc(180))
    datapadlexikonbutton:SetText(" ")

    datapadlexikonbutton.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_white)
    end

    datapadlexikonbutton.DoClick = function(self, w, h)
        mainmenudatapad:Close()
        Datapadlexion()
    end


    local mainmenudatapadsettingsbutton = mainmenudatapad:Add("DButton")
    mainmenudatapadsettingsbutton:SetSize(300, 60)
    mainmenudatapadsettingsbutton:SetPos(screenwide /  9, screenhigh /  7.8)
    mainmenudatapadsettingsbutton:SetText(" ")

    mainmenudatapadsettingsbutton.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Settings", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadsettingsbutton.DoClick = function(self, w, h)
        Settingsmenu(username)
        mainmenudatapad:Close()
    end

    if defconpermision == "2" then
        local mainmenudatapaddefconbuttom = mainmenudatapad:Add("DButton")
        mainmenudatapaddefconbuttom:SetSize(300, 60)
        mainmenudatapaddefconbuttom:SetPos(screenwide /  9, screenhigh /  3.455)
        mainmenudatapaddefconbuttom:SetText(" ")

        mainmenudatapaddefconbuttom.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
            draw.SimpleText("Defcon", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        mainmenudatapaddefconbuttom.DoClick = function(self, w, h)
            Datapadmenu(username)
            mainmenudatapad:Close()
        end
    end
    if accountpermision == "2" then
        local mainmenudatapaddcreateuseraccountsbutton = mainmenudatapad:Add("DButton")
        mainmenudatapaddcreateuseraccountsbutton:SetSize(300, 60)
        mainmenudatapaddcreateuseraccountsbutton:SetPos(screenwide /  9, screenhigh /  2.9)
        mainmenudatapaddcreateuseraccountsbutton:SetText(" ")

        mainmenudatapaddcreateuseraccountsbutton.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
            draw.SimpleText("Accountverwaltung", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        mainmenudatapaddcreateuseraccountsbutton.DoClick = function(self, w, h)
            net.Start("Reik.Datapadopenaccountmenusv")
             net.WriteString(username)
            net.SendToServer()
            mainmenudatapad:Close()
        end
    end
    if befehlspermision == "2" then
        local mainmenudatapaddbefehlebutton = mainmenudatapad:Add("DButton")
        mainmenudatapaddbefehlebutton:SetSize(300, 60)
        mainmenudatapaddbefehlebutton:SetPos(screenwide /  9, screenhigh /  2.5)
        mainmenudatapaddbefehlebutton:SetText(" ")
    
        mainmenudatapaddbefehlebutton.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
            draw.SimpleText("Befehle", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
        mainmenudatapaddbefehlebutton.DoClick = function(self, w, h)
            befehleMainmenu(username)
            mainmenudatapad:Close()
        end
    end

    if officerpermision == "2" then
        local mainmenudatapadofficerbutton = mainmenudatapad:Add("DButton")
        mainmenudatapadofficerbutton:SetSize(300, 60)
        mainmenudatapadofficerbutton:SetPos(screenwide /  9, screenhigh /  2.19)
        mainmenudatapadofficerbutton:SetText(" ")
    
        mainmenudatapadofficerbutton.Paint = function(self, w, h)
            draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
            draw.SimpleText("Officer", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
    
        mainmenudatapadofficerbutton.DoClick = function(self, w, h)
            officerMainmenu()
            mainmenudatapad:Close()
        end
    end
    --[[
    local mainmenudatapadplatzhalt2button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt2button:SetSize(300, 60)
    mainmenudatapadplatzhalt2button:SetPos(screenwide /  9, screenhigh /  1.945)
    mainmenudatapadplatzhalt2button:SetText(" ")

    mainmenudatapadplatzhalt2button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt2button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt3button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt3button:SetSize(300, 60)
    mainmenudatapadplatzhalt3button:SetPos(screenwide /  9, screenhigh /  1.745)
    mainmenudatapadplatzhalt3button:SetText(" ")

    mainmenudatapadplatzhalt3button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt3button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt4button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt4button:SetSize(300, 60)
    mainmenudatapadplatzhalt4button:SetPos(screenwide /  9, screenhigh /  1.59)
    mainmenudatapadplatzhalt4button:SetText(" ")

    mainmenudatapadplatzhalt4button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt4button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt5button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt5button:SetSize(300, 60)
    mainmenudatapadplatzhalt5button:SetPos(screenwide /  9, screenhigh /  1.46)
    mainmenudatapadplatzhalt5button:SetText(" ")

    mainmenudatapadplatzhalt5button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt5button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt6button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt6button:SetSize(300, 60)
    mainmenudatapadplatzhalt6button:SetPos(screenwide /  9, screenhigh /  1.35)
    mainmenudatapadplatzhalt6button:SetText(" ")

    mainmenudatapadplatzhalt6button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt6button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt7button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt7button:SetSize(300, 60)
    mainmenudatapadplatzhalt7button:SetPos(screenwide /  9, screenhigh /  1.255)
    mainmenudatapadplatzhalt7button:SetText(" ")

    mainmenudatapadplatzhalt7button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt7button.DoClick = function(self, w, h)

    end

    local mainmenudatapadplatzhalt8button = mainmenudatapad:Add("DButton")
    mainmenudatapadplatzhalt8button:SetSize(300, 60)
    mainmenudatapadplatzhalt8button:SetPos(screenwide /  9, screenhigh /  1.172)
    mainmenudatapadplatzhalt8button:SetText(" ")

    mainmenudatapadplatzhalt8button.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, color_black)
        draw.SimpleText("Platzhalter", "VFSFont_35", 150, 40, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    mainmenudatapadplatzhalt8button.DoClick = function(self, w, h)

    end--]]

end


net.Receive("Reik.Datapadmainmenuopenerpersidemenues", function ()
    Mainmenu()
end)