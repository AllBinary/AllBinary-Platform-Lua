-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2003 AllBinary 
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
-- package org.allbinary.game.layer

local CommonSeps = require("org.allbinary.string.CommonSeps")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local PositionStrings = require("org.allbinary.math.PositionStrings")
local ABHashtable = require("org.allbinary.util.ABHashtable")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local LayerUtil = {}
LayerUtil.__index = LayerUtil
LayerUtil.className = "LayerUtil"

function LayerUtil.new()
    local self = setmetatable({}, LayerUtil)
    return self
end


function LayerUtil.toString(hashtable, x, y, z)
        local commonSeps = CommonSeps.getInstance()
        local positionStrings = PositionStrings.getInstance()
        local stringBuffer = StringMaker.new()
        stringBuffer:append(LayerUtil.HASHTABLE)
        stringBuffer:append(StringUtil.getInstance():toString(hashtable))
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.X_LABEL)
        stringBuffer:appendint(x)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Y_LABEL)
        stringBuffer:appendint(y)
        stringBuffer:append(commonSeps.SPACE)
        stringBuffer:append(positionStrings.Z_LABEL)
        stringBuffer:appendint(z)
        return tostring(stringBuffer)
end

LayerUtil.HASHTABLE = "Hashtable: "

return LayerUtil

