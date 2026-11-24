-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local RTSGameStrings = {}
package.loaded["org.allbinary.game.layer.RTSGameStrings"] = RTSGameStrings

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

-- class table RTSGameStrings is declared before the requires
RTSGameStrings.__index = RTSGameStrings
RTSGameStrings.className = "RTSGameStrings"
RTSGameStrings.javaClassName = "org.allbinary.game.layer.RTSGameStrings"

function RTSGameStrings:_init_fields()
    self.DRAG_TO_SPOT = "Please Drag"
    self.NOT_YOURS = "Not Yours"
    self.NEW_UNIT = "New Unit"
    self.NEW_WAYPOINT = "New Waypoint"
    self.BUILDING = "Building"
    self.UPGRADE = "Upgrading"
    self.DOWNGRADE = "Downgrading"
    self.NO_MONEY = "Not Enough Money"
    self.SPOT_TAKEN = "Spot Taken"
    self.BUILDING_COLLISION = "Building Collision"
    self.STRUCTURE_TO_CLOSE = "Building To Close"
    self.MAP_EDGE = "Map Edge"
    self.ROAD_COLLISION = "Road Collision"
    self.SELECT_BUILD_SPOT = "Select Build Spot"
    self.BUILD_ON_PATH = "Not On Path"
    self.DRAGGABLE = "Draggable"
end

function RTSGameStrings._jinit(self)
    RTSGameStrings._init_fields(self)
    return self
end

function RTSGameStrings.new()
    return RTSGameStrings._jinit(setmetatable({}, RTSGameStrings))
end


function RTSGameStrings.getInstance()
        return RTSGameStrings.instance_f
end

RTSGameStrings.instance_f = RTSGameStrings.new()

return RTSGameStrings

