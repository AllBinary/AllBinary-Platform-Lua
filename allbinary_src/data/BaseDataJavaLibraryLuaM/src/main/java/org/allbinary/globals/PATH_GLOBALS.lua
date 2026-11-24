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

local PATH_GLOBALS = {}
package.loaded["org.allbinary.globals.PATH_GLOBALS"] = PATH_GLOBALS

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

local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")

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

-- class table PATH_GLOBALS is declared before the requires
PATH_GLOBALS.__index = PATH_GLOBALS
PATH_GLOBALS.className = "PATH_GLOBALS"
PATH_GLOBALS.javaClassName = "org.allbinary.globals.PATH_GLOBALS"

function PATH_GLOBALS:_init_fields()
    if self.DATA_PATH == nil then self.DATA_PATH = nil end
    if self.INIT_PATH == nil then self.INIT_PATH = nil end
    if self.VIEWS_PATH == nil then self.VIEWS_PATH = nil end
    if self.LOG_PATH == nil then self.LOG_PATH = nil end
    if self.BACKUP_PATH == nil then self.BACKUP_PATH = nil end
end


function PATH_GLOBALS.getInstance()
        return PATH_GLOBALS.instance_f
end


function PATH_GLOBALS._jinit(self)
    PATH_GLOBALS._init_fields(self)
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

function PATH_GLOBALS.new(...)
    local self = setmetatable({}, PATH_GLOBALS)
    PATH_GLOBALS._jinit(self, ...)
    return self
end

PATH_GLOBALS.instance_f = PATH_GLOBALS.new()

return PATH_GLOBALS

