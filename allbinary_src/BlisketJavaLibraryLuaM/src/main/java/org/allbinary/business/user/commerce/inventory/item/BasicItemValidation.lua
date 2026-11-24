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
-- package org.allbinary.business.user.commerce.inventory.item

local BasicItemValidation = {}
package.loaded["org.allbinary.business.user.commerce.inventory.item.BasicItemValidation"] = BasicItemValidation

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

-- class table BasicItemValidation is declared before the requires
BasicItemValidation.__index = BasicItemValidation
BasicItemValidation.className = "BasicItemValidation"
BasicItemValidation.javaClassName = "org.allbinary.business.user.commerce.inventory.item.BasicItemValidation"
setmetatable(BasicItemValidation, {__index = Validation})

function BasicItemValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.MAXWEIGHT = 14
    self.MAXPRICE = 14
    if self.itemInterface == nil then self.itemInterface = nil end
end


function BasicItemValidation._jinit(self, itemInterface)
    java_super_init(Validation, self)
    BasicItemValidation._init_fields(self)
        self.itemInterface = itemInterface
    return self
end

function BasicItemValidation.new(...)
    local self = setmetatable({}, BasicItemValidation)
    BasicItemValidation._jinit(self, ...)
    return self
end


function BasicItemValidation:isValid()
        local try_ok, try_error, try_value = pcall(function()
            if self.itemInterface:getId() == nil or self.itemInterface:getId():length() < 1 or self.itemInterface:getId():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if self.itemInterface:getId() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getId()) then
                do return "__jreturn", false end
            end
            if self.itemInterface:getNumber() == nil or self.itemInterface:getNumber():length() < 1 or self.itemInterface:getNumber():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getNumber() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getNumber()) then
                do return "__jreturn", false end
            end
            if self.itemInterface:getInBaskets() == nil or self.itemInterface:getInBaskets():length() < 1 or self.itemInterface:getInBaskets():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getInBaskets() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getInBaskets()) then
                do return "__jreturn", false end
            end
            if self.itemInterface:getWeight() == nil or self.itemInterface:getWeight():length() < 1 or self.itemInterface:getWeight():length() > self.MAXWEIGHT then
                do return "__jreturn", false end
            end
            if self.itemInterface:getWeight() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getWeight()) then
                do return "__jreturn", false end
            end
            if self.itemInterface:getEnabled() == nil or self.itemInterface:getEnabled():length() < 1 or self.itemInterface:getEnabled():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getNewOrUsed() == nil or self.itemInterface:getNewOrUsed():length() < 1 or self.itemInterface:getNewOrUsed():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getSummary() == nil or self.itemInterface:getSummary():length() < 1 or self.itemInterface:getSummary():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getDescription() == nil or self.itemInterface:getDescription():length() < 1 or self.itemInterface:getDescription():length() > AbSqlData.MAXBLOB then
                do return "__jreturn", false end
            end
            if self.itemInterface:getKeywords() == nil or self.itemInterface:getKeywords():length() < 1 or self.itemInterface:getKeywords():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getCategory() == nil or self.itemInterface:getCategory():length() < 1 or self.itemInterface:getCategory():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getType() == nil or self.itemInterface:getType():length() < 1 or self.itemInterface:getType():length() > AbSqlData.MAXSTRING then
                do return "__jreturn", false end
            end
            if self.itemInterface:getPrice() == nil or not self.itemInterface:getPrice():isValid() then
                do return "__jreturn", false end
            end
            if self.itemInterface:getCustoms() == nil or self.itemInterface:getCustoms():length() < 1 or self.itemInterface:getCustoms():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getDownloads() == nil or self.itemInterface:getDownloads():length() < 1 or self.itemInterface:getDownloads():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getGroups() == nil or self.itemInterface:getGroups():length() < 1 or self.itemInterface:getGroups():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getOptions() == nil or self.itemInterface:getOptions():length() < 1 or self.itemInterface:getOptions():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getPermissions() == nil or self.itemInterface:getPermissions():length() < 1 or self.itemInterface:getPermissions():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
            end
            if self.itemInterface:getSpecials() == nil or self.itemInterface:getSpecials():length() < 1 or self.itemInterface:getSpecials():length() > AbSqlData.MAXNUM then
                do return "__jreturn", false end
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
java_overload(BasicItemValidation, "isValid", 0)


function BasicItemValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            if self.itemInterface:getId() == nil or self.itemInterface:getId():length() < 1 or self.itemInterface:getId():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Id is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            local stringValidationUtil = StringValidationUtil.getInstance()
            if self.itemInterface:getId() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getId()) then
                stringBuffer:append("Id is invalid. Must be > 0.<br />")
            end
            if self.itemInterface:getNumber() == nil or self.itemInterface:getNumber():length() < 1 or self.itemInterface:getNumber():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Number of items is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getNumber() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getNumber()) then
                stringBuffer:append("Number of items value is not a valid number.<br />")
            end
            if self.itemInterface:getInBaskets() == nil or self.itemInterface:getInBaskets():length() < 1 or self.itemInterface:getInBaskets():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Number in baskets is invalid. Must be < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getInBaskets() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getInBaskets()) then
                stringBuffer:append("In Baskets value is not a valid number.<br />")
            end
            if self.itemInterface:getWeight() == nil or self.itemInterface:getWeight():length() < 1 or self.itemInterface:getWeight():length() > self.MAXWEIGHT then
                stringBuffer:append("Weight value is invalid. Must be < " .. tostring(self.MAXWEIGHT) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getWeight() ~= nil and not stringValidationUtil:isNumber(self.itemInterface:getWeight()) then
                stringBuffer:append("Weight value is not a valid number.<br />")
            end
            if self.itemInterface:getEnabled() == nil or self.itemInterface:getEnabled():length() < 1 or self.itemInterface:getEnabled():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("For Sale value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getNewOrUsed() == nil or self.itemInterface:getNewOrUsed():length() < 1 or self.itemInterface:getNewOrUsed():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("New Or Used value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getSummary() == nil or self.itemInterface:getSummary():length() < 1 or self.itemInterface:getSummary():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Summary value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getDescription() == nil or self.itemInterface:getDescription():length() < 1 or self.itemInterface:getDescription():length() > AbSqlData.MAXBLOB then
                stringBuffer:append("Description value is invalid. Must be < " .. tostring(AbSqlData.MAXBLOB) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getKeywords() == nil or self.itemInterface:getKeywords():length() < 1 or self.itemInterface:getKeywords():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Keywords value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getCategory() == nil or self.itemInterface:getCategory():length() < 1 or self.itemInterface:getCategory():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Category value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getType() == nil or self.itemInterface:getType():length() < 1 or self.itemInterface:getType():length() > AbSqlData.MAXSTRING then
                stringBuffer:append("Type value is invalid. Must be < " .. tostring(AbSqlData.MAXSTRING) .. " and > 0 characters long.<br />")
            end
            if self.itemInterface:getPrice() == nil or not self.itemInterface:getPrice():isValid() then
                stringBuffer:append("Price value is invalid. Must be < " .. tostring(self.MAXPRICE) .. " and > 0 in length.<br />")
            end
            if self.itemInterface:getCustoms() == nil or self.itemInterface:getCustoms():length() < 1 or self.itemInterface:getCustoms():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Custom items value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getDownloads() == nil or self.itemInterface:getDownloads():length() < 1 or self.itemInterface:getDownloads():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Downloadable item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getGroups() == nil or self.itemInterface:getGroups():length() < 1 or self.itemInterface:getGroups():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Group item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getOptions() == nil or self.itemInterface:getOptions():length() < 1 or self.itemInterface:getOptions():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Option item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getPermissions() == nil or self.itemInterface:getPermissions():length() < 1 or self.itemInterface:getPermissions():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Permission item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
            end
            if self.itemInterface:getSpecials() == nil or self.itemInterface:getSpecials():length() < 1 or self.itemInterface:getSpecials():length() > AbSqlData.MAXNUM then
                stringBuffer:append("Special item value is invalid. Must be number < " .. tostring(AbSqlData.MAXNUM) .. " and > 0 digits.<br />")
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
java_overload(BasicItemValidation, "validationInfo", 0)


function BasicItemValidation:toValidationInfoDoc()
        return nil
end
java_overload(BasicItemValidation, "toValidationInfoDoc", 0)


function BasicItemValidation:toValidationInfoNode(document)
        return nil
end
java_overload(BasicItemValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)

return BasicItemValidation

