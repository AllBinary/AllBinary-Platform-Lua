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

local SmallDelete = {}
package.loaded["org.allbinary.logic.io.SmallDelete"] = SmallDelete

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

-- class table SmallDelete is declared before the requires
SmallDelete.__index = SmallDelete
SmallDelete.className = "SmallDelete"
SmallDelete.javaClassName = "org.allbinary.logic.io.SmallDelete"

function SmallDelete:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.fileName == nil then self.fileName = nil end
    if self.string_ == nil then self.string_ = nil end
end


function SmallDelete._jinit(self, fileName)
    SmallDelete._init_fields(self)
        self.fileName = fileName
        self.string_ = AbFileSystem.getInstance():readAsString(fileName)
    return self
end

function SmallDelete.new(...)
    local self = setmetatable({}, SmallDelete)
    SmallDelete._jinit(self, ...)
    return self
end


function SmallDelete:deleteAtStart(start, end_)
        local try_ok, try_error, try_value = pcall(function()
            local beginIndex = 0
            local endIndex = 0
            beginIndex = ((string.find(self.string_, start, 1, true) or 0) - 1)
            endIndex = ((string.find(self.string_, end_, 1, true) or 0) - 1)
            if endIndex > beginIndex and beginIndex >= 0 and endIndex >= 0 and beginIndex < 10 and endIndex < 525 then
                local text = string.sub(self.string_, (endIndex) + 1, #self.string_)
                local idFile = FileOutputStream.new(self.fileName)
                local idOutData = DataOutputStream.new(idFile)
                idOutData:writeBytes(text)
                do return "__jreturn", true end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteAtStart", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function SmallDelete:deleteBetween(start, end_, newText)
        local try_ok, try_error, try_value = pcall(function()
            local beginIndex = 0
            local endIndex = 0
            beginIndex = ((string.find(self.string_, start, 1, true) or 0) - 1)
            endIndex = ((string.find(self.string_, end_, 1, true) or 0) - 1)
            if endIndex > beginIndex and beginIndex >= 0 and endIndex >= 0 and beginIndex < 50 and endIndex < 425 then
                local newStart = string.sub(self.string_, (0) + 1, beginIndex)
                local text = string.sub(self.string_, (endIndex + #end_) + 1, #self.string_)
                local idFile = FileOutputStream.new(self.fileName)
                local idOutData = DataOutputStream.new(idFile)
                idOutData:writeBytes(require("allbinary_java").to_string(require("allbinary_java").to_string(newStart) .. require("allbinary_java").to_string(newText)) .. require("allbinary_java").to_string(text))
                do return "__jreturn", true end
            end
            do return "__jreturn", false end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().IDLOGGING) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "deleteAtStart", e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end

return SmallDelete

