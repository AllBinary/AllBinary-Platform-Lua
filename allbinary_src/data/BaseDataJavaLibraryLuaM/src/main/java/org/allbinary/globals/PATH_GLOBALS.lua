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
-- package org.allbinary.globals

local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local CommonStrings = require("org.allbinary.string.CommonStrings")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local PATH_GLOBALS = {}
PATH_GLOBALS.__index = PATH_GLOBALS
PATH_GLOBALS.className = "PATH_GLOBALS"

function PATH_GLOBALS:_init_fields()
    self.DATA_PATH = nil
    self.INIT_PATH = nil
    self.VIEWS_PATH = nil
    self.LOG_PATH = nil
    self.BACKUP_PATH = nil
end


function PATH_GLOBALS.getInstance()
        return self.PATH_GLOBALS.instance
end


function PATH_GLOBALS.new()
    local self = setmetatable({}, PATH_GLOBALS)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        local abPathData = AbPathData.getInstance()
        stringBuffer:append("data")
        stringBuffer:append(abPathData.SEPARATOR)
        self.DATA_PATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.DATA_PATH)
        stringBuffer:append(CommonStrings.getInstance().INIT)
        stringBuffer:append(abPathData.SEPARATOR)
        self.INIT_PATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.DATA_PATH)
        stringBuffer:append("log")
        stringBuffer:append(abPathData.SEPARATOR)
        self.LOG_PATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.DATA_PATH)
        stringBuffer:append("backup")
        stringBuffer:append(abPathData.SEPARATOR)
        self.BACKUP_PATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.INIT_PATH)
        stringBuffer:append("views")
        stringBuffer:append(abPathData.SEPARATOR)
        self.VIEWS_PATH = tostring(stringBuffer)
    return self
end

PATH_GLOBALS.instance = PATH_GLOBALS.new()

return PATH_GLOBALS

