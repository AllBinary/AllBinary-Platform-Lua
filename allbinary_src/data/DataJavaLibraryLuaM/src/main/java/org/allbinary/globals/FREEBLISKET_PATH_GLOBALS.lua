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

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local FREEBLISKET_PATH_GLOBALS = {}
FREEBLISKET_PATH_GLOBALS.__index = FREEBLISKET_PATH_GLOBALS
FREEBLISKET_PATH_GLOBALS.className = "FREEBLISKET_PATH_GLOBALS"

function FREEBLISKET_PATH_GLOBALS:_init_fields()
    self.INSTALLPATH = nil
    self.XSLPATH = nil
    self.TEMPLATEPATH = "template" .. tostring(AbPathData.getInstance().SEPARATOR)
    self.STYLEPATH = self.TEMPLATEPATH .. "style" .. tostring(AbPathData.getInstance().SEPARATOR)
    self.THEMEPATH = self.STYLEPATH .. "theme" .. tostring(AbPathData.getInstance().SEPARATOR)
    self.DBINITPATH = tostring(self.PATH_GLOBALS:getInstance().INIT_PATH) .. "db" .. tostring(AbPathData.getInstance().SEPARATOR)
    self.LINEDATAPATH = tostring(self.PATH_GLOBALS:getInstance().INIT_PATH) .. "lineData" .. tostring(AbPathData.getInstance().SEPARATOR)
    self.CONFIGURATIONPATH = nil
    self.USERCONFIGURATIONPATH = nil
    self.CONTEXTCONFIGURATIONPATH = nil
    self.LICENSEERRORPAGE = "LicensingError.jsp"
    self.ERRORPAGE = "Error.jsp"
end


function FREEBLISKET_PATH_GLOBALS.getInstance()
        return self.FREEBLISKET_PATH_GLOBALS.instance
end


function FREEBLISKET_PATH_GLOBALS.new()
    local self = setmetatable({}, FREEBLISKET_PATH_GLOBALS)
    self:_init_fields()
        local stringBuffer = StringMaker.new()
        stringBuffer:append("install")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.INSTALLPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.PATH_GLOBALS:getInstance().INIT_PATH)
        stringBuffer:append("views")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.XSLPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.XSLPATH)
        stringBuffer:append("configuration")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.CONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.CONFIGURATIONPATH)
        stringBuffer:append("user")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.USERCONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
        stringBuffer:append(self.CONFIGURATIONPATH)
        stringBuffer:append("context")
        stringBuffer:append(AbPathData.getInstance().SEPARATOR)
        self.CONTEXTCONFIGURATIONPATH = tostring(stringBuffer)
        stringBuffer:delete(0, stringBuffer:length())
    return self
end

FREEBLISKET_PATH_GLOBALS.instance = FREEBLISKET_PATH_GLOBALS.new()

return FREEBLISKET_PATH_GLOBALS

