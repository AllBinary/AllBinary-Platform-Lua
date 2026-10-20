--
-- AllBinary Open License Version 1
-- Copyright (c) 2011 AllBinary
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
-- package org.allbinary.graphics.paint

local Paintable = require("org.allbinary.graphics.paint.Paintable")
local InitUpdatePaintableInterface = require("org.allbinary.graphics.paint.InitUpdatePaintableInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitUpdatePaintable = {}
InitUpdatePaintable.__index = InitUpdatePaintable
InitUpdatePaintable.className = "InitUpdatePaintable"
setmetatable(InitUpdatePaintable, {__index = Paintable})


function InitUpdatePaintable.new()
    local self = setmetatable(Paintable.new(), InitUpdatePaintable)
    return self
end


-- throws Exception
function InitUpdatePaintable:init()
end


function InitUpdatePaintable:update()
end

return InitUpdatePaintable

