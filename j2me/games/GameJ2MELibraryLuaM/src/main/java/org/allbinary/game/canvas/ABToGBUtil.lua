-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2022 AllBinary 
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
-- package org.allbinary.game.canvas

-- local Canvas = require("javax.microedition.lcdui.Canvas")
-- local NullCanvas = require("javax.microedition.lcdui.NullCanvas")
local AllBinaryGameLayerManager = require("org.allbinary.game.layer.AllBinaryGameLayerManager")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local ABToGBUtil = {}
ABToGBUtil.__index = ABToGBUtil
ABToGBUtil.className = "ABToGBUtil"

function ABToGBUtil:_init_fields()
    self.abCanvas = NullCanvas.NULL_CANVAS
    self.allBinaryGameLayerManager = AllBinaryGameLayerManager.getNullInstance()
end

function ABToGBUtil.new()
    local self = setmetatable({}, ABToGBUtil)
    self:_init_fields()
    return self
end


function ABToGBUtil.getInstance()
        return ABToGBUtil.instance
end

ABToGBUtil.instance = ABToGBUtil.new()

return ABToGBUtil

