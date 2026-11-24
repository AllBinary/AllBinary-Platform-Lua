-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

local MediaIOUtil = {}
package.loaded["org.allbinary.logic.visual.media.MediaIOUtil"] = MediaIOUtil

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

-- local ImageIO = require("javax.imageio.ImageIO")

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

-- class table MediaIOUtil is declared before the requires
MediaIOUtil.__index = MediaIOUtil
MediaIOUtil.className = "MediaIOUtil"
MediaIOUtil.javaClassName = "org.allbinary.logic.visual.media.MediaIOUtil"

function MediaIOUtil._jinit(self)
    return self
end

function MediaIOUtil.new()
    return MediaIOUtil._jinit(setmetatable({}, MediaIOUtil))
end


function MediaIOUtil.getInstance()
        return MediaIOUtil.instance_f
end


function MediaIOUtil:getReaderFormatNames()
        return ImageIO.getReaderFormatNames()
end


function MediaIOUtil:getWriterFormatNames()
        return ImageIO.getWriterFormatNames()
end

MediaIOUtil.instance_f = MediaIOUtil.new()

return MediaIOUtil

