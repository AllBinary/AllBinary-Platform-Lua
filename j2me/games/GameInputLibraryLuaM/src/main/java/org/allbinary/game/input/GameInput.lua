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
-- package org.allbinary.game.input

local GameInput = {}
package.loaded["org.allbinary.game.input.GameInput"] = GameInput

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

local Features = java_lazy("org.allbinary.game.configuration.feature.Features")
local InputFeatureFactory = java_lazy("org.allbinary.game.configuration.feature.InputFeatureFactory")
local GameKeyEvent = java_lazy("org.allbinary.game.input.event.GameKeyEvent")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")

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

-- class table GameInput is declared before the requires
GameInput.__index = GameInput
GameInput.className = "GameInput"
GameInput.javaClassName = "org.allbinary.game.input.GameInput"

function GameInput:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.gameKeyEventList == nil then self.gameKeyEventList = nil end
    if self.removalGameKeyEventList == nil then self.removalGameKeyEventList = nil end
    if self.isRemoveDuplicateKeyPresses == nil then self.isRemoveDuplicateKeyPresses = false end
end


function GameInput._jinit(self, gameKeyEventList, removalGameKeyEventList)
    GameInput._init_fields(self)
        self.gameKeyEventList = gameKeyEventList
        self.removalGameKeyEventList = removalGameKeyEventList
        self.isRemoveDuplicateKeyPresses = Features.getInstance():isFeature(InputFeatureFactory.getInstance().REMOVE_DUPLICATE_KEY_PRESSES)
    return self
end

function GameInput.new(...)
    local self = setmetatable({}, GameInput)
    GameInput._jinit(self, ...)
    return self
end


function GameInput:add(gameKeyEvent)
        if self.isRemoveDuplicateKeyPresses and self.gameKeyEventList:contains(gameKeyEvent) then
            return
        end
        if not rawequal(gameKeyEvent, nil) then
            self.gameKeyEventList:add(gameKeyEvent)
        else
            self.logUtil:putF("Danger Passed Null GameKeyEvent", self, self.commonStrings.ADD)
        end
end


function GameInput:addForRemoval(gameKeyEvent)
        self.removalGameKeyEventList:add(gameKeyEvent)
end


function GameInput:isForRemoval(gameKeyEvent)
        return self.removalGameKeyEventList:contains(gameKeyEvent)
end


function GameInput:clear()
        self.gameKeyEventList:clear()
end


function GameInput:removeNonAIInputGameKeyEvents()
        local list = self.gameKeyEventList
        local gameKeyEvent = nil
        do
            local index = list:size()
            while (function() index = index - 1 return index end)() >= 0 do
            gameKeyEvent = list.objectArray[index + 1]
            if not rawequal(gameKeyEvent:getSourceId(), 1) then
                list:removeAt(index)
            end
            end
        end
end


function GameInput:update()
        local removeList = self.removalGameKeyEventList
        local list = self.gameKeyEventList
        local size = removeList:size()
        for index = 0, size - 1 do
            local anyType = removeList.objectArray[index + 1]
            do
                local index2 = list:size()
                while (function() index2 = index2 - 1 return index2 end)() >= 0 do
                if rawequal(list.objectArray[index2 + 1], anyType) then
                    list:removeAt(index2)
                end
                end
            end
        end
        removeList:clear()
end


function GameInput:getRemovalGameKeyEventList()
        return self.removalGameKeyEventList
end


function GameInput:getGameKeyEventList()
        return self.gameKeyEventList
end

return GameInput

