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
-- package org.allbinary.input.automation.module.game

-- local BufferedImage = require("java.awt.image.BufferedImage")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local MeteredGameObject = require("org.allbinary.input.automation.module.game.MeteredGameObject")
local MagicGameObjectInterface = require("org.allbinary.input.automation.module.game.MagicGameObjectInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MagicGameObject = {}
MagicGameObject.__index = MagicGameObject
MagicGameObject.className = "MagicGameObject"
setmetatable(MagicGameObject, {__index = MeteredGameObject})

function MagicGameObject:_init_fields()
    self.MP_LABEL = "MP:"
end


function MagicGameObject.new(bufferedImage, minX, maxX, y)
    local self = setmetatable(MeteredGameObject.new(bufferedImage, minX, maxX, y), MagicGameObject)
    self:_init_fields()
        -- super(...) made self above
    return self
end


function MagicGameObject:toString()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(CommonSeps.getInstance().NEW_LINE)
        stringBuffer:append(self.MP_LABEL)
        stringBuffer:append(tostring(MeteredGameObject))
        return tostring(stringBuffer)
end
MagicGameObject.__tostring = function(self) return self:toString() end

return MagicGameObject

