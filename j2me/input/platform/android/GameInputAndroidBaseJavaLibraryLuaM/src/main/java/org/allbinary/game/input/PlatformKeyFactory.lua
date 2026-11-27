-- Generated Code Do Not Modify
-- package org.allbinary.game.input

local PlatformKeyFactory = {}
package.loaded["org.allbinary.game.input.PlatformKeyFactory"] = PlatformKeyFactory

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

local NullUtil = java_lazy("org.allbinary.logic.NullUtil")
local ActivityFractureControllerUtilFactory = java_lazy("org.allbinary.game.input.ActivityFractureControllerUtilFactory")
local AndroidGameKey = java_lazy("org.allbinary.game.input.AndroidGameKey")
local AndroidKeyFactory = java_lazy("org.allbinary.game.input.AndroidKeyFactory")
local Input = java_lazy("org.allbinary.game.input.Input")

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

-- class table PlatformKeyFactory is declared before the requires
PlatformKeyFactory.__index = PlatformKeyFactory
PlatformKeyFactory.className = "PlatformKeyFactory"
PlatformKeyFactory.javaClassName = "org.allbinary.game.input.PlatformKeyFactory"

function PlatformKeyFactory:_init_fields()
    self.androidKeyFactory = ActivityFractureControllerUtilFactory.getInstance()
end

function PlatformKeyFactory._jinit(self)
    PlatformKeyFactory._init_fields(self)
    return self
end

function PlatformKeyFactory.new()
    return PlatformKeyFactory._jinit(setmetatable({}, PlatformKeyFactory))
end


function PlatformKeyFactory.getInstance()
        if PlatformKeyFactory.instance_f == NullUtil.getInstance().NULL_OBJECT then
            PlatformKeyFactory.instance_f = PlatformKeyFactory.new()
        end
        return PlatformKeyFactory.instance_f
end


function PlatformKeyFactory:getString(keyCode)
        return AndroidGameKey.getString(keyCode)
end


function PlatformKeyFactory:isSubmission(input)
        return self.androidKeyFactory:isSubmission(input)
end


function PlatformKeyFactory:isDelete(input)
        return self.androidKeyFactory:isDelete(input)
end


function PlatformKeyFactory:isBackSpace(input)
        return self.androidKeyFactory:isBackSpace(input)
end


function PlatformKeyFactory:isLeft(input)
        return self.androidKeyFactory:isLeft(input)
end


function PlatformKeyFactory:isRight(input)
        return self.androidKeyFactory:isRight(input)
end


function PlatformKeyFactory:isUp(input)
        return self.androidKeyFactory:isUp(input)
end


function PlatformKeyFactory:isDown(input)
        return self.androidKeyFactory:isDown(input)
end


function PlatformKeyFactory:isEnter(input)
        return self.androidKeyFactory:isEnter(input)
end

PlatformKeyFactory.instance_f = NullUtil.getInstance().NULL_OBJECT

return PlatformKeyFactory

