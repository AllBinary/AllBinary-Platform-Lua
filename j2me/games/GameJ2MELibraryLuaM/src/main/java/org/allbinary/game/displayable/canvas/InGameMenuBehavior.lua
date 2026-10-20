-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
--  
-- By agreeing to this license you and any business entity you represent are 
-- legally bound to the AllBinary Open License Version 1 legal agreement. 
--  
-- You may obtain the AllBinary Open License Version 1 legal agreement from 
-- AllBinary or the root directory of AllBinary's AllBinary Platform repository. 
--  
-- Created By: Travis Berthelot 
--   
-- Generated Code Do Not Modify
-- package org.allbinary.game.displayable.canvas

local DisplayChangeEvent = require("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local BaseMenuBehavior = require("org.allbinary.game.displayable.canvas.BaseMenuBehavior")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InGameMenuBehavior = {}
InGameMenuBehavior.__index = InGameMenuBehavior
InGameMenuBehavior.className = "InGameMenuBehavior"
setmetatable(InGameMenuBehavior, {__index = BaseMenuBehavior})

function InGameMenuBehavior.new()
    local self = setmetatable(BaseMenuBehavior.new(), InGameMenuBehavior)
    return self
end


function InGameMenuBehavior.getInstance()
        return InGameMenuBehavior.instanceC
end


-- throws Exception
function InGameMenuBehavior:onDisplayChangeEvent(allBinaryGameCanvas, displayChangeEvent)
        allBinaryGameCanvas:updateMenuFromEvent(displayChangeEvent)
end


function InGameMenuBehavior:initSpecialPaint(allBinaryGameCanvas)
        allBinaryGameCanvas:setNonBotPaintableP(GameCanvasNonBotPaintable.new(allBinaryGameCanvas))
end


-- throws Exception
function InGameMenuBehavior:initMenu(allBinaryGameCanvas)
        allBinaryGameCanvas:initMenu2()
end


-- throws Exception
function InGameMenuBehavior:updateMenu(allBinaryGameCanvas)
        allBinaryGameCanvas:initMenu2()
end


-- throws Exception
function InGameMenuBehavior:popupMenu(allBinaryGameCanvas)
        allBinaryGameCanvas:popupMenu2()
end


function InGameMenuBehavior:closeMenu(allBinaryGameCanvas)
        allBinaryGameCanvas:closeMenu2()
end

InGameMenuBehavior.instanceC = InGameMenuBehavior.new()

return InGameMenuBehavior

