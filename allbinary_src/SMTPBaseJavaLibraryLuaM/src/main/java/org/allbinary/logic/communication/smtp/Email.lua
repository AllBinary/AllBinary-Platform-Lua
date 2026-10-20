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
-- package org.allbinary.logic.communication.smtp

-- local ByteArrayOutputStream = require("java.io.ByteArrayOutputStream")
-- local PrintStream = require("java.io.PrintStream")
-- local HashMap = require("java.util.HashMap")
-- local Properties = require("java.util.Properties")
-- local Address = require("javax.mail.Address")
-- local Authenticator = require("javax.mail.Authenticator")
-- local Message = require("javax.mail.Message")
-- local MessagingException = require("javax.mail.MessagingException")
-- local Session = require("javax.mail.Session")
-- local InternetAddress = require("javax.mail.internet.InternetAddress")
-- local InternetHeaders = require("javax.mail.internet.InternetHeaders")
-- local MimeBodyPart = require("javax.mail.internet.MimeBodyPart")
-- local MimeMessage = require("javax.mail.internet.MimeMessage")
-- local MimeMultipart = require("javax.mail.internet.MimeMultipart")
local ModDomHelper = require("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = require("org.allbinary.logic.StdUtil")
local LogUtil = require("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = require("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = require("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = require("org.allbinary.string.CommonStrings")
local Document = require("org.w3c.dom.Document")
local Node = require("org.w3c.dom.Node")
local EmailInterface = require("org.allbinary.logic.communication.smtp.EmailInterface")

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

local Email = {}
Email.__index = Email
Email.className = "Email"

function Email:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    self.msg = nil
    self.properties = nil
    self.bs = nil
    self.isDebug = nil
end

function Email.new(...)
    local count = select("#", ...)
    if count == 7 then return Email._new7(...)
    elseif count == 8 then return Email._new8(...)
    end
end


function Email._new7(from, to, subject, server, textBody, htmlAttachment, contentBase)
    local self = setmetatable({}, Email)
    self:_init_fields()
        self.isDebug = false
        self:init(from, to, subject, server, textBody, htmlAttachment, contentBase)
    return self
end


function Email._new8(from, to, subject, server, textBody, htmlAttachment, contentBase, isDebug)
    local self = setmetatable({}, Email)
    self:_init_fields()
        self.isDebug = isDebug
        self:init(from, to, subject, server, textBody, htmlAttachment, contentBase)
    return self
end


-- throws Exception
function Email:init(from, to, subject, server, textBody, htmlAttachment, contentBase)
        local try_ok, try_error = pcall(function()
            local stringValidationUtil = StringValidationUtil.getInstance()
            local mimeBodyParts = java_new_array(nil, (function() if not stringValidationUtil:isEmpty(htmlAttachment) then return 2 else return 1 end end)())
            mimeBodyParts[1] = MimeBodyPart.new()
            mimeBodyParts[1]:setText(textBody)
            if not stringValidationUtil:isEmpty(htmlAttachment) then
                local internetHeaders = InternetHeaders.new()
                internetHeaders:addHeader("Content-Type", "text/html")
                if not stringValidationUtil:isEmpty(contentBase) then
                    internetHeaders:addHeader("Content-Base", contentBase)
                end
                mimeBodyParts[2] = MimeBodyPart.new(internetHeaders, {string.byte(htmlAttachment, 1, -1)})
            end
            self:init(server, nil, {InternetAddress.new(from)}, {InternetAddress.new(to)}, nil, nil, subject, mimeBodyParts)
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "emailConstructor", e)
            end
            error(e, 0)
        end
end


-- throws MessagingException
-- Java overloaded method: Lua keeps the last definition
function Email:init(server, authenticator, addresses_from, addresses_to, addresses_cc, addresses_bcc, subject, mimeBodyParts)
        self.properties = Properties.new()
        self.properties:put(Email.SMTP_HOST, server)
        local try_ok, try_error = pcall(function()
            local hostName = StringUtil.getInstance().EMPTY_STRING
            if StringValidationUtil.getInstance():isEmpty(hostName) then
                if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                    self.logUtil:putF("Unable to get HostName so using fake", self, "init()")
                end
                self.properties:put(Email.SMTP_LOCAL_HOST, "FakeHostName")
            end
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put("Continuing on Exception: Unable to get HostName", self, "init()", e)
            end
            self.properties:put(Email.SMTP_LOCAL_HOST, "FakeHostName")
        end
        if self.isDebug then
            self.properties:put(Email.DEBUG, "true")
        end
        local session = Session.getInstance(self.properties, authenticator)
        if self.isDebug then
            session:setDebug(true)
            self.bs = java_byte_array_output_stream()
            local printStream = PrintStream.new(self.bs)
            session:setDebugOut(printStream)
        end
        self.msg = MimeMessage.new(session)
        self.msg:addFrom(addresses_from)
        self.msg:setRecipients(Message.RecipientType.TO, addresses_to)
        self.msg:setRecipients(Message.RecipientType.CC, addresses_cc)
        self.msg:setRecipients(Message.RecipientType.BCC, addresses_bcc)
        self.msg:setSubject(subject)
        local mimeMultipart = MimeMultipart.new()
        for i = 0, (mimeBodyParts.n or #mimeBodyParts) - 1 do
            mimeMultipart:addBodyPart(mimeBodyParts[i + 1])
        end
        self.msg:setContent(mimeMultipart)
end


function Email:getMimeMessage()
        return self.msg
end


function Email:getDebugInfo()
        if self.isDebug then
            return "More Logging Before This To Standard Out: " .. tostring(tostring(tostring(self.bs)))
        else
            return "Debugging Is Off"
        end
end


-- throws Exception
function Email:log()
        return "\nHashMap: " .. tostring(self:toHashMap())
end


-- throws Exception
function Email:toHashMap()
        local try_ok, try_error = pcall(function()
            local hashMap = StdUtil.getInstance():createHashMap()
            hashMap:put(EmailData.SERVER, self.properties:get(Email.SMTP_HOST))
            local addresses = self.msg:getFrom()
            if addresses ~= nil then
                for index = 0, (addresses.n or #addresses) - 1 do
                    hashMap:put(EmailData.FROM, tostring(addresses[index + 1]))
                end
            end
            addresses = self.msg:getRecipients(Message.RecipientType.TO)
            if addresses ~= nil then
                for index = 0, (addresses.n or #addresses) - 1 do
                    hashMap:put(EmailData.TO, tostring(addresses[index + 1]))
                end
            end
            addresses = self.msg:getRecipients(Message.RecipientType.CC)
            if addresses ~= nil then
                for index = 0, (addresses.n or #addresses) - 1 do
                    hashMap:put(EmailData.CC, tostring(addresses[index + 1]))
                end
            end
            addresses = self.msg:getRecipients(Message.RecipientType.BCC)
            if addresses ~= nil then
                for index = 0, (addresses.n or #addresses) - 1 do
                    hashMap:put(EmailData.BCC, tostring(addresses[index + 1]))
                end
            end
            hashMap:put(EmailData.SUBJECT, self.msg:getSubject())
            local mimeMultipart = self.msg:getContent()
            if mimeMultipart ~= nil then
                for index = 0, mimeMultipart:getCount() - 1 do
                    local content = mimeMultipart:getBodyPart(index):getContent()
                    hashMap:put(EmailData.CONTENT, content)
                end
            end
            return hashMap
        end)
        if not try_ok then
            local e = try_error
            if org.allbinary.logic.communication.log.config.type.LogConfigTypes.LOGGING:contains(org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory:getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toHashMap()", e)
            end
            error(e, 0)
        end
end


-- throws Exception
function Email:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, EmailData.NAME, self:toHashMap())
        return node
end


-- throws Exception
function Email:toXmlDoc()
        error(java_exception("Exception", CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end

Email.DEBUG = "mail.debug"
Email.SMTP_HOST = "mail.smtp.host"
Email.SMTP_PORT = "mail.smtp.port"
Email.SMTP_USER = "mail.smtp.user"
Email.SMTP_RETURN_ADDRESS = "mail.from"
Email.SMTP_LOCAL_HOST = "mail.smtp.localhost"

return Email

