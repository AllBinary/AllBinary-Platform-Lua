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
-- package org.allbinary.game.input.mapping

-- local Canvas = require("javax.microedition.lcdui.Canvas")
local GameKey = require("org.allbinary.game.input.GameKey")
local GameKeyFactory = require("org.allbinary.game.input.GameKeyFactory")
local Input = require("org.allbinary.game.input.Input")
local InputFactory = require("org.allbinary.game.input.InputFactory")
local NullUtil = require("org.allbinary.logic.NullUtil")
local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonLabels = require("org.allbinary.string.CommonLabels")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local InputMapping = require("org.allbinary.game.input.mapping.InputMapping")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

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

local InputToGameKeyMapping = {}
InputToGameKeyMapping.__index = InputToGameKeyMapping
InputToGameKeyMapping.className = "InputToGameKeyMapping"
setmetatable(InputToGameKeyMapping, {__index = InputMapping})

function InputToGameKeyMapping:_init_fields()
    self.gameKeyFactory = GameKeyFactory.getInstance()
    self.mappedGameKeys = {self.gameKeyFactory.UP, self.gameKeyFactory.DOWN, self.gameKeyFactory.LEFT, self.gameKeyFactory.RIGHT}
    self.platformToGameKeyMapping = java_new_array(nil, InputFactory.getInstance().MAX)
    self.negativePlatformToGameKeyMapping = java_new_array(nil, 0)
end


function InputToGameKeyMapping.getNullInstance()
        if InputToGameKeyMapping.instance == NullUtil.getInstance().NULL_OBJECT then
            InputToGameKeyMapping.instance = InputToGameKeyMapping.new()
        end
        return InputToGameKeyMapping.instance
end


function InputToGameKeyMapping.new()
    local self = setmetatable(InputMapping.new(), InputToGameKeyMapping)
    self:_init_fields()
        self.logUtil:putF(self.commonStrings.START, self, self.commonStrings.CONSTRUCTOR)
        self:clear()
    return self
end


function InputToGameKeyMapping:clear()
        for index = (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) - 1, 0, -1 do
            self.platformToGameKeyMapping[index + 1] = self.gameKeyFactory.NONE
        end
end


function InputToGameKeyMapping:removeAll()
        InputMapping.removeAll(self)
        self:clear()
end


function InputToGameKeyMapping:addMapping(inputToGameKeyMapping)
        for index = inputToGameKeyMapping:getMaxMappable() - 1, 0, -1 do
            local input = inputToGameKeyMapping:getInstance(index)
            if input ~= self.gameKeyFactory.NONE then
                self:addAll(input, inputToGameKeyMapping:getMappedInput(input))
            end
        end
end


function InputToGameKeyMapping:addAll(input, list)
        for index = list:size() - 1, 0, -1 do
            local mappedToInput = list.objectArray[index + 1]
            self:add(input, mappedToInput)
        end
end


function InputToGameKeyMapping:add(input, mappedToInput)
        InputMapping.add(self, input, mappedToInput)
        self:set(input, mappedToInput)
end


function InputToGameKeyMapping:remove(input, mappedToInput)
        self.logUtil:putF(tostring(StringMaker.new():append(CommonLabels.getInstance().START_LABEL):append(StringUtil.getInstance():toString(input)):append(" == "):append(StringUtil.getInstance():toString(mappedToInput))), self, "InputToGameKeyMapping::remove")
        InputMapping.remove(self, input, mappedToInput)
        self:set(input, self.gameKeyFactory.NONE)
end


function InputToGameKeyMapping:set(input, mappedToInput)
        local id = mappedToInput:getId()
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            self.platformToGameKeyMapping[id + 1] = input
        end
end


function InputToGameKeyMapping:getMaxMappable()
        return (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping)
end


function InputToGameKeyMapping:getReverseInstance(id)
        local list = BasicArrayListD.new()
        local inputFactory = InputFactory.getInstance()
        for index = 0, (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) - 1 do
            if self.platformToGameKeyMapping[index + 1]:getId() == id then
                local input = inputFactory:getInstanceById(index)
                if input ~= nil then
                    list:add(input)
                end
            end
        end
        return list
end


-- throws Exception
function InputToGameKeyMapping:initGameKey(canvas, gameKey)
        local key = canvas:getKeyCode(gameKey:getId())
        if key < 0 and -key < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            self.negativePlatformToGameKeyMapping[-key + 1] = gameKey
        elseif key > 0 then
            if self.platformToGameKeyMapping[key + 1] == self.gameKeyFactory.NONE then
                self.platformToGameKeyMapping[key + 1] = gameKey
            end
        else
            PreLogUtil.putOE(tostring(StringMaker.new():append(tostring(gameKey)):append(CommonSeps.getInstance().COLON_SEP):appendint(key)), self, self.commonStrings.INIT, java_exception("Exception"))
        end
end


-- throws Exception
function InputToGameKeyMapping:getSmallestCanvasGameKeyCode(canvas)
        local nextKey = 0
        local smallestKey = 0
        do
            local index = (self.mappedGameKeys.n or #self.mappedGameKeys)
            while (function() index = index - 1 return index end)() >= 0 do
            nextKey = canvas:getKeyCode(self.mappedGameKeys[index + 1]:getId())
            if nextKey < smallestKey then
                smallestKey = nextKey
            end
            end
        end
        return smallestKey
end


function InputToGameKeyMapping:init(canvas)
        local try_ok, try_error = pcall(function()
            local negativePlatformToGameKeyMapping = java_new_array(nil, 0)
            local smallestKey = self:getSmallestCanvasGameKeyCode(canvas)
            if smallestKey < 0 then
                smallestKey = smallestKey - 1
                if smallestKey < -256 then
                    smallestKey = -256
                end
                negativePlatformToGameKeyMapping = java_new_array(nil, -smallestKey)
                do
                    local index = (negativePlatformToGameKeyMapping.n or #negativePlatformToGameKeyMapping)
                    while (function() index = index - 1 return index end)() >= 0 do
                    negativePlatformToGameKeyMapping[index + 1] = self.gameKeyFactory.NONE
                    end
                end
                self.negativePlatformToGameKeyMapping = negativePlatformToGameKeyMapping
            end
            do
                local index = (self.mappedGameKeys.n or #self.mappedGameKeys)
                while (function() index = index - 1 return index end)() >= 0 do
                self:initGameKey(canvas, self.mappedGameKeys[index + 1])
                end
            end
        end)
        if not try_ok then
            local t = try_error
            self.logUtil:put(self.commonStrings.EXCEPTION, self, self.commonStrings.INIT, t)
        end
end


function InputToGameKeyMapping:getInstanceForCanvas(canvas, id)
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            return self.platformToGameKeyMapping[id + 1]
        elseif id < 0 and -id < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            return self.negativePlatformToGameKeyMapping[-id + 1]
        else
            return self.gameKeyFactory.NONE
        end
end


function InputToGameKeyMapping:getInstance(id)
        if id >= 0 and id < (self.platformToGameKeyMapping.n or #self.platformToGameKeyMapping) then
            return self.platformToGameKeyMapping[id + 1]
        elseif id < 0 and -id < (self.negativePlatformToGameKeyMapping.n or #self.negativePlatformToGameKeyMapping) then
            return self.negativePlatformToGameKeyMapping[-id + 1]
        else
            return self.gameKeyFactory.NONE
        end
end

InputToGameKeyMapping.instance = NullUtil.getInstance().NULL_OBJECT

return InputToGameKeyMapping

