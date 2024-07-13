local screenhigh = ScrH()
local screenwide = ScrW()

local gray = Color(154,163,151,93)
befehlemenu = false
befehlelogsmenu = false
local screenhigh = ScrH()
local screenwide = ScrW()   
local function sc(x)
    return x / 1080 * screenhigh
end
befehlelogstable = {}
function befehleMainmenu(username)

    befehlelogsmenu = false
    befehlemenu = true
    befehlemenudatapad = vgui.Create("DFrame")
    befehlemenudatapad:SetTitle("")
    befehlemenudatapad:Dock(FILL)
    befehlemenudatapad:SetDraggable(false)
    befehlemenudatapad:ShowCloseButton(true)
    befehlemenudatapad:MakePopup()
    befehlemenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Befehle", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

    end

    local befehledatapaddzurueckbutton = befehlemenudatapad:Add("DButton")
    befehledatapaddzurueckbutton:SetSize(300, 60)
    befehledatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    befehledatapaddzurueckbutton:SetText(" ")

    befehledatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    befehledatapaddzurueckbutton.DoClick = function(self, w, h)
        befehlemenudatapad:Close()
        Mainmenu()
    end


    local befehlebuttom = befehlemenudatapad:Add("DButton")
    befehlebuttom:SetSize(300, 60)
    befehlebuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    befehlebuttom:SetText(" ")

    befehlebuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Befehle", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    befehlebuttom.DoClick = function(self, w, h)
        if not befehlemenu == true then
            befehlelogsmenudatapad:Close()
            befehleMainmenu()
        end
    end

    local befehlelogsnmainmenu = befehlemenudatapad:Add("DButton")
    befehlelogsnmainmenu:SetSize(300, 60)
    befehlelogsnmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    befehlelogsnmainmenu:SetText(" ")

    befehlelogsnmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Befehle Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    befehlelogsnmainmenu.DoClick = function(self, w, h)
        if not befehlelogsmenu == true then
            befehlemenudatapad:Close()
            befehlelogsMainmenu(username)
        end
    end

    local overreasontextEntry = befehlemenudatapad:Add("DTextEntry") 
    overreasontextEntry:SetPos(sc(790), sc(320))
    overreasontextEntry:SetSize(300, 60)
    overreasontextEntry:SetMultiline(false)
    overreasontextEntry:SetFont("VFSFont_27")
    overreasontextEntry:SetValue("Ober Grund")
    overreasontextEntry:SetTextColor(fontdatapad)
    overreasontextEntry:SetDrawBackground(true)
    overreasontextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end

    local reasontextEntry = befehlemenudatapad:Add("DTextEntry") 
    reasontextEntry:SetPos(sc(790), sc(420))
    reasontextEntry:SetSize(300, 60)
    reasontextEntry:SetMultiline(false)
    reasontextEntry:SetFont("VFSFont_27")
    reasontextEntry:SetValue("Grund")
    reasontextEntry:SetTextColor(fontdatapad)
    reasontextEntry:SetDrawBackground(true)
    reasontextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end

    local befehletime = befehlemenudatapad:Add("DComboBox") 
    befehletime:SetPos( sc(865), sc(510) )
    befehletime:SetSize( 150, 70 )
    befehletime:SetValue("Zeit")
    befehletime:AddChoice("5")
    befehletime:AddChoice("15")
    befehletime:AddChoice("20")
    befehletime:AddChoice("25")
    befehletime:AddChoice("3")
    befehletime:AddChoice("10")
    befehletime:SetTextColor(fontdatapad)
    befehletime:SetDrawBackground(true)
    befehletime.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor())
    end

    local Mixerforcolorforbefehle = befehlemenudatapad:Add("DColorMixer")
    Mixerforcolorforbefehle:SetPos(sc(785), sc(600))
    Mixerforcolorforbefehle:SetSize(400, 200)
    Mixerforcolorforbefehle:SetPalette(false)
    Mixerforcolorforbefehle:SetAlphaBar(false)
    Mixerforcolorforbefehle:SetWangs(true) 
    Mixerforcolorforbefehle:SetColor(Color(64,255,0))   


    local submitbutton = befehlemenudatapad:Add("DButton")
    submitbutton:SetPos(sc(880), sc(820))
    submitbutton:SetSize(125, 30)
    submitbutton:SetText("")
    submitbutton.Paint = function (self, w, h)
        surface.SetDrawColor(Color(255, 0, 0))
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Abschicken!", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    submitbutton.DoClick = function (self, w, h)
        local overreason = overreasontextEntry:GetValue()
        local reason = reasontextEntry:GetValue()
        local time = befehletime:GetValue()
        local color = Mixerforcolorforbefehle:GetColor()
        local colorObject = Color(color.r, color.g, color.b, color.a)
        if time == "Zeit" then
            time = "5"
        end
        net.Start("Reik.givedataforannocment")
         net.WriteString(overreason)
         net.WriteString(reason)
         net.WriteString(time)
         net.WriteColor(colorObject, true)
         net.WriteString(username)
        net.SendToServer()
    end
end

net.Receive("Reik.soundannocmant", function ()
    surface.PlaySound("ambient/alarms/klaxon1.wav")
end)

function befehlelogsMainmenu(username)



    befehlemenu = false
    befehlelogsmenu = true
    befehlelogsmenudatapad = vgui.Create("DFrame")
    befehlelogsmenudatapad:SetTitle("")
    befehlelogsmenudatapad:Dock(FILL)
    befehlelogsmenudatapad:SetDraggable(false)
    befehlelogsmenudatapad:ShowCloseButton(true)
    befehlelogsmenudatapad:MakePopup()
    befehlelogsmenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Befehle Logs", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

    end

    local befehlelogsdatapaddzurueckbutton = befehlelogsmenudatapad:Add("DButton")
    befehlelogsdatapaddzurueckbutton:SetSize(300, 60)
    befehlelogsdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    befehlelogsdatapaddzurueckbutton:SetText(" ")

    befehlelogsdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    befehlelogsdatapaddzurueckbutton.DoClick = function(self, w, h)
        befehlelogsmenudatapad:Close()
        Mainmenu()
    end


    local befehlebuttom = befehlelogsmenudatapad:Add("DButton")
    befehlebuttom:SetSize(300, 60)
    befehlebuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    befehlebuttom:SetText(" ")

    befehlebuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Befehle", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    befehlebuttom.DoClick = function(self, w, h)
        if not befehlemenu == true then
            befehlelogsmenudatapad:Close()
            befehleMainmenu(username)
        end
    end

    local befehlelogsnmainmenu = befehlelogsmenudatapad:Add("DButton")
    befehlelogsnmainmenu:SetSize(300, 60)
    befehlelogsnmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    befehlelogsnmainmenu:SetText(" ")

    befehlelogsnmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Befehle Logs", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    befehlelogsnmainmenu.DoClick = function(self, w, h)
        if not befehlelogsmenu == true then
            befehlemenudatapad:Close()
            befehlelogsMainmenu()
        end
    end
    
    befehlelogsdatapadscroll = befehlelogsmenudatapad:Add("DScrollPanel")
    befehlelogsdatapadscroll:SetSize(600, 700)
    befehlelogsdatapadscroll:SetPos(640, 310)
    befehlelogsdatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end
    befehleScrollPanel()
end



function befehleScrollPanel()


    net.Receive("Reik.givelogdatabefehle", function ()
        befehlelogstable = net.ReadTable()
    end)

    local yoffsetforbefehle = 0
    for _, row in pairs(befehlelogstable) do
        local panelforlogsbefele = befehlelogsdatapadscroll:Add("DPanel")
        panelforlogsbefele:SetSize(600, 50)
        panelforlogsbefele:SetPos(0, yoffsetforbefehle)
        panelforlogsbefele.Paint = function(self, w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(168, 151 ,151))
            draw.SimpleText("Owner: " .. row.ownerforbefehl .. " | Ober Grund: " .. row.overeasontable .. " | Grund: " .. row.resontable, "VFSFont_20", w / 2, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end
        yoffsetforbefehle = yoffsetforbefehle + 60 -- Adjust the spacing as needed
    end
end

