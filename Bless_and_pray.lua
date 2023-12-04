local frmPray = CreateFrame("Frame")

local function pray()
    SendChatMessage("¡Gracias por el buff!", "SAY")
end

local function BuffEventHandler(self, event, unit)
    if unit == "player" then
        pray()
    end
end

frmPray:RegisterEvent("UNIT_AURA")
frmPray:SetScript("OnEvent", BuffEventHandler)


--[[
local function CastFortitudeOnClosestFriendlyUnit()
    local spellName = "Fortaleza"
    local unit = nil
    local minRange = 100 -- Rango máximo inicial grande para encontrar la unidad más cercana

    for i = 1, GetNumGroupMembers() do
        local groupUnit = "party" .. i
        if UnitExists(groupUnit) and UnitIsVisible(groupUnit) and UnitIsFriend("player", groupUnit) then
            local range = CheckInteractDistance(groupUnit, 4) or 100 -- 4 es el código de rango para "interactuar"
            if range < minRange then
                minRange = range
                unit = groupUnit
            end
        end
    end

    if not unit then
        for i = 1, GetNumGroupMembers() do
            local unitID = "raid" .. i
            if UnitExists(unitID) and UnitIsVisible(unitID) and UnitIsFriend("player", unitID) then
                local range = CheckInteractDistance(unitID, 4) or 100 -- 4 es el código de rango para "interactuar"
                if range < minRange then
                    minRange = range
                    unit = unitID
                end
            end
        end
    end

    if not unit then
        unit = "target"
        local range = CheckInteractDistance(unit, 4) or 100 -- 4 es el código de rango para "interactuar"
        if range > minRange then
            unit = nil
        end
    end

    if unit then
        CastSpellByName(spellName, unit)
    else
        print("No se encontraron unidades amigas cercanas para lanzar Fortaleza.")
    end
end

SLASH_BLNPRY1 = "/blnpry"
SlashCmdList["BLNPRY"] = function()
    CastFortitudeOnClosestFriendlyUnit()
end
]]