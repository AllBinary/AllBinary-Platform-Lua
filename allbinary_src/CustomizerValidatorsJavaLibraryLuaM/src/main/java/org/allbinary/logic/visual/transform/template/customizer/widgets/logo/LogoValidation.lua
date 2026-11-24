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
-- package org.allbinary.logic.visual.transform.template.customizer.widgets.logo

local LogoValidation = {}
package.loaded["org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoValidation"] = LogoValidation

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

local HashMap = java_lazy("java.util.HashMap")
local DomNodeInterface = java_lazy("org.allbinary.data.tree.dom.DomNodeInterface")
local DomSearchHelper = java_lazy("org.allbinary.data.tree.dom.DomSearchHelper")
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local HttpRequestUtil = java_lazy("org.allbinary.logic.communication.http.request.HttpRequestUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local Validation = require("org.allbinary.logic.control.validate.Validation")
local FileData = java_lazy("org.allbinary.logic.io.file.FileData")
local AbPath = java_lazy("org.allbinary.logic.io.path.AbPath")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local FileItem = java_lazy("org.apache.commons.fileupload.FileItem")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local LogoImageFileUtil = java_lazy("org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoImageFileUtil")

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

-- class table LogoValidation is declared before the requires
LogoValidation.__index = LogoValidation
LogoValidation.className = "LogoValidation"
LogoValidation.javaClassName = "org.allbinary.logic.visual.transform.template.customizer.widgets.logo.LogoValidation"
setmetatable(LogoValidation, {__index = Validation})
LogoValidation.java_implements = " DomNodeInterface "
LogoValidation.java_interfaces = function() return {DomNodeInterface} end

function LogoValidation:_init_fields()
    self.logUtil = LogUtil.getInstance()
    if self.logoFileItem == nil then self.logoFileItem = nil end
    if self.logoAbPath == nil then self.logoAbPath = nil end
    if self.logoFile == nil then self.logoFile = nil end
    if self.isFile == nil then self.isFile = nil end
end

function LogoValidation._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return LogoValidation._new0(self, ...)
    elseif count == 1 then return LogoValidation._new1(self, ...)
    end
    error("No constructor of LogoValidation takes " .. count .. " arguments")
end

function LogoValidation.new(...)
    local self = setmetatable({}, LogoValidation)
    LogoValidation._jinit(self, ...)
    return self
end

function LogoValidation._new1(self, ...)
    local java_a1 = ...
    if true and (java_a1 == nil or java_is(java_a1, "Node")) then return LogoValidation._new1_1(self, ...) end
    return LogoValidation._new1_2(self, ...)
end


function LogoValidation._new0(self)
    java_super_init(Validation, self)
    LogoValidation._init_fields(self)
        self.isFile = false
        self.logoAbPath = nil
        self.logoFile = nil
    return self
end


function LogoValidation._new1_1(self, node)
    java_super_init(Validation, self)
    LogoValidation._init_fields(self)
        self.isFile = false
        self.logoAbPath = AbPath.new(DomSearchHelper.getNode(LogoData.getInstance().IMAGEPATH, node:getChildNodes()):getNodeValue(), StringUtil.getInstance().EMPTY_STRING)
        self.logoFile = DomSearchHelper.getNode(LogoData.getInstance().IMAGEFILENAME, node:getChildNodes()):getNodeValue()
    return self
end


function LogoValidation._new1_2(self, hashMap)
    java_super_init(Validation, self)
    LogoValidation._init_fields(self)
        self.isFile = true
        self:getFormData(hashMap)
    return self
end


-- throws Exception
function LogoValidation:getFormData(hashMap)
        self.logoFileItem = hashMap:get(LogoData.getInstance().IMAGE)
        self.logoAbPath = AbPath.new(hashMap:get(LogoData.getInstance().IMAGEPATH), StringUtil.getInstance().EMPTY_STRING)
        if self.logoFileItem ~= nil then
            self.logoFile = HttpRequestUtil.getInstance():generateFileName(self.logoFileItem:getName())
        end
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("HashMap: ")
            stringBuffer:append(tostring(hashMap))
            stringBuffer:append("\nLogoFileName: ")
            stringBuffer:append(self.logoFile)
            self.logUtil:putF(tostring(stringBuffer), self, "getFormData()")
        end
end
java_overload(LogoValidation, "getFormData", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "HashMap")) end)


function LogoValidation:isValid()
        local try_ok, try_error, try_value = pcall(function()
            local valid = true
            local fileData = FileData.getInstance()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("LogoValidation", self, self.commonStrings.IS_VALID)
            end
            if not StringValidationUtil.getInstance():isValidRequired(tostring(self.logoAbPath), 0, 512) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("logoPath is invalid: " .. tostring(self.logoAbPath), self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            if not StringValidationUtil.getInstance():isValidRequired(self.logoFile, fileData.MINLEN, fileData.MAXLEN) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                    self.logUtil:putF("logoFile is invalid: " .. self.logoFile, self, self.commonStrings.IS_VALID)
                end
                do return "__jreturn", false end
            end
            if self.isFile then
                if self.logoFileItem == nil then
                    do return "__jreturn", false end
                end
                if self.logoFileItem:getSize() > fileData.MAXIMAGEFILESIZE or self.logoFileItem:getSize() < fileData.MINIMAGEFILESIZE then
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                        self.logUtil:putF("Image File Is Not The Right Size. " .. tostring(fileData.MINIMAGEFILESIZE) .. "< > " .. tostring(fileData.MAXIMAGEFILESIZE), self, self.commonStrings.IS_VALID)
                    end
                    do return "__jreturn", false end
                end
            end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
                self.logUtil:putF("Logo Validation: " .. tostring(valid), self, self.commonStrings.IS_VALID)
            end
            do return "__jreturn", valid end
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
java_overload(LogoValidation, "isValid", 0)


function LogoValidation:validationInfo()
        local try_ok, try_error, try_value = pcall(function()
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Logo is not valid.")
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
java_overload(LogoValidation, "validationInfo", 0)


function LogoValidation:toValidationInfoDoc()
        return nil
end
java_overload(LogoValidation, "toValidationInfoDoc", 0)


function LogoValidation:toValidationInfoNode(document)
        return nil
end
java_overload(LogoValidation, "toValidationInfoNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


function LogoValidation:toHashMap()
        local stringUtil = StringUtil.getInstance()
        local hashMap = StdUtil.getInstance():createHashMap()
        hashMap:put(LogoData.getInstance().IMAGE, stringUtil.EMPTY_STRING)
        if self.logoFile ~= nil then
            hashMap:put(LogoData.getInstance().IMAGEPATH, tostring(self.logoAbPath))
            hashMap:put(LogoData.getInstance().IMAGEFILENAME, self.logoFile)
        else
            hashMap:put(LogoData.getInstance().IMAGEPATH, nil)
            hashMap:put(LogoData.getInstance().IMAGEFILENAME, self.logoFile)
        end
        return hashMap
end
java_overload(LogoValidation, "toHashMap", 0)


-- throws Exception
function LogoValidation:toXmlNode(document)
        local hashMap = self:toHashMap()
        return ModDomHelper.createNameValueNodes(document, LogoData.getInstance().NAME, hashMap)
end
java_overload(LogoValidation, "toXmlNode", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "Document")) end)


-- throws Exception
function LogoValidation:processLogoFile()
        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().VIEW) then
            local stringBuffer = StringMaker.new()
            stringBuffer:append("Processing logoFile: ")
            stringBuffer:append(tostring(self.logoAbPath))
            stringBuffer:append(self.logoFile)
            self.logUtil:putF(tostring(stringBuffer), self, "processLogoFile()")
        end
        LogoImageFileUtil.new(self.logoAbPath, self.logoFile):saveFiles(self.logoFileItem)
end
java_overload(LogoValidation, "processLogoFile", 0)

return LogoValidation

