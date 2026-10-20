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
local HitPointGameObjectInterface = require("org.allbinary.input.automation.module.game.HitPointGameObjectInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local HitPointGameObject = {}
HitPointGameObject.__index = HitPointGameObject
HitPointGameObject.className = "HitPointGameObject"
setmetatable(HitPointGameObject, {__index = MeteredGameObject})

function HitPointGameObject:_init_fields()
    self.damaged = false
    self.closeDeath = false
    self.HP_LABEL = "HP: "
    self.IS_DAMAGED_LABEL = "isDamaged: "
    self.IS_CLOSE_DEATH_LABEL = "isCloseDeath: "
end


function HitPointGameObject.new(bufferedImage, minX, maxX, y)
    local self = setmetatable(MeteredGameObject.new(bufferedImage, minX, maxX, y), HitPointGameObject)
    self:_init_fields()
        -- super(...) made self above
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) < 1.0 then
            self:setDamaged(true)
        else
            self:setDamaged(false)
        end
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) > 0.25 then
            self.closeDeath = false
        else
            self.closeDeath = true
        end
    return self
end


function HitPointGameObject:isMoreThan(aFloat)
        if (self:getRatios()[(self:getRatios().n or #self:getRatios()) - 1 + 1] + 0.0) > aFloat then
            return true
        else
            return false
        end
end


function HitPointGameObject:isCloseDeath()
        return self.closeDeath
end


function HitPointGameObject:setCloseDeath(closeDeath)
        self.closeDeath = closeDeath
end


function HitPointGameObject:isDamaged()
        return self.damaged
end


function HitPointGameObject:setDamaged(damaged)
        self.damaged = damaged
end


function HitPointGameObject:toString()
        local commonSeps = CommonSeps.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(self.HP_LABEL)
        stringBuffer:append(tostring(MeteredGameObject))
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_DAMAGED_LABEL)
        stringBuffer:appendboolean(self:isDamaged())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_CLOSE_DEATH_LABEL)
        stringBuffer:appendboolean(self:isCloseDeath())
        return tostring(stringBuffer)
end
HitPointGameObject.__tostring = function(self) return self:toString() end

return HitPointGameObject

