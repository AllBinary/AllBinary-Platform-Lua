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
-- package org.allbinary.input.automation.module.game

local GraphicsAnalysisUtil = {}
package.loaded["org.allbinary.input.automation.module.game.GraphicsAnalysisUtil"] = GraphicsAnalysisUtil

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

-- local Color = require("java.awt.Color")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local ColorCacheFactory = java_lazy("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = java_lazy("org.allbinary.graphics.color.ColorCacheable")
local AutomaticCacheInterface = java_lazy("org.allbinary.logic.util.cache.AutomaticCacheInterface")

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

-- class table GraphicsAnalysisUtil is declared before the requires
GraphicsAnalysisUtil.__index = GraphicsAnalysisUtil
GraphicsAnalysisUtil.className = "GraphicsAnalysisUtil"
GraphicsAnalysisUtil.javaClassName = "org.allbinary.input.automation.module.game.GraphicsAnalysisUtil"


function GraphicsAnalysisUtil._jinit(self)
    return self
end

function GraphicsAnalysisUtil.new(...)
    local self = setmetatable({}, GraphicsAnalysisUtil)
    GraphicsAnalysisUtil._jinit(self, ...)
    return self
end


-- throws Exception
function GraphicsAnalysisUtil.getNominator(bufferedImage, min_x, max_x, y)
        for index = require("allbinary_java").number_value(max_x, "intValue"), require("allbinary_java").number_value(min_x, "intValue") + 1, -1 do
            local colorInteger = tostring(bufferedImage:getRGB(index, require("allbinary_java").number_value(y, "intValue")))
            local automaticCacheInterface = ColorCacheFactory.getInstance()
            local colorCacheable = automaticCacheInterface:get(colorInteger)
            local color = colorCacheable:getColor()
            if color:getRed() < GraphicsAnalysisUtil.MAX and color:getGreen() < GraphicsAnalysisUtil.MAX and color:getBlue() < GraphicsAnalysisUtil.MAX then
            else
                return index - require("allbinary_java").number_value(min_x, "intValue")
            end
        end
        return 0.0
end

GraphicsAnalysisUtil.MAX = 122

return GraphicsAnalysisUtil

