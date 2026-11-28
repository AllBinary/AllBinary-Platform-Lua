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
-- package org.allbinary.logic.communication.http.file.upload

local AbFileItem = {}
package.loaded["org.allbinary.logic.communication.http.file.upload.AbFileItem"] = AbFileItem

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

local File = java_lazy("java.io.File")
-- local IOException = require("java.io.IOException")
local InputStream = java_lazy("java.io.InputStream")
-- local OutputStream = require("java.io.OutputStream")
-- local UnsupportedEncodingException = require("java.io.UnsupportedEncodingException")
local ForcedLogUtil = java_lazy("org.allbinary.logic.communication.log.ForcedLogUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")
local FileItemHeaders = java_lazy("org.apache.commons.fileupload.FileItemHeaders")
local FileItemUtil = java_lazy("org.apache.commons.fileupload.FileItemUtil")
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

local function java_class_matches(class, name)
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
local java_type_matches = setmetatable({}, {__mode = "k"})
local function java_is(object, name)
    if type(object) ~= "table" then return false end
    local class = getmetatable(object)
    if type(class) ~= "table" then return false end
    local matches = java_type_matches[class]
    if matches and matches[name] then return true end
    if not java_class_matches(class, name) then return false end
    if not matches then matches = {}; java_type_matches[class] = matches end
    matches[name] = true
    return true
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

-- class table AbFileItem is declared before the requires
AbFileItem.__index = AbFileItem
AbFileItem.className = "AbFileItem"
AbFileItem.javaClassName = "org.allbinary.logic.communication.http.file.upload.AbFileItem"
AbFileItem.java_implements = " FileItem "
AbFileItem.java_interfaces = function() return {FileItem} end

function AbFileItem:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.name_f == nil then self.name_f = nil end
    if self.fieldName == nil then self.fieldName = nil end
    if self.byteArray == nil then self.byteArray = nil end
end


function AbFileItem._jinit(self, name, fieldName, byteArray)
    AbFileItem._init_fields(self)
        self.name_f = name
        self.fieldName = fieldName
        self.byteArray = byteArray
    return self
end

function AbFileItem.new(...)
    local self = setmetatable({}, AbFileItem)
    AbFileItem._jinit(self, ...)
    return self
end


-- throws IOException
function AbFileItem:getInputStream()
        error(java_exception("IOException", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:getContentType()
        return nil
end


function AbFileItem:getName()
        return self.name_f
end


function AbFileItem:isInMemory()
        return true
end


function AbFileItem:getSize()
        return (self.byteArray.n or #self.byteArray)
end


function AbFileItem:get()
        return self.byteArray
end


-- throws UnsupportedEncodingException
function AbFileItem:getString_j1(encoding)
        return string.char(table.unpack(self.byteArray, encoding))
end


function AbFileItem:getString_j0()
        local try_ok, try_error, try_value = pcall(function()
            do return "__jreturn", FileItemUtil.getInstance():getString(self.byteArray) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "getString", e)
            end
            return StringUtil.getInstance().EMPTY_STRING
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
function AbFileItem:getString(...)
    local count = select("#", ...)
    if count == 1 then return self:getString_j1(...) end
    if count == 0 then return self:getString_j0(...) end
    error("No method getString takes " .. count .. " arguments")
end
AbFileItem.getString__jdispatcher = AbFileItem.getString


-- throws Exception
function AbFileItem:write_j1_1(file)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


-- throws Exception
function AbFileItem:write_j1_2(file)
        error(require("java.lang.Exception").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end
function AbFileItem:write(...)
    local count = select("#", ...)
    if count == 1 then return self:write_j1(...) end
    error("No method write takes " .. count .. " arguments")
end
AbFileItem.write__jdispatcher = AbFileItem.write
function AbFileItem:write_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "File")) then return AbFileItem.write_j1_1(self, ...) end
    return AbFileItem.write_j1_2(self, ...)
end


function AbFileItem:delete()
        ForcedLogUtil.log(self.commonStrings.NOT_IMPLEMENTED, "delete()")
end


function AbFileItem:getFieldName()
        return self.fieldName
end


function AbFileItem:setFieldName(name)
        self.fieldName = name
end


function AbFileItem:isFormField()
        if StringValidationUtil.getInstance():isEmpty(self.fieldName) then
            return false
        else
            return true
        end
end


function AbFileItem:setFormField(state)
end


-- throws IOException
function AbFileItem:getOutputStream()
        error(java_exception("IOException", self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:getHeaders()
        error(require("java.lang.RuntimeException").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end


function AbFileItem:setHeaders(fih)
        error(require("java.lang.RuntimeException").new(self.commonStrings.NOT_IMPLEMENTED), 0)
end

return AbFileItem

