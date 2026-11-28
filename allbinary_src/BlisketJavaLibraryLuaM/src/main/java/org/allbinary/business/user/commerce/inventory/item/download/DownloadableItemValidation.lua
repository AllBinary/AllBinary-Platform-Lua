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
-- package org.allbinary.business.user.commerce.inventory.item.download

local DownloadableItemValidation = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemValidation"] = DownloadableItemValidation

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
local AbSqlData = java_lazy("org.allbinary.logic.communication.sql.AbSqlData")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local DownloadableItem = java_lazy("org.allbinary.business.user.commerce.inventory.item.download.DownloadableItem")

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

local function java_super_init(base, self, ...)
    local init = rawget(base, "_jinit")
    if init ~= nil then return init(self, ...) end
    if base.new ~= nil then
        local object = base.new(...)
        if type(object) == "table" then
            for key, value in pairs(object) do if rawget(self, key) == nil then self[key] = value end end
        end
    end
end

local function java_overload(class, name, count, test)
    local parent = getmetatable(class)
    local base = parent and parent.__index
    if type(base) ~= "table" or base == class then return end
    local override = rawget(class, name)
    local mangled = name .. "_j" .. count
    -- an inherited overload with the same count and other parameter types (Control.drawBackground(hDC, rect, pixel, tx, ty)
    -- and Canvas.drawBackground(gc, x, y, width, height)) is called when the arguments do not match the override
    local typed = function(self, ...)
        if test == nil or test(...) then return override(self, ...) end
        local inherited = base[mangled]
        if inherited == nil then local plain = base[name] if plain ~= nil and plain ~= base[name .. "__jdispatcher"] then inherited = plain end end
        if inherited == nil or inherited == override then return override(self, ...) end
        return inherited(self, ...)
    end
    class[mangled] = typed
    -- the inherited method is looked up at the call: the base class can still be loading (require cycle)
    local dispatcher = function(self, ...)
        if select("#", ...) == count then return typed(self, ...) end
        local inherited = base[name]
        if inherited == nil then return override(self, ...) end
        return inherited(self, ...)
    end
    class[name] = dispatcher
    class[name .. "__jdispatcher"] = dispatcher
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

-- class table DownloadableItemValidation is declared before the requires
DownloadableItemValidation.__index = DownloadableItemValidation
DownloadableItemValidation.className = "DownloadableItemValidation"
DownloadableItemValidation.javaClassName = "org.allbinary.business.user.commerce.inventory.item.download.DownloadableItemValidation"
setmetatable(DownloadableItemValidation, {__index = Validation})

function DownloadableItemValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.downloadableItem == nil then self.downloadableItem = nil end
end


function DownloadableItemValidation._jinit(self, downloadableItem)
    java_super_init(Validation, self)
    DownloadableItemValidation._init_fields(self)
        self.downloadableItem = downloadableItem
    return self
end

function DownloadableItemValidation.new(...)
    local self = setmetatable({}, DownloadableItemValidation)
    DownloadableItemValidation._jinit(self, ...)
    return self
end


function DownloadableItemValidation:isValid()
        local try_ok, try_error, try_value = pcall(function()
            if rawequal(self.downloadableItem:getId(), nil) or self.downloadableItem:getId():length() < 1 or self.downloadableItem:getId():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if not rawequal(self.downloadableItem:getId(), nil) and not (StringValidationUtil.getInstance():isNumber(self.downloadableItem:getId())) then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getSystem(), nil) or self.downloadableItem:getSystem():length() < 1 or self.downloadableItem:getSystem():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getPlatform(), nil) or self.downloadableItem:getPlatform():length() < 1 or self.downloadableItem:getPlatform():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getSpecialName(), nil) or self.downloadableItem:getSpecialName():length() < 0 or self.downloadableItem:getSpecialName():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getVersion(), nil) or self.downloadableItem:getVersion():length() < 1 or self.downloadableItem:getVersion():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getChanges(), nil) or self.downloadableItem:getChanges():length() < 1 or self.downloadableItem:getChanges():length() > AbSqlData.MAXBLOB then
                do return "__jreturn", false end
            end
            if rawequal(self.downloadableItem:getSize(), nil) then
                do return "__jreturn", false end
            else
                local size = tostring(self.downloadableItem:getSize())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    do return "__jreturn", false end
                end
            end
            if rawequal(self.downloadableItem:getValidTime(), nil) then
                do return "__jreturn", false end
            else
                local size = tostring(self.downloadableItem:getValidTime())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    do return "__jreturn", false end
                end
            end
            if rawequal(self.downloadableItem:getRetries(), nil) then
                do return "__jreturn", false end
            else
                local size = tostring(self.downloadableItem:getRetries())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    do return "__jreturn", false end
                end
            end
            do return "__jreturn", true end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to validate form", self, self.commonStrings.IS_VALID, e)
            end
            return false
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadableItemValidation, "isValid", 0)


function DownloadableItemValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            if rawequal(self.downloadableItem:getId(), nil) or self.downloadableItem:getId():length() < 1 or self.downloadableItem:getId():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Id is invalid. Must be number < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                stringBuffer:append(" and > 0 digits.<br/>")
            end
            if not rawequal(self.downloadableItem:getId(), nil) and not (StringValidationUtil.getInstance():isNumber(self.downloadableItem:getId())) then
                stringBuffer:append("Id is invalid. Must be > 0.<br/>")
            end
            if rawequal(self.downloadableItem:getSystem(), nil) or self.downloadableItem:getSystem():length() < 1 or self.downloadableItem:getSystem():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("System value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if rawequal(self.downloadableItem:getPlatform(), nil) or self.downloadableItem:getPlatform():length() < 1 or self.downloadableItem:getPlatform():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Platform value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if rawequal(self.downloadableItem:getSpecialName(), nil) or self.downloadableItem:getSpecialName():length() < 0 or self.downloadableItem:getSpecialName():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Special Name value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if rawequal(self.downloadableItem:getVersion(), nil) or self.downloadableItem:getVersion():length() < 1 or self.downloadableItem:getVersion():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Version value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXSTRING))
                stringBuffer:append(" and > 0 characters long.<br/>")
            end
            if rawequal(self.downloadableItem:getChanges(), nil) or self.downloadableItem:getChanges():length() < 0 or self.downloadableItem:getChanges():length() > AbSqlData.MAXBLOB then
                stringBuffer:append("Changes value is invalid. Must be < ")
                stringBuffer:appendint(java_int(AbSqlData.MAXBLOB))
                stringBuffer:append(" and >= 0 characters long.<br/>")
            end
            if rawequal(self.downloadableItem:getSize(), nil) then
                stringBuffer:append("File Size is null")
            else
                local size = tostring(self.downloadableItem:getSize())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("File Size is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
            if rawequal(self.downloadableItem:getValidTime(), nil) then
                stringBuffer:append("Valid Time is null")
            else
                local size = tostring(self.downloadableItem:getValidTime())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("Valid Time is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
            if rawequal(self.downloadableItem:getRetries(), nil) then
                stringBuffer:append("Retries is null")
            else
                local size = tostring(self.downloadableItem:getRetries())
                if #size < 1 or #size > AbSqlData.MAXNUM then
                    stringBuffer:append("Retries is invalid. Must be number < ")
                    stringBuffer:appendint(java_int(AbSqlData.MAXNUM))
                    stringBuffer:append(" and > 0 digits.<br/>")
                end
            end
            do return "__jreturn", tostring(stringBuffer) end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().SQLTAGSERROR) then
                self.logUtil:put("Failed to generate validation error info", self, "validationInfo()", e)
            end
            return "Error Validating Form"
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end
java_overload(DownloadableItemValidation, "validationInfo", 0)


function DownloadableItemValidation:toValidationInfoDoc()
        return nil
end
java_overload(DownloadableItemValidation, "toValidationInfoDoc", 0)


function DownloadableItemValidation:toValidationInfoNode(document)
        return nil
end
java_overload(DownloadableItemValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return DownloadableItemValidation

