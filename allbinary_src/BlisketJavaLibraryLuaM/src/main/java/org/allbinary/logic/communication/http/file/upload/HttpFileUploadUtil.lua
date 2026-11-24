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

local HttpFileUploadUtil = {}
package.loaded["org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil"] = HttpFileUploadUtil

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
local ClassUtil = java_lazy("org.allbinary.logic.java.anyType.clazz.ClassUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")
local FileItemStream = java_lazy("org.apache.commons.fileupload.FileItemStream")
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

local function java_instanceof(object, class)
    class = java_real(class)
    local metatable = getmetatable(object)
    while metatable do
        if metatable == class then return true end
        local parent = getmetatable(metatable)
        metatable = parent and parent.__index
    end
    return false
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

-- class table HttpFileUploadUtil is declared before the requires
HttpFileUploadUtil.__index = HttpFileUploadUtil
HttpFileUploadUtil.className = "HttpFileUploadUtil"
HttpFileUploadUtil.javaClassName = "org.allbinary.logic.communication.http.file.upload.HttpFileUploadUtil"

function HttpFileUploadUtil:_init_fields()
    self.logUtil = LogUtil.getInstance()
end


function HttpFileUploadUtil.getInstance()
        return HttpFileUploadUtil.instance_f
end


function HttpFileUploadUtil._jinit(self)
    HttpFileUploadUtil._init_fields(self)
    return self
end

function HttpFileUploadUtil.new(...)
    local self = setmetatable({}, HttpFileUploadUtil)
    HttpFileUploadUtil._jinit(self, ...)
    return self
end


-- throws Exception
function HttpFileUploadUtil:isValid(anyType)
        if anyType ~= nil and not java_instanceof(anyType, String) then
            if java_instanceof(anyType, FileItem) then
                return true
            else
                error(require("java.lang.Exception").new("Object Not Instance Of FileItem but is: " .. tostring(ClassUtil.viewAll(anyType, CommonSeps.getInstance().NEW_LINE))), 0)
            end
        end
        return false
end


-- throws Exception
function HttpFileUploadUtil.log_j1_1(fileItem)
        local logUtil = LogUtil.getInstance()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append("FileItem Log:")
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Content Type:")
        stringBuffer:append(fileItem:getContentType())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Field Name:")
        stringBuffer:append(fileItem:getFieldName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Name:")
        stringBuffer:append(fileItem:getName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Size:")
        stringBuffer:append(" Not Calculated Yet")
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTP) then
            logUtil:putF(tostring(stringBuffer), HttpFileUploadUtil.getInstance(), "log()")
        end
end


function HttpFileUploadUtil.log_j1_2(fileItem)
        local logUtil = LogUtil.getInstance()
        local stringBuffer = StringMaker.new()
        local commonSeps = CommonSeps.getInstance()
        stringBuffer:append("FileItem Log:")
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Content Type:")
        stringBuffer:append(fileItem:getContentType())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Field Name:")
        stringBuffer:append(fileItem:getFieldName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Name:")
        stringBuffer:append(fileItem:getName())
        stringBuffer:append(commonSeps.NEW_LINE)
        stringBuffer:append("Size:")
        stringBuffer:appendlong(java_int(fileItem:getSize()))
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().HTTPREQUEST) then
            logUtil:putF(tostring(stringBuffer), HttpFileUploadUtil.getInstance(), "log()")
        end
end
function HttpFileUploadUtil.log(...)
    local count = select("#", ...)
    if count == 1 then return HttpFileUploadUtil.log_j1(...) end
    error("No method log takes " .. count .. " arguments")
end
HttpFileUploadUtil.log__jdispatcher = HttpFileUploadUtil.log
function HttpFileUploadUtil.log_j1(...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "FileItemStream")) then return HttpFileUploadUtil.log_j1_1(...) end
    return HttpFileUploadUtil.log_j1_2(...)
end

HttpFileUploadUtil.instance_f = HttpFileUploadUtil.new()

return HttpFileUploadUtil

