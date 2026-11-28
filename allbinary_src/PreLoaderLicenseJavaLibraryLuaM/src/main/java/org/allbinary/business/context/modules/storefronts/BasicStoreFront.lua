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
-- package org.allbinary.business.context.modules.storefronts

local BasicStoreFront = {}
package.loaded["org.allbinary.business.context.modules.storefronts.BasicStoreFront"] = BasicStoreFront

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
local StoreFrontData = java_lazy("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = java_lazy("org.allbinary.business.entry.EntryData")
local UserData = java_lazy("org.allbinary.business.user.UserData")
local Tokenizer = java_lazy("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = java_lazy("org.allbinary.string.CommonSeps")
local BasicArrayList = java_lazy("org.allbinary.util.BasicArrayList")
local BasicArrayListD = java_lazy("org.allbinary.util.BasicArrayListD")
local URLGLOBALS = java_lazy("org.allbinary.globals.URLGLOBALS")
local BasicStoreFrontInterface = require("org.allbinary.business.context.modules.storefronts.BasicStoreFrontInterface")

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

-- class table BasicStoreFront is declared before the requires
BasicStoreFront.__index = BasicStoreFront
BasicStoreFront.className = "BasicStoreFront"
BasicStoreFront.javaClassName = "org.allbinary.business.context.modules.storefronts.BasicStoreFront"
BasicStoreFront.java_implements = " BasicStoreFrontInterface "
BasicStoreFront.java_interfaces = function() return {BasicStoreFrontInterface} end

function BasicStoreFront:_init_fields()
    if self.name_f == nil then self.name_f = nil end
    if self.userName == nil then self.userName = nil end
    if self.basketName == nil then self.basketName = nil end
    if self.homeHostName == nil then self.homeHostName = nil end
    if self.homeHostNamePath == nil then self.homeHostNamePath = nil end
    if self.hostName == nil then self.hostName = nil end
    if self.hostNamePath == nil then self.hostNamePath = nil end
    if self.testHomeHostName == nil then self.testHomeHostName = nil end
    if self.testHomeHostNamePath == nil then self.testHomeHostNamePath = nil end
    if self.testHostName == nil then self.testHostName = nil end
    if self.testHostNamePath == nil then self.testHostNamePath = nil end
    if self.imagePath == nil then self.imagePath = nil end
    if self.staticPath == nil then self.staticPath = nil end
    if self.categoryPath == nil then self.categoryPath = nil end
    if self.inventoryControl == nil then self.inventoryControl = nil end
    if self.subStores == nil then self.subStores = nil end
    if self.tagLocation == nil then self.tagLocation = nil end
    if self.packageLocation == nil then self.packageLocation = nil end
    if self.ftp == nil then self.ftp = nil end
    if self.ftpPath == nil then self.ftpPath = nil end
    if self.ftpUserName == nil then self.ftpUserName = nil end
    if self.ftpPassword == nil then self.ftpPassword = nil end
    if self.testFtp == nil then self.testFtp = nil end
    if self.testFtpPath == nil then self.testFtpPath = nil end
    if self.testFtpUserName == nil then self.testFtpUserName = nil end
    if self.testFtpPassword == nil then self.testFtpPassword = nil end
    if self.timeCreated == nil then self.timeCreated = nil end
    if self.lastModified == nil then self.lastModified = nil end
end

function BasicStoreFront._jinit(self, ...)
    local count = select("#", ...)
    if count == 0 then return BasicStoreFront._new0(self, ...)
    elseif count == 1 then return BasicStoreFront._new1(self, ...)
    end
    error("No constructor of BasicStoreFront takes " .. count .. " arguments")
end

function BasicStoreFront.new(...)
    local self = setmetatable({}, BasicStoreFront)
    BasicStoreFront._jinit(self, ...)
    return self
end


function BasicStoreFront._new0(self)
    BasicStoreFront._init_fields(self)
    return self
end


function BasicStoreFront._new1(self, storeHashMap)
    BasicStoreFront._init_fields(self)
        local storeFrontData = StoreFrontData.getInstance()
        self.name_f = storeHashMap:get(storeFrontData.NAME)
        self.userName = storeHashMap:get(UserData.USERNAME)
        self.basketName = storeHashMap:get(storeFrontData.NAME)
        self.homeHostName = storeHashMap:get(storeFrontData.HOMEHOSTNAME)
        self.homeHostNamePath = storeHashMap:get(storeFrontData.HOMEHOSTNAMEPATH)
        self.hostName = storeHashMap:get(storeFrontData.HOSTNAME)
        self.hostNamePath = storeHashMap:get(storeFrontData.HOSTNAMEPATH)
        self.testHomeHostName = storeHashMap:get(storeFrontData.TESTHOMEHOSTNAME)
        self.testHomeHostNamePath = storeHashMap:get(storeFrontData.TESTHOMEHOSTNAMEPATH)
        self.testHostName = storeHashMap:get(storeFrontData.TESTHOSTNAME)
        self.testHostNamePath = storeHashMap:get(storeFrontData.TESTHOSTNAMEPATH)
        self.imagePath = storeHashMap:get(storeFrontData.IMAGEPATH)
        self.staticPath = storeHashMap:get(storeFrontData.STATICPATH)
        self.categoryPath = storeHashMap:get(storeFrontData.CATEGORYPATH)
        self.inventoryControl = storeHashMap:get(storeFrontData.INVENTORYCONTROL)
        self.subStores = storeHashMap:get(storeFrontData.SUBSTORES)
        self.tagLocation = storeHashMap:get(storeFrontData.TAGLOCATION)
        self.packageLocation = storeHashMap:get(storeFrontData.PACKAGELOCATION)
        self.ftp = storeHashMap:get(storeFrontData.FTP)
        self.ftpPath = storeHashMap:get(storeFrontData.FTPPATH)
        self.ftpUserName = storeHashMap:get(storeFrontData.FTPUSERNAME)
        self.ftpPassword = storeHashMap:get(storeFrontData.FTPPASSWORD)
        self.testFtp = storeHashMap:get(storeFrontData.TESTFTP)
        self.testFtpPath = storeHashMap:get(storeFrontData.TESTFTPPATH)
        self.testFtpUserName = storeHashMap:get(storeFrontData.TESTFTPUSERNAME)
        self.testFtpPassword = storeHashMap:get(storeFrontData.TESTFTPPASSWORD)
        self.timeCreated = storeHashMap:get(EntryData.getInstance().TIMECREATED)
        self.lastModified = storeHashMap:get(EntryData.getInstance().LASTMODIFIED)
    return self
end


function BasicStoreFront:getTestHtmlPath()
        return URLGLOBALS.getTestHtmlPath() + self:getCurrentHostNamePath()
end


function BasicStoreFront:getCurrentHostName()
        local location = nil
        if URLGLOBALS.isTestingMode() then
            location = self:getTestHostName()
        else
            location = self:getHostName()
        end
        return location
end


function BasicStoreFront:getCurrentHostNamePath()
        local location = nil
        if URLGLOBALS.isTestingMode() then
            location = self:getTestHostNamePath()
        else
            location = self:getHostNamePath()
        end
        return location
end


function BasicStoreFront:getCurrentHomeHostName()
        local location = nil
        if URLGLOBALS.isTestingMode() then
            location = self:getTestHomeHostName()
        else
            location = self:getHomeHostName()
        end
        return location
end


function BasicStoreFront:getCurrentHomeHostNamePath()
        local location = nil
        if URLGLOBALS.isTestingMode() then
            location = self:getTestHomeHostNamePath()
        else
            location = self:getHomeHostNamePath()
        end
        return location
end


function BasicStoreFront:getName()
        return self.name_f
end


function BasicStoreFront:getUserName()
        return self.userName
end


function BasicStoreFront:getBasketName()
        return self.basketName
end


function BasicStoreFront:getHomeHostName()
        return self.homeHostName
end


function BasicStoreFront:getHomeHostNamePath()
        return self.homeHostNamePath
end


function BasicStoreFront:getHostName()
        return self.hostName
end


function BasicStoreFront:getHostNamePath()
        return self.hostNamePath
end


function BasicStoreFront:getTestHomeHostName()
        return self.testHomeHostName
end


function BasicStoreFront:getTestHomeHostNamePath()
        return self.testHomeHostNamePath
end


function BasicStoreFront:getTestHostName()
        return self.testHostName
end


function BasicStoreFront:getTestHostNamePath()
        return self.testHostNamePath
end


function BasicStoreFront:getStaticPath()
        return self.staticPath
end


function BasicStoreFront:getCategoryPath()
        return self.categoryPath
end


function BasicStoreFront:getInventoryControl()
        return self.inventoryControl
end


-- throws Exception
function BasicStoreFront:getSubStores()
        local try_ok, try_error, try_value = pcall(function()
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().SEMICOLON)
            local subStoreVector = tokenizer:getTokensFromString(self.subStores, BasicArrayListD.new())
            do return "__jreturn", subStoreVector end
        end)
        if not try_ok then
            local e = try_error
            if type(e) ~= "table" then e = require("java.lang.RuntimeException").new(tostring(e)) end
            error(e, 0)
        end
        if try_ok and try_error == "__jreturn" then return try_value end
end


function BasicStoreFront:getTagLocation()
        return self.tagLocation
end


function BasicStoreFront:getPackageLocation()
        return self.packageLocation
end


function BasicStoreFront:getFtp()
        return self.ftp
end


function BasicStoreFront:getFtpUserName()
        return self.ftpUserName
end


function BasicStoreFront:getFtpPassword()
        return self.ftpPassword
end


function BasicStoreFront:getTestFtp()
        return self.testFtp
end


function BasicStoreFront:getTestFtpUserName()
        return self.testFtpUserName
end


function BasicStoreFront:getTestFtpPassword()
        return self.testFtpPassword
end


function BasicStoreFront:getFtpPath()
        return self.ftpPath
end


function BasicStoreFront:getTestFtpPath()
        return self.testFtpPath
end


function BasicStoreFront:getTimeCreated()
        return self.timeCreated
end


function BasicStoreFront:getLastModified()
        return self.lastModified
end

return BasicStoreFront

