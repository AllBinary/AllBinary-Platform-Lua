-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local ActivityFractureControllerUtilFactory = {}
package.loaded["org.allbinary.game.input.ActivityFractureControllerUtilFactory"] = ActivityFractureControllerUtilFactory

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

local AndroidInfoFactory = java_lazy("org.allbinary.android.AndroidInfoFactory")
local AndroidAPI12KeyFactory = java_lazy("org.allbinary.game.input.AndroidAPI12KeyFactory")
local AndroidAPI1KeyFactory = java_lazy("org.allbinary.game.input.AndroidAPI1KeyFactory")
local AndroidAPI9KeyFactory = java_lazy("org.allbinary.game.input.AndroidAPI9KeyFactory")
local AndroidKeyFactory = java_lazy("org.allbinary.game.input.AndroidKeyFactory")

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

-- class table ActivityFractureControllerUtilFactory is declared before the requires
ActivityFractureControllerUtilFactory.__index = ActivityFractureControllerUtilFactory
ActivityFractureControllerUtilFactory.className = "ActivityFractureControllerUtilFactory"
ActivityFractureControllerUtilFactory.javaClassName = "org.allbinary.game.input.ActivityFractureControllerUtilFactory"

function ActivityFractureControllerUtilFactory._jinit(self)
    return self
end

function ActivityFractureControllerUtilFactory.new()
    return ActivityFractureControllerUtilFactory._jinit(setmetatable({}, ActivityFractureControllerUtilFactory))
end


function ActivityFractureControllerUtilFactory.getInstance()
        local SDK_VERSION = AndroidInfoFactory.getInstance():getVersion()
        if SDK_VERSION <= 8 then
            return AndroidAPI1KeyFactory.getInstance()
        elseif SDK_VERSION <= 11 then
            return AndroidAPI9KeyFactory.getInstance()
        else
            return AndroidAPI12KeyFactory.getAPI12Instance()
        end
end

return ActivityFractureControllerUtilFactory

