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

-- local HashMap = require("java.util.HashMap")
local StoreFrontData = require("org.allbinary.business.context.modules.storefront.StoreFrontData")
local EntryData = require("org.allbinary.business.entry.EntryData")
local UserData = require("org.allbinary.business.user.UserData")
local Tokenizer = require("org.allbinary.logic.string.tokens.Tokenizer")
local CommonSeps = require("org.allbinary.string.CommonSeps")
local BasicArrayList = require("org.allbinary.util.BasicArrayList")
local BasicArrayListD = require("org.allbinary.util.BasicArrayListD")
local BasicStoreFrontInterface = require("org.allbinary.business.context.modules.storefronts.BasicStoreFrontInterface")

local function java_idiv(a, b)
    local q = a / b
    if q < 0 then return math.ceil(q) end
    return math.floor(q)
end

local function java_int(value)
    if value < 0 then return math.tointeger(math.ceil(value)) end
    return math.tointeger(math.floor(value))
end

local BasicStoreFront = {}
BasicStoreFront.__index = BasicStoreFront
BasicStoreFront.className = "BasicStoreFront"

function BasicStoreFront:_init_fields()
    self.name = nil
    self.userName = nil
    self.basketName = nil
    self.homeHostName = nil
    self.homeHostNamePath = nil
    self.hostName = nil
    self.hostNamePath = nil
    self.testHomeHostName = nil
    self.testHomeHostNamePath = nil
    self.testHostName = nil
    self.testHostNamePath = nil
    self.imagePath = nil
    self.staticPath = nil
    self.categoryPath = nil
    self.inventoryControl = nil
    self.subStores = nil
    self.tagLocation = nil
    self.packageLocation = nil
    self.ftp = nil
    self.ftpPath = nil
    self.ftpUserName = nil
    self.ftpPassword = nil
    self.testFtp = nil
    self.testFtpPath = nil
    self.testFtpUserName = nil
    self.testFtpPassword = nil
    self.timeCreated = nil
    self.lastModified = nil
end

function BasicStoreFront.new(...)
    local count = select("#", ...)
    if count == 0 then return BasicStoreFront._new0(...)
    elseif count == 1 then return BasicStoreFront._new1(...)
    end
end


function BasicStoreFront._new0()
    local self = setmetatable({}, BasicStoreFront)
    self:_init_fields()
    return self
end


function BasicStoreFront._new1(storeHashMap)
    local self = setmetatable({}, BasicStoreFront)
    self:_init_fields()
        local storeFrontData = StoreFrontData.getInstance()
        self.name = storeHashMap:get(storeFrontData.NAME)
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
        return org.allbinary.globals.URLGLOBALS:getTestHtmlPath() + self:getCurrentHostNamePath()
end


function BasicStoreFront:getCurrentHostName()
        local location = nil
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHostName()
        else
            location = self:getHostName()
        end
        return location
end


function BasicStoreFront:getCurrentHostNamePath()
        local location = nil
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHostNamePath()
        else
            location = self:getHostNamePath()
        end
        return location
end


function BasicStoreFront:getCurrentHomeHostName()
        local location = nil
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHomeHostName()
        else
            location = self:getHomeHostName()
        end
        return location
end


function BasicStoreFront:getCurrentHomeHostNamePath()
        local location = nil
        if org.allbinary.globals.URLGLOBALS:isTestingMode() then
            location = self:getTestHomeHostNamePath()
        else
            location = self:getHomeHostNamePath()
        end
        return location
end


function BasicStoreFront:getName()
        return self.name
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
        local try_ok, try_error = pcall(function()
            local tokenizer = Tokenizer.new(CommonSeps.getInstance().SEMICOLON)
            local subStoreVector = tokenizer:getTokensFromString(self.subStores, BasicArrayListD.new())
            return subStoreVector
        end)
        if not try_ok then
            local e = try_error
            error(e, 0)
        end
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

