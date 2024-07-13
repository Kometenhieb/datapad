local screenhigh = ScrH()
local screenwide = ScrW()
local function sc(x)
    return x / 1080 * screenhigh
end


function Datapadlexion()
    lexikonmainmenudatapad = vgui.Create("DFrame")
    lexikonmainmenudatapad:SetTitle("")
    lexikonmainmenudatapad:Dock(FILL)
    lexikonmainmenudatapad:SetDraggable(false)
    lexikonmainmenudatapad:ShowCloseButton(true)
    lexikonmainmenudatapad:MakePopup()
    lexikonmainmenudatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.SimpleText("Lexikon", "VFSFont_35", w / 2.05, sc(205), fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

    end

    local lexikondatapaddzurueckbutton = lexikonmainmenudatapad:Add("DButton")
    lexikondatapaddzurueckbutton:SetSize(300, 60)
    lexikondatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    lexikondatapaddzurueckbutton:SetText(" ")

    lexikondatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    lexikondatapaddzurueckbutton.DoClick = function(self, w, h)
        lexikonmainmenudatapad:Close()
        Mainmenu()
    end


    local lexikondatapadscroll = lexikonmainmenudatapad:Add("DScrollPanel")
    lexikondatapadscroll:SetSize(600, 700)
    lexikondatapadscroll:SetPos(640, 310)
    lexikondatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end
    
    local yoffset = 0
    for _, row in pairs(Reik.lexikonconfig.lexikon) do
        local panelforlexikon = lexikondatapadscroll:Add("DPanel")
        panelforlexikon:SetSize(600, 80)
        panelforlexikon:SetPos(0, yoffset)
        panelforlexikon.Paint = function(self, w, h)
            draw.RoundedBox(1, sc(20), 10, 560, 1, fontdatapad)
            draw.RoundedBox(1, sc(20), 70, 560, 1, fontdatapad)
            draw.RoundedBox(1, sc(20), 15, 1, 50, fontdatapad)
            draw.RoundedBox(1, sc(580), 15, 1, 50, fontdatapad)
            draw.SimpleText(row.title, "VFSFont_25", sc(40), sc(30), fontdatapad, TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
        end

        local lexikonseebutton = lexikondatapadscroll:Add("DButton")
        lexikonseebutton:SetPos(sc(380), yoffset + 20)
        lexikonseebutton:SetSize(185, 40)
        lexikonseebutton:SetText("")
        lexikonseebutton.Paint = function (self, w, h)
            surface.SetDrawColor(fontdatapad)
            surface.DrawOutlinedRect(0, 0, w, h)
            draw.SimpleText("Lass mich sehen!", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        yoffset = yoffset + 70 -- Adjust the spacing as needed
    
        lexikonseebutton.DoClick = function (self, w, h)
            lexikonmainmenudatapad:Close()
            lexikonseemenudatapad = vgui.Create("DFrame")
            lexikonseemenudatapad:SetTitle("")
            lexikonseemenudatapad:Dock(FILL)
            lexikonseemenudatapad:SetDraggable(false)
            lexikonseemenudatapad:ShowCloseButton(true)
            lexikonseemenudatapad:MakePopup()
            lexikonseemenudatapad.Paint = function (self, w, h)
                draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
                draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)
        
                draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
                draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)
        
                draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
                draw.SimpleText("Lexikon Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
                draw.SimpleText(row.title, "VFSFont_35", w / 2.05, sc(205), fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
            end
        
            local lexikonseedatapaddzurueckbutton = lexikonseemenudatapad:Add("DButton")
            lexikonseedatapaddzurueckbutton:SetSize(300, 60)
            lexikonseedatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
            lexikonseedatapaddzurueckbutton:SetText(" ")
        
            lexikonseedatapaddzurueckbutton.Paint = function(self, w, h)
                
            end
        
            lexikonseedatapaddzurueckbutton.DoClick = function(self, w, h)
                lexikonseemenudatapad:Close()
                Datapadlexion()
            end

            local lexikonseedatapadscroll = lexikonseemenudatapad:Add("DScrollPanel")
            lexikonseedatapadscroll:SetSize(600, 700)
            lexikonseedatapadscroll:SetPos(640, 310)
            local scrollBar = lexikonseedatapadscroll:GetVBar()
            scrollBar:SetWide(0)
            scrollBar:SetAlpha(0)
            scrollBar.Paint = function() end
            scrollBar.btnUp.Paint = function() end
            scrollBar.btnDown.Paint = function() end
            scrollBar.btnGrip.Paint = function() end

            local textgiver = lexikonseedatapadscroll:Add("DLabel")
            textgiver:SetPos(20, 20)
            textgiver:SetSize(560, 650)
            textgiver:SetText(row.info)
            textgiver:SetWrap(true)
            textgiver:SetTextColor(fontdatapad)
            textgiver:SetContentAlignment(7)
            textgiver:SetFont("VFSFont_25")

            textgiver.Paint = function(self, w, h)
                --draw.RoundedBox(5, 0, 0 , w, h, color_black)
            end
            textgiver:SizeToContentsY()
        end

    end  
end