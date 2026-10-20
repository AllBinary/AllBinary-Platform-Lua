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
-- package org.allbinary.game.paint.help

local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local Input = require("org.allbinary.game.input.Input")
local PlatformInputMappingFactory = require("org.allbinary.game.input.PlatformInputMappingFactory")
local GameInputMapping = require("org.allbinary.game.input.mapping.GameInputMapping")
local PersistentInputMapping = require("org.allbinary.game.input.mapping.PersistentInputMapping")
local BasicColor = require("org.allbinary.graphics.color.BasicColor")
local BasicColorFactory = require("org.allbinary.graphics.color.BasicColorFactory")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local HelpPaintable = require("org.allbinary.game.paint.help.HelpPaintable")

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

local BasicInputMappingHelpPaintable = {}
BasicInputMappingHelpPaintable.__index = BasicInputMappingHelpPaintable
BasicInputMappingHelpPaintable.className = "BasicInputMappingHelpPaintable"
setmetatable(BasicInputMappingHelpPaintable, {__index = HelpPaintable})

function BasicInputMappingHelpPaintable:_init_fields()
    self.gameInputMappingArray = nil
    self.NONE = GameKeyFactory.getInstance().NONE
end


function BasicInputMappingHelpPaintable.new(gameInputMappingArray, basicColor)
    local self = setmetatable(HelpPaintable.new("Help Screen", BasicColorFactory.getInstance().BLACK, basicColor), BasicInputMappingHelpPaintable)
    self:_init_fields()
        -- super(...) made self above
        self.gameInputMappingArray = gameInputMappingArray
        self:update(self.NONE, self.NONE)
    return self
end


function BasicInputMappingHelpPaintable:update(selectedGameKey, selectedInput)
        local gameKeyMapping = PlatformInputMappingFactory.getInstance():getPersistentInputMappingInstance()
        local EQUAL = " = "
        local stringMaker = StringMaker.new()
        local size = (self.gameInputMappingArray.n or #self.gameInputMappingArray)
        local keyInfo = java_new_array(nil, size)
        local gameInputMapping = nil
        local gameKey = nil
        local list = nil
        for index = 0, size - 1 do
            gameInputMapping = self.gameInputMappingArray[index + 1]
            gameKey = gameInputMapping:getGameKey()
            list = gameKeyMapping:getInputMapping():getMappedInput(gameKey)
            stringMaker:delete(0, stringMaker:length())
            keyInfo[index + 1] = tostring(stringMaker:append(gameInputMapping:getName()):append(EQUAL):append(self:get(list)))
        end
        HelpPaintable.setInputInfoP(self, keyInfo)
end


function BasicInputMappingHelpPaintable:get(keyList)
        local commonSeps = CommonSeps.getInstance()
        local stringBuffer = StringMaker.new()
        local AND = "and "
        local key = nil
        local size = keyList:size()
        for index = 0, size - 1 do
            key = keyList.objectArray[index + 1]
            stringBuffer:append(key:getName())
            if index + 1 < keyList:size() then
                if keyList:size() == 2 then
                    stringBuffer:append(commonSeps.SPACE):append(AND)
                else
                    if index + 2 == keyList:size() then
                        stringBuffer:append(commonSeps.COMMA_SEP)
                        stringBuffer:append(AND)
                    else
                        stringBuffer:append(commonSeps.COMMA_SEP)
                    end
                end
            end
        end
        return tostring(stringBuffer)
end

return BasicInputMappingHelpPaintable

