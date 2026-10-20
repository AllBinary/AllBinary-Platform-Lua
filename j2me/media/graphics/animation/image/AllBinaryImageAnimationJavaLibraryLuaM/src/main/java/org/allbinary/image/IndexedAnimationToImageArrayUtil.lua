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
-- package org.allbinary.image

-- local Image = require("javax.microedition.lcdui.Image")
local IndexedAnimation = require("org.allbinary.animation.IndexedAnimation")

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local IndexedAnimationToImageArrayUtil = {}
IndexedAnimationToImageArrayUtil.__index = IndexedAnimationToImageArrayUtil
IndexedAnimationToImageArrayUtil.className = "IndexedAnimationToImageArrayUtil"

function IndexedAnimationToImageArrayUtil.new()
    local self = setmetatable({}, IndexedAnimationToImageArrayUtil)
    return self
end


-- throws Exception
function IndexedAnimationToImageArrayUtil.getInstance(width, height, sequentialAnimationInterface)
        local size = sequentialAnimationInterface:getAnimationSize()
        local imageArray = java_new_array(nil, size)
        for index = 0, size - 1 do
            sequentialAnimationInterface:setFrame(index)
            imageArray[index + 1] = AnimationFrameToImageUtil.getInstance():getInstanceWH(width, height, sequentialAnimationInterface)
        end
        return imageArray
end

return IndexedAnimationToImageArrayUtil

