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
-- package org.allbinary.business.init

local Directory = require("org.allbinary.logic.io.file.directory.Directory")
local AbPath = require("org.allbinary.logic.io.path.AbPath")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local InitInfo2 = {}
InitInfo2.__index = InitInfo2
InitInfo2.className = "InitInfo2"

function InitInfo2:_init_fields()
    self.directory = Directory.getInstance()
end

function InitInfo2.new()
    local self = setmetatable({}, InitInfo2)
    self:_init_fields()
    return self
end


function InitInfo2.getInstance()
        return InitInfo2.instance
end


function InitInfo2:isTestHtmlPathValid(value)
        return self.directory:create(value)
end


function InitInfo2:isMainPathValid(value)
        return self.directory:create(value)
end

InitInfo2.instance = InitInfo2.new()

return InitInfo2

