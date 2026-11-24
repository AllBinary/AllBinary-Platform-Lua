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
-- package org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.sim

local AuthorizeNetSimData = {}
package.loaded["org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.sim.AuthorizeNetSimData"] = AuthorizeNetSimData

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

-- class table AuthorizeNetSimData is declared before the requires
AuthorizeNetSimData.__index = AuthorizeNetSimData
AuthorizeNetSimData.className = "AuthorizeNetSimData"
AuthorizeNetSimData.javaClassName = "org.allbinary.business.user.commerce.money.payment.gateway.modules.processor.authorizenet.sim.AuthorizeNetSimData"


function AuthorizeNetSimData._jinit(self)
    return self
end

function AuthorizeNetSimData.new(...)
    local self = setmetatable({}, AuthorizeNetSimData)
    AuthorizeNetSimData._jinit(self, ...)
    return self
end

AuthorizeNetSimData.X_FP_HASH = "x_fp_hash"
AuthorizeNetSimData.X_FP_SEQUENCE = "x_fp_sequence"
AuthorizeNetSimData.X_FP_TIMESTAMP = "x_fp_timestamp"
AuthorizeNetSimData.X_SHOW_FORM = "x_show_form"
AuthorizeNetSimData.X_HEADER_HTML_PAYMENT_FORM = "x_header_html_payment_form"
AuthorizeNetSimData.X_FOOTER_HTML_PAYMENT_FORM = "x_footer_html_payment_form"
AuthorizeNetSimData.X_HEADER_HTML_RECEIPT = "x_header_html_receipt"
AuthorizeNetSimData.X_FOOTER_HTML_RECEIPT = "x_footer_html_receipt"
AuthorizeNetSimData.X_RECEIPT_LINK_TEXT = "x_receipt_link_text"
AuthorizeNetSimData.X_RECEIPT_LINK_URL = "x_receipt_link_url"
AuthorizeNetSimData.X_LOGO_URL = "x_logo_url"
AuthorizeNetSimData.X_BACKGROUND_URL = "x_background_url"
AuthorizeNetSimData.X_COLOR_BACKGROUND = "x_color_background"
AuthorizeNetSimData.X_COLOR_LINK = "x_color_link"
AuthorizeNetSimData.X_COLOR_TEXT = "x_color_text"
AuthorizeNetSimData.X_RELAY_URL = "x_relay_url"

return AuthorizeNetSimData

