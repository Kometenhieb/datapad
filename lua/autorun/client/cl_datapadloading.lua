isloadet = false

net.Receive("Reik.Datapadopenmenu", function ()
    if not DefconMenuOpen then
        if isloadet == false then
            Datapadmenuloader()
            isloadet = true
        else
            Datapadmenuautheikator() 
        end

        DefconMenuOpen = true
    end
end)

local fontsize = {
    51,
    41,
    27,
    35,
    34,
    20,
    30,
    22,
    25,
    28,
    18,
    16,
}

for i = 1, #fontsize do
    local size = fontsize[i]
    surface.CreateFont( "VFSFont_" .. size, {
        font = "BF4 Numbers",
        extended = false,
        size = size,
        weight = 500,
    } )
end

local screenhigh = ScrH()
local screenwide = ScrW()
DefconMenuOpen = false
loadingscreenvalue = 0


timer.Create("DatapadMenuTimer", 5, 0, function()
    if DefconMenuOpen then
        DefconMenuOpen = false
    end
end)


function Timerforlogininformation()
    loadingscreenvalue = loadingscreenvalue + 60
end

function Datapadmenuloader()
    local loadingscreentextdot = 0

    timer.Create("Timerforlogin", 2, 5, Timerforlogininformation)
    loadingframe = vgui.Create("DFrame")
    loadingframe:SetPos(0, 0)
    loadingframe:SetSize(screenwide, screenhigh)
    loadingframe:SetTitle("")
    loadingframe:SetDraggable(false)
    loadingframe:ShowCloseButton(false)
    loadingframe:MakePopup()
    loadingframe.Paint = function (self, w, h)
        draw.RoundedBox(5, screenwide / 2.3, screenhigh / 2, loadingscreenvalue, 20, Color(255, 255, 255))
        draw.RoundedBox(5, screenwide / 2.3, screenhigh / 2, 300, 20, Color(24, 24, 24, 173))
        if loadingscreenvalue == 300 then
            Datapadmenuautheikator()
            loadingscreenvalue = 0
            loadingframe:Close()
        end
        if loadingscreentextdot == 0 then
            draw.SimpleText("Datepad fährt hoch", "VFSFont_35", screenwide / 2.25 , screenhigh / 2.20, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            timer.Simple(0.8, function() loadingscreentextdot = 1 end)
        elseif loadingscreentextdot == 1 then
            draw.SimpleText("Datepad fährt hoch.", "VFSFont_35", screenwide / 2.25 , screenhigh / 2.20, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            timer.Simple(0.8, function() loadingscreentextdot = 2 end)
        elseif loadingscreentextdot == 2 then
            draw.SimpleText("Datepad fährt hoch..", "VFSFont_35", screenwide / 2.25 , screenhigh / 2.20, Color( 255, 255, 255, 255 ), TEXT_ALIGN_LEFT, TEXT_ALIGN_LEFT)
            timer.Simple(0.8, function() loadingscreentextdot = 0 end)
        end
    end
end

function Datapadmenuautheikator()
    authenikatiorframe = vgui.Create("DFrame")
    authenikatiorframe:SetPos(0, 0)
    authenikatiorframe:SetSize(screenwide, screenhigh)
    authenikatiorframe:SetTitle("")
    authenikatiorframe:SetDraggable(false)
    authenikatiorframe:ShowCloseButton(false)
    authenikatiorframe:MakePopup()
    authenikatiorframe.Paint = function (self, w, h)
        draw.RoundedBox(1, w / 2.5, h / 3, 330, 320, Color(255, 255, 255))
        draw.SimpleText("Benutzername", "VFSFont_27", w / 2.1, h / 2.75, Color(0, 0 ,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT)
        draw.SimpleText("Autorisierungscode", "VFSFont_27", w / 2, h / 2.15, Color(0, 0 ,0), TEXT_ALIGN_RIGHT, TEXT_ALIGN_RIGHT)
    end

    local usernametextEntry = authenikatiorframe:Add("DTextEntry") 
    usernametextEntry:SetPos(screenwide / 2.45, screenhigh / 2.5)
    usernametextEntry:SetSize(300, 50)
    usernametextEntry:SetMultiline(false)
    usernametextEntry:SetFont("VFSFont_27")

    local passwordtextEntry = authenikatiorframe:Add("DTextEntry") 
    passwordtextEntry:SetPos(screenwide / 2.45, screenhigh / 2)
    passwordtextEntry:SetSize(300, 50)
    passwordtextEntry:SetMultiline(false)
    passwordtextEntry:SetFont("VFSFont_27")

    local loginbutton = authenikatiorframe:Add("DButton")
    loginbutton:SetPos(screenwide / 1.95, screenhigh / 1.7)
    loginbutton:SetSize(100, 30)
    loginbutton:SetText("")
    loginbutton.Paint = function (self, w, h)
        surface.SetDrawColor(0, 0, 255)
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Anmelden", "VFSFont_20", w / 2, h / 2, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    loginbutton.DoClick = function ()
        local password = passwordtextEntry:GetValue()
        local username = usernametextEntry:GetValue()
        net.Start("Reik.Usernameandpasswordcheck")
         net.WriteString(username)
         net.WriteString(password)
        net.SendToServer()
    end

    local cancelbutton = authenikatiorframe:Add("DButton")
    cancelbutton:SetPos(screenwide / 2.45, screenhigh / 1.7)
    cancelbutton:SetSize(100, 30)
    cancelbutton:SetText("")
    cancelbutton.Paint = function (self, w, h)
        surface.SetDrawColor(255, 0, 0)
        surface.DrawOutlinedRect(0, 0, w, h)
        draw.SimpleText("Abbrechen", "VFSFont_20", w / 2, h / 2, color_black, TEXT_ALIGN_CENTER, TEXT_ALIGN_CENTER)
    end

    cancelbutton.DoClick = function (self, w, h)
        authenikatiorframe:Close()
        DefconMenuOpen = false
    end
end

net.Receive("Reik.passwordorusernamenotfound", function ()
    VoidLib.Notify("ERROR", "Entweder das Passwort oder der Benutzername ist falsch!", Color(255, 0, 0), 5)
end)

