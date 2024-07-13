net.Receive("Reik.Datapadopenaccountmenu", function ()
    username = net.ReadString()
    Datapadaccountcreationmenu(username)
    net.Start("Reik.getalluserersforaccountmanage")
    net.SendToServer()

end)
--[[
net.Receive("Reik.Datapadopenmenu", function ()
   if not DefconMenuOpen then
        Datapadaccountcreationmenu()
        DefconMenuOpen = true
   end
end)
--]]

local screenhigh = ScrH()
local screenwide = ScrW()
accountcreatemenu = false
accountmagment = false


function Datapadaccountcreationmenu()
    accountmagment = false
    accountcreatemenu = true
    accountcreationdatapad = vgui.Create("DFrame")
    accountcreationdatapad:SetTitle("")
    accountcreationdatapad:Dock(FILL)
    accountcreationdatapad:SetDraggable(false)
    accountcreationdatapad:ShowCloseButton(true)
    accountcreationdatapad:MakePopup()
    accountcreationdatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Account Creation", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)

        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

        draw.RoundedBox(5, w / 3, h / 2.4, 600, 2, fontdatapad)


        draw.SimpleText("Besitzer:", "VFSFont_30", w / 2.7, h / 3.4, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Username:", "VFSFont_30", w / 1.65, h / 3.4, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Autorisierungscode:", "VFSFont_30", w / 2.04, h / 2.85, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)


        draw.SimpleText("Permisions:", "VFSFont_30", w / 2.04, h / 2.3, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)        
    end

    local accountcreationdatapaddzurueckbutton = accountcreationdatapad:Add("DButton")
    accountcreationdatapaddzurueckbutton:SetSize(300, 60)
    accountcreationdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    accountcreationdatapaddzurueckbutton:SetText(" ")

    accountcreationdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    accountcreationdatapaddzurueckbutton.DoClick = function(self, w, h)
        accountcreationdatapad:Close()
        net.Start("Reik.Datapadmainmenuopenerpersidemenuessv")
        net.SendToServer()
    end


    local accountcreationdlogsbuttom = accountcreationdatapad:Add("DButton")
    accountcreationdlogsbuttom:SetSize(300, 60)
    accountcreationdlogsbuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    accountcreationdlogsbuttom:SetText(" ")

    accountcreationdlogsbuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Accountcreation", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    accountcreationdlogsbuttom.DoClick = function(self, w, h)
        if not accountcreatemenu == true then
            accountverwaltungsdatapad:Close()
            Datapadaccountcreationmenu()
        end
    end

    local accountcreationmainmenu = accountcreationdatapad:Add("DButton")
    accountcreationmainmenu:SetSize(300, 60)
    accountcreationmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    accountcreationmainmenu:SetText(" ")

    accountcreationmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Accountverwaltung", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    accountcreationmainmenu.DoClick = function(self, w, h)
        if not accountmagment == true then
            accountcreationdatapad:Close()
            Datapadaccountverwaltungsmenu()
        end
    end

    local ownernametextEntry = accountcreationdatapad:Add("DTextEntry") 
    ownernametextEntry:SetPos(screenwide / 2.9, screenhigh / 3.2)
    ownernametextEntry:SetSize(200, 30)
    ownernametextEntry:SetMultiline(false)
    ownernametextEntry:SetFont("VFSFont_27")
    ownernametextEntry:SetTextColor(fontdatapad)
    ownernametextEntry:SetDrawBackground(true)
    ownernametextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end

    local usernametextEntry = accountcreationdatapad:Add("DTextEntry") 
    usernametextEntry:SetPos(screenwide / 1.885, screenhigh / 3.2)
    usernametextEntry:SetSize(200, 30)
    usernametextEntry:SetMultiline(false)
    usernametextEntry:SetFont("VFSFont_27")
    usernametextEntry:SetTextColor(fontdatapad)
    usernametextEntry:SetDrawBackground(true)
    usernametextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end

    local passwordtextEntry = accountcreationdatapad:Add("DTextEntry") 
    passwordtextEntry:SetPos(screenwide / 2.28, screenhigh / 2.7)
    passwordtextEntry:SetSize(200, 30)
    passwordtextEntry:SetMultiline(false)
    passwordtextEntry:SetFont("VFSFont_27")
    passwordtextEntry:SetTextColor(fontdatapad)
    passwordtextEntry:SetNumeric(true)
    passwordtextEntry:SetDrawBackground(true)
    passwordtextEntry.Paint = function(self, w, h)
        surface.SetDrawColor(maincolor)
        surface.DrawRect(0, 0, w, h)
        self:DrawTextEntryText(self:GetTextColor(), self:GetHighlightColor(), self:GetCursorColor())
    end


    local accountcreationpermision = accountcreationdatapad:Add("DComboBox") 
    accountcreationpermision:SetPos( screenwide / 2.9, screenhigh / 2.19 )
    accountcreationpermision:SetSize( 138, 30 )
    accountcreationpermision:SetValue( "Accountverwaltung:" )
    accountcreationpermision:AddChoice( "Ja" )
    accountcreationpermision:AddChoice( "Nein" )

    local defconpermision = accountcreationdatapad:Add("DComboBox") 
    defconpermision:SetPos( screenwide / 2.2, screenhigh / 2.19 )
    defconpermision:SetSize( 138, 30 )
    defconpermision:SetValue( "Defcon:" )
    defconpermision:AddChoice( "Ja" )
    defconpermision:AddChoice( "Nein" )

    local befehlepermision = accountcreationdatapad:Add("DComboBox") 
    befehlepermision:SetPos( screenwide / 1.77, screenhigh / 2.19 )
    befehlepermision:SetSize( 138, 30 )
    befehlepermision:SetValue( "Befehle:" )
    befehlepermision:AddChoice( "Ja" )
    befehlepermision:AddChoice( "Nein" )

    local officerpermision = accountcreationdatapad:Add("DComboBox") 
    officerpermision:SetPos( screenwide / 2.9, screenhigh / 1.95 )
    officerpermision:SetSize( 138, 30 )
    officerpermision:SetValue( "Officer:" )
    officerpermision:AddChoice( "Ja" )
    officerpermision:AddChoice( "Nein" )


    local submitbutton = accountcreationdatapad:Add("DButton")
    submitbutton:SetPos(screenwide / 2.2, screenhigh / 1.125)
    submitbutton:SetSize(125, 30)
    submitbutton:SetText("")
    submitbutton.Paint = function (self, w, h)
        surface.SetDrawColor(255, 0, 0)
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Create", "VFSFont_25", w / 2, h / 2, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    submitbutton.DoClick = function (self, w, h)
        accountcreationdatapad:Close()
        Datapadaccountcreationmenu()
        local usernamepercreate = usernametextEntry:GetValue()
        local ownerpercreate = ownernametextEntry:GetValue()
        local passwordpercreate = passwordtextEntry:GetValue()
        local accountcreationpermisionpercreate = accountcreationpermision:GetValue()
        local defconpermisionpercreate = defconpermision:GetValue()
        local befehlepermisionpercreate = befehlepermision:GetValue()
        local officerpermisionpercreate = officerpermision:GetValue()

        if accountcreationpermisionpercreate == "Accountverwaltung:" or accountcreationpermisionpercreate == "Nein" then
            accountcreationpermisionpercreate = 1
        else
            accountcreationpermisionpercreate = 2
        end

        if defconpermisionpercreate == "Defcon:" or defconpermisionpercreate == "Nein" then
            defconpermisionpercreate = 1
        else
            defconpermisionpercreate = 2
        end

        if befehlepermisionpercreate == "Befehle:" or befehlepermisionpercreate == "Nein" then
            befehlepermisionpercreate = 1
        else
            befehlepermisionpercreate = 2
        end

        if officerpermisionpercreate == "Officer:" or officerpermisionpercreate == "Nein" then
            officerpermisionpercreate = 1
        else
            officerpermisionpercreate = 2
        end

        if usernamepercreate == "" then
            VoidLib.Notify("Accountcreation", "Kein Username angeben", Color(170, 66, 66), 5)
        end
        if ownerpercreate == "" then
            VoidLib.Notify("Accountcreation", "Kein Owner angeben", Color(170, 66, 66), 5)
        end
        if passwordpercreate == "" then
            VoidLib.Notify("Accountcreation", "Kein Passwort angeben", Color(170, 66, 66), 5)
        end

        if usernamepercreate == "" or ownerpercreate == "" or passwordpercreate == "" then
            --
        else
            net.Start("Reik.Datapadcreatenewaccount")
             net.WriteString(usernamepercreate)
             net.WriteString(ownerpercreate)
             net.WriteString(passwordpercreate)
             net.WriteString(tostring(accountcreationpermisionpercreate))
             net.WriteString(tostring(defconpermisionpercreate))
             net.WriteString(tostring(befehlepermisionpercreate))
             net.WriteString(tostring(officerpermisionpercreate))
            net.SendToServer()
        end
    end
end

net.Receive("Reik.Usernameexistforcreatenewaccount", function ()
    VoidLib.Notify("Accountcreation", "Account konnte nicht erstellt werden da der Username bereits vergeben ist!", Color(170, 66, 66), 5)
end)

net.Receive("Reik.Accountcreationsubmit", function ()
    VoidLib.Notify("Accountcreation", "Account wurde erstellt!", Color(26, 255, 0), 5)
end)

----------------------------------------------------------
existingusernames = {}
local accountverwaltungsdatapad -- Globale Variable
local accountverwaltungsdatapadscroll -- Globale Variable

net.Receive("Reik.getalluserersforaccountmanageforcl",function ()
    existingusernames = net.ReadTable()

end)

function Datapadaccountverwaltungsmenu(username)
    accountcreatemenu = false
    accountmagment = true

    net.Start("Reik.getalluserersforaccountmanage")
    net.SendToServer()


    accountverwaltungsdatapad = vgui.Create("DFrame")
    accountverwaltungsdatapad:SetTitle("")
    accountverwaltungsdatapad:Dock(FILL)
    accountverwaltungsdatapad:SetDraggable(false)
    accountverwaltungsdatapad:ShowCloseButton(true)
    accountverwaltungsdatapad:MakePopup()
    accountverwaltungsdatapad.Paint = function (self, w, h)
        draw.RoundedBox(25, w / 3.025, h / 3.555, 610, 710, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 3.5, 600, 700, maincolor)

        draw.RoundedBox(25, w / 3.025, h / 9.35, 610, 130, backgroundcolor)
        draw.RoundedBox(25, w / 3, h / 9, 600, 120, maincolor)

        draw.RoundedBox(5, w / 3, h / 6, 600, 3, fontdatapad)
        draw.SimpleText("Datapad Main Menu", "VFSFont_35", w / 2.05, h / 7, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        draw.SimpleText("Account Verwaltung", "VFSFont_35", w / 2.05, h / 5.32, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        
        draw.RoundedBox(25, w / 9.25, h / 3.555, 310, 710, backgroundcolor)
        draw.RoundedBoxEx(25, w /  9 , h /  3.5, 300, 700, maincolor, true, true, true, true)

    end


    accountverwaltungsdatapadscroll = accountverwaltungsdatapad:Add("DScrollPanel")
    accountverwaltungsdatapadscroll:SetSize(600, 700)
    accountverwaltungsdatapadscroll:SetPos(640, 310)
    accountverwaltungsdatapadscroll.Paint = function(self, w, h)
        --draw.RoundedBox(5, 0, 0 , w, h, color_black)
    end

    populateScrollPanel(username)






    local accountcreationdatapaddzurueckbutton = accountverwaltungsdatapad:Add("DButton")
    accountcreationdatapaddzurueckbutton:SetSize(300, 60)
    accountcreationdatapaddzurueckbutton:SetPos(screenwide /  2.4, screenhigh /  9)
    accountcreationdatapaddzurueckbutton:SetText(" ")

    accountcreationdatapaddzurueckbutton.Paint = function(self, w, h)
        
    end

    accountcreationdatapaddzurueckbutton.DoClick = function(self, w, h)
        accountverwaltungsdatapad:Close()
        net.Start("Reik.Datapadmainmenuopenerpersidemenuessv")
        net.SendToServer()

    end

    -- Createpage
    local accountcreationdlogsbuttom = accountverwaltungsdatapad:Add("DButton")
    accountcreationdlogsbuttom:SetSize(300, 60)
    accountcreationdlogsbuttom:SetPos(screenwide /  9, screenhigh /  3.455)
    accountcreationdlogsbuttom:SetText(" ")

    accountcreationdlogsbuttom.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Accountcreation", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    accountcreationdlogsbuttom.DoClick = function(self, w, h)
        if not accountcreatemenu == true then
            accountverwaltungsdatapad:Close()
            Datapadaccountcreationmenu()
        end
    end
    
    -- Logpage
    local accountcreationmainmenu = accountverwaltungsdatapad:Add("DButton")
    accountcreationmainmenu:SetSize(300, 60)
    accountcreationmainmenu:SetPos(screenwide /  9, screenhigh /  2.9)
    accountcreationmainmenu:SetText(" ")

    accountcreationmainmenu.Paint = function(self, w, h)
        draw.RoundedBox(5, 0, 57, 300, 3, fontdatapad)
        draw.SimpleText("Accountverwaltung", "VFSFont_35", 150, 40, fontdatapad, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    accountcreationmainmenu.DoClick = function(self, w, h)
        if not accountmagment == true then
            accountcreationdatapad:Close()
            Datapadaccountverwaltungsmenu()
        end
    end
end

function populateScrollPanel(usernamefrompersonwhodelete)
    local yoffset = 0
    for _, row in ipairs(existingusernames) do
        local panelforlogs = accountverwaltungsdatapadscroll:Add("DPanel")
        panelforlogs:SetSize(600, 50)
        panelforlogs:SetPos(0, yoffset)
        panelforlogs.Paint = function(self, w, h)
            draw.RoundedBox(25, 0, 0, w, h, Color(142, 141, 141, 160))
            draw.SimpleText(row.username, "VFSFont_30", w / 8, h / 2, Color(255, 255, 255), TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
        end

        local logdeleteImageButton = panelforlogs:Add("DImageButton")
        logdeleteImageButton:SetPos( 540, 5 )
        logdeleteImageButton:SetSize( 40, 40 )
        logdeleteImageButton:SetImage("materials/closesymbol.png")
        logdeleteImageButton.DoClick = function()
            net.Start("Reik.deleteaccountpermenu")
             net.WriteString(row.username)
             net.WriteString(username)
            net.SendToServer()
        end

        yoffset = yoffset + 60 -- Adjust the spacing as needed
    end
end

net.Receive("Reik.refreshtheaccountmanagment", function ()
    VoidLib.Notify("Accountmanagmet", "Account wurde gelöscht!", Color(26, 255, 0), 5)
    timer.Simple(0.1, function ()
        accountverwaltungsdatapad:Close()
        Datapadaccountverwaltungsmenu()
    end)


end)