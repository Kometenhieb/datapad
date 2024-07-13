
local screenhigh = ScrH()
local screenwide = ScrW()
local function sc(x)
    return x / 1080 * screenhigh
end
defconmainmenu = false
defconlogs = false
local defconname = "Defcon 5"
local description = "Freigang"
local tempdefcon = "Defcon 5"
defconlogstablee = {}

net.Receive("Reik.givelogdatadefcon", function ()
    defconlogstablee = net.ReadTable()
end)

function Datapadmenu(benutzername)
    local reik = benutzername -- Move this line here to ensure 'reik' is initialized correctly
    defconmainmenu = true
    defconlogs = false
    defcondatapadmenu = vgui.Create("DFrame")
    defcondatapadmenu:SetTitle("")
    defcondatapadmenu:Dock(FILL)
    defcondatapadmenu:SetDraggable(false)
    defcondatapadmenu:ShowCloseButton(true)
    defcondatapadmenu:MakePopup()
    defcondatapadmenu.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Defcon", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)
    end

    local defcomdatapaddzurueckbutton = defcondatapadmenu:Add("DButton")
    defcomdatapaddzurueckbutton:SetSize(300, 60)
    defcomdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    defcomdatapaddzurueckbutton:SetText(" ")

    defcomdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    defcomdatapaddzurueckbutton.DoClick = function(self, w, h)
        defcondatapadmenu:Close()
        Mainmenu()
    end

    local defconbuttondefcon = defcondatapadmenu:Add("DButton")
    defconbuttondefcon:SetSize(300, 60)
    defconbuttondefcon:SetPos(screenwide /  9, screenhigh /  3.455)
    defconbuttondefcon:SetText(" ")

    defconbuttondefcon.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Defcon", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    defconbuttondefcon.DoClick = function(self, w, h)
        if not defconmainmenu == true then
            defconlogsdatapadmenu:Close()
            Datapadmenu(reik)
        end
    end

    local defconbuttonlogs = defcondatapadmenu:Add("DButton")
    defconbuttonlogs:SetSize(300, 60)
    defconbuttonlogs:SetPos(screenwide /  9, screenhigh /  2.9)
    defconbuttonlogs:SetText(" ")

    defconbuttonlogs.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Defcon Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    defconbuttonlogs.DoClick = function(self, w, h)
        if not defconlogs == true then
            defcondatapadmenu:Close()
            Datapadlogsmenu(reik)
        end
    end

    local defconswitcher = defcondatapadmenu:Add("DComboBox") 
    defconswitcher:SetPos(sc(865), sc(330))
    defconswitcher:SetSize(150, 70)
    defconswitcher:SetValue(tempdefcon)
    defconswitcher:SetTextColor(fontdatapad)

    for k, v in pairs(Reik.defconconfig.defcon) do
        defconswitcher:AddChoice(v.defconname)
    end

    defconswitcher.Paint = function (self, w, h)
        for k, v in pairs(Reik.defconconfig.defcon) do
            if tempdefcon == v.defconname then
                color = v.color
                draw.RoundedBox(40, 0, 0, 150, 70, color)
            end
        end
    end

    function defconswitcher:OnSelect(index, text, data)
        tempdefcon = text
        defcondatapadmenu:Close()
        Datapadmenu(reik)
    end

    local reasontextEntry = defcondatapadmenu:Add("DTextEntry") 
    reasontextEntry:SetPos(sc(790), sc(420))
    reasontextEntry:SetSize(300, 60)
    reasontextEntry:SetMultiline(false)
    reasontextEntry:SetFont("VFSFont_27")
    reasontextEntry:SetTextColor(fontdatapad)
    reasontextEntry:SetDrawBackground(true)
    reasontextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end
    for k, v in pairs(Reik.defconconfig.defcon) do
        if tempdefcon == v.defconname then
            reasontextEntry:SetValue(v.description)
        end
    end

    local submitbutton = defcondatapadmenu:Add("DButton")
    submitbutton:SetPos(sc(880), sc(500))
    submitbutton:SetSize(125, 30)
    submitbutton:SetText("")
    submitbutton.Paint = function (self, w, h)
        surface.SetDrawColor(color)
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Abschicken!", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    submitbutton.DoClick = function (self, w, h)
        local reason = reasontextEntry:GetValue()
        net.Start("Reik.Senddefcontotheserver")
        net.WriteString(tempdefcon)
        net.WriteString(reason)
        net.WriteColor(color)
        net.WriteString(benutzername)
        net.SendToServer()
    end
end


net.Receive("Reik.updatedefcon", function ()
    defconname = net.ReadString()
    description = net.ReadString()
    surface.PlaySound("ambient/alarms/klaxon1.wav") 
end)

net.Receive("Reik.givedefcondata", function ()
    defconname = net.ReadString()
    description = net.ReadString()
end)

hook.Add("HUDPaint", "Reik.DefconSystem", function()
    draw.RoundedBox(1, 0, 100, 200, 5, color_white)
    draw.SimpleText(defconname, "VFSFont_41", sc(95), sc(80), color_white, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    draw.SimpleText(description, "VFSFont_27", sc(10), sc(150), color_white, TEXT_ALIGN_TOP, TEXT_ALIGN_BOTTOM)
end)


function Datapadlogsmenu(reik)
    defconmainmenu = false
    defconlogs = true

    defconlogsdatapadmenu = vgui.Create("DFrame")
    defconlogsdatapadmenu:SetTitle("")
    defconlogsdatapadmenu:Dock(FILL)
    defconlogsdatapadmenu:SetDraggable(false)
    defconlogsdatapadmenu:ShowCloseButton(true)
    defconlogsdatapadmenu:MakePopup()
    defconlogsdatapadmenu.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Defcon Logs", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

    end

    local defcomlogsdatapaddzurueckbutton = defconlogsdatapadmenu:Add("DButton")
    defcomlogsdatapaddzurueckbutton:SetSize(300, 60)
    defcomlogsdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    defcomlogsdatapaddzurueckbutton:SetText(" ")

    defcomlogsdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    defcomlogsdatapaddzurueckbutton.DoClick = function(self, w, h)
        defconlogsdatapadmenu:Close()
        Mainmenu()
    end

    local defconbuttondefcon = defconlogsdatapadmenu:Add("DButton")
    defconbuttondefcon:SetSize(300, 60)
    defconbuttondefcon:SetPos(screenwide /  9, screenhigh /  3.455)
    defconbuttondefcon:SetText(" ")

    defconbuttondefcon.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Defcon", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    defconbuttondefcon.DoClick = function(self, w, h)
        if not defconmainmenu == true then
            defconlogsdatapadmenu:Close()
            Datapadmenu(reik)
        end
    end

    local defconbuttonlogs = defconlogsdatapadmenu:Add("DButton")
    defconbuttonlogs:SetSize(300, 60)
    defconbuttonlogs:SetPos(screenwide /  9, screenhigh /  2.9)
    defconbuttonlogs:SetText(" ")

    defconbuttonlogs.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Defcon Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    defconbuttonlogs.DoClick = function(self, w, h)
        if not defconlogs == true then
            defcondatapadmenu:Close()
            Datapadlogsmenu()
            
        end
    end

    defconlogsdatapadscroll = defconlogsdatapadmenu:Add("DScrollPanel")
    defconlogsdatapadscroll:SetSize(600, 700)
    defconlogsdatapadscroll:SetPos(640, 310)
    defconlogsdatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end
    defconScrollPanel()
end

function defconScrollPanel()
    local yoffset = 0
    for _, row in pairs(defconlogstablee) do
        local panelforlogsdefcon = defconlogsdatapadscroll:Add("DPanel")
        panelforlogsdefcon:SetSize(600, 50)
        panelforlogsdefcon:SetPos(0, yoffset)
        panelforlogsdefcon.Paint = function(self, w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(205, 194, 194, 160))
            draw.SimpleText("Owner: " .. row.username .. " | Geändertes Defcon: " .. row.defcon .. " | Grund: " .. row.reason, "VFSFont_20", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        yoffset = yoffset + 60 -- Adjust the spacing as needed
    end
end

