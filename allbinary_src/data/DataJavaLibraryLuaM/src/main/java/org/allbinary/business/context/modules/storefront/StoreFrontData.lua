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
-- package org.allbinary.business.context.modules.storefront

local StoreFrontData = {}
package.loaded["org.allbinary.business.context.modules.storefront.StoreFrontData"] = StoreFrontData

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

-- class table StoreFrontData is declared before the requires
StoreFrontData.__index = StoreFrontData
StoreFrontData.className = "StoreFrontData"
StoreFrontData.javaClassName = "org.allbinary.business.context.modules.storefront.StoreFrontData"

function StoreFrontData:_init_fields()
    self.CANCEL = "Cancel Store Front"
    self.SELECT = "Select Store Front"
    self.INSTALL = "Install Store Front"
    self.INSTALL_COMPLETE = "Install Store Front Complete"
    self.NAME = "STOREFRONT_NAME"
    self.CURRENTHOSTNAME = "STOREFRONT_CURRENTHOSTNAME"
    self.CURRENTHOSTNAMEPATH = "STOREFRONT_CURRENTHOSTNAMEPATH"
    self.CURRENTHOMEHOSTNAME = "STOREFRONT_CURRENTHOMEHOSTNAME"
    self.CURRENTHOMEHOSTNAMEPATH = "STOREFRONT_CURRENTHOMEHOSTNAMEPATH"
    self.HOMEHOSTNAME = "STOREFRONT_HOMEHOSTNAME"
    self.HOMEHOSTNAMEPATH = "STOREFRONT_HOMEHOSTNAMEPATH"
    self.HOSTNAME = "STOREFRONT_HOSTNAME"
    self.HOSTNAMEPATH = "STOREFRONT_HOSTNAMEPATH"
    self.TESTHOMEHOSTNAME = "STOREFRONT_TESTHOMEHOSTNAME"
    self.TESTHOMEHOSTNAMEPATH = "STOREFRONT_TESTHOMEHOSTNAMEPATH"
    self.TESTHOSTNAME = "STOREFRONT_TESTHOSTNAME"
    self.TESTHOSTNAMEPATH = "STOREFRONT_TESTHOSTNAMEPATH"
    self.IMAGEPATH = "STOREFRONT_IMAGEPATH"
    self.STATICPATH = "STOREFRONT_STATICPATH"
    self.CATEGORYPATH = "STOREFRONT_CATEGORYPATH"
    self.INVENTORYCONTROL = "STOREFRONT_INVENTORYCONTROL"
    self.CONFIGURATION = "STOREFRONT_CONFIGURATION"
    self.SUBSTORES = "STOREFRONT_SUBSTORES"
    self.TAGLOCATION = "STOREFRONT_TAGLOCATION"
    self.PACKAGELOCATION = "STOREFRONT_PACKAGELOCATION"
    self.FTP = "STOREFRONT_FTP"
    self.FTPPATH = "STOREFRONT_FTPPATH"
    self.FTPUSERNAME = "STOREFRONT_FTPUSERNAME"
    self.FTPPASSWORD = "STOREFRONT_FTPPASSWORD"
    self.TESTFTP = "STOREFRONT_TESTFTP"
    self.TESTFTPPATH = "STOREFRONT_TESTFTPPATH"
    self.TESTFTPUSERNAME = "STOREFRONT_TESTFTPUSERNAME"
    self.TESTFTPPASSWORD = "STOREFRONT_TESTFTPPASSWORD"
    self.SELECTSTORENAME = "STOREFRONT_SELECTSTORENAME"
end

function StoreFrontData._jinit(self)
    StoreFrontData._init_fields(self)
    return self
end

function StoreFrontData.new()
    return StoreFrontData._jinit(setmetatable({}, StoreFrontData))
end


function StoreFrontData.getInstance()
        return StoreFrontData.instance_f
end

StoreFrontData.instance_f = StoreFrontData.new()

return StoreFrontData

