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
-- package org.allbinary.logic.system.hardware.components.linux

local HardwareComponentInterface = require("org.allbinary.logic.system.hardware.components.interfaces.HardwareComponentInterface")
local VideoInterface = require("org.allbinary.logic.system.hardware.components.interfaces.VideoInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local Video = {}
Video.__index = Video
Video.className = "Video"

function Video:_init_fields()
    self.data = nil
end


function Video.new(data)
    local self = setmetatable({}, Video)
    self:_init_fields()
        self.data = data
    return self
end


function Video:compareTo(componentInterface)
        return true
end


function Video:toString()
        return self.data
end
Video.__tostring = function(self) return self:toString() end

return Video

