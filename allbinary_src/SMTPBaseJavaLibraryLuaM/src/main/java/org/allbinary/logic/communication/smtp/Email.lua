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

local Email = {}
package.loaded["org.allbinary.logic.communication.smtp.Email"] = Email

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

local ByteArrayOutputStream = java_lazy("java.io.ByteArrayOutputStream")
local PrintStream = java_lazy("java.io.PrintStream")
local HashMap = java_lazy("java.util.HashMap")
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
local ModDomHelper = java_lazy("org.allbinary.data.tree.dom.ModDomHelper")
local StdUtil = java_lazy("org.allbinary.logic.StdUtil")
local LogUtil = java_lazy("org.allbinary.logic.communication.log.LogUtil")
local StringUtil = java_lazy("org.allbinary.logic.string.StringUtil")
local StringValidationUtil = java_lazy("org.allbinary.logic.string.StringValidationUtil")
local CommonStrings = java_lazy("org.allbinary.string.CommonStrings")
local Document = java_lazy("org.w3c.dom.Document")
local Node = java_lazy("org.w3c.dom.Node")
local LogConfigTypeFactory = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypeFactory")
local LogConfigTypes = java_lazy("org.allbinary.logic.communication.log.config.type.LogConfigTypes")
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

-- class table Email is declared before the requires
Email.__index = Email
Email.className = "Email"
Email.javaClassName = "org.allbinary.logic.communication.smtp.Email"
Email.java_implements = " EmailInterface "
Email.java_interfaces = function() return {EmailInterface} end

function Email:_init_fields()
    self.logUtil = LogUtil.getInstance()
    self.commonStrings = CommonStrings.getInstance()
    if self.msg == nil then self.msg = nil end
    if self.properties == nil then self.properties = nil end
    if self.bs == nil then self.bs = nil end
    if self.isDebug == nil then self.isDebug = nil end
end

function Email._jinit(self, ...)
    local count = select("#", ...)
    if count == 7 then return Email._new7(self, ...)
    elseif count == 8 then return Email._new8(self, ...)
    end
    error("No constructor of Email takes " .. count .. " arguments")
end

function Email.new(...)
    local self = setmetatable({}, Email)
    Email._jinit(self, ...)
    return self
end


function Email._new7(self, from, to, subject, server, textBody, htmlAttachment, contentBase)
    Email._init_fields(self)
        self.isDebug = false
        self:init(from, to, subject, server, textBody, htmlAttachment, contentBase)
    return self
end


function Email._new8(self, from, to, subject, server, textBody, htmlAttachment, contentBase, isDebug)
    Email._init_fields(self)
        self.isDebug = isDebug
        self:init(from, to, subject, server, textBody, htmlAttachment, contentBase)
    return self
end


-- throws Exception
function Email:init_j7(from, to, subject, server, textBody, htmlAttachment, contentBase)
        local try_ok, try_error, try_value = pcall(function()
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
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                local commonStrings = CommonStrings.getInstance()
                self.logUtil:put(commonStrings.EXCEPTION, self, "emailConstructor", e)
            end
            error(e, 0)
        end
end


-- throws MessagingException
function Email:init_j8(server, authenticator, addresses_from, addresses_to, addresses_cc, addresses_bcc, subject, mimeBodyParts)
        self.properties = Properties.new()
        self.properties:put(Email.SMTP_HOST, server)
        local try_ok, try_error, try_value = pcall(function()
            local hostName = StringUtil.getInstance().EMPTY_STRING
            if StringValidationUtil.getInstance():isEmpty(hostName) then
                if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                    self.logUtil:putF("Unable to get HostName so using fake", self, "init()")
                end
                self.properties:put(Email.SMTP_LOCAL_HOST, "FakeHostName")
            end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
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
            self.bs = require("java.io.ByteArrayOutputStream").new()
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
function Email:init(...)
    local count = select("#", ...)
    if count == 7 then return self:init_j7(...) end
    if count == 8 then return self:init_j8(...) end
    error("No method init takes " .. count .. " arguments")
end
Email.init__jdispatcher = Email.init


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
        local try_ok, try_error, try_value = pcall(function()
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
            do return "__jreturn", hashMap end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            if LogConfigTypes.LOGGING:contains(LogConfigTypeFactory.getInstance().EMAILLOGGINGERROR) then
                self.logUtil:put(self.commonStrings.EXCEPTION, self, "toHashMap()", e)
            end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


-- throws Exception
function Email:toXmlNode(document)
        local node = ModDomHelper.createNameValueNodes(document, EmailData.NAME, self:toHashMap())
        return node
end


-- throws Exception
function Email:toXmlDoc()
        error(require("java.lang.Exception").new(CommonStrings.getInstance().NOT_IMPLEMENTED), 0)
end

Email.DEBUG = "mail.debug"
Email.SMTP_HOST = "mail.smtp.host"
Email.SMTP_PORT = "mail.smtp.port"
Email.SMTP_USER = "mail.smtp.user"
Email.SMTP_RETURN_ADDRESS = "mail.from"
Email.SMTP_LOCAL_HOST = "mail.smtp.localhost"

return Email

