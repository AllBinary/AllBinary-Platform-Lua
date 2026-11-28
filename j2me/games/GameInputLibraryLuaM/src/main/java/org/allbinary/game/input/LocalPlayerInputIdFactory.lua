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

local LocalPlayerInputIdFactory = {}
package.loaded["org.allbinary.game.input.LocalPlayerInputIdFactory"] = LocalPlayerInputIdFactory

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

local AnalogLocationInputFactory = java_lazy("org.allbinary.game.input.analog.AnalogLocationInputFactory")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
end

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

-- class table LocalPlayerInputIdFactory is declared before the requires
LocalPlayerInputIdFactory.__index = LocalPlayerInputIdFactory
LocalPlayerInputIdFactory.className = "LocalPlayerInputIdFactory"
LocalPlayerInputIdFactory.javaClassName = "org.allbinary.game.input.LocalPlayerInputIdFactory"

function LocalPlayerInputIdFactory:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.MAX_NUMBER_OF_PLAYERS = 6
    self.MAX_FAST_DEVICEID = 65
    self.deviceIdToplayerId = java_typed_array("I", java_new_array(0, self.MAX_FAST_DEVICEID))
    self.playerIdToDeviceId = java_typed_array("I", java_new_array(0, self.MAX_NUMBER_OF_PLAYERS))
    self.playersInPlay = java_new_array(false, self.MAX_NUMBER_OF_PLAYERS)
    self.totalDevicesMapped = 0
end


function LocalPlayerInputIdFactory._jinit(self)
    LocalPlayerInputIdFactory._init_fields(self)
        for index = (self.deviceIdToplayerId.n or #self.deviceIdToplayerId) - 1, 0, -1 do
            self.deviceIdToplayerId[index + 1] = -1
        end
    return self
end

function LocalPlayerInputIdFactory.new(...)
    local self = setmetatable({}, LocalPlayerInputIdFactory)
    LocalPlayerInputIdFactory._jinit(self, ...)
    return self
end


function LocalPlayerInputIdFactory.getInstance()
        return LocalPlayerInputIdFactory.instance_f
end


function LocalPlayerInputIdFactory:getDeviceId(playerInputId)
        return self.playerIdToDeviceId[playerInputId + 1]
end


function LocalPlayerInputIdFactory:getPlayerForDevice(deviceId)
        local index = 0
        if deviceId < self.MAX_FAST_DEVICEID then
            local playerInputId = self.deviceIdToplayerId[deviceId + 1]
            if not rawequal(playerInputId, -1) then
                return playerInputId
            end
        else
            for index = self.totalDevicesMapped - 1, 0, -1 do
                if rawequal(self.playerIdToDeviceId[index + 1], deviceId) then
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
            if rawequal(self.playersInPlay[index + 1], true) then
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

LocalPlayerInputIdFactory.instance_f = LocalPlayerInputIdFactory.new()

return LocalPlayerInputIdFactory

