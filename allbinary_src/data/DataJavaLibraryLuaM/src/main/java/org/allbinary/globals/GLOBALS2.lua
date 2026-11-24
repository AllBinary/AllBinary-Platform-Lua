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
-- package org.allbinary.globals

local GLOBALS2 = {}
package.loaded["org.allbinary.globals.GLOBALS2"] = GLOBALS2

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

-- class table GLOBALS2 is declared before the requires
GLOBALS2.__index = GLOBALS2
GLOBALS2.className = "GLOBALS2"
GLOBALS2.javaClassName = "org.allbinary.globals.GLOBALS2"

function GLOBALS2._jinit(self)
    return self
end

function GLOBALS2.new()
    return GLOBALS2._jinit(setmetatable({}, GLOBALS2))
end

GLOBALS2.GETCURRENTLOCATION = "Get Current Location"
GLOBALS2.GETCURRENTHOMELOCATION = "Get Current Home Location"
GLOBALS2.GENERATEALLSTORES = "Generate All Stores"
GLOBALS2.LICENSEAGREEMENT = "License Agreement"
GLOBALS2.CREATEDATABASES = "Create Databases"
GLOBALS2.VIEWNAME = "VIEW_NAME"
GLOBALS2.SETSHIPPINGTYPE = "Set Shipping Type"
GLOBALS2.VIEWSUMMARY = "View Summary"
GLOBALS2.SET = "Set"
GLOBALS2.SELECT = "Select"
GLOBALS2.SELECTNEW = "Select New"
GLOBALS2.SELECTEXISTING = "Select Existing"
GLOBALS2.PROCESS = "Process"
GLOBALS2.LOGINSUCCESS = "Login Successful"
GLOBALS2.LOGINFAILED = "Login Failed"
GLOBALS2.NONE = "None"
GLOBALS2.TOP = "Top"
GLOBALS2.LEFT = "Left"
GLOBALS2.RIGHT = "Right"
GLOBALS2.BACK = "Back"
GLOBALS2.BOTTOM = "Bottom"
GLOBALS2.FRONT = "Front"
GLOBALS2.AUTHORIZE = "Authorize"
GLOBALS2.AUTHORIZEANDEVALBODY = "Authorize AND EVAL BODY"
GLOBALS2.AUTHORIZEANDEVALBODYONERROR = "Authorize AND EVAL BODY On Error"
GLOBALS2.AUTHORIZEORDEREVALBODYONERROR = "Authorize Order Eval On Error"
GLOBALS2.AUTHORIZEFORMEVALBODYONERROR = "Authorize Form Eval On Error"
GLOBALS2.AUTHORIZEORDERANDSKIPBODY = "Authorize Order Skip"
GLOBALS2.AUTHORIZEORDERANDEVALBODY = "Authorize Order Eval"
GLOBALS2.EDITPRICING = "Edit Pricing"
GLOBALS2.UPDATEPRICING = "Update Pricing"
GLOBALS2.SETPAYMENTMETHOD = "Set Payment Method"
GLOBALS2.BACKUP = "Backup"
GLOBALS2.RESTORE = "Restore"
GLOBALS2.SUMMARY = "Summary"
GLOBALS2.DESCRIPTION = "Description"
GLOBALS2.IMG = "img"
GLOBALS2.HREF = "href"
GLOBALS2.KEYWORD = "keyword"
GLOBALS2.TYPE = "TYPE"
GLOBALS2.DATA = "DATA"
GLOBALS2.NUM = "NUM"
GLOBALS2.PRICE = "PRICE"
GLOBALS2.REGISTER = "Register"
GLOBALS2.CHECKOUT = "Checkout"
GLOBALS2.ADMINCOMMAND = "AdminCommand"
GLOBALS2.PROCESSBODYIFNOTAUTHENTICATED = "Not Authenticated"
GLOBALS2.PROCESSBODYIFAUTHENTICATED = "Authenticated"
GLOBALS2.PROCESSTRANSACTION = "Process Transaction"
GLOBALS2.NEWPASSWORD = "New Password"
GLOBALS2.CHANGEPASSWORD = "Change Password"
GLOBALS2.JDBCDRIVER = "Jdbc Driver"
GLOBALS2.WEBAPPPATH = "Webapp Path"
GLOBALS2.AMOUNTVALUE = "Amount Value"
GLOBALS2.GETORDERIDFROMSESSION = "Get Order Id From Session"
GLOBALS2.SETUPPAYMENTMETHODS = "Setup Payment Methods"
GLOBALS2.CANCELSTOREFRONT = "Cancel Store Front"
GLOBALS2.ADJUST = "Adjust"
GLOBALS2.ISASUBSET = "Is a Subset"
GLOBALS2.NOTASUBSET = "Not a Subset"
GLOBALS2.GENERATE = "Generate"
GLOBALS2.VIEW = "View"
GLOBALS2.EDIT = "Edit"
GLOBALS2.NEW = "New"
GLOBALS2.SEARCH = "Search"

return GLOBALS2

