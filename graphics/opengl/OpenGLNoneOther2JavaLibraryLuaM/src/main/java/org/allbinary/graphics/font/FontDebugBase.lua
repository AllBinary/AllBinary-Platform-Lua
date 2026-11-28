-- Generated Code Do Not Modify
-- package org.allbinary.graphics.font

local FontDebugBase = {}
package.loaded["org.allbinary.graphics.font.FontDebugBase"] = FontDebugBase

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

local Font = java_lazy("javax.microedition.lcdui.Font")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")

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

--OpenGLNoneOther2JavaLibrary
-- class table FontDebugBase is declared before the requires
FontDebugBase.__index = FontDebugBase
FontDebugBase.className = "FontDebugBase"
FontDebugBase.javaClassName = "org.allbinary.graphics.font.FontDebugBase"

function FontDebugBase:_init_fields()
    self.SET_FONT = "setFont"
end

function FontDebugBase._jinit(self)
    FontDebugBase._init_fields(self)
    return self
end

function FontDebugBase.new()
    return FontDebugBase._jinit(setmetatable({}, FontDebugBase))
end


function FontDebugBase.getInstance()
        return FontDebugBase.instanceBase
end


function FontDebugBase:debugMetrics(currentFont, convertedTextSize, displayMetrics, stringBuffer)
end


function FontDebugBase:debugDpi(densityDpi, stringBuffer)
end


function FontDebugBase:debugDimension(currentFont, convertedTextSize, longestDimensionTotalPixels, stringBuffer)
end

FontDebugBase.instanceBase = FontDebugBase.new()

return FontDebugBase

