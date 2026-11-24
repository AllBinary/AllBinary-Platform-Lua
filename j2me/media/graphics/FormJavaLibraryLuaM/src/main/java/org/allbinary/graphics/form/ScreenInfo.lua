-- Generated Code Do Not Modify
-- package org.allbinary.graphics.form

local ScreenInfo = {}
package.loaded["org.allbinary.graphics.form.ScreenInfo"] = ScreenInfo

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

-- class table ScreenInfo is declared before the requires
ScreenInfo.__index = ScreenInfo
ScreenInfo.className = "ScreenInfo"
ScreenInfo.javaClassName = "org.allbinary.graphics.form.ScreenInfo"

function ScreenInfo:_init_fields()
    self.SMALL_WIDTH = 320
    self.SMALL_HEIGHT = 240
    self.MEDIUM_WIDTH = 800
    self.MEDIUM_HEIGHT = 600
end

function ScreenInfo._jinit(self)
    ScreenInfo._init_fields(self)
    return self
end

function ScreenInfo.new()
    return ScreenInfo._jinit(setmetatable({}, ScreenInfo))
end


function ScreenInfo.getInstance()
        return ScreenInfo.instance_f
end

ScreenInfo.instance_f = ScreenInfo.new()

return ScreenInfo

