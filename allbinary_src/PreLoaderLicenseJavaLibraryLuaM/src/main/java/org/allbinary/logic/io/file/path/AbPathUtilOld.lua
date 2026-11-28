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
-- package org.allbinary.logic.io.file.path

local AbPathUtilOld = {}
package.loaded["org.allbinary.logic.io.file.path.AbPathUtilOld"] = AbPathUtilOld

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

local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local FilePathData = java_lazy("org.allbinary.logic.io.file.FilePathData")
local AbFilePath = java_lazy("org.allbinary.logic.io.path.AbFilePath")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")

-- Java library Throwable. tostring gives the message like Java getMessage.
local function java_exception(className, message, cause)
    if cause == nil and type(message) == "table" then
        cause = message
        message = tostring(message)
    end
    local exception = {className = className, message = message, cause = cause}
    function exception:getMessage() return self.message end
    function exception:getCause() return self.cause end
    function exception:printStackTrace() print(debug.traceback(tostring(self))) end
    return setmetatable(exception, {__tostring = function(self) if self.message ~= nil then return tostring(self.message) end return self.className end})
end

-- Sub interfaces: the interface tables a class implements (java_interfaces) and the interfaces they extend
local function java_is_interface(interface, name, depth)
    interface = java_real(interface)
    if type(interface) ~= "table" or depth > 32 then return false end
    if rawget(interface, "className") == name then return true end
    local interfaces = rawget(interface, "java_interfaces")
    if interfaces ~= nil then
        for _, each in pairs(interfaces()) do if java_is_interface(each, name, depth + 1) then return true end end
    end
    local parent = getmetatable(interface)
    return parent ~= nil and parent.__index ~= interface and java_is_interface(parent.__index, name, depth + 1)
end

local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    while type(class) == "table" do
        class = java_real(class)
        if rawget(class, "className") == name then return true end
        local implements = rawget(class, "java_implements")
        if implements ~= nil and string.find(implements, " " .. name .. " ", 1, true) then return true end
        local interfaces = rawget(class, "java_interfaces")
        if interfaces ~= nil then
            for _, each in pairs(interfaces()) do if java_is_interface(each, name, 0) then return true end end
        end
        local parent = getmetatable(class)
        if parent ~= nil then class = parent.__index
        else
            local index = rawget(class, "__index")
            if index ~= class then class = index else class = nil end
        end
    end
    return false
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

--Used to correct user input for paths
-- class table AbPathUtilOld is declared before the requires
AbPathUtilOld.__index = AbPathUtilOld
AbPathUtilOld.className = "AbPathUtilOld"
AbPathUtilOld.javaClassName = "org.allbinary.logic.io.file.path.AbPathUtilOld"

function AbPathUtilOld:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.abPathData = AbPathData.getInstance()
    self.filePathData = FilePathData.getInstance()
end


function AbPathUtilOld.getInstance()
        return AbPathUtilOld.instance_f
end


function AbPathUtilOld._jinit(self)
    AbPathUtilOld._init_fields(self)
    return self
end

function AbPathUtilOld.new(...)
    local self = setmetatable({}, AbPathUtilOld)
    AbPathUtilOld._jinit(self, ...)
    return self
end


-- throws Exception
function AbPathUtilOld:getExtension_j1_1(abFilePath)
        return self:getExtension(tostring(abFilePath))
end


-- throws Exception
function AbPathUtilOld:getExtension_j1_2(abPath)
        return self:getExtension(tostring(abPath))
end


-- throws Exception
function AbPathUtilOld:getExtension_j1_3(filePath)
        if #filePath < AbPathUtilOld.MIN then
            error(require("java.lang.Exception").new("Could not be a file path since its less that 4 characters"), 0)
        end
        local beginIndex = #filePath - AbPathUtilOld.MIN
        local extension = string.sub(filePath, (beginIndex + 1) + 1)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("FileExtension: ") .. require("allbinary_java").to_string(extension), self, "getExtension()")
        end
        return extension
end
function AbPathUtilOld:getExtension(...)
    local count = select("#", ...)
    if count == 1 then return self:getExtension_j1(...) end
    error("No method getExtension takes " .. count .. " arguments")
end
AbPathUtilOld.getExtension__jdispatcher = AbPathUtilOld.getExtension
function AbPathUtilOld:getExtension_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbFilePath")) then return AbPathUtilOld.getExtension_j1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) then return AbPathUtilOld.getExtension_j1_2(self, ...) end
    return AbPathUtilOld.getExtension_j1_3(self, ...)
end


-- throws Exception
function AbPathUtilOld:getWithoutExtension_j1_1(abFilePath)
        return self:getWithoutExtension(tostring(abFilePath))
end


-- throws Exception
function AbPathUtilOld:getWithoutExtension_j1_2(abPath)
        return self:getWithoutExtension(tostring(abPath))
end


-- throws Exception
function AbPathUtilOld:getWithoutExtension_j1_3(filePath)
        if #filePath < AbPathUtilOld.MIN then
            error(require("java.lang.Exception").new("Could not be a file path since its less that 4 characters"), 0)
        end
        local endIndex = #filePath - AbPathUtilOld.MIN
        local pathWithoutExtension = string.sub(filePath, (0) + 1, endIndex)
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            self.logUtil:putF(require("allbinary_java").to_string("FileWithoutExtension: ") .. require("allbinary_java").to_string(pathWithoutExtension), self, "getWithoutExtension()")
        end
        return pathWithoutExtension
end
function AbPathUtilOld:getWithoutExtension(...)
    local count = select("#", ...)
    if count == 1 then return self:getWithoutExtension_j1(...) end
    error("No method getWithoutExtension takes " .. count .. " arguments")
end
AbPathUtilOld.getWithoutExtension__jdispatcher = AbPathUtilOld.getWithoutExtension
function AbPathUtilOld:getWithoutExtension_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "AbFilePath")) then return AbPathUtilOld.getWithoutExtension_j1_1(self, ...) end
    if true and (java_a1 == nil or java_is(java_a1, "AbPath")) then return AbPathUtilOld.getWithoutExtension_j1_2(self, ...) end
    return AbPathUtilOld.getWithoutExtension_j1_3(self, ...)
end


function AbPathUtilOld:isValid(path)
        if self:isValidStart(path) then
            if self:isValidEnd(path) then
                return true
            end
        end
        return false
end


function AbPathUtilOld:isValidStart(path)
        if rawequal(string.sub(path, (0) + 1, (0) + 1), self.abPathData.SEPARATORCHAR) then
            return true
        else
            return false
        end
end


function AbPathUtilOld:isValidEnd(path)
        if StringValidationUtil.getInstance():isEmpty(path) then
            return false
        end
        if rawequal(string.sub(path, (#path - 1) + 1, (#path - 1) + 1), self.abPathData.SEPARATORCHAR) then
            return true
        else
            return false
        end
end


function AbPathUtilOld:adjustStart(path)
        if not (self:isValidStart(path)) then
            path = require("allbinary_java").to_string(self.abPathData.SEPARATOR) .. require("allbinary_java").to_string(path)
        end
        return path
end


function AbPathUtilOld:adjustEnd(path)
        if not (self:isValidEnd(path)) then
            path = require("allbinary_java").to_string(path) .. require("allbinary_java").to_string(self.abPathData.SEPARATOR)
        end
        return path
end


function AbPathUtilOld:adjust(path)
        if StringValidationUtil.getInstance():isEmpty(path) then
            return self.abPathData.SEPARATOR
        end
        if ((string.find(path, "\\", 1, true) or 0) - 1) >= 0 then
            path = path:replace("\\", self.abPathData.SEPARATORCHAR)
        end
        return path
end


function AbPathUtilOld:getNameFromPath(categoryPath)
        local endIndex = categoryPath:lastIndexOf(self.abPathData.SEPARATOR)
        if endIndex < 0 then
            endIndex = categoryPath:lastIndexOf(self.filePathData.SEPARATORCHAR)
        end
        if endIndex < 0 then
            return categoryPath
        end
        if rawequal(#categoryPath, endIndex + 1) then
            local categoryName = string.sub(categoryPath, (0) + 1, endIndex)
            return self:getNameFromPath(categoryName)
        else
            local categoryName = string.sub(categoryPath, (endIndex + 1) + 1)
            return categoryName
        end
end


-- throws Exception
function AbPathUtilOld:removeNameFromPath(categoryPath)
        local endIndex = categoryPath:lastIndexOf(self.abPathData.SEPARATOR)
        if endIndex < 0 then
            endIndex = categoryPath:lastIndexOf(self.filePathData.SEPARATORCHAR)
        end
        if endIndex < 0 then
            return AbPath.createAbPath()
        end
        if rawequal(#categoryPath, endIndex + 1) then
            return self:removeNameFromPath(string.sub(categoryPath, (0) + 1, endIndex - 1))
        else
            local categoryName = string.sub(categoryPath, (0) + 1, endIndex)
            return AbPath.new(categoryName, StringUtil.getInstance().EMPTY_STRING)
        end
end

AbPathUtilOld.instance_f = AbPathUtilOld.new()
AbPathUtilOld.MIN = 4

return AbPathUtilOld

