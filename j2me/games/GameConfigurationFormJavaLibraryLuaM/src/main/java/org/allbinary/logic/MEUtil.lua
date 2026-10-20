-- 
-- AllBinary Open License Version 1 
-- Copyright (c) 2026 AllBinary 
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
-- package org.allbinary.logic

-- local Item = require("javax.microedition.lcdui.Item")
local CommandForm = require("org.allbinary.graphics.displayable.screen.CommandForm")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

--Handle the differences in the public platform vs the raw JS build
local MEUtil = {}
MEUtil.__index = MEUtil
MEUtil.className = "MEUtil"

function MEUtil.new()
    local self = setmetatable({}, MEUtil)
    return self
end


function MEUtil.getInstance()
        return MEUtil.instance
end


function MEUtil:appendItem(form, item)
        form:append(item)
end

MEUtil.instance = MEUtil.new()

return MEUtil

