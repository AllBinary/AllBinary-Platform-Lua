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

local BaseMenuBehavior = {}
package.loaded["org.allbinary.game.displayable.canvas.BaseMenuBehavior"] = BaseMenuBehavior

require("java.lang.String")
local function java_lazy(name)
    return setmetatable({}, {__jmodule = name,
        __index = function(_, key) return require(name)[key] end,
        __newindex = function(_, key, value) require(name)[key] = value end})
end
local function java_real(class)
    local metatable = type(class) == "table" and getmetatable(class)
    if metatable and rawget(metatable, "__jmodule") then return require(metatable.__jmodule) end
    return class
end

local DisplayChangeEvent = java_lazy("org.allbinary.graphics.displayable.event.DisplayChangeEvent")
local NullPaintable = java_lazy("org.allbinary.graphics.paint.NullPaintable")
local AllBinaryGameCanvas = java_lazy("org.allbinary.game.displayable.canvas.AllBinaryGameCanvas")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    -- a char (1 character string) whose type the converter did not know: (byte) name.charAt(i)
    if type(value) == "string" then
        local ok, code = pcall(utf8.codepoint, value)
        if ok and code ~= nil then return code end
        return string.byte(value) or 0
    end
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

-- class table BaseMenuBehavior is declared before the requires
BaseMenuBehavior.__index = BaseMenuBehavior
BaseMenuBehavior.className = "BaseMenuBehavior"
BaseMenuBehavior.javaClassName = "org.allbinary.game.displayable.canvas.BaseMenuBehavior"

function BaseMenuBehavior._jinit(self)
    return self
end

function BaseMenuBehavior.new()
    return BaseMenuBehavior._jinit(setmetatable({}, BaseMenuBehavior))
end


function BaseMenuBehavior.getInstance()
        return BaseMenuBehavior.instance_f
end


-- throws Exception
function BaseMenuBehavior:onDisplayChangeEvent(allBinaryGameCanvas, displayChangeEvent)
end


function BaseMenuBehavior:initSpecialPaint(allBinaryGameCanvas)
        allBinaryGameCanvas:setNonBotPaintableP(NullPaintable.getInstance())
end


-- throws Exception
function BaseMenuBehavior:initMenu(allBinaryGameCanvas)
end


-- throws Exception
function BaseMenuBehavior:updateMenu(allBinaryGameCanvas)
end


-- throws Exception
function BaseMenuBehavior:popupMenu(allBinaryGameCanvas)
end


function BaseMenuBehavior:closeMenu(allBinaryGameCanvas)
end

BaseMenuBehavior.instance_f = BaseMenuBehavior.new()

return BaseMenuBehavior

