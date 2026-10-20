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

local AnalogLocationInputFactory = require("org.allbinary.game.input.analog.AnalogLocationInputFactory")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")

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

local LocalPlayerInputIdFactory = {}
LocalPlayerInputIdFactory.__index = LocalPlayerInputIdFactory
LocalPlayerInputIdFactory.className = "LocalPlayerInputIdFactory"

function LocalPlayerInputIdFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.MAX_NUMBER_OF_PLAYERS = 6
    self.MAX_FAST_DEVICEID = 65
    self.deviceIdToplayerId = java_new_array(0, self.MAX_FAST_DEVICEID)
    self.playerIdToDeviceId = java_new_array(0, self.MAX_NUMBER_OF_PLAYERS)
    self.playersInPlay = java_new_array(false, self.MAX_NUMBER_OF_PLAYERS)
    self.totalDevicesMapped = 0
end


function LocalPlayerInputIdFactory.new()
    local self = setmetatable({}, LocalPlayerInputIdFactory)
    self:_init_fields()
        for index = (self.deviceIdToplayerId.n or #self.deviceIdToplayerId) - 1, 0, -1 do
            self.deviceIdToplayerId[index + 1] = -1
        end
    return self
end


function LocalPlayerInputIdFactory.getInstance()
        return LocalPlayerInputIdFactory.instance
end


function LocalPlayerInputIdFactory:getDeviceId(playerInputId)
        return self.playerIdToDeviceId[playerInputId + 1]
end


function LocalPlayerInputIdFactory:getPlayerForDevice(deviceId)
        local index = 0
        if deviceId < self.MAX_FAST_DEVICEID then
            local playerInputId = self.deviceIdToplayerId[deviceId + 1]
            if playerInputId ~= -1 then
                return playerInputId
            end
        else
            for index = self.totalDevicesMapped - 1, 0, -1 do
                if self.playerIdToDeviceId[index + 1] == deviceId then
                    return index
                end
            end
        end
        index = self.totalDevicesMapped
        if deviceId < self.MAX_FAST_DEVICEID then
            self.deviceIdToplayerId[deviceId + 1] = index
        else
            self.logUtil:putF(tostring(StringMaker.new():append("Added DeviceId: "):appendint(deviceId):append(" beyond fast Id list")), self, "getPlayerForDevice")
        end
        self.playerIdToDeviceId[index + 1] = deviceId
        AnalogLocationInputFactory.getInstance():addPlayer(self.totalDevicesMapped)
        self.totalDevicesMapped = self.totalDevicesMapped + 1
        self.logUtil:putF(tostring(StringMaker.new():append("Added DeviceId: "):appendint(deviceId):append(" at: "):appendint(index):append(" Total: "):appendint(self.totalDevicesMapped)), self, "getPlayerForDevice")
        return index
end


function LocalPlayerInputIdFactory:getTotalDevicesInPlay()
        local total = 0
        for index = self.totalDevicesMapped - 1, 0, -1 do
            if self.playersInPlay[index + 1] == true then
                total = total + 1
            end
        end
        return total
end


function LocalPlayerInputIdFactory:isPlayerInPlay(playerInputId)
        return self.playersInPlay[playerInputId + 1]
end


function LocalPlayerInputIdFactory:setPlayerInPlay(playerInputId)
        self.logUtil:putF(tostring(StringMaker.new():append("Setting PlayerInPlay with playerInputId: "):appendint(playerInputId)), self, "setPlayerInPlay")
        self.playersInPlay[playerInputId + 1] = true
end


function LocalPlayerInputIdFactory:setPlayerOutOfPlay(playerInputId)
        self.logUtil:putF(tostring(StringMaker.new():append("Setting PlayerOutOfPlay with playerInputId: "):appendint(playerInputId)), self, "setPlayerOutOfPlay")
        self.playersInPlay[playerInputId + 1] = false
end


function LocalPlayerInputIdFactory:getPlayersInPlay()
        return self.playersInPlay
end

LocalPlayerInputIdFactory.instance = LocalPlayerInputIdFactory.new()

return LocalPlayerInputIdFactory

