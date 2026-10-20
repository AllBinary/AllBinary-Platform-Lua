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

-- local GL = require("javax.microedition.khronos.opengles.GL")
-- local Graphics = require("javax.microedition.lcdui.Graphics")
-- local Image = require("javax.microedition.lcdui.Image")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PreResourceImageUtil = {}
PreResourceImageUtil.__index = PreResourceImageUtil
PreResourceImageUtil.className = "PreResourceImageUtil"

function PreResourceImageUtil.new()
    local self = setmetatable({}, PreResourceImageUtil)
    return self
end


function PreResourceImageUtil.getInstance()
        return PreResourceImageUtil.instance
end


function PreResourceImageUtil:encapsulate(image)
        return image
end


function PreResourceImageUtil:updateGL(gl, image)
end


function PreResourceImageUtil:update(graphics, image)
end

PreResourceImageUtil.instance = PreResourceImageUtil.new()

return PreResourceImageUtil

