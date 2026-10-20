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
local MeteredGameObjectInterface = require("org.allbinary.input.automation.module.game.MeteredGameObjectInterface")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local MeteredGameObject = {}
MeteredGameObject.__index = MeteredGameObject
MeteredGameObject.className = "MeteredGameObject"

function MeteredGameObject:_init_fields()
    self.ratios = nil
    self.good = false
    self.dropping = false
    self.minX = nil
    self.maxX = nil
    self.y = nil
    self.size = nil
    self.RATIOS_LABEL = "Ratios: "
    self.IS_GOOD_LABEL = "isGood: "
    self.IS_DROPPPING_LABEL = "isDropping: "
end


function MeteredGameObject.new(bufferedImage, minX, maxX, y)
    local self = setmetatable({}, MeteredGameObject)
    self:_init_fields()
        self:setRatios(java_new_array(nil, (bufferedImage.n or #bufferedImage)))
        self:setMinX(minX)
        self:setMaxX(maxX)
        self:setY(y)
        self:setSize(maxX - minX)
        for index = 0, (bufferedImage.n or #bufferedImage) - 1 do
            local nominator = GraphicsAnalysisUtil.getNominator(bufferedImage[index + 1], self:getMinX(), self:getMaxX(), self:getY())
            self:getRatios()[index + 1] = nominator / self:getSize()
        end
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) > 0.93 then
            self:setGood(true)
        else
            self:setGood(false)
        end
        if (self:getRatios()[(bufferedImage.n or #bufferedImage) - 1 + 1] + 0.0) < (self:getRatios()[1] + 0.0) then
            self:setDropping(true)
        else
            self:setDropping(false)
        end
    return self
end


function MeteredGameObject:isGood()
        return self.good
end


function MeteredGameObject:setGood(good)
        self.good = good
end


function MeteredGameObject:isDropping()
        return self.dropping
end


function MeteredGameObject:setDropping(dropping)
        self.dropping = dropping
end


function MeteredGameObject:getRatios()
        return self.ratios
end


function MeteredGameObject:toString()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.RATIOS_LABEL)
        for index = 0, (self:getRatios().n or #self:getRatios()) - 1 do
            stringBuffer:append(tostring(self:getRatios()[index + 1]))
            if index < (self:getRatios().n or #self:getRatios()) - 1 then
                stringBuffer:append(commonSeps.COMMA_SEP)
            end
        end
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_GOOD_LABEL)
        stringBuffer:appendboolean(self:isGood())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append(self.IS_DROPPPING_LABEL)
        stringBuffer:appendboolean(self:isDropping())
        return tostring(stringBuffer)
end
MeteredGameObject.__tostring = function(self) return self:toString() end


function MeteredGameObject:setRatios(ratios)
        self.ratios = ratios
end


function MeteredGameObject:getMinX()
        return self.minX
end


function MeteredGameObject:setMinX(minX)
        self.minX = minX
end


function MeteredGameObject:getMaxX()
        return self.maxX
end


function MeteredGameObject:setMaxX(maxX)
        self.maxX = maxX
end


function MeteredGameObject:getY()
        return self.y
end


function MeteredGameObject:setY(y)
        self.y = y
end


function MeteredGameObject:getSize()
        return self.size
end


function MeteredGameObject:setSize(size)
        self.size = size
end

return MeteredGameObject

