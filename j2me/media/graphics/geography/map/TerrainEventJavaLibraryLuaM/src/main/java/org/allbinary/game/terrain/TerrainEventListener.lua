-- Generated Code Do Not Modify
-- package org.allbinary.game.terrain

local TerrainEventListener = {}
package.loaded["org.allbinary.game.terrain.TerrainEventListener"] = TerrainEventListener

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

local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local AllBinaryEventObject = java_lazy("org.allbinary.logic.util.event.AllBinaryEventObject")
local EventStrings = java_lazy("org.allbinary.logic.util.event.EventStrings")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local TerrainEventListenerInterface = require("org.allbinary.game.terrain.TerrainEventListenerInterface")
local TerrainEvent = java_lazy("org.allbinary.game.terrain.TerrainEvent")

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

-- class table TerrainEventListener is declared before the requires
TerrainEventListener.__index = TerrainEventListener
TerrainEventListener.className = "TerrainEventListener"
TerrainEventListener.javaClassName = "org.allbinary.game.terrain.TerrainEventListener"
TerrainEventListener.java_implements = " TerrainEventListenerInterface "
TerrainEventListener.java_interfaces = function() return {TerrainEventListenerInterface} end

function TerrainEventListener:_init_fields()
    self.list = BasicArrayListD.new()
end

function TerrainEventListener._jinit(self)
    TerrainEventListener._init_fields(self)
    return self
end

function TerrainEventListener.new()
    return TerrainEventListener._jinit(setmetatable({}, TerrainEventListener))
end


function TerrainEventListener:onEvent(eventObject)
        ForcedLogUtil.log(EventStrings.getInstance().PERFORMANCE_MESSAGE, self)
end


function TerrainEventListener:onTerrainEvent(terrainEvent)
        self.list:clear()
        self.list:add(terrainEvent)
end


function TerrainEventListener:getList()
        return self.list
end

return TerrainEventListener

