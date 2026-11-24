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
-- package org.allbinary.logic.visual.transform

local BasicTransformer = {}
package.loaded["org.allbinary.logic.visual.transform.BasicTransformer"] = BasicTransformer

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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
local BasicUriResolver = java_lazy("org.allbinary.data.tree.dom.BasicUriResolver")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local AbCrypt = java_lazy("org.allbinary.logic.control.crypt.jcehelper.AbCrypt")
local KeySpecFactory = java_lazy("org.allbinary.logic.control.crypt.jcehelper.KeySpecFactory")
local AbFileInputStream = java_lazy("org.allbinary.logic.io.AbFileInputStream")
local StreamUtil = java_lazy("org.allbinary.logic.io.StreamUtil")
local AbFile = java_lazy("org.allbinary.logic.io.file.AbFile")
local AbPathData = java_lazy("org.allbinary.logic.io.path.AbPathData")
local PathUtil = java_lazy("org.allbinary.logic.io.path.PathUtil")
local StringMaker = java_lazy("org.allbinary.logic.string.StringMaker")
local AbKeys = java_lazy("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = java_lazy("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = java_lazy("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoTemplateData = java_lazy("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
local AbTransformer = require("org.allbinary.logic.visual.transform.AbTransformer")

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

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

-- JNI element code (I, J, S, B, F, D) of a primitive array for the overload type dispatch
local function java_typed_array(code, array)
    array.jt = code
    return array
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

-- class table BasicTransformer is declared before the requires
BasicTransformer.__index = BasicTransformer
BasicTransformer.className = "BasicTransformer"
BasicTransformer.javaClassName = "org.allbinary.logic.visual.transform.BasicTransformer"
setmetatable(BasicTransformer, {__index = AbTransformer})

function BasicTransformer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.streamUtil = StreamUtil.getInstance()
    if self.abeClientInformation == nil then self.abeClientInformation = nil end
end


function BasicTransformer._jinit(self, abeClientInformation, transformInfoInterface)
    java_super_init(AbTransformer, self, transformInfoInterface)
    BasicTransformer._init_fields(self)
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setTemplateAsInputStream()
    return self
end

function BasicTransformer.new(...)
    local self = setmetatable({}, BasicTransformer)
    BasicTransformer._jinit(self, ...)
    return self
end


-- throws Exception
function BasicTransformer:setEncryptedTemplateFileAsInputStream(file)
        local outputStream = nil
        local inputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            outputStream = require("java.io.ByteArrayOutputStream").new()
            inputStream = AbFileInputStream.createFromAbFile(file)
            outputStream = self.streamUtil:get(inputStream, outputStream, java_typed_array("B", java_new_array(0, 16384)))
            local abCrypt = AbCrypt.new(KeySpecFactory.DESEDE, AbKeys.getInstance():getKey(self.abeClientInformation, file:getAbsolutePath()))
            local decrypted = abCrypt:decrypt(outputStream:toByteArray())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Decrypted Template: \n" .. tostring(string.char(table.unpack(decrypted))), self, "setEncryptedTemplateFileAsInputStream(file)")
            end
            self:setInputStream(ByteArrayInputStream.new(decrypted))
            self:setURIResolver(BasicUriResolver.new(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                local stringBuffer = StringMaker.new()
                stringBuffer:append("Failed to get Encrypted File: ")
                stringBuffer:append(file:getPath())
                stringBuffer:append(" \nName:")
                stringBuffer:append(file:getName())
                self.logUtil:put(tostring(stringBuffer), self, "setEncryptedTemplateFileAsInputStream()", e)
            end
            error(e, 0)
        end
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
end
java_overload(BasicTransformer, "setEncryptedTemplateFileAsInputStream", 1, function(java_a1) return true and (java_a1 == nil or java_is(java_a1, "AbFile")) end)


-- throws Exception
function BasicTransformer:setEncryptedTemplateAsInputStream()
        local outputStream = nil
        local inputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            outputStream = require("java.io.ByteArrayOutputStream").new()
            inputStream = ByteArrayInputStream.new(self:getTransformInfoInterface():getTemplate():getBytes())
            outputStream = self.streamUtil:get(inputStream, outputStream, java_typed_array("B", java_new_array(0, 16384)))
            local abCrypt = AbCrypt.new(KeySpecFactory.DESEDE, AbKeys.getInstance():getKey(self.abeClientInformation, self:getTransformInfoInterface():getName()))
            local decrypted = abCrypt:decrypt(outputStream:toByteArray())
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Decrypted Template: \n" .. tostring(decrypted), self, "setEncryptedTemplateAsInputStream()")
            end
            self:setInputStream(ByteArrayInputStream.new(decrypted))
            self:setURIResolver(BasicUriResolver.new(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION))
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put("Failed to set with template: " .. tostring(self:getTransformInfoInterface():getTemplateFilePath()), self, "setEncryptedTemplateFileAsInputStream()", e)
            end
            error(e, 0)
        end
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
end
java_overload(BasicTransformer, "setEncryptedTemplateAsInputStream", 0)


-- throws Exception
function BasicTransformer:setTemplateAsInputStream()
        local inputStream = nil
        local outputStream = nil
        local try_ok, try_error, try_value = pcall(function()
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
            end
            local transformInfoTemplateData = TransformInfoTemplateData.getInstance()
            local pathUtil = PathUtil.getInstance()
            if self:getTransformInfoInterface():getTemplateFilePath() ~= nil then
                local extension = pathUtil:getExtensionWithAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                local filePath = pathUtil:getWithoutExtensionWithAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                    self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                end
                if ((extension < transformInfoTemplateData.UNCRYPTED_EXTENSION and -1) or (extension > transformInfoTemplateData.UNCRYPTED_EXTENSION and 1) or 0) == 0 then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(filePath)
                    stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
                    stringBuffer:append(transformInfoTemplateData.ENCRYPTED_EXTENSION)
                    local encFile = AbFile.createAbFile(tostring(stringBuffer))
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                        self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                    end
                    if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                        stringBuffer = StringMaker.new()
                        stringBuffer:append("Encrypted Template File isFile=")
                        stringBuffer:appendboolean(encFile:isFile())
                        stringBuffer:append("\nEncTemplateFilePath: ")
                        stringBuffer:append(encFile:getPath())
                        self.logUtil:putF(tostring(stringBuffer), self, "setTemplateAsInputStream()")
                    end
                    if encFile:isFile() then
                        self:setEncryptedTemplateFileAsInputStream(encFile)
                        do return "__jreturn" end
                    else
                        local file = AbFile.createAbFileFromAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                            self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                        end
                        if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                            self.logUtil:putF("Template File isFile=" .. tostring(file:isFile()), self, "setTemplateAsInputStream()")
                        end
                        if file:isFile() then
                            inputStream = AbFileInputStream.createFromAbFile(file)
                            outputStream = require("java.io.ByteArrayOutputStream").new()
                            outputStream = self.streamUtil:get(inputStream, outputStream, java_typed_array("B", java_new_array(0, 16384)))
                            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORY) then
                                self.logUtil:putF("Template: " .. tostring(outputStream), self, "getTemplateAsInputStream()")
                            end
                            self:setInputStream(ByteArrayInputStream.new(outputStream:toByteArray()))
                            self:setURIResolver(BasicUriResolver.new(transformInfoTemplateData.UNCRYPTED_EXTENSION))
                            do return "__jreturn" end
                        end
                    end
                elseif ((extension < transformInfoTemplateData.ENCRYPTED_EXTENSION and -1) or (extension > transformInfoTemplateData.ENCRYPTED_EXTENSION and 1) or 0) == 0 then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(filePath)
                    stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
                    stringBuffer:append(transformInfoTemplateData.ENCRYPTED_EXTENSION)
                    local file = AbFile.createAbFile(tostring(stringBuffer))
                    if file:isFile() then
                        self:setEncryptedTemplateFileAsInputStream(file)
                    end
                else
                    error(require("java.lang.Exception").new("View Template File Type Is Not Recognized: " .. tostring(self:getTransformInfoInterface():getTemplateFilePath())), 0)
                end
            else
                self:setEncryptedTemplateAsInputStream()
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put("Failed to get Template Data", self, "setTemplateAsInputStream()", e)
            end
            error(e, 0)
        end
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
        error(require("java.lang.Exception").new("Error setTemplateAsInputStream()"), 0)
end
java_overload(BasicTransformer, "setTemplateAsInputStream", 0)

return BasicTransformer

