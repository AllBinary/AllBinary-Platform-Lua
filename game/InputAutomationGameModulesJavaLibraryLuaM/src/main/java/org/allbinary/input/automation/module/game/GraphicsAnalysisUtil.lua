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

-- local awt = require("java.awt")
-- local BufferedImage = require("java.awt.image.BufferedImage")
local ColorCacheFactory = require("org.allbinary.graphics.color.ColorCacheFactory")
local ColorCacheable = require("org.allbinary.graphics.color.ColorCacheable")
local AutomaticCacheInterface = require("org.allbinary.logic.util.cache.AutomaticCacheInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local GraphicsAnalysisUtil = {}
GraphicsAnalysisUtil.__index = GraphicsAnalysisUtil
GraphicsAnalysisUtil.className = "GraphicsAnalysisUtil"


function GraphicsAnalysisUtil.new()
    local self = setmetatable({}, GraphicsAnalysisUtil)
    return self
end


-- throws Exception
function GraphicsAnalysisUtil.getNominator(bufferedImage, min_x, max_x, y)
        for index = math.tointeger(max_x // 1), math.tointeger(min_x // 1) + 1, -1 do
            local colorInteger = tostring(bufferedImage:getRGB(index, math.tointeger(y // 1)))
            local automaticCacheInterface = ColorCacheFactory.getInstance()
            local colorCacheable = automaticCacheInterface:get(colorInteger)
            local color = colorCacheable:getColor()
            if color:getRed() < GraphicsAnalysisUtil.MAX and color:getGreen() < GraphicsAnalysisUtil.MAX and color:getBlue() < GraphicsAnalysisUtil.MAX then
            else
                return index - math.tointeger(min_x // 1)
            end
        end
        return 0.0
end

GraphicsAnalysisUtil.MAX = 122

return GraphicsAnalysisUtil

