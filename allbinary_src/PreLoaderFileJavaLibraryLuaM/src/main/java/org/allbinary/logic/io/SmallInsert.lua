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
-- package org.allbinary.logic.io

local SmallInsert = {}
package.loaded["org.allbinary.logic.io.SmallInsert"] = SmallInsert

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

-- local DataOutputStream = require("java.io.DataOutputStream")
-- local FileOutputStream = require("java.io.FileOutputStream")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFileSystem = java_lazy("org.allbinary.logic.io.file.AbFileSystem")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

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

-- class table SmallInsert is declared before the requires
SmallInsert.__index = SmallInsert
SmallInsert.className = "SmallInsert"
SmallInsert.javaClassName = "org.allbinary.logic.io.SmallInsert"

function SmallInsert:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.fileName == nil then self.fileName = nil end
    if self.string_ == nil then self.string_ = nil end
end


function SmallInsert._jinit(self, fileName)
    SmallInsert._init_fields(self)
        self.fileName = fileName
        self.string_ = AbFileSystem.getInstance():readAsString(fileName)
    return self
end

function SmallInsert.new(...)
    local self = setmetatable({}, SmallInsert)
    SmallInsert._jinit(self, ...)
    return self
end


function SmallInsert:atBeginning(text)
        local try_ok, try_error, try_value = pcall(function()
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(require("allbinary_java").to_string(text) .. require("allbinary_java").to_string(self.string_))
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insertAtBeginning", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function SmallInsert:after(text, after)
        local try_ok, try_error, try_value = pcall(function()
            local index = ((string.find(self.string_, after, 1, true) or 0) - 1)
            if index < 0 then
                print(require("allbinary_java").to_string(require("allbinary_java").to_string(require("allbinary_java").to_string("No such start: ") .. require("allbinary_java").to_string(after)) .. require("allbinary_java").to_string(" in: ")) .. require("allbinary_java").to_string(self.string_))
                do return "__jreturn", false end
            end
            index = index + #after
            local start = string.sub(self.string_, (0) + 1, index)
            local end_ = string.sub(self.string_, (index + 1) + 1, #self.string_)
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(require("allbinary_java").to_string(require("allbinary_java").to_string(start) .. require("allbinary_java").to_string(text)) .. require("allbinary_java").to_string(end_))
            idOutData:close()
            idFile:close()
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "after", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function SmallInsert:atEnd(text)
        local try_ok, try_error, try_value = pcall(function()
            local idFile = FileOutputStream.new(self.fileName)
            local idOutData = DataOutputStream.new(idFile)
            idOutData:writeBytes(require("allbinary_java").to_string(self.string_) .. require("allbinary_java").to_string(text))
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "insertAtEnd", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return SmallInsert

