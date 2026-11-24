-- Generated Code Do Not Modify
-- package org.allbinary.logic.visual.media

local ImageIOUtil = {}
package.loaded["org.allbinary.logic.visual.media.ImageIOUtil"] = ImageIOUtil

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

-- local BufferedImage = require("java.awt.image.BufferedImage")
-- local RenderedImage = require("java.awt.image.RenderedImage")
-- local ImageIO = require("javax.imageio.ImageIO")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbFileNativeUtil = java_lazy("org.allbinary.logic.io.file.AbFileNativeUtil")

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

-- class table ImageIOUtil is declared before the requires
ImageIOUtil.__index = ImageIOUtil
ImageIOUtil.className = "ImageIOUtil"
ImageIOUtil.javaClassName = "org.allbinary.logic.visual.media.ImageIOUtil"

function ImageIOUtil._jinit(self)
    return self
end

function ImageIOUtil.new()
    return ImageIOUtil._jinit(setmetatable({}, ImageIOUtil))
end


-- throws Exception
function ImageIOUtil.read(file)
        return ImageIO.read(AbFileNativeUtil.get(file))
end


-- throws Exception
function ImageIOUtil.write(renderedImage, name, file)
        return ImageIO.write(renderedImage, name, AbFileNativeUtil.get(file))
end

return ImageIOUtil

