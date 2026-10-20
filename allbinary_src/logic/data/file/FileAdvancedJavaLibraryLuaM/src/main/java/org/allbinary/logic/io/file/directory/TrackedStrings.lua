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


local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local TrackedStrings = {}
TrackedStrings.__index = TrackedStrings
TrackedStrings.className = "TrackedStrings"

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

function TrackedStrings.new()
    local self = setmetatable({}, TrackedStrings)
    self:_init_fields()
    return self
end


function TrackedStrings.getInstance()
        return TrackedStrings.instance
end

TrackedStrings.instance = TrackedStrings.new()

return TrackedStrings

