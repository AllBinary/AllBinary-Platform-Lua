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

-- local ByteArrayInputStream = require("java.io.ByteArrayInputStream")
-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local InputStream = require("java.io.InputStream")
-- local URIResolver = require("javax.xml.transform.URIResolver")
local BasicUriResolver = require("org.allbinary.data.tree.dom.BasicUriResolver")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local AbCrypt = require("org.allbinary.logic.control.crypt.jcehelper.AbCrypt")
local KeySpecFactory = require("org.allbinary.logic.control.crypt.jcehelper.KeySpecFactory")
local AbFileInputStream = require("org.allbinary.logic.io.AbFileInputStream")
local StreamUtil = require("org.allbinary.logic.io.StreamUtil")
local AbFile = require("org.allbinary.logic.io.file.AbFile")
local AbPathData = require("org.allbinary.logic.io.path.AbPathData")
local PathUtil = require("org.allbinary.logic.io.path.PathUtil")
local StringMaker = require("org.allbinary.logic.string.StringMaker")
local AbKeys = require("org.allbinary.logic.system.security.AbKeys")
local AbeClientInformationInterface = require("org.allbinary.logic.system.security.licensing.AbeClientInformationInterface")
local TransformInfoInterface = require("org.allbinary.logic.visual.transform.info.TransformInfoInterface")
local TransformInfoTemplateData = require("org.allbinary.logic.visual.transform.info.template.TransformInfoTemplateData")
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

-- Java library java.io.ByteArrayOutputStream
local function java_byte_array_output_stream()
    local stream = {buffer = {}}
    function stream:write(value, offset, length)
        if type(value) == "table" then
            local first = (offset or 0) + 1
            local last = first + (length or #value) - 1
            for index = first, last do self.buffer[#self.buffer + 1] = string.char(value[index] % 256) end
        elseif type(value) == "number" then
            self.buffer[#self.buffer + 1] = string.char(value % 256)
        else
            self.buffer[#self.buffer + 1] = tostring(value)
        end
    end
    function stream:toString() return table.concat(self.buffer) end
    function stream:size() return #table.concat(self.buffer) end
    function stream:reset() self.buffer = {} end
    function stream:flush() end
    function stream:close() end
    return setmetatable(stream, {__tostring = function(self) return table.concat(self.buffer) end})
end

local function java_new_array(default, size, ...)
    local array = {n = size}
    for index = 1, size do
        if select("#", ...) > 0 then array[index] = java_new_array(default, ...) else array[index] = default end
    end
    return array
end

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicTransformer = {}
BasicTransformer.__index = BasicTransformer
BasicTransformer.className = "BasicTransformer"
setmetatable(BasicTransformer, {__index = AbTransformer})

function BasicTransformer:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.streamUtil = StreamUtil.getInstance()
    self.abeClientInformation = nil
end


function BasicTransformer.new(abeClientInformation, transformInfoInterface)
    local self = setmetatable(AbTransformer.new(transformInfoInterface), BasicTransformer)
    self:_init_fields()
        -- super(...) made self above
        self.abeClientInformation = abeClientInformation
        self:setTemplateAsInputStream()
    return self
end


-- throws Exception
function BasicTransformer:setEncryptedTemplateFileAsInputStream(file)
        local outputStream = nil
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            outputStream = java_byte_array_output_stream()
            inputStream = AbFileInputStream.new(file)
            outputStream = self.streamUtil:get(inputStream, outputStream, java_new_array(0, 16384))
            local abCrypt = AbCrypt.new(KeySpecFactory.DESEDE, AbKeys.getInstance():getKey(self.abeClientInformation, file:getAbsolutePath()))
            local decrypted = abCrypt:decrypt(outputStream:toByteArray())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Decrypted Template: \n" .. tostring(string.char(table.unpack(decrypted))), self, "setEncryptedTemplateFileAsInputStream(file)")
            end
            self:setInputStream(ByteArrayInputStream.new(decrypted))
            self:setURIResolver(BasicUriResolver.new(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION))
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
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


-- throws Exception
function BasicTransformer:setEncryptedTemplateAsInputStream()
        local outputStream = nil
        local inputStream = nil
        local try_ok, try_error = pcall(function()
            outputStream = java_byte_array_output_stream()
            inputStream = ByteArrayInputStream.new(self:getTransformInfoInterface():getTemplate():getBytes())
            outputStream = self.streamUtil:get(inputStream, outputStream, java_new_array(0, 16384))
            local abCrypt = AbCrypt.new(KeySpecFactory.DESEDE, AbKeys.getInstance():getKey(self.abeClientInformation, self:getTransformInfoInterface():getName()))
            local decrypted = abCrypt:decrypt(outputStream:toByteArray())
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF("Decrypted Template: \n" .. tostring(decrypted), self, "setEncryptedTemplateAsInputStream()")
            end
            self:setInputStream(ByteArrayInputStream.new(decrypted))
            self:setURIResolver(BasicUriResolver.new(TransformInfoTemplateData.getInstance().ENCRYPTED_EXTENSION))
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put("Failed to set with template: " .. tostring(self:getTransformInfoInterface():getTemplateFilePath()), self, "setEncryptedTemplateFileAsInputStream()", e)
            end
            error(e, 0)
        end
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
end


-- throws Exception
function BasicTransformer:setTemplateAsInputStream()
        local inputStream = nil
        local outputStream = nil
        local try_ok, try_error = pcall(function()
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
            end
            local transformInfoTemplateData = TransformInfoTemplateData.getInstance()
            local pathUtil = PathUtil.getInstance()
            if self:getTransformInfoInterface():getTemplateFilePath() ~= nil then
                local extension = pathUtil:getExtensionWithAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                local filePath = pathUtil:getWithoutExtensionWithAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                    self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                end
                if ((extension < transformInfoTemplateData.UNCRYPTED_EXTENSION and -1) or (extension > transformInfoTemplateData.UNCRYPTED_EXTENSION and 1) or 0) == 0 then
                    local stringBuffer = StringMaker.new()
                    stringBuffer:append(filePath)
                    stringBuffer:append(AbPathData.getInstance().EXTENSION_SEP)
                    stringBuffer:append(transformInfoTemplateData.ENCRYPTED_EXTENSION)
                    local encFile = AbFile.createAbFile(tostring(stringBuffer))
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                        self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                    end
                    if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                        stringBuffer = StringMaker.new()
                        stringBuffer:append("Encrypted Template File isFile=")
                        stringBuffer:appendboolean(encFile:isFile())
                        stringBuffer:append("\nEncTemplateFilePath: ")
                        stringBuffer:append(encFile:getPath())
                        self.logUtil:putF(tostring(stringBuffer), self, "setTemplateAsInputStream()")
                    end
                    if encFile:isFile() then
                        self:setEncryptedTemplateFileAsInputStream(encFile)
                        return
                    else
                        local file = AbFile.createAbFileFromAbPath(self:getTransformInfoInterface():getTemplateFilePath())
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                            self.logUtil:putF(self:getTransformInfoInterface():log(), self, "setTemplateAsInputStream()")
                        end
                        if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                            self.logUtil:putF("Template File isFile=" .. tostring(file:isFile()), self, "setTemplateAsInputStream()")
                        end
                        if file:isFile() then
                            inputStream = AbFileInputStream.new(file)
                            outputStream = java_byte_array_output_stream()
                            outputStream = self.streamUtil:get(inputStream, outputStream, java_new_array(0, 16384))
                            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORY) then
                                self.logUtil:putF("Template: " .. tostring(outputStream), self, "getTemplateAsInputStream()")
                            end
                            self:setInputStream(ByteArrayInputStream.new(outputStream:toByteArray()))
                            self:setURIResolver(BasicUriResolver.new(transformInfoTemplateData.UNCRYPTED_EXTENSION))
                            return
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
                    error(java_exception("Exception", "View Template File Type Is Not Recognized: " .. tostring(self:getTransformInfoInterface():getTemplateFilePath())), 0)
                end
            else
                self:setEncryptedTemplateAsInputStream()
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().TAGHELPERFACTORYERROR) then
                self.logUtil:put("Failed to get Template Data", self, "setTemplateAsInputStream()", e)
            end
            error(e, 0)
        end
        do -- finally
            self.streamUtil:close(outputStream)
            self.streamUtil:close(inputStream)
        end
        error(java_exception("Exception", "Error setTemplateAsInputStream()"), 0)
end

return BasicTransformer

