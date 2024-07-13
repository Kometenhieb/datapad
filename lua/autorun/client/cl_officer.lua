officerlogsmenu = false
officermenu = false
local screenhigh = ScrH()
local screenwide = ScrW()
local function sc(x)
    return x / 1080 * screenhigh
end
xo = "N/A "
co = "N/A "
ao = "N/A "

officerlogs = {}


net.Receive("Reik.giveofficerlogsdata", function ()
    officerlogs = net.ReadTable()
end)

function officerMainmenu(username)
    net.Start("Reik.getofficerlogsdata")
    net.SendToServer()
    officerlogsmenu = false
    officermenu = true

    officermenudatapad = vgui.Create("DFrame")
    officermenudatapad:SetTitle("")
    officermenudatapad:Dock(FILL)
    officermenudatapad:SetDraggable(false)
    officermenudatapad:ShowCloseButton(true)
    officermenudatapad:MakePopup()
    officermenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Officer", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)


    end

    local officerdatapaddzurueckbutton = officermenudatapad:Add("DButton")
    officerdatapaddzurueckbutton:SetSize(300, 60)
    officerdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    officerdatapaddzurueckbutton:SetText(" ")

    officerdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    officerdatapaddzurueckbutton.DoClick = function(self, w, h)
        officermenudatapad:Close()
        Mainmenu()
    end


    local officerbuttom = officermenudatapad:Add("DButton")
    officerbuttom:SetSize(300, 60)
    officerbuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    officerbuttom:SetText(" ")

    officerbuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Officer", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    officerbuttom.DoClick = function(self, w, h)
        if not officermenu == true then
            officerlogsmenudatapad:Close()
            officerMainmenu()
        end
    end

    local officerlogsnmainmenu = officermenudatapad:Add("DButton")
    officerlogsnmainmenu:SetSize(300, 60)
    officerlogsnmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    officerlogsnmainmenu:SetText(" ")

    officerlogsnmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Officer Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    officerlogsnmainmenu.DoClick = function(self, w, h)
        if not officerlogsmenu == true then
            officermenudatapad:Close()
            officerlogsMainmenu()
        end
    end

    local executivofficercombobox = officermenudatapad:Add("DComboBox") 
    executivofficercombobox:SetPos( sc(800), sc(330) )
    executivofficercombobox:SetSize( 300, 70 )
    executivofficercombobox:SetValue("Executiv Officer")
    executivofficercombobox:SetTextColor(fontdatapad)
    executivofficercombobox:SetDrawBackground(true)
    executivofficercombobox.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor())
    end

    for k, ply in ipairs(player.GetAll()) do
        executivofficercombobox:AddChoice( ply:Nick() )
    end

    local commandingofficercombobox = officermenudatapad:Add("DComboBox") 
    commandingofficercombobox:SetPos( sc(800), sc(430) )
    commandingofficercombobox:SetSize( 300, 70 )
    commandingofficercombobox:SetValue("Commanding Officer")
    commandingofficercombobox:SetTextColor(fontdatapad)
    commandingofficercombobox:SetDrawBackground(true)
    commandingofficercombobox.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor())
    end

    for k, ply in ipairs(player.GetAll()) do
        commandingofficercombobox:AddChoice( ply:Nick() )
    end

    local administrativeofficercombobox = officermenudatapad:Add("DComboBox") 
    administrativeofficercombobox:SetPos( sc(800), sc(530) )
    administrativeofficercombobox:SetSize( 300, 70 )
    administrativeofficercombobox:SetValue("Administration Officer")
    administrativeofficercombobox:SetTextColor(fontdatapad)
    administrativeofficercombobox:SetDrawBackground(true)
    administrativeofficercombobox.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor())
    end

    for k, ply in ipairs(player.GetAll()) do
        administrativeofficercombobox:AddChoice(ply:Nick() )
    end

    local submitbutton = officermenudatapad:Add("DButton")
    submitbutton:SetPos(sc(880), sc(650))
    submitbutton:SetSize(125, 30)
    submitbutton:SetText("")
    submitbutton.Paint = function (self, w, h)
        surface.SetDrawColor(Color(0, 255, 51))
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Abschicken!", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    submitbutton.DoClick = function (self, w, h)
        xoo = executivofficercombobox:GetSelected()
        coo = commandingofficercombobox:GetSelected()
        aoo = administrativeofficercombobox:GetSelected()

        if coo == nil then 
            coo = "N/A"
        end
        if xoo == nil then 
            xoo = "N/A" 
        end
        if aoo == nil then
            aoo = "N/A"
        end


        net.Start("Reik.officerfromclientsite")
         net.WriteString(xoo)
         net.WriteString(coo)
         net.WriteString(aoo)
        net.SendToServer()



    end

end

net.Receive("Reik.officerfromsvtoclient", function ()
    xo = net.ReadString()
    co = net.ReadString()
    ao = net.ReadString()
end)

net.Receive("Reik.giveofficerdata", function ()
    xo = net.ReadString()
    co = net.ReadString()
    ao = net.ReadString()
end)

hook.Add("HUDPaint", "Reik.Officersystem", function()
    local textleng = surface.GetTextSize("CO: " .. co .. "| XO: " .. xo .. "| AO: " .. ao)
    draw.RoundedBox(5, 5, 5, textleng, 27, Color(57, 54, 54, 180))
    draw.SimpleText("CO: " .. co .. "| XO: " .. xo .. "| AO: " .. ao, "VFSFont_22", sc(10), sc(10), color_white, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
end)

function officerlogsMainmenu()
    officerlogsmenu = true
    officermenu = false

    officerlogsmenudatapad = vgui.Create("DFrame")
    officerlogsmenudatapad:SetTitle("") 
    officerlogsmenudatapad:Dock(FILL)
    officerlogsmenudatapad:SetDraggable(false)
    officerlogsmenudatapad:ShowCloseButton(true)
    officerlogsmenudatapad:MakePopup()
    officerlogsmenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Officer Logs", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

    end

    local officerdatapaddzurueckbutton = officerlogsmenudatapad:Add("DButton")
    officerdatapaddzurueckbutton:SetSize(300, 60)
    officerdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    officerdatapaddzurueckbutton:SetText(" ")

    officerdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    officerdatapaddzurueckbutton.DoClick = function(self, w, h)
        officerlogsmenudatapad:Close()
        Mainmenu()
    end


    local officerbuttom = officerlogsmenudatapad:Add("DButton")
    officerbuttom:SetSize(300, 60)
    officerbuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    officerbuttom:SetText(" ")

    officerbuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Officer", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    officerbuttom.DoClick = function(self, w, h)
        if not officermenu == true then
            officerlogsmenudatapad:Close()
            officerMainmenu()
        end
    end

    local officerlogsnmainmenu = officerlogsmenudatapad:Add("DButton")
    officerlogsnmainmenu:SetSize(300, 60)
    officerlogsnmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    officerlogsnmainmenu:SetText(" ")

    officerlogsnmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Officer Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    officerlogsnmainmenu.DoClick = function(self, w, h)
        if not officerlogsmenu == true then
            officermenudatapad:Close()
            officerlogsMainmenu()
        end
    end
    officerlogsdatapadscroll = officerlogsmenudatapad:Add("DScrollPanel")
    officerlogsdatapadscroll:SetSize(600, 700)
    officerlogsdatapadscroll:SetPos(640, 310)
    officerlogsdatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end
    officerScrollPanel()
end


function officerScrollPanel()
    local yoffset = 0
    for _, row in pairs(officerlogs) do
        local panelforlogsofficer = officerlogsdatapadscroll:Add("DPanel")
        panelforlogsofficer:SetSize(600, 50)
        panelforlogsofficer:SetPos(0, yoffset)
        panelforlogsofficer.Paint = function(self, w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(205, 194, 194, 160))
            draw.SimpleText("Owner: " .. row.ownerr, "VFSFont_20", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        yoffset = yoffset + 60 -- Adjust the spacing as needed
    end
end