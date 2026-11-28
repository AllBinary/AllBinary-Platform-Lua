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
-- package org.allbinary.media.audio

local PlayerQueue = {}
package.loaded["org.allbinary.media.audio.PlayerQueue"] = PlayerQueue

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

local PreLogUtil = java_lazy("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local NoSound = java_lazy("org.allbinary.media.audio.NoSound")
local Sound = java_lazy("org.allbinary.media.audio.Sound")

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

-- class table PlayerQueue is declared before the requires
PlayerQueue.__index = PlayerQueue
PlayerQueue.className = "PlayerQueue"
PlayerQueue.javaClassName = "org.allbinary.media.audio.PlayerQueue"

function PlayerQueue:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.list = BasicArrayListD.new()
    if self.max == nil then self.max = 0 end
end


function PlayerQueue._jinit(self, max)
    PlayerQueue._init_fields(self)
        self.max = max
    return self
end

function PlayerQueue.new(...)
    local self = setmetatable({}, PlayerQueue)
    PlayerQueue._jinit(self, ...)
    return self
end


function PlayerQueue:add(sound)
        local try_ok, try_error, try_value = pcall(function()
            if not (self.list:contains(sound)) then
                self.list:add(sound)
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            PreLogUtil.put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD)
        end
end


function PlayerQueue:process()
        local sound = NoSound.getInstance()
        local try_ok, try_error, try_value = pcall(function()
            local played = false
            if self.list:size() > 0 then
                sound = self.list:removeAt(0)
                if not rawequal(sound, nil) then
                    sound:getPlayerP():start()
                end
                while self.list:size() > self.max do
                    self.list:removeAt(0)
                end
                played = true
            end
            do return "__jreturn", played end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            local resource = StringUtil.getInstance().EMPTY_STRING
            if not rawequal(sound, nil) then
                resource = sound:getResource()
            end
            PreLogUtil.put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(resource)), self, self.commonStrings.PROCESS)
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function PlayerQueue:clear()
        self.list:clear()
end


function PlayerQueue:toString()
        return tostring(StringMaker.new():append(PlayerQueue.TOTAL):appendint(self.list:size()))
end
PlayerQueue.__tostring = function(self) return self:toString() end

PlayerQueue.TOTAL = "Sounds In Queue: "

return PlayerQueue

