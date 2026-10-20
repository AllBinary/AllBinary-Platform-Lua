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

local PreLogUtil = require("org.allbinary.logic.communication.log.PreLogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PlayerQueue = {}
PlayerQueue.__index = PlayerQueue
PlayerQueue.className = "PlayerQueue"

function PlayerQueue:_init_fields()
    self.commonStrings = CommonStrings.getInstance()
    self.list = BasicArrayListD.new()
    self.max = nil
end


function PlayerQueue.new(max)
    local self = setmetatable({}, PlayerQueue)
    self:_init_fields()
        self.max = max
    return self
end


function PlayerQueue:add(sound)
        local try_ok, try_error = pcall(function()
            if not self.list:contains(sound) then
                self.list:add(sound)
            end
        end)
        if not try_ok then
            local e = try_error
            PreLogUtil.put(self.commonStrings.EXCEPTION, self, self.commonStrings.ADD)
        end
end


function PlayerQueue:process()
        local sound = NoSound.getInstance()
        local try_ok, try_error = pcall(function()
            local played = false
            if self.list:size() > 0 then
                sound = self.list:removeAt(0)
                if sound ~= nil then
                    sound:getPlayerP():start()
                end
                while self.list:size() > self.max do
                    self.list:removeAt(0)
                end
                played = true
            end
            return played
        end)
        if not try_ok then
            local e = try_error
            local resource = StringUtil.getInstance().EMPTY_STRING
            if sound ~= nil then
                resource = sound:getResource()
            end
            PreLogUtil.put(tostring(StringMaker.new():append(self.commonStrings.EXCEPTION_LABEL):append(resource)), self, self.commonStrings.PROCESS)
            return false
        end
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

