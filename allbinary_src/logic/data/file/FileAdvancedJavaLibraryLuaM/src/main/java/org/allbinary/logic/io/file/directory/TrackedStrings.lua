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
-- package org.allbinary.logic.io.file.directory

local TrackedStrings = {}
package.loaded["org.allbinary.logic.io.file.directory.TrackedStrings"] = TrackedStrings

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

-- class table TrackedStrings is declared before the requires
TrackedStrings.__index = TrackedStrings
TrackedStrings.className = "TrackedStrings"
TrackedStrings.javaClassName = "org.allbinary.logic.io.file.directory.TrackedStrings"

function TrackedStrings:_init_fields()
    self.TARGET_PATH_WINDOWS = "\\target\\"
    self.TARGET_PATH_UNIX = "/target/"
    self.HTML_TEMP = "HTMLTemp"
    self.APPLICATION = "Application"
    self.APP = "\\app"
    self.GIT_COMMAND = "git"
    self.CHANGE_DIRECTORY_OPTION = "-C"
    self.LIST_FILES_COMMAND = "ls-files"
    self.ERROR_UNMATCH_OPTION = "--error-unmatch"
    self.PATHSPEC_SEPARATOR = "--"
    self.SEP_BY_NULL_CHAR_INSTEAD_OF_NEW_LINE = "-z"
end

function TrackedStrings._jinit(self)
    TrackedStrings._init_fields(self)
    return self
end

function TrackedStrings.new()
    return TrackedStrings._jinit(setmetatable({}, TrackedStrings))
end


function TrackedStrings.getInstance()
        return TrackedStrings.instance_f
end

TrackedStrings.instance_f = TrackedStrings.new()

return TrackedStrings

